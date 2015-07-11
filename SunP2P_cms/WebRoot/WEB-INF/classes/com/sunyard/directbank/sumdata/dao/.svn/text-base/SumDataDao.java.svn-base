package com.sunyard.directbank.sumdata.dao;

import java.util.List;
import java.util.Map;


public interface SumDataDao {

	int haveStatisticsTodayForTransAmt(Map<String, Object> map);

	int haveStatisticsTodayForAmtList(Map<String, Object> map);

	int haveStatisticsTodayForEAccount(Map<String, Object> map);

	List<Map<String, Object>> getTransAmtList(Map<String, Object> param);

	void insertTransAmtBatch(List<Map<String, Object>> list);

	List<Map<String, Object>> getTransAmtListList(Map<String, Object> param);

	List<String> bankCardList();

	String loadBankNoById(String oppo_acc);

	void insertAmtList(Map<String, Object> map);

	List<Map<String, Object>> getEAccountList(Map<String, Object> param);

	void insertEAccountList(Map<String, Object> map);

	
}
