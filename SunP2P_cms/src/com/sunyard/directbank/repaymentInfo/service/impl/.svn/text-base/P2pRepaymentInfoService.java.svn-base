package com.sunyard.directbank.repaymentInfo.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunyard.directbank.prod.model.ProdBaseInfo;
@Transactional
@Service
public class P2pRepaymentInfoService extends RepaymentInfoService{
	
	@Override
	protected void insertRepaymentInfoToTable(List<Map<String, Object>> list) {
		repaymentInfoDao.insertP2pRepayBatch(list);
		
	}

	@Override
	protected void putExtraParamToMap(Map<String, Object> map, int currPeriod, Object in) {
		ProdBaseInfo prod =  getRepayType().getProd();
		map.put("repay_amt", getRepayType().getEachAmt(prod.getSaled_limit(), currPeriod, prod.getIst_year()));
		map.put("prod_id", prod.getProd_id());
	}

	@Override
	public  List<Map<String, Object>> selectListByKey(Map<String, Object> map) {
		return repaymentInfoDao.selectP2pRepayList(map);
	}

	@Override
	public void updateRepayStatus(Map<String, Object> map){
		repaymentInfoDao.updateP2pRepayStatus(map);
	}
}
