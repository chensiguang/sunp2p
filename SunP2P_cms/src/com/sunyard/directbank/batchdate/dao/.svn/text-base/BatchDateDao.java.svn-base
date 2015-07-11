package com.sunyard.directbank.batchdate.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface BatchDateDao {

	int pageCount(Map<String, Object> param);
	List<Map<String, Object>> pageQuery(Map<String, Object> param);
	void insertBatch(List<Map<String, Object>> paralist);
	Map<String, Object> loadOverViewByPK(Map<String, Object> para);
	int getCountOverViewByPK(Map<String, Object> param);
	void deleteBatchByPK(Map<String, Object> param);
	void deleteOverViewByPK(Map<String, Object> param);
	void insertOverViewByPK(Map<String, Object> param);
	List<Date> selectBatchDateByProductId(Map<String, Object> map);


}
