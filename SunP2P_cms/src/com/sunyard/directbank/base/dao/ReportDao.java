package com.sunyard.directbank.base.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;


public interface ReportDao {

	public List<Map<String,Object>> selectList(Map<String,Object> map) throws SQLException;

	public int pageCount(Map<String, Object> param) throws SQLException;

	public List<Map<String,Object>> pageQuery(Map<String, Object> param) throws SQLException;
	
}
