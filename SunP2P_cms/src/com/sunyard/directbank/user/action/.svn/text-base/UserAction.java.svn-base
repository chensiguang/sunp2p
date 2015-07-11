package com.sunyard.directbank.user.action;

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

import com.sunyard.directbank.base.BaseAction;
import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.department.model.DepartmentModel;
import com.sunyard.directbank.role.model.RoleModel;
import com.sunyard.directbank.tools.ParamUtil;
import com.sunyard.directbank.tools.TreeUtil;
import com.sunyard.directbank.user.model.UserModel;

@Controller
@Scope("prototype")
public class UserAction extends BaseAction<UserModel> {

	private static final long serialVersionUID = 2996539554022688026L;
	private Logger logger = Logger.getLogger(UserAction.class);
	HttpServletRequest request = ServletActionContext.getRequest();
	
	/**
	 * 模糊查询用户
	 * 
	 * @return
	 */
	public String selectUser() throws Exception {

		// 按照条件查询用户
		List<UserModel> userModule = iUserService.selectUser(model.getUser_id(), model.getUser_name(), model.getUser_state(), model.getDepartment_id());
		request.setAttribute("userModule", userModule);

		return "selectUsers";
	}

	/**
	 * 添加用户页面
	 * 
	 * @return
	 */
	public String addUserUI() throws Exception {

		// 准备上级机构信息
		List<DepartmentModel> topDepartments = iDepartmentService.selectTopDepartments();
		List<DepartmentModel> list = new ArrayList<DepartmentModel>();
		
		// 显示树状结构
		try {
			List<DepartmentModel> departmentTree = TreeUtil.walkDepartmentTreeList(topDepartments,"",list);
			request.setAttribute("departmentTree", departmentTree);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "addUserUI";
	}

	/**
	 * 添加用户
	 * 
	 * @return
	 */
	public String addUser() throws Exception {
		
		// 初始密码为888888
		model.setUser_pwd(Consts.USER_DEFAULT_PWD);
		
		// 初始状态为0，代表初始化状态
		model.setUser_state(Consts.USER_DEFAULT_STATE);
		
		if(iUserService.addUser(model)) {
			
			request.setAttribute("msg", "添加用户成功！");
			return Consts.SYSSUCCESS;
		}else {
			
			return Consts.ERROR;
		}

	}

	/**
	 * 修改用户页面
	 * 
	 * @return
	 */
	public String updateUserUI() throws Exception {

		// 准备上级机构信息
		List<DepartmentModel> topDepartments = iDepartmentService.selectTopDepartments();
		List<DepartmentModel> list = new ArrayList<DepartmentModel>();
		
		// 显示树状结构
		List<DepartmentModel> departmentTree = TreeUtil.walkDepartmentTreeList(topDepartments,"",list);
		request.setAttribute("departmentTree", departmentTree);

		// 查询用户信息用于回显
		UserModel user = iUserService.getById(model.getUser_id());
		request.setAttribute("user", user);
		String[] paramArr = {Consts.USER_STATE, Consts.USER_TYPE};
		super.getDirtMap(paramArr);

		return "updateUserUI";
	}

	/**
	 * 修改用户
	 * 
	 * @return
	 */
	public String updateUser() throws Exception {

		// 获取当前用户
		UserModel user = iUserService.getById(model.getUser_id());
		
		user.setUser_name(model.getUser_name());
		user.setUser_type(model.getUser_type());
		user.setUser_desc(model.getUser_desc());
		user.setDepartment_id(model.getDepartment_id());
		
		if(iUserService.updateUser(model)) {
			
			request.setAttribute("msg", "修改用户成功！");
			return Consts.SYSSUCCESS;
		}else {
			
			return Consts.ERROR;
		}
		

	}

	/**
	 * 删除用户
	 * 
	 * @return
	 */
	public String deleteUser() throws Exception {

		// 获取需要删除的用户id
		String userid = model.getUser_id();
		userid = userid.substring(0, userid.length()-1);
		String[] usertemp = userid.split(",");
		
		// 由于mysql批量删除要求传入list，此处将String类型转为List类型
		List<String> userList = Arrays.asList(usertemp);
		
		// 调用批量删除方法
		if(iUserService.deleteBatch(userList)) {
			
			logger.info("删除用户成功！");
			return Consts.SYSSUCCESS;
		}else {
			
			return Consts.ERROR;
		}
	}

	/**
	 * 查询所有的用户
	 * 
	 * @return
	 * @throws Exception 
	 */
	public String selectAllUsers() throws Exception {
		
		// 准备上级机构信息
		List<DepartmentModel> topDepartments = iDepartmentService.selectTopDepartments();
		List<DepartmentModel> list = new ArrayList<DepartmentModel>();
		
		// 显示树状结构
		List<DepartmentModel> departmentTree = TreeUtil.walkDepartmentTreeList(topDepartments,"",list);
		request.setAttribute("departmentTree", departmentTree);
		
		// 显示所有用户
		/*List<UserModel> userModule = iUserService.selectAllUsers();
		request.setAttribute("userModule", userModule);
		System.out.println(userModule);*/
		
		// 真分页
		// model参数转换为map用于后面添加分页参数
		Map<String, Object> param = ParamUtil.transBean2Map(model);
		if(param == null) {
			param = new HashMap<String, Object>();
		}
		logger.info("model==========" + param);
		
		// 得到当前的页数，默认值是1
		int pageNo = ParamUtil.getInt(request, "pageNo", 1);
		
		// 根据条件查询要显示的记录
		IListPage page = iUserService.pageQuery(param,pageNo);
		logger.info("page="+ page.getResult());
		
		request.setAttribute("page", page);
		request.setAttribute("param", param);
		String[] paramArr = {Consts.USER_STATE};
		super.getDirtMap(paramArr);
		
		return "selectUsers";
	}

	/**
	 * 密码重置为888888
	 * 
	 * @return
	 */
	public String resetPwd() throws Exception {

		iUserService.resetPwd(model.getUser_id(), Consts.USER_DEFAULT_PWD);
		request.setAttribute("msg", "密码重置成功！");

		return Consts.SYSSUCCESS;
	}

	/**
	 * 密码修改页面
	 * 
	 * @return
	 */
	public String updatePwdUI() throws Exception {

		UserModel userupdate = iUserService.getById(model.getUser_id());
		request.setAttribute("userupdate", userupdate);
		
		return "updatePwdUI";
	}

	/**
	 * 密码修改
	 * 
	 * @return
	 */
	public String updatePwd() throws Exception {

		// 得到页面传来的新密码
		String user_new_pwd = request.getParameter("user_new_pwd");
		
		// 验证用户是否存在
		UserModel user = iUserService.findByUserIdAndPwd(model.getUser_name(), model.getUser_pwd());
		if (user == null) {

			addFieldError("usernewpwd", "当前用户不存在，请重新输入~");
			return "updatePwdUI";
		}
		
		if(iUserService.updatePwd(model.getUser_id(), user_new_pwd)) {
			
			request.setAttribute("msg", "修改密码成功！");
			return Consts.SYSSUCCESS;
		}else {
			
			return Consts.ERROR;
		}
	}

	/**
	 * 锁定用户，0初始化用户，1为正常，2为在线，3为锁定 设置用户状态为3
	 * 
	 * @return
	 */
	public String lockUser() throws Exception {

		iUserService.lockUser(model.getUser_id(), Consts.USER_STATE_LOCK);
		request.setAttribute("msg", "锁定用户成功！");

		return Consts.SYSSUCCESS;
	}

	/**
	 * 用户解锁，0初始化用户，1为正常，2为在线，3为锁定 设置用户状态为1
	 * 
	 * @return
	 */
	public String unlockUser() throws Exception {

		UserModel user = iUserService.getById(model.getUser_id());
		if( !user.getUser_state().equals(Consts.USER_STATE_LOCK) ) {
			request.setAttribute("msg", "该用户没被锁定，不可解锁！");
			return Consts.ERROR;
		} else {
			iUserService.unlockUser(model.getUser_id(), Consts.USER_STATE_UNLOCK);
			request.setAttribute("msg", "解锁用户成功！");
			return Consts.SYSSUCCESS;
		}
	}
	
	/**
	 * 角色分配页面
	 * 
	 * @return
	 */
	public String roleDistbUI() throws Exception {
		
		// 查询用户信息用于回显
		UserModel user = iUserService.getById(model.getUser_id());
		request.setAttribute("user", user);
		
		// 准备角色信息
		List<RoleModel> roleList = iRoleService.selectAllRoles();
		
		// 查询所有已分配的角色放在leftList中
		List<RoleModel> leftList = iRoleService.selectAllocatedRoles(model.getUser_id());
		List<RoleModel> leftListCopy = new ArrayList<RoleModel>(leftList);
		
		// 通过roleList-leftList得到rightList
		if(!leftListCopy.isEmpty()) {
			int i = 0;
			while(i < roleList.size()) {
				if(roleList.get(i).getRole_id().equals(leftListCopy.get(0).getRole_id())) {
					roleList.remove(roleList.get(i));
					leftListCopy.remove(leftListCopy.get(0));
					
					i = 0;	// 当有删除操作时，将i赋值为0，再次从头开始比较
					if(leftListCopy.isEmpty())
						break;
				} else {
					i++;
				}
			}
		}
		List<RoleModel> rightList = roleList;
		
		request.setAttribute("leftList", leftList);
		request.setAttribute("rightList", rightList);
		
		return "roleDistbUI";
	}

	/**
	 * 角色分配
	 * 
	 * @return
	 */
	public String roleDistb() throws Exception {
		
		// 取得需要分配的角色id
		String[] leftRoles = request.getParameterValues("leftRoles");
		String[] rightRoles = request.getParameterValues("rightRoles");
		String user_id = request.getParameter("user_id");
		
		// 新增已分配角色，并添加到数据库
		if(leftRoles != null) {
			for(int i = 0; i < leftRoles.length; i++) {
				
				iRoleService.roleDistbAdd(leftRoles[i], user_id);
			}
			request.setAttribute("msg", "分配角色成功！");
		}
		
		// 删除已分配角色，并从数据库删除
		if(rightRoles != null) {
			for(int i = 0; i < rightRoles.length; i++) {
				
				iRoleService.roleDistbDelete(rightRoles[i], user_id);
			}
			request.setAttribute("msg", "分配角色成功！");
		}
		
		return Consts.SYSSUCCESS;
	}

	/**
	 * 将有权限的按钮显示在页面上
	 * 
	 * @throws Exception
	 */
	/*public void getButton() throws Exception {
		
		UserModel activeUser = getUser();
		List<PrivilegeModel> allocatedPrivileges = super.selectAllMyPrivileges(activeUser.getUser_id());
		List<PrivilegeModel> leafPrivileges = new ArrayList<PrivilegeModel>();
		String buttonID = null;
		
		// 获取用户管理的privilege_id
		for(PrivilegeModel priv : allocatedPrivileges) {
			if("用户管理".equalsIgnoreCase(priv.getPrivilege_name())) {
				buttonID = priv.getPrivilege_id();
			}
		}
		
		// 父id的值为_id的叶子节点即为要在页面上显示的按钮
		for(PrivilegeModel privilege : allocatedPrivileges) {
			if(privilege.getParent_id()!=null && privilege.getParent_id().equalsIgnoreCase(buttonID) ) {
				
				leafPrivileges.add(privilege);
			}
		}
		
		// 将list类型的数据转换为json通过ajax在页面获取
		String result = JSONUtil.getJSONArrayFromList(leafPrivileges).toString();
		write(result);
	}*/

	@Override
	protected String getModuleName() throws Exception {
		return "用户管理";
	}
	
}
