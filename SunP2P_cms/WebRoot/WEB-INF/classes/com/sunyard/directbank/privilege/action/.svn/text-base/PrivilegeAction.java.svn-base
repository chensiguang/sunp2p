package com.sunyard.directbank.privilege.action;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.sunyard.directbank.base.BaseAction;
import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.privilege.model.PrivilegeModel;
import com.sunyard.directbank.tools.ParamUtil;

@Controller
@Scope("prototype")
public class PrivilegeAction extends BaseAction<PrivilegeModel> {

	private static final long serialVersionUID = 8737148735501762427L;
	private Logger logger = Logger.getLogger(PrivilegeAction.class);
	HttpServletRequest request = ServletActionContext.getRequest();
	
	/**
	 * 根据ID和name进行模糊查找
	 * @return
	 */
	public String selectPrivilege() throws Exception {
		
		try {
			List<PrivilegeModel> privilegeList = iPrivilegeService.selectPrivilege(model.getPrivilege_id(), model.getPrivilege_name());
			System.out.println(privilegeList);
			request.setAttribute("privilegeList", privilegeList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "selectPrivileges";
	}
	
	/**
	 * 添加页面
	 * @return
	 */
	public String addPrivilegeUI() throws Exception {
		
		return "addPrivilegeUI";
	}
	
	/**
	 * 添加权限
	 * @return
	 * @throws Exception 
	 */
	public String addPrivilege() throws Exception {
		
		if(iPrivilegeService.addPrivilege(model)) {
			
			request.setAttribute("msg", "添加权限成功！");
			return "syssuccess";
		}else {
			
			return Consts.ERROR;
		}
	}
	
	/**
	 * 修改权限页面
	 * @return
	 */
	public String updatePrivilegeUI() throws Exception {
		
		PrivilegeModel privilege = iPrivilegeService.getById(model.getPrivilege_id());
		System.out.println(privilege);
		// 用于信息回显
//		ActionContext.getContext().getSession().put("privilege", privilege);
		request.setAttribute("privilege", privilege);
		
		return "updatePrivilegeUI";
	}
	
	/**
	 * 修改权限
	 * @return
	 */
	public String updatePrivilege() throws Exception {
		
		PrivilegeModel privilege = iPrivilegeService.getById(model.getPrivilege_id());
		
		// 设置修改的内容
		privilege.setPrivilege_name(model.getPrivilege_name());
		privilege.setParent_id(model.getParent_id());
		privilege.setUrl(model.getUrl());
		
		System.out.println(privilege);
		if(iPrivilegeService.updatePrivilege(privilege)) {
			
			request.setAttribute("msg", "修改权限成功！");
			return "syssuccess";
		}else {
			
			return Consts.ERROR;
		}
		
	}
	
	/**
	 * 删除权限
	 * @return
	 */
	public String deletePrivilege() throws Exception {
		
		String privilegeid = model.getPrivilege_id();
		privilegeid = privilegeid.substring(0, privilegeid.length()-1);
		String[] privilegetemp = privilegeid.split(",");
		
		// 由于mysql批量删除要求传入list，此处将String类型转为List类型
		List<String> privilegelist = Arrays.asList(privilegetemp);
		
		// 调用批量删除方法
		if(iPrivilegeService.deleteBatch(privilegelist)) {
			
			logger.info("删除privilege成功！");
			return "toSelectPrivileges";
		}else {
			
			return Consts.ERROR;
		}
		
	}
	
	/**
	 * 查询所有权限
	 * @return
	 * @throws Exception 
	 */
	public String selectAllPrivileges() throws Exception {
		
		// model参数转换为map用于后面添加分页参数
		Map<String, Object> param = ParamUtil.transBean2Map(model);
		if(param == null) {
			param = new HashMap<String, Object>();
		}
		logger.info("model=========" + param);
		
		// 得到当前的页数，默认值是1
		int pageNo = ParamUtil.getInt(request, "pageNo", 1);
		
		// 根据条件查询要显示的记录
		IListPage page = iPrivilegeService.pageQuery(param,pageNo);
		logger.info("page====" + page.getResult());
		
		request.setAttribute("page", page);
		request.setAttribute("param", param);

		return "selectPrivileges";
	}
	
	@Override
	protected String getModuleName() throws Exception {
		return "权限管理";
	}
}
