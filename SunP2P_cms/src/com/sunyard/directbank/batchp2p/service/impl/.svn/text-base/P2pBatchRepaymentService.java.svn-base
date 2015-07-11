package com.sunyard.directbank.batchp2p.service.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunyard.directbank.base.Exception.DBException;
import com.sunyard.directbank.batchdate.service.IBatchDateSerivce;
import com.sunyard.directbank.batchp2p.model.ShareInall;
import com.sunyard.directbank.batchp2p.service.IP2pBatchRepaymentSerivce;
import com.sunyard.directbank.eaccontAmt.service.IEaccountAmtService;
import com.sunyard.directbank.enums.ACCOUNTTYPE;
import com.sunyard.directbank.enums.AMTTYPE;
import com.sunyard.directbank.enums.REPAYMENTSTATUS;
import com.sunyard.directbank.prod.model.ProdBaseInfo;
import com.sunyard.directbank.productInfo.service.IProductInfoSerivce;
import com.sunyard.directbank.repayType.service.IRepayType;
import com.sunyard.directbank.repayType.service.impl.RepayTypeUtil;
import com.sunyard.directbank.repaymentInfo.service.IRepaymentInfoSerivce;
import com.sunyard.directbank.tools.DateUtil;

@Transactional
@Service
public class P2pBatchRepaymentService implements IP2pBatchRepaymentSerivce {
	
	@Resource
	private IRepaymentInfoSerivce p2pRepaymentInfoService;
	@Resource
	private IRepaymentInfoSerivce custRepaymentInfoService;
	@Resource
	private IEaccountAmtService eaccountAmtService;
	@Resource
	private IProductInfoSerivce productInfoSerivce;
	@Resource
	private IBatchDateSerivce batchDateSerivce;
	
	private IRepayType repayType;
	
	@Override
	public List<Map<String, Object>> getRealRepayDateEqualTodayRecord(String status) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("real_repay_date", DateUtil.today());
		map.put("status", status);
		return p2pRepaymentInfoService.selectListByKey(map);
	}

	@Override
	public void p2pBatchRepayment(Map<String, Object> item) {
		List<Map<String,Object>> custlist = getRealRepayDateEqualTodayRecordForCust(item);
		if(custlist != null && custlist.size()>0){
			repayType = RepayTypeUtil.getProdRepayType(productInfoSerivce.loadProductObjectById((Integer)item.get("prod_id")));//获取当前产品还款方式
			for(Map<String,Object> custItem : custlist){
				updateEAccountBalance(custItem);//更新投资人账户余额和可用余额
				generateEAccountAmtToInvest(custItem);//记录投资人账户资金变动明细
				updateCustShareInall(custItem);//更新客户份额表
				generateCustShareList(custItem);//记录客户产品份额明细
			}
			updateCustRepayStatus(item);//更新客户还款表还款状态
			updateProductNextRepayDate(item);//更新产品下一个还款日
			updateProdRepayStatus(item);//更新产品还款表还款状态
		}else{
			throw new DBException("数据异常！");
		}
		
	}
	
	private List<Map<String,Object>> getRealRepayDateEqualTodayRecordForCust(Map<String,Object> map) {
		map.put("repay_status", map.get("status"));
		return custRepaymentInfoService.selectListByKey(map);
	}

	private void updateEAccountBalance(Map<String, Object> custItem) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("amt_add", custItem.get("real_repay_amt"));
		map.put("eacc_no", custItem.get("eacc_no"));
		eaccountAmtService.updateEAcccoutBalance(map);
	}
	
	private void generateEAccountAmtToInvest(Map<String, Object> custItem){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("amt", custItem.get("real_repay_amt"));
		map.put("eacc_no", custItem.get("eacc_no"));
		map.put("oppo_acc", custItem.get("loanout_acc"));
		map.put("trans_code", "t00031");//交易代码:清算之产品还款
		eaccountAmtService.insertEAccountAmtList(map);
	}
	
	private void updateCustShareInall(Map<String, Object> custItem) {
		ShareInall custShare = new ShareInall();
		custShare.setEacc_no(custItem.get("eacc_no").toString());
		custShare.setProd_id((Integer)custItem.get("prod_id"));
		custShare.setLast_date(DateUtil.today());
		custShare.setPayed_val((BigDecimal)custItem.get("real_repay_val"));
		
		if((Integer)custItem.get("repay_num") == repayType.getPeriods()){
			custShare.setTot_vol(new BigDecimal(-1).multiply((BigDecimal)custItem.get("real_repay_amount")));
			custShare.setUse_vol(new BigDecimal(-1).multiply((BigDecimal)custItem.get("real_repay_amount")));
			custShare.setTransfer_vol(new BigDecimal(0));
		}
		eaccountAmtService.updateShareInall(custShare);
	}
	
	private void generateCustShareList(Map<String, Object> custItem) {
		if((Integer)custItem.get("repay_num") == repayType.getPeriods()){
			custItem.put("acc_type", ACCOUNTTYPE.LoanOutAcc.getCode());
			custItem.put("account", custItem.get("loanout_acc"));
			custItem.put("reserve", "");
			custItem.put("system_date", DateUtil.today());
			custItem.put("var_cause", "清算产品还款");
			custItem.put("var_date", DateUtil.today());
			custItem.put("var_direction", AMTTYPE.Expensive.getCode());
			custItem.put("var_time", DateUtil.curTimeStr());
			custItem.put("var_value",custItem.get("real_repay_amount"));
			eaccountAmtService.insertShareList(custItem);
		}
		
	}
	
	private void updateCustRepayStatus(Map<String, Object> map) {
		map.put("repay_status", REPAYMENTSTATUS.SuccPay.getCode());
		custRepaymentInfoService.updateRepayStatus(map);
	}
	
	private void updateProductNextRepayDate(Map<String, Object> map) {
		int currPeriod = (Integer)map.get("repay_num");
		if(currPeriod < repayType.getPeriods()){
			ProdBaseInfo prod = repayType.getProd();
			List<Date> datelist = batchDateSerivce.selectBatchDate(map);
			int index = datelist.indexOf(prod.getNext_repay_date());
			prod.setNext_repay_date(datelist.get(index+1));
			productInfoSerivce.updateProductById(prod);
		}
	}
	
	private void updateProdRepayStatus(Map<String, Object> map) {
		map.put("status", REPAYMENTSTATUS.SuccPay.getCode());
		p2pRepaymentInfoService.updateRepayStatus(map);
	}
}
