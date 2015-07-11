package com.sunyard.directbank.role.action;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.sunyard.directbank.base.BaseAction;
import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.privilege.model.PrivilegeModel;
import com.sunyard.directbank.role.model.RoleModel;
import com.sunyard.directbank.tools.ParamUtil;

@Controller
@Scope("prototype")
public class RoleAction extends BaseAction<RoleModel> {

	private static final long serialVersionUID = -105799595147085470L;
	private Logger logger = Logger.getLogger(RoleAction.class);
	HttpServletRequest request = ServletActionContext.getRequest();
	
	/**
	 * 查询某些角色
	 * 
	 * @return
	 * @throws Exception 
	 */
	public String selectRole() throws Exception {

		// 根据role_id 和 role_name模糊查询某些角色
		List<RoleModel> roleModule = iRoleService.selectRole(model.getRole_id(), model.getRole_name());
		ActionContext.getContext().put("roleModule", roleModule);

		return "selectRoles";
	}

	/**
	 * 添加角色页面
	 * 
	 * @return
	 */
	public String addRoleUI() throws Exception {

		return "addRoleUI";
	}

	/**
	 * 添加角色
	 * 
	 * @return
	 * @throws Exception 
	 */
	public String addRole() throws Exception {

		if(iRoleService.addRole(model)) {
			
			request.setAttribute("msg", "添加角色成功！");
			return "syssuccess";
		}else {
			
			return Consts.ERROR;
		}

	}

	/**
	 * 修改角色页面
	 * 
	 * @return
	 * @throws Exception 
	 */
	public String updateRoleUI() throws Exception {

		RoleModel role = iRoleService.getById(model.getRole_id());

		// 将查询出来的角色放到valueStack的值栈中，用来回显信息
//		ActionContext.getContext().getValueStack().push(role);
		request.setAttribute("role", role);

		return "updateRoleUI";
	}

	/**
	 * 修改角色
	 * 
	 * @return
	 * @throws Exception 
	 */
	public String updateRole() throws Exception {

		RoleModel role = iRoleService.getById(model.getRole_id());

		// 设置属性的值
		role.setRole_name(model.getRole_name());
		role.setRole_desc(model.getRole_desc());

		if(iRoleService.updateRole(role)) {
			
			request.setAttribute("msg", "修改角色成功！");
			return "syssuccess";
		}else {
			
			return Consts.ERROR;
		}

	}

	/**
	 * 删除角色
	 * 
	 * @return
	 * @throws Exception 
	 */
	public String deleteRole() throws Exception {

		String roleid = model.getRole_id();
		roleid = roleid.substring(0, roleid.length()-1);
		String[] roletemp = roleid.split(",");
		
		// 由于mysql批量删除要求传入list，此处将String类型转为List类型
		List<String> list = Arrays.asList(roletemp);
		System.out.println(list.size());
		
		// 调用批量删除方法
		if(iRoleService.deleteBatch(list)) {
			
			logger.info("======================>删除角色成功！");
			return "toSelectRoles";
		}else {

			return Consts.ERROR;
		}
	}

	/**
	 * 查询所有角色
	 * 
	 * @return
	 * @throws Exception 
	 */
	public String selectAllRoles() throws Exception {

		/*List<RoleModel> roleModule = iRoleService.selectAllRoles();
		System.out.println(roleModule);
		request.setAttribute("roleModule", roleModule);*/
		
		// 真分页
		// model参数转换为map用于后面添加分页参数
		Map<String, Object> param = ParamUtil.transBean2Map(model);
		if(param == null) {
			param = new HashMap<String, Object>();
		}
		logger.info("model=========" + param);
		
		// 得到当前的页数，默认值是1
		int pageNo = ParamUtil.getInt(request, "pageNo", 1);
		
		// 根据条件查询要显示的记录
		IListPage page = iRoleService.pageQuery(param,pageNo);
		logger.info("page====" + page.getResult());
		
		request.setAttribute("page", page);
		request.setAttribute("param", param);

		return "selectRoles";
	}
	
	/**
	 * 分配权限页面
	 * @return
	 * @throws Exception 
	 */
	public String privilegeDistbUI() throws Exception {
		
		// 回显角色信息
		RoleModel role = iRoleService.getById(model.getRole_id());
		request.setAttribute("role", role);
		
		List<PrivilegeModel> privilegeList = iPrivilegeService.selectAllPrivileges();
		
		List<PrivilegeModel> leftList = iPrivilegeService.selectAllocatedPrivileges(model.getRole_id());
		List<PrivilegeModel> leftListCopy = new ArrayList<PrivilegeModel>(leftList);
		// 通过roleList-leftList得到rightList
		if(!leftList.isEmpty()) {
			int i = 0;
			while(i < privilegeList.size()) {
				if(privilegeList.get(i).getPrivilege_id().equals(leftListCopy.get(0).getPrivilege_id())) {
					privilegeList.remove(privilegeList.get(i));
					leftListCopy.remove(leftListCopy.get(0));
					i = 0;
					System.out.println("set i to 0");
					
					if(leftListCopy.isEmpty())
						break;
				} else {
					i++;
				}
			}
		}
		List<PrivilegeModel> rightList = privilegeList;
		
		request.setAttribute("leftList", leftList);
		request.setAttribute("rightList", rightList);
		
		return "privilegeDistbUI";
	}
	
	/**
	 * 分配权限
	 * @return
	 * @throws Exception 
	 */
	public String privilegeDistb() throws Exception {
		
		String[] leftPrivileges = request.getParameterValues("leftPrivileges");
		String[] rightPrivileges = request.getParameterValues("rightPrivileges");
		String role_id = request.getParameter("role_id");
		
		// 新增已分配权限，并添加到数据库
		if(leftPrivileges != null) {
			for(int i = 0; i < leftPrivileges.length; i++) {
				iPrivilegeService.privilegeDistbAdd(role_id, leftPrivileges[i]);
			}
			request.setAttribute("msg", "分配权限成功！");
		}
		
		// 删除已分配权限，并从数据库删除
		if(rightPrivileges != null) {
			for(int i = 0; i < rightPrivileges.length; i++) {
				iPrivilegeService.privilegeDistbDelete(role_id, rightPrivileges[i]);
			}
			request.setAttribute("msg", "分配权限成功！");
		}
		
		return "syssuccess";
	}
	
	/**
	 * 将有权限的按钮显示在页面上
	 * @throws Exception
	 */
	/*public void getButton() throws Exception {
		
		UserModel activeUser = getUser();
		List<PrivilegeModel> allocatedPrivileges = super.selectAllMyPrivileges(activeUser.getUser_id());
		List<PrivilegeModel> leafPrivileges = new ArrayList<PrivilegeModel>();
		String buttonID = null;
		
		// 获取用户管理的privilege_id
		for(PrivilegeModel priv : allocatedPrivileges) {
			if("角色管理".equalsIgnoreCase(priv.getPrivilege_name())) {
				buttonID = priv.getPrivilege_id();
			}
		}
		
		// 父id的值为_id的叶子节点即为要在页面上显示的按钮
		for(PrivilegeModel privilege : allocatedPrivileges) {
			if(privilege.getParent_id()!=null && privilege.getParent_id().equalsIgnoreCase(buttonID) ) {
				
				logger.info("------------------------->>"+ buttonID);
				leafPrivileges.add(privilege);
			}
		}
		
		// 将list类型的数据转换为json通过ajax在页面获取
		String result = JSONUtil.getJSONArrayFromList(leafPrivileges).toString();
		write(result);
	}*/
	@Override
	protected String getModuleName() throws Exception {
		return "角色管理";
	}
}
