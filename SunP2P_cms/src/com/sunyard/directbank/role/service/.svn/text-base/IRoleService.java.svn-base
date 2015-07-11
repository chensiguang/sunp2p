package com.sunyard.directbank.role.service;

import java.util.List;
import java.util.Map;

import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.role.model.RoleModel;

public interface IRoleService {

	/**
	 * 查询所以角色
	 * 
	 * @return
	 */
	public List<RoleModel> selectAllRoles() throws Exception;

	/**
	 * 删除某个角色
	 * 
	 * @param role_id
	 */
	public boolean deleteRole(String role_id) throws Exception;

	/**
	 * 添加角色
	 * 
	 * @param role
	 */
	public boolean addRole(RoleModel role) throws Exception;

	/**
	 * 通过role_id查询一个角色对象
	 * 
	 * @param role_id
	 * @return
	 */
	public RoleModel getById(String role_id) throws Exception;

	/**
	 * 修改角色
	 * 
	 * @param role
	 */
	public boolean updateRole(RoleModel role) throws Exception;

	/**
	 * 通过role_id和role_name模糊查询某个角色
	 * 
	 * @param role_id
	 * @param role_name
	 * @return
	 */
	public List<RoleModel> selectRole(String role_id, String role_name) throws Exception;

	/**
	 * 查询所有已分配的角色
	 * 
	 * @param user_id
	 * @return
	 */
	public List<RoleModel> selectAllocatedRoles(String user_id) throws Exception;

	/**
	 * 新增已分配角色，并添加到数据库
	 * 
	 * @param string
	 * @param user_id
	 */
	public void roleDistbAdd(String allocatedrole, String user_id) throws Exception;

	/**
	 * 删除已分配角色，并从数据库删除
	 * 
	 * @param string
	 * @param user_id
	 */
	public void roleDistbDelete(String distributablerole, String user_id) throws Exception;

	/**
	 * 批量删除
	 * 
	 * @param list
	 * @return
	 */
	public boolean deleteBatch(List<String> rolelist) throws Exception;

	/**
	 * 查询某一页对应的数据
	 * 
	 * @param param
	 * @param pageNo
	 * @return
	 */
	public IListPage pageQuery(Map<String, Object> param, int pageNo) throws Exception;

	/**
	 * 查询所有已分配的角色，并放到cache中
	 * 
	 * @param user_id
	 * @return
	 */
	public List<RoleModel> selectAllocatedRoles_Cache(String user_id) throws Exception;

}
