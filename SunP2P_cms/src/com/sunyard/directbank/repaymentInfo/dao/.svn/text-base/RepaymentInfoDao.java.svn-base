package com.sunyard.directbank.repaymentInfo.dao;

import java.util.List;
import java.util.Map;

public interface RepaymentInfoDao {
	void insertP2pRepayBatch(List<Map<String,Object>> list);
	
	void insertFinancingRepayBatch(List<Map<String,Object>> list);
	
	void insertCustDetailRepayBatch(List<Map<String, Object>> list);

	List<Map<String, Object>> selectP2pRepayList(Map<String, Object> map);
	
	List<Map<String, Object>> selectCustRepayList(Map<String, Object> map);

	void updateCustRepayStatus(Map<String, Object> map);

	void updateP2pRepayStatus(Map<String, Object> map);

}
