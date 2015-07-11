package com.sunyard.directbank.base;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.sunyard.directbank.base.model.Properties;

public class log4jlistener implements ServletContextListener {

	public static final String log4jdirkey = "log4jdir";

	public void contextDestroyed(ServletContextEvent servletcontextevent) {
		System.getProperties().remove(log4jdirkey);

	}

	public void contextInitialized(ServletContextEvent servletcontextevent) {
		String log4jdir = servletcontextevent.getServletContext().getRealPath("/");
		log4jdir = Properties.getString("logPath");
		System.setProperty(log4jdirkey, log4jdir);

	}

}