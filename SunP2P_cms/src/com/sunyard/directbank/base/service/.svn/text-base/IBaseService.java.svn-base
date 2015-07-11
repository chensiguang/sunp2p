package com.sunyard.directbank.base.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.sunyard.directbank.base.dao.ReportDao;
import com.sunyard.directbank.base.dao.StatisticsDao;
import com.sunyard.directbank.base.model.IListPage;

public interface IBaseService {
	//查询类
	List<Map<String,Object>> selectList(ReportDao baseDao, Map<String,Object> map) throws SQLException;

	List<Map<String, Object>> selectList(Map<String, Object> param) throws SQLException;
	
	IListPage pageQuery(ReportDao baseDao, Map<String, Object> param, int pageNo) throws SQLException;

	IListPage pageQuery(Map<String, Object> param, int pageNo) throws SQLException;
	
	//统计类
	List<Map<String, Object>> selectList(Map<String, Object> param,String date_type);
	
	List<Map<String, Object>> selectList(StatisticsDao dao,Map<String, Object> param,String date_type);
	
	IListPage pageQuery(Map<String, Object> param, int pageNo, String date_type);
	
	IListPage pageQuery(StatisticsDao dao,Map<String, Object> param, int pageNo, String date_type);
}