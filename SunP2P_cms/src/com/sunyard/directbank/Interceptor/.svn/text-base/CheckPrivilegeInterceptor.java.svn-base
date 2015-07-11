package com.sunyard.directbank.Interceptor;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.privilege.model.PrivilegeModel;
import com.sunyard.directbank.tools.PrivilegeUtil;
import com.sunyard.directbank.user.model.UserModel;

public class CheckPrivilegeInterceptor extends AbstractInterceptor {

	private static final long serialVersionUID = 4785841299953792690L;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {

		// 获取用户和访问的action信息
		UserModel user = (UserModel) ActionContext.getContext().getSession().get("user");
		String actionName = invocation.getProxy().getActionName();

		if (user == null) {

			// 如果没有登录就让用户登录
			if ("homeAction_login".equals(actionName)) {
				return invocation.invoke();
			} else {
				return "loginUI";
			}
		} else if (Consts.ADMIN_USER.equals(user.getUser_name())) {

			// 超级管理有所有的权限
			return invocation.invoke();
		} else {
			@SuppressWarnings("unchecked")
			// 所有权限的url
			List<String> allUrl = (List<String>) ActionContext.getContext().getApplication().get("allUrl");

			// 如果本URL不需要控制，则登录用户就可以使用，eg: 添加用户的提交按钮等
			if (!allUrl.contains(actionName)) {
				return invocation.invoke();
			} else {

				// 普通用户要判断是否含有这个权限
				List<PrivilegeModel> allocatedPrivileges = PrivilegeUtil.selectAllMyPrivileges(user.getUser_id());
				for (PrivilegeModel privilege : allocatedPrivileges) {
					if (privilege.getUrl() != null && privilege.getUrl().equals(actionName)) {
						return invocation.invoke();
					}
				}
			}
		}
		return "noPrivilegeError";
	}

}
