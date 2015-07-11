package com.sunyard.directbank.repaymentInfo.service.impl;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunyard.directbank.batchp2p.model.ShareInall;
import com.sunyard.directbank.eaccontAmt.service.IEaccountAmtService;
import com.sunyard.directbank.productInfo.service.IProductInfoSerivce;
import com.sunyard.directbank.repayType.service.IRepayType;
import com.sunyard.directbank.repaymentInfo.service.IRepaymentInfoSerivce;
import com.sunyard.directbank.tools.DateUtil;

@Transactional
@Service
public class RepaymentInfoUtil {
	
	@Resource
	private IProductInfoSerivce productInfoSerivce;
	@Resource
	private IEaccountAmtService eaccountAmtService;
	@Resource
	private IRepaymentInfoSerivce p2pRepaymentInfoService;
	@Resource
	private IRepaymentInfoSerivce financeRepaymentInfoService;
	@Resource
	private IRepaymentInfoSerivce custRepaymentInfoService;
	
	public void generateRepaymentInfo(IRepayType repayType){
		//p2p产品还款
		p2pRepaymentInfoService.setRepayType(repayType);
		p2pRepaymentInfoService.saveRepaymentInfoByBatch(null);
		
		//融资人还款
		financeRepaymentInfoService.setRepayType(repayType);
		financeRepaymentInfoService.saveRepaymentInfoByBatch(productInfoSerivce.loadFinanceObjectById(repayType.getProd()));
		
		//投资人还款
		List<ShareInall> custlist  = productInfoSerivce.getCustListBuyProd(repayType.getProd());
		custRepaymentInfoService.setRepayType(repayType);
		for(ShareInall cust : custlist){
			custRepaymentInfoService.saveRepaymentInfoByBatch(cust);
			updateShareInall(cust,repayType);//更新客户预收益和可转让份额
		}
	}

	private void updateShareInall(ShareInall cust, IRepayType repayType) {
		cust.setTot_val(repayType.getEachInterest(cust.getUse_vol()).multiply(new BigDecimal(repayType.getPeriods())));//预计总收益
		cust.setLast_date(DateUtil.today());
		cust.setTransfer_vol(cust.getUse_vol());//初始化可转让份额
		eaccountAmtService.updateShareInall(cust);
	}
}
