package com.sunyard.directbank.finance.dao;

import java.util.List;
import java.util.Map;
import org.springframework.dao.DataAccessException;

public interface FinanceDao {

	public int pageCount(Map<String, Object> param) throws DataAccessException;
	
	public List<Map<String,Object>> pageQuery(Map<String, Object> param) throws DataAccessException;
	
	public Map<String, Object> details(Map<String, Object> param);
	
	public void approve(Map<String, Object> param);
	
	public void refuse(Map<String, Object> param);
	
	public Map<String, Object> selectOneFinance(Map<String, Object> param);
}
