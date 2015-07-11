package com.sunyard.directbank.base.listener;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.sunyard.directbank.privilege.service.IPrivilegeService;

public class InitListener implements ServletContextListener {

	private Logger logger = Logger.getLogger(InitListener.class);

	@Override
	public void contextInitialized(ServletContextEvent sc) {

		// 获取applicationContext对象
		ApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(sc.getServletContext());

		// @Service注解告诉spring创建一个实现类的实例，实例名默认为class类首字母小写，此处通过getBean得到这个实例
		IPrivilegeService iPrivilegeService = (IPrivilegeService) ac.getBean("privilegeService");

		// 登录的时候就为检查权限的拦截器准备所有权限url的数据
		List<String> allUrl = new ArrayList<String>();
		try {
			allUrl = iPrivilegeService.selectAllUrl();
			sc.getServletContext().setAttribute("allUrl", allUrl);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		logger.info("====================已准备所有权限url数据=====================");
	}

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {}

}
