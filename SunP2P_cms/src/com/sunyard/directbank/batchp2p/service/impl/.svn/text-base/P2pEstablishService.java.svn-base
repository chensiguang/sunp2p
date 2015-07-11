package com.sunyard.directbank.batchp2p.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.sunyard.directbank.batchdate.service.IBatchDateSerivce;
import com.sunyard.directbank.batchp2p.service.IP2pEstablishSerivce;
import com.sunyard.directbank.eaccontAmt.service.IEaccountAmtService;
import com.sunyard.directbank.enums.PRODSTATE;
import com.sunyard.directbank.enums.PRODTRANSSTATUS;
import com.sunyard.directbank.prod.model.ProdBaseInfo;
import com.sunyard.directbank.productInfo.service.IProductInfoSerivce;
import com.sunyard.directbank.repayType.service.IRepayType;
import com.sunyard.directbank.repayType.service.impl.RepayTypeUtil;
import com.sunyard.directbank.repaymentInfo.service.impl.RepaymentInfoUtil;
import com.sunyard.directbank.tools.DateUtil;

@Transactional
@Service
public class P2pEstablishService implements IP2pEstablishSerivce {
	
	@Resource
	private IBatchDateSerivce batchDateSerivce;
	@Resource
	private IEaccountAmtService eaccountAmtService;
	@Resource
	private RepaymentInfoUtil repaymentInfoUtil;
	@Resource
	private IProductInfoSerivce productInfoSerivce;
	private IRepayType repayType;
	
	@Override
	public void establishedProduct(ProdBaseInfo prod) {
		repayType = RepayTypeUtil.getProdRepayType(prod);//获取当前产品还款方式
		repaymentInfoUtil.generateRepaymentInfo(repayType);//生成还款表中数据
		updateFinancingPartyEAccBalance();//更新融资方账户余额
		generateEAccountAmtToFinance();//产生账户余额变动明细
		generateP2pBatchDate();//生成当前产品清算日
		updateProductInfo(prod);//更新产品状态和下一还款日
		updateProdTransStatus(prod);//更新产品交易状态
	}

	private void updateFinancingPartyEAccBalance() {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("amt_add", repayType.getProd().getSaled_limit());
		map.put("eacc_no", repayType.getProd().getCrebit_account());
		eaccountAmtService.updateEAcccoutBalance(map);
	}
	
	private void generateEAccountAmtToFinance() {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("amt", repayType.getProd().getSaled_limit());
		map.put("eacc_no", repayType.getProd().getCrebit_account());//产品付款账号-->融资人的电子账户
		map.put("oppo_acc", repayType.getProd().getDebit_account());//产品收款账号
		map.put("trans_code", "t00035");//交易代码:清算之产品成立
		eaccountAmtService.insertEAccountAmtList(map);
	}
	
	private void generateP2pBatchDate() {
		List<Map<String,Object>> list = repayType.getProdBatchDate();
		Map<String,Object> paramOverview = list.get(0);
		list.remove(0);
		batchDateSerivce.insertBatch(list, paramOverview);
	}
	
	private void updateProductInfo(ProdBaseInfo prod) {
		prod.setValue_date(DateUtil.today());
		prod.setExpire_date(repayType.getRepaymentDate(repayType.getPeriods()));
		prod.setNext_repay_date(repayType.getRepaymentDate(1));
		prod.setProd_state(PRODSTATE.P2pEstablish.getCode());
		productInfoSerivce.updateProductById(prod);
	}
	
	private void updateProdTransStatus(ProdBaseInfo prod) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("prod_id", prod.getProd_id());
		map.put("enable_flag", PRODTRANSSTATUS.NotAllow.getCode());
		map.put("trans_code", "t00014");//产品成立时p2p购买交易停掉
		productInfoSerivce.updateProdTransStatus(map);
	}
}
