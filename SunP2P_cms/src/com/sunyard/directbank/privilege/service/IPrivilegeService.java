package com.sunyard.directbank.privilege.service;

import java.util.List;
import java.util.Map;

import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.privilege.model.PrivilegeModel;

public interface IPrivilegeService {

	/**
	 * 模糊查询权限
	 * 
	 * @param privilege_id
	 * @param privilege_name
	 * @return
	 * @throws Exception
	 */
	public List<PrivilegeModel> selectPrivilege(String privilege_id, String privilege_name) throws Exception;

	/**
	 * 添加权限
	 * 
	 * @param model
	 * @throws Exception
	 */
	public boolean addPrivilege(PrivilegeModel model) throws Exception;

	/**
	 * 根据权限id查询权限
	 * 
	 * @param privilege_id
	 * @return
	 */
	public PrivilegeModel getById(String privilege_id) throws Exception;

	/**
	 * 修改权限
	 * 
	 * @param privilege
	 */
	public boolean updatePrivilege(PrivilegeModel privilege) throws Exception;

	/**
	 * 删除权限
	 * 
	 * @param privilege_id
	 */
	public void deletePrivilege(String privilege_id) throws Exception;

	/**
	 * 查询所有权限
	 * 
	 * @return
	 */
	public List<PrivilegeModel> selectAllPrivileges() throws Exception;

	/**
	 * 查询顶级权限
	 * 
	 * @return
	 */
	public List<PrivilegeModel> selectTopPrivileges() throws Exception;

	/**
	 * 查询子权限
	 * 
	 * @param privilege_id
	 * @return
	 */
	public List<PrivilegeModel> selectChildrenPrivileges(String privilege_id) throws Exception;

	/**
	 * 查询所有已分配的权限
	 * 
	 * @param role_id
	 * @return
	 */
	public List<PrivilegeModel> selectAllocatedPrivileges(String role_id) throws Exception;

	/**
	 * 分配权限，添加到权限角色表
	 * 
	 * @param role_id
	 * @param allocatedprivilege
	 */
	public void privilegeDistbAdd(String role_id, String allocatedprivilege) throws Exception;

	/**
	 * 删除权限
	 * 
	 * @param role_id
	 * @param distributableprivilege
	 */
	public void privilegeDistbDelete(String role_id, String distributableprivilege) throws Exception;

	/**
	 * 批量删除
	 * 
	 * @param privilegelist
	 * @return
	 */
	public boolean deleteBatch(List<String> privilegelist) throws Exception;

	/**
	 * 查询所有父id
	 * 
	 * @return
	 */
	public List<String> selectAllParentID() throws Exception;

	/**
	 * 查询所有权限url
	 * 
	 * @return
	 */
	public List<String> selectAllUrl() throws Exception;

	/**
	 * 真分页
	 * 
	 * @param param
	 * @param pageNo
	 * @return
	 * @throws Exception
	 */
	public IListPage pageQuery(Map<String, Object> param, int pageNo) throws Exception;

	/**
	 * 查询所有权限，并放到cache中
	 * 
	 * @return
	 */
	public List<PrivilegeModel> selectAllPrivileges_Cache() throws Exception;

	/**
	 * 查询所有已分配的权限，并放到cache中
	 * 
	 * @param role_id
	 * @return
	 */
	public List<PrivilegeModel> selectAllocatedPrivileges_Cache(String role_id) throws Exception;

}
