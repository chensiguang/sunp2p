package com.sunyard.directbank.sysparam.service;

import java.util.List;
import java.util.Map;
import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.sysparam.model.SysParam;

public interface ISysParamService {
     

	public List<SysParam> selectSysParam(String param_type, String value_name) throws Exception;

	public abstract IListPage pageQuery(Map<String, Object> param, int pageNo) throws Exception;

	public abstract SysParam loadSysParamById(String param_id);
	
	public abstract void insert(SysParam sysParam);

	public abstract boolean update(SysParam sysParam);

	public abstract boolean deleteAll(SysParam sysParam);

	public abstract boolean deleteBatch(List<String> paramList);

	
}