package com.sunyard.directbank.dict.dao;

import java.util.List;
import java.util.Map;

import com.sunyard.directbank.fund.model.FundInfo;

public interface DictInfoDao {

	int pageCount(Map<String, Object> param);

	List<FundInfo> pageQuery(Map<String, Object> param);

	void insertDictMap(Map<String, Object> param);

	void insertDict(List<Map<String, Object>> insertList);

	int loadDictMapBykey(Map<String, Object> param);

	List<Map<String,Object>> loadDictListByKey(Map<String, Object> param);

	Map<String, Object> getSpeciDictById(Map<String, Object> paraMap);

	Object getSpeciDictMapById(Map<String, Object> paraMap);

	void updateDictMap(Map<String, Object> param);

	void updateDict(Map<String, Object> param);

	void deleteDict(Map<String, Object> item);

	int getDictCountByKey(String sun_key);

	void deleteDictMapBatch(List<String> dictMapList);


}
