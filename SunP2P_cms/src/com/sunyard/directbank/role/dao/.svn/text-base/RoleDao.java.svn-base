package com.sunyard.directbank.role.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import com.sunyard.directbank.base.dao.BaseDao;
import com.sunyard.directbank.role.model.RoleModel;

public interface RoleDao extends BaseDao<RoleModel> {

	/**
	 * 分配权限
	 * 
	 * @return
	 */
	public String privilegeDistb() throws DataAccessException;

	/**
	 * 根据role_id 和 role_name模糊查询某些角色
	 * 
	 * @param role_id
	 * @param role_name
	 * @return
	 */
	public List<RoleModel> selectRole(@Param("role_id") String role_id, @Param("role_name") String role_name) throws DataAccessException;

	/**
	 * 查询所有已分配角色
	 * 
	 * @param user_id
	 * @return
	 */
	public List<RoleModel> selectAllocatedRoles(String user_id) throws DataAccessException;

	/**
	 * 新增已分配角色，并添加到数据库
	 * 
	 * @param role_id
	 * @param user_id
	 */
	public void roleDistbAdd(@Param("role_id") String role_id, @Param("user_id") String user_id) throws DataAccessException;

	/**
	 * 删除已分配角色，并从数据库删除
	 * 
	 * @param role_id
	 * @param user_id
	 */
	public void roleDistbDelete(@Param("role_id") String role_id, @Param("user_id") String user_id) throws DataAccessException;

	/**
	 * 批量删除
	 * 
	 * @param rolelist
	 * @return
	 */
	public boolean deleteBatch(List<String> rolelist) throws DataAccessException;
}
