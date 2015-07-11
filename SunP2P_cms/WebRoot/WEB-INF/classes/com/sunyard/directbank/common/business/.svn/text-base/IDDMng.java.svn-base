package com.sunyard.directbank.common.business;

import java.util.List;
import java.util.Map;



/********************************************
 * 文件名称: IP2pQueryMng <br/>
 * 系统名称: 直销银行V1.0
 * 模块名称: WEB业务平台帐户类
 * 软件版权: 信雅达系统工程股份有限公司
 * 功能说明:数据字典服务类
 * 系统版本: 1.0.0.1
 * 开发人员:  Terrance
 * 开发时间: 2014年10月9日16:21:26 <br/> 
 * 审核人员:
 * 相关文档:
 * 修改记录: 修改日期    修改人员    修改说明
 * V3.0.0.2 20130530-01  XXXX        提示报错 M201305300011
 *********************************************/

public interface IDDMng {
	public Map<String,Map<String,String>> getDDContent() throws Exception;
	public String getDDContentSpec(String key,String value) throws Exception;
	public List<Map<String,String>> getSys(String key) throws Exception ;
	public void clearDDContentSpecFromCache(String key,String value) throws Exception;
	public void clearSysFromCache(String key) throws Exception;
	
}
