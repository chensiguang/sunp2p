package com.sunyard.directbank.user.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.sunyard.directbank.base.BaseAction;
import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.privilege.model.PrivilegeModel;
import com.sunyard.directbank.tools.PrivilegeUtil;
import com.sunyard.directbank.tools.TreeUtil;
import com.sunyard.directbank.user.model.UserModel;

@Controller
@Scope("prototype")
public class HomeAction extends BaseAction<UserModel> {

	private static final long serialVersionUID = -2873126031517335068L;
	private Logger logger = Logger.getLogger(this.getClass());
	HttpServletRequest request = ServletActionContext.getRequest();
	
	/**
	 * 用户登录
	 * 
	 * @return
	 */
	public String login() throws Exception {

		// 判断用户是否存在
		UserModel user = iUserService.findByUserIdAndPwd(model.getUser_name(), model.getUser_pwd());
		if (user == null) {
			logger.info("用户名或密码错误，请重新输入！");
			request.setAttribute("error", "用户名或密码错误，请重新输入！");
			return "loginUI";
		}
		if ( user.getUser_state().equals(Consts.USER_STATE_LOCK) ) { 
			logger.info("用户已锁定，无法登录！");
			request.setAttribute("error", "用户已锁定，无法登录，请联系管理员！");
			return "loginUI";
		}
		
		ActionContext.getContext().getSession().put("user", user);

		// 查询登录用户的顶级权限
		List<PrivilegeModel> tops = iPrivilegeService.selectTopPrivileges();
		List<PrivilegeModel> topPrivileges = filterTopPrivileges(tops, user.getUser_id());
		ActionContext.getContext().getSession().put("topPrivileges", topPrivileges);
		
		// 查询登录用户的子权限
		String privilegeid = topPrivileges.get(0).getPrivilege_id();
		PrivilegeModel parent = iPrivilegeService.getById(privilegeid);
		List<PrivilegeModel> children = getChildrenByParent(parent);
		List<PrivilegeModel> mychildren = filterChildren(children, user.getUser_id());
		
		// 显示左边树
		String childrenList = TreeUtil.showLeftTree(mychildren, privilegeid);
		ActionContext.getContext().getSession().put("childrenList", childrenList);
		request.setAttribute("title", parent.getPrivilege_name());
		
		logger.info("=======================================>>登录成功！");
		return "toIndex";
	}

	/**
	 * 用户注销
	 * 
	 * @return
	 */
	public String logout() throws Exception {

		ActionContext.getContext().getSession().remove("user");
		logger.info("==========================================>>用户注销！");
		request.setAttribute("error", "你已退出当前系统！");
		
		return "loginUI";
	}
	
	/**
	 * 过滤登录用户的顶级权限
	 * 
	 * @param topPrivileges
	 * @param userid
	 * @return
	 */
	public List<PrivilegeModel> filterTopPrivileges(List<PrivilegeModel> topPrivileges, String userid) throws Exception {
		
		if(Consts.ADMIN_USER.equals(model.getUser_name())) {
			
			return topPrivileges;
		}else {
		
			// 查询所有已分配的角色
			List<PrivilegeModel> allocatedPrivileges = PrivilegeUtil.selectAllMyPrivileges(userid);
	
			// 删除没有的权限
			for(int i = 0; i < topPrivileges.size(); i++) {
				if(!allocatedPrivileges.contains(topPrivileges.get(i))) {
					
					topPrivileges.remove(topPrivileges.get(i));
					i--;		// 当发生删除操作的时候，再次从i开始验证
				}
			}
			
			return topPrivileges;
		}
	}
	
	/**
	 * 过滤登录用户的子权限
	 * 
	 * @param children
	 * @param user_id
	 * @return
	 */
	private List<PrivilegeModel> filterChildren(List<PrivilegeModel> children, String userid) throws Exception {

		if(Consts.ADMIN_USER.equals(model.getUser_name())) {
			
			return children;
		}else {
			
			// 查询所有已分配的权限
			List<PrivilegeModel> allocatedPrivileges = PrivilegeUtil.selectAllMyPrivileges(userid);
			
			for(int i = 0; i < allocatedPrivileges.size(); i++) {
				
				// 去掉所有的顶级权限
				String parentid = allocatedPrivileges.get(i).getParent_id();
				if(parentid == null || parentid == "" || parentid.isEmpty()) {
					
					allocatedPrivileges.remove(allocatedPrivileges.get(i));
					i--;		// 当发生删除操作的时候，再次从i开始验证
				}
			}
			
			// 获取所有父id
			List<String> parentids = iPrivilegeService.selectAllParentID();
			
			// 去掉所有叶子权限
			for(int i = 0; i < allocatedPrivileges.size(); i++) {
				
				String privilegeid = allocatedPrivileges.get(i).getPrivilege_id();
				if(!parentids.contains(privilegeid)) {
					allocatedPrivileges.remove(i);
					i--;		// 当发生删除操作的时候，再次从i开始验证
				}
			}
			
			children = allocatedPrivileges;
			return children;
		}
	}
	
	/**
	 * 展示顶级权限下的左边树
	 * 
	 * @return
	 */
	public String showChildren() throws Exception {
		
		UserModel currentUser = getUser();
		String privilegeid = request.getParameter("privilege_id");
		PrivilegeModel thismodel = iPrivilegeService.getById(privilegeid);
		
		// 根据privilege_id 查找其所有的子权限
		List<PrivilegeModel> children = getChildrenByParent(thismodel);
		
		// 如果是admin用户就显示所有的权限
		if(Consts.ADMIN_USER.equals(currentUser.getUser_name())) {
			// 显示左边树
			String childrenList = TreeUtil.showLeftTree(children, privilegeid);
			ActionContext.getContext().getSession().put("childrenList", childrenList);
			request.setAttribute("title", thismodel.getPrivilege_name());
	
			return "toIndex";
		}
		
		// 如果不是admin用户则显示当前用户的权限
		else {
			// 得到当前用户的所以权限
			List<PrivilegeModel> myPrivileges = PrivilegeUtil.selectAllMyPrivileges(currentUser.getUser_id());
			
			// 如果children里面包含myPrivileges，则该权限为我们需要的权限
			for(int i = 0; i < myPrivileges.size(); i++) {
				if(!children.contains(myPrivileges.get(i))) {
					
					myPrivileges.remove(i);
					i--;
				}
			}
			
			String childrenList = TreeUtil.showLeftTree(myPrivileges, privilegeid);
			ActionContext.getContext().getSession().put("childrenList", childrenList);
			request.setAttribute("title", thismodel.getPrivilege_name());
			
			return "toIndex";
		}
	}
	
	/**
	 * 得到单个parent的所有子权限
	 * @param parent
	 * @return
	 */
	public List<PrivilegeModel> getChildrenByParent(PrivilegeModel parent) throws Exception {
		
		List<PrivilegeModel> list = new ArrayList<PrivilegeModel>();
		TreeUtil.walkChildrenPrivilege(parent, list);
		
		return list;
	}
	
}
