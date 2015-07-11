package com.sunyard.directbank.Interceptor;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class CheckLoginInterceptor extends MethodFilterInterceptor {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7309916369427093690L;

	private String returnUrl;
	
	@SuppressWarnings("unused")
	private Logger logger = Logger.getLogger(CheckLoginInterceptor.class);
	
	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
//		logger.info("进入拦截器");
//		CusAccountModel cusAccountModel = (CusAccountModel) ActionContext.getContext().getSession().get("user"); // 当前登录用户
//		String namespace = invocation.getProxy().getNamespace();
//		String actionName = invocation.getProxy().getActionName();
//		String privUrl = namespace + actionName; // 对应的权限URL
//		
//		HttpServletRequest request = ServletActionContext.getRequest();
//		//HttpServletResponse response = ServletActionContext.getResponse();
//		
//		// 如果登录
//		logger.info(cusAccountModel==null?"cusAccountModel为空":"cusAccountModel不为空");
//		if (cusAccountModel != null) {
//			return invocation.invoke();
//		}
//		if (privUrl.startsWith("/cusAccountAction_register") || privUrl.startsWith("/cusAccountAction_login")
//				|| privUrl.startsWith("/cusAccountAction_forgetPassword")
//				|| privUrl.startsWith("/cusAccountAction_resetLoginPassword")
//				|| privUrl.startsWith("/fundAction_selectPromote") || privUrl.startsWith("/p2pSaleAction_readyToBuy")
//				|| privUrl.startsWith("/cusAccountAction_updateEmail_chked")
//				|| privUrl.startsWith("/p2pAction_loadIndexHot")
//				|| privUrl.startsWith("/p2pAction_doSearchP2pProds")
//				|| privUrl.startsWith("/cusAccountAction_readyLogin")
//				|| privUrl.startsWith("/fundAction_selectPromote") || privUrl.startsWith("/fundAction_getIst")
//				|| privUrl.startsWith("/fundAction_loadIndexFund")|| privUrl.startsWith("/fundAction_getFundScope")|| privUrl.startsWith("/cusAccountAction_quit")
//				) {
//			// 如果是以上，就放行
//			return invocation.invoke();
//		} else {
//			
//			String path = request.getContextPath();
//			String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
//			String executeUrl = basePath+privUrl;
//			
//			Map<String, String[]> params = request.getParameterMap();
//			String queryString = "";
//			for (String key : params.keySet()) {
//				String[] values = params.get(key);
//				for (int i = 0; i < values.length; i++) {
//					String value = values[i];
//					queryString += key + "=" + value + "&";
//				}
//			}
//			// 去掉最后一个空格
//			if(queryString!=null && !queryString.trim().equalsIgnoreCase(""))
//				queryString = queryString.substring(0, queryString.length() - 1);
//			
//			
//			// 如果不是去登录，就转到登录页面
//			returnUrl=executeUrl+"?"+queryString;
//			
//			request.getSession().setAttribute("returnUrl", returnUrl);
//			logger.info("returnUrl =="+returnUrl);
			return "LoginUI";
//		}
	}
	public String getReturnUrl() {
		return returnUrl;
	}
	public void setReturnUrl(String returnUrl) {
		this.returnUrl = returnUrl;
	}
	
	
}
