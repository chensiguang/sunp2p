package com.sunyard.directbank.repaymentInfo.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunyard.directbank.enums.REPAYMENTSTATUS;
import com.sunyard.directbank.repayType.service.IRepayType;
import com.sunyard.directbank.repaymentInfo.dao.RepaymentInfoDao;
import com.sunyard.directbank.repaymentInfo.service.IRepaymentInfoSerivce;
@Transactional
@Service
public abstract class RepaymentInfoService implements IRepaymentInfoSerivce{
	@Resource
	protected RepaymentInfoDao repaymentInfoDao;
	private IRepayType repayType;

	public void setRepayType(IRepayType repayType) {
		this.repayType = repayType;
	}
	
	public IRepayType getRepayType() {
		return repayType;
	}
	
	@Override
	public void saveRepaymentInfoByBatch(Object in){
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		for(int currPeriod=1; currPeriod<=repayType.getPeriods(); currPeriod ++){
			list.add(generateCurrPeriodRepayment(currPeriod,in));
		}
		insertRepaymentInfoToTable(list);
	}

	protected abstract void insertRepaymentInfoToTable(List<Map<String, Object>> list) ;

	private Map<String, Object> generateCurrPeriodRepayment(int currPeriod, Object in) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("repay_num", currPeriod);
		map.put("repay_date", repayType.getRepaymentDate(currPeriod));
		map.put("status", REPAYMENTSTATUS.NotPay.getCode());
		putExtraParamToMap(map,currPeriod,in);
		return map;
	}
	
	protected abstract void putExtraParamToMap(Map<String, Object> map, int currPeriod, Object in);

	@Override
	public List<Map<String,Object>> selectListByKey(Map<String, Object> map) {
		return null;
	}
	
	@Override
	public void updateRepayStatus(Map<String, Object> map){}
	
	
	
}
