package com.sunyard.directbank.dict.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.sunyard.directbank.base.model.IListPage;

public interface IDictInfoSerivce {

	IListPage pageQuery(Map<String, Object> param, int pageNo);

	void add(Map<String, Object> param, List<Map<String, Object>> insertList);

	List<Map<String,Object>> getDictListByKey(Map<String, Object> param);

	Map<String, Object> show2Modi(Map<String, Object> paraMap);

	void update(Map<String, Object> param);

	void deleteBatch(List<Map<String, Object>> paraList, Set<String> keySet);

}
