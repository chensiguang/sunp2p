package com.sunyard.directbank.sysparam.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import com.sunyard.directbank.sysparam.model.SysParam;

public interface SysParamDao {

	List<SysParam> selectSysParam(@Param("param_type") String param_type,@Param("value_name") String value_name);

	public int pageCount(Map<String, Object> param);

	public List<SysParam> pageQuery(Map<String, Object> param);

	public SysParam loadById(String param_id);

	public void insert(SysParam sysParam);
    
	public boolean update(SysParam sysParam);

	public boolean deleteAll(SysParam sysParam);

	public boolean deleteBatch(List<String> paramList);

}
