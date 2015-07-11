package com.sunyard.directbank.Interceptor;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.StrutsStatics;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import com.sunyard.directbank.base.Exception.DBException;
import com.sunyard.directbank.base.Exception.DateNullException;

public class ExceptionInterceptor extends MethodFilterInterceptor {

	private static final long serialVersionUID = 6905417537239674995L;

	@Override
	protected String doIntercept(ActionInvocation actioninvocation) {
		String result = null; // Action的返回值
		try {
			// 运行被拦截的Action,期间如果发生异常会被catch住
			result = actioninvocation.invoke();
			return result;
		} catch (Exception e) {
			/**
			 * 处理异常
			 */
			String errorMsg = "未知错误！";
			String errorShow="未知错误！";
			// 通过instanceof判断到底是什么异常类型（数据库操作异常）
			if (e instanceof DataAccessException) {
				DataAccessException ee = (DataAccessException) e;
				ee.printStackTrace(); // 开发时打印异常信息，方便调试
				if (ee.getMessage() != null|| !"".equals(ee.getMessage().trim())) {
					// 获得错误信息
					errorMsg = ee.getMessage().trim();
				}
				errorShow="数据库操作异常！";
			} 
			//空指针异常
			else if (e instanceof NullPointerException) {
				NullPointerException ee = (NullPointerException) e;
				ee.printStackTrace(); // 开发时打印异常信息，方便调试
				if (ee.getMessage() != null|| !"".equals(ee.getMessage().trim())) {
					// 获得错误信息
					errorMsg = ee.getMessage().trim();
				}
				errorShow="空指针异常！";
			}
			//IO异常
			else if (e instanceof IOException) {
				IOException ee = (IOException) e;
				ee.printStackTrace(); // 开发时打印异常信息，方便调试
				if (ee.getMessage() != null|| !"".equals(ee.getMessage().trim())) {
					// 获得错误信息
					errorMsg = ee.getMessage().trim();
				}
				errorShow="读写异常！";
			}
			//数学运算异常
			else if (e instanceof ArithmeticException) {
				ArithmeticException ee = (ArithmeticException) e;
				ee.printStackTrace(); // 开发时打印异常信息，方便调试
				if (ee.getMessage() != null|| !"".equals(ee.getMessage().trim())) {
					// 获得错误信息
					errorMsg = ee.getMessage().trim();
				}
				errorShow="数学运算异常";
			}
			//数组下标越界
			else if (e instanceof ArrayIndexOutOfBoundsException) {
				ArrayIndexOutOfBoundsException ee = (ArrayIndexOutOfBoundsException) e;
				ee.printStackTrace(); // 开发时打印异常信息，方便调试
				if (ee.getMessage() != null|| !"".equals(ee.getMessage().trim())) {
					// 获得错误信息
					errorMsg = ee.getMessage().trim();
				}
				errorShow="数组下标越界";
			}
			//方法参数错误
			else if (e instanceof IllegalArgumentException) {
				IllegalArgumentException ee = (IllegalArgumentException) e;
				ee.printStackTrace(); // 开发时打印异常信息，方便调试
				if (ee.getMessage() != null|| !"".equals(ee.getMessage().trim())) {
					// 获得错误信息
					errorMsg = ee.getMessage().trim();
				}
				errorShow="方法参数错误";
			}
			//类转换异常
			else if (e instanceof ClassCastException) {
				ClassCastException ee = (ClassCastException) e;
				ee.printStackTrace(); // 开发时打印异常信息，方便调试
				if (ee.getMessage() != null|| !"".equals(ee.getMessage().trim())) {
					// 获得错误信息
					errorMsg = ee.getMessage().trim();
				}
				errorShow="类转换异常";
			}
			//违背安全原则异常
			else if (e instanceof SecurityException) {
				SecurityException ee = (SecurityException) e;
				ee.printStackTrace(); // 开发时打印异常信息，方便调试
				if (ee.getMessage() != null|| !"".equals(ee.getMessage().trim())) {
					// 获得错误信息
					errorMsg = ee.getMessage().trim();
				}
				errorShow="违背安全原则异常";
			}
			//操作数据库异常
			else if (e instanceof SQLException) {
				SQLException ee = (SQLException) e;
				ee.printStackTrace(); // 开发时打印异常信息，方便调试
				if (ee.getMessage() != null|| !"".equals(ee.getMessage().trim())) {
					// 获得错误信息
					errorMsg = ee.getMessage().trim();
				}
			}
			//自定义异常
			else if (e instanceof DBException) {
				DBException ee = (DBException) e;
				ee.printStackTrace(); // 开发时打印异常信息，方便调试
				if (ee.getMessage() != null|| !"".equals(ee.getMessage().trim())) {
					// 获得错误信息
					errorMsg = ee.getMessage().trim();
				}
				errorShow=ee.getMessage().trim();
			}
			else if (e instanceof DateNullException) {
				DateNullException ee = (DateNullException) e;
				ee.printStackTrace(); // 开发时打印异常信息，方便调试
				if (ee.getMessage() != null|| !"".equals(ee.getMessage().trim())) {
					// 获得错误信息
					errorMsg = ee.getMessage().trim();
				}
				errorShow=ee.getMessage().trim();
			}
			else if (e instanceof RuntimeException) {

				// 未知的运行时异常
				RuntimeException re = (RuntimeException) e;
				re.printStackTrace();
			} else {
				// 未知的严重异常
				e.printStackTrace();
			}
			// 把自定义错误信息
			HttpServletRequest request = (HttpServletRequest) actioninvocation
					.getInvocationContext().get(StrutsStatics.HTTP_REQUEST);

			/**
			 * 发送错误消息到页面
			 */
			request.setAttribute("msg", errorShow);

			/**
			 * log4j记录日志
			 */
			Logger logger = LoggerFactory.getLogger(this.getClass());
			if (e.getCause() != null) {
				logger.error(errorMsg, e);
			} else {
				logger.error(errorMsg, e);
			}

			return "error";
		}// ...end of catch
	}
}
