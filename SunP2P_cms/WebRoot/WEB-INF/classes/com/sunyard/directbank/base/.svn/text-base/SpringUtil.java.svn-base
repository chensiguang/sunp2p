/********************************************
 * 文件名称: Util <br/>
 * 系统名称: 直销银行V1.0
 * 模块名称: WEB业务平台帐户类
 * 软件版权: 信雅达系统工程股份有限公司
 * 功能说明: Spring工具类
 * 系统版本: 1.0.0.1
 * 开发人员:  Terrance
 * 开发时间: 2014年10月11日 上午9:39:01 <br/> 
 * 审核人员:
 * 相关文档:
 * 修改记录: 修改日期    修改人员    修改说明
 * V3.0.0.2 20130530-01  XXXX        提示报错 M201305300011
 *********************************************/

package com.sunyard.directbank.base;

import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;


public class SpringUtil {

	public static WebApplicationContext getWebApplicationContext(){
		WebApplicationContext wac = ContextLoader.getCurrentWebApplicationContext();  
		return wac;
	}
	
	public static DDUtil getCache(){
		return (DDUtil)getBean("dDUtil");
	}
	
	public static Object getBean(String name){
        return getWebApplicationContext().getBean(name);
    }
}
