package com.sunyard.directbank.repaymentInfo.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunyard.directbank.batchp2p.model.ShareInall;
import com.sunyard.directbank.enums.REPAYMENTSTATUS;
import com.sunyard.directbank.prod.model.ProdBaseInfo;
@Transactional
@Service
public class CustRepaymentInfoService extends RepaymentInfoService{
	
	@Override
	protected void insertRepaymentInfoToTable(List<Map<String, Object>> list) {
		repaymentInfoDao.insertCustDetailRepayBatch(list);
		
	}

	@Override
	protected void putExtraParamToMap(Map<String, Object> map, int currPeriod, Object in) {
		ProdBaseInfo prod =  getRepayType().getProd();
		ShareInall obj = (ShareInall) in;
		map.put("eacc_no", obj.getEacc_no());
		map.put("loanout_acc", obj.getAccount());
		map.put("prod_id", obj.getProd_id());
		map.put("repay_amount", getRepayType().getEachCapital(obj.getUse_vol(), currPeriod));
		map.put("repay_val", getRepayType().getEachInterest(obj.getUse_vol(), prod.getIst_year()));
		map.put("repay_amt", getRepayType().getEachAmt(obj.getUse_vol(), currPeriod, prod.getIst_year()));
		map.put("repay_status", REPAYMENTSTATUS.NotPay.getCode());
	}

	@Override
	public  List<Map<String, Object>> selectListByKey(Map<String, Object> map) {
		return repaymentInfoDao.selectCustRepayList(map);
	}
	
	@Override
	public void updateRepayStatus(Map<String, Object> map){
		repaymentInfoDao.updateCustRepayStatus(map);
	}
}
