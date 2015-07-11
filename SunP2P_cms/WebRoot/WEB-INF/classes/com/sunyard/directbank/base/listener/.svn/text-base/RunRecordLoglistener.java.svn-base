package com.sunyard.directbank.base.listener;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.sunyard.directbank.enums.SYSTYPE;
import com.sunyard.directbank.syslog.service.ISysLogService;


public class RunRecordLoglistener implements ServletContextListener {
	private String sys_action;	
	private Map<String,String> map = new HashMap<String,String>();
	private WebApplicationContext ctx;
	private ISysLogService sysLogService;

	public void contextDestroyed(ServletContextEvent servletcontextevent) {
		this.saveLog("系统关闭",sysLogService);

	}

	public void contextInitialized(ServletContextEvent servletcontextevent) {
		ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(servletcontextevent.getServletContext());
		sysLogService = (ISysLogService)ctx.getBean("sysLogService");
		this.saveLog("系统启动",sysLogService);

	}
	
	public void saveLog(String sys_action,ISysLogService sysLogService){
		this.setSys_action(sys_action);
		map.put("system_type", SYSTYPE.CMS.getCode());
		map.put("system_action", getSys_action());
		sysLogService.saveRunLog(map);
	}

	public String getSys_action() {
		return sys_action;
	}

	public void setSys_action(String sys_action) {
		this.sys_action = sys_action;
	}

}