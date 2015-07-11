package com.sunyard.directbank.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * 该类主要用于字节码转换，以防止中文乱码现象
 * @author yaohui
 *
 */
public class CodeFilter implements Filter {
	protected FilterConfig filterConfig;
	//默认编码为utf8
	private String targetEncoding = "UFT-8";

	public void destroy() {
		this.filterConfig = null;

	}
	/**
	 * 分别设置request 与 response的编码
	 */
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		
		HttpServletRequest srequest = (HttpServletRequest) arg0;
		HttpServletResponse sresponse = (HttpServletResponse)arg1;
		try {
			srequest.setCharacterEncoding(this.targetEncoding);
			sresponse.setCharacterEncoding(this.targetEncoding);
			arg2.doFilter(arg0, arg1);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void init(FilterConfig arg0) throws ServletException {
		this.filterConfig = arg0;
		this.targetEncoding = arg0.getInitParameter("code");

	}

}