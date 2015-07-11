package com.sunyard.directbank.syslog.service;

import java.util.Map;

public interface IOperLogService {
	public void saveOperLog(Map<String,String> map);
	public void updateRstCode(Map<String,String> map);
	public Map<String, Object> getByName(String user_name);
}