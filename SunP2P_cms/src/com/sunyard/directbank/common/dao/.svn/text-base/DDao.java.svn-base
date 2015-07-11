package com.sunyard.directbank.common.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;


/********************************************
 * 文件名称: IP2pQuery <br/>
 * 系统名称: 直销银行V1.0 
 * 模块名称: WEB业务平台帐户类 
 * 软件版权: 信雅达系统工程股份有限公司 
 * 功能说明: 数据字典的缓存
 * 系统版本: 1.0.0.1 
 * 开发人员: Terrance 
 * 开发时间: 2014年10月9日16:21:54
 * 审核人员: 相关文档: 修改记录: 修改日期 修改人员 修改说明 V3.0.0.2 20130530-01 XXXX 提示报错 M201305300011
 *********************************************/

public interface DDao {
	@SuppressWarnings("rawtypes")
	public List getDDContent() throws Exception;
	public String getDDContentSpec(@Param("key") String key,@Param("value") String value) throws Exception;
	public List<Map<String,String>> getSys(String key) throws Exception;
	@SuppressWarnings("rawtypes")
	public List<Map> getAllSys() throws Exception;
}
