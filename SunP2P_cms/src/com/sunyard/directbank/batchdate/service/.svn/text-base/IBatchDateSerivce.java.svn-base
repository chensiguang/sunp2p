package com.sunyard.directbank.batchdate.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.sunyard.directbank.base.model.IListPage;

public interface IBatchDateSerivce {

	IListPage pageQuery(Map<String, Object> param, int pageNo);
	
	void insertBatch(List<Map<String, Object>> paralist, Map<String, Object> param);

	Map<String, Object> loadOverViewByPK(Map<String, Object> para);
	
	List<Date> selectBatchDate(Map<String,Object> map);

}
