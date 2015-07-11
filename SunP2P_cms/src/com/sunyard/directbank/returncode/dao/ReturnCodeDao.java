package com.sunyard.directbank.returncode.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunyard.directbank.returncode.model.ReturnCode;

@Service
@Transactional
public interface ReturnCodeDao {
    public List<ReturnCode> select(@Param("return_code") String return_code,@Param("return_msg") String return_msg);
    
	public int pageCount(Map<String, Object> param);

	public List<ReturnCode> pageQuery(Map<String, Object> param);

	public void insert(ReturnCode returnCode);

	public ReturnCode loadRCodeById(String return_code);
 
	public boolean update(ReturnCode returnCode);
	
	public boolean deleteBatch(List<String> paramList);
}
