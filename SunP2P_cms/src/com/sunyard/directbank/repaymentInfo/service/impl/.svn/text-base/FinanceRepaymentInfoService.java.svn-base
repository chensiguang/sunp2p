package com.sunyard.directbank.repaymentInfo.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunyard.directbank.finance.model.FinanceModel;
import com.sunyard.directbank.prod.model.ProdBaseInfo;
@Transactional
@Service
public class FinanceRepaymentInfoService extends RepaymentInfoService{
	
	@Override
	protected void insertRepaymentInfoToTable(List<Map<String, Object>> list) {
		repaymentInfoDao.insertFinancingRepayBatch(list);
	}

	@Override
	protected void putExtraParamToMap(Map<String, Object> map, int currPeriod, Object in) {
		ProdBaseInfo prod =  getRepayType().getProd();
		FinanceModel obj = (FinanceModel) in;
		map.put("repay_amt", getRepayType().getEachAmt(prod.getSaled_limit(), currPeriod, obj.getFinanc_int()));
		map.put("financ_id", obj.getFinanc_id());
	}
	
}
