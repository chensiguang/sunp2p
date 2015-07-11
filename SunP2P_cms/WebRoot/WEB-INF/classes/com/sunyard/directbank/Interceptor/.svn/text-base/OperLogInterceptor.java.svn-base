package com.sunyard.directbank.Interceptor;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.base.model.ParamCover;
import com.sunyard.directbank.enums.RSTCODE;
import com.sunyard.directbank.syslog.service.IOperLogService;
import com.sunyard.directbank.user.action.HomeAction;
import com.sunyard.directbank.user.model.UserModel;

public class OperLogInterceptor extends MethodFilterInterceptor {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7309916369427093690L;
	
	private Logger logger = Logger.getLogger(OperLogInterceptor.class);
	
	@Resource
	private IOperLogService operLogService;
	
	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		logger.info("进入操作日志拦截器");
		Map<String,String> map = new HashMap<String,String>();
		
		String actionName = invocation.getProxy().getActionName();
		Object action = invocation.getAction();
		logger.info( "actionName=" + actionName);
		
		HttpServletRequest request = ServletActionContext.getRequest();
		UserModel user = (UserModel)invocation.getInvocationContext().getSession().get("user");
		
		String log_id = Long.toString(System.currentTimeMillis());
		map.put("log_id",log_id);
		map.put("fun_url", actionName);
		map.put("user_ip", getIpAddress(request));
		map.put("rst_code", RSTCODE.ERR.getCode());//方法执行前 状态都是失败
		map.put("oper_info", "");
		
		if(user == null){
			if(action instanceof HomeAction && "homeAction_login".equals(actionName)){
				 Method[] methods = action.getClass().getMethods();
				 for(Method method : methods){
					 if("getModel".equals(method.getName())){
						 UserModel login_user = (UserModel) method.invoke(action);
						 map.put("user_id", (String)operLogService.getByName(login_user.getUser_name()).get("user_id"));
						 map.put("user_name", login_user.getUser_name());
						 break;
					 }
				 }
			}else{
				return Consts.LOGIN;
			}
		}else{
			map.put("user_id", user.getUser_id());
			map.put("user_name", user.getUser_name());
		}
		
		logger.info("插入操作表的参数map=" + map);
		operLogService.saveOperLog(map);
		
		paramCover(request); // 参传递
		String returnCode = invocation.invoke();
		logger.info("returnCode=" + returnCode);
		
		
		map.put("rst_code", RSTCODE.SUC.getCode());//执行成功后  update 日志表的操作成功标志（为成功）
		
		if(returnCode != Consts.ERROR && returnCode != Consts.LOGIN){
			operLogService.updateRstCode(map);
		}
		
		return returnCode;
	}
	
	private String getIpAddress(HttpServletRequest request) { 
	       
        String ip = request.getHeader("x-forwarded-for");     
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {      
            ip = request.getHeader("Proxy-Client-IP");      
        }
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {    
            ip = request.getHeader("WL-Proxy-Client-IP");     
        }      
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {      
            ip = request.getRemoteAddr();    
        }      
        return ip;   
    } 
	
	/**
	 * 参转换及传递
	 * 
	 * @param request
	 */
	private void paramCover(HttpServletRequest request) {
		request.setAttribute(Consts.PARAM_COVER, new ParamCover(request));
	}
}
