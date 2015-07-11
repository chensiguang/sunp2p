package com.sunyard.directbank.syslog.dao;

import java.util.Map;

import com.sunyard.directbank.base.dao.ReportDao;


public interface OperLogDao extends ReportDao{

	public void insertToOperLog(Map<String,String> map);
	
	public void updateOperRstCode(Map<String,String> map);

	//public List<Map<String, Object>> selectOperList(Map<String, Object> map);

	public Map<String, Object> getByName(String user_name);
	
}
