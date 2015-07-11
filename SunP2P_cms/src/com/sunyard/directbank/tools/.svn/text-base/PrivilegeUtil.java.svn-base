package com.sunyard.directbank.tools;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.InitializingBean;

import com.sunyard.directbank.base.DDUtil;
import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.privilege.model.PrivilegeModel;
import com.sunyard.directbank.role.model.RoleModel;
import com.sunyard.directbank.user.model.UserModel;
import com.sunyard.directbank.user.service.IUserService;

public class PrivilegeUtil implements InitializingBean {

	@Resource
	public IUserService iUserService;
	
	public static IUserService staticIUserService;
	Logger logger = Logger.getLogger(PrivilegeUtil.class);
	
	@Override
	public void afterPropertiesSet() throws Exception {
		
		staticIUserService = iUserService;
		logger.info("------------准备所以的权限数据--------------");
	}
	
	/**
	 * 查询当前用户的所有权限
	 * @param userid
	 * @return
	 */
	public static List<PrivilegeModel> selectAllMyPrivileges(String userid) throws Exception {
		
		// 超级管理员有所有权限
		UserModel thisuser = staticIUserService.getById(userid);
		if(Consts.ADMIN_USER.equalsIgnoreCase(thisuser.getUser_name())) {
			
			//List<PrivilegeModel> allPrivileges = iPrivilegeService.selectAllPrivileges();
			List<PrivilegeModel> allPrivileges = DDUtil.selectAllPrivileges();
			return allPrivileges;
		} else {
			// 查询所有已分配的角色
			//List<RoleModel> allocatedRoles = iRoleService.selectAllocatedRoles(userid);
			List<RoleModel> allocatedRoles = DDUtil.selectAllocatedRoles(userid);
			List<PrivilegeModel> allocatedPrivileges = new ArrayList<PrivilegeModel>();
			for(RoleModel role : allocatedRoles) {
				
				// 查询所有已分配的权限
				//List<PrivilegeModel> temp = iPrivilegeService.selectAllocatedPrivileges(role.getRole_id());
				List<PrivilegeModel> temp = DDUtil.selectAllocatedPrivileges(role.getRole_id());
				allocatedPrivileges.addAll(temp);
			}
			
			// 去掉重复的内容
			if(!allocatedPrivileges.isEmpty()) {
				List<PrivilegeModel> distinctPrivileges = new ArrayList<PrivilegeModel>();
				
				for(int i = 0; i < allocatedPrivileges.size(); i++) {
					if(!distinctPrivileges.contains(allocatedPrivileges.get(i))) {
						distinctPrivileges.add(allocatedPrivileges.get(i));
					}
				}
				allocatedPrivileges = distinctPrivileges;
			}
			
			return allocatedPrivileges;
		}
	}

}
