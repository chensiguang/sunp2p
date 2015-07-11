package com.sunyard.directbank.returncode.service;

import java.util.List;
import java.util.Map;

import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.returncode.model.ReturnCode;

public interface IReturnCodeService {

	public List<ReturnCode> select(String return_code, String return_msg) throws Exception;

	public abstract IListPage pageQuery(Map<String, Object> param, int pageNo) throws Exception;

	public abstract ReturnCode loadRCodeById(String param_id);
	
	public abstract void insert(ReturnCode rCode);

	public abstract boolean update(ReturnCode rCode);

	
	public abstract boolean deleteBatch(List<String> paramList);

}
