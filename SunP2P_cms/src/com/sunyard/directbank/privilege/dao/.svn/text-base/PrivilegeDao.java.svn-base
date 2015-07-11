package com.sunyard.directbank.privilege.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import com.sunyard.directbank.base.dao.BaseDao;
import com.sunyard.directbank.privilege.model.PrivilegeModel;

public interface PrivilegeDao extends BaseDao<PrivilegeModel> {

	/**
	 * 根据条件模糊查询权限
	 * 
	 * @param privilege_id
	 * @param privilege_name
	 * @return
	 */
	public List<PrivilegeModel> selectPrivilege(@Param("privilege_id") String privilege_id, 
			@Param("privilege_name") String privilege_name) throws DataAccessException;

	/**
	 * 查询顶级权限
	 * 
	 * @return
	 */
	public List<PrivilegeModel> selectTopPrivileges() throws DataAccessException;

	/**
	 * 查询当前privilege_id的所有子权限
	 * 
	 * @param privilege_id
	 * @return
	 */
	public List<PrivilegeModel> selectChildrenPrivileges(String privilege_id) throws DataAccessException;

	/**
	 * 查询已分配的权限
	 * 
	 * @param role_id
	 * @return
	 */
	public List<PrivilegeModel> selectAllocatedPrivileges(String role_id) throws DataAccessException;

	/**
	 * 新增已分配权限，并添加到数据库
	 * 
	 * @param privilege_id
	 * @param allocatedprivilege
	 */
	public void privilegeDistbAdd(@Param("role_id") String role_id, @Param("privilege_id") String privilege_id) throws DataAccessException;

	/**
	 * 删除已分配权限，并从数据库删除
	 * 
	 * @param privilege_id
	 * @param distributableprivilege
	 */
	public void privilegeDistbDelete(@Param("role_id") String role_id, @Param("privilege_id") String privilege_id) throws DataAccessException;

	/**
	 * 批量删除
	 * 
	 * @param privilegelist
	 * @return
	 */
	public boolean deleteBatch(List<String> privilegelist) throws DataAccessException;

	/**
	 * 查询所以的父id
	 * 
	 * @return
	 */
	public List<String> selectAllParentID() throws DataAccessException;

	/**
	 * 查询所有权限url
	 * 
	 * @return
	 */
	public List<String> selectAllUrl() throws DataAccessException;

}
