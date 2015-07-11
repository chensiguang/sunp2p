package com.sunyard.directbank.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import com.sunyard.directbank.base.dao.BaseDao;
import com.sunyard.directbank.user.model.UserModel;

public interface UserDao extends BaseDao<UserModel> {

	/**
	 * 根据条件模糊查询用户
	 * 
	 * @param user_id
	 * @param user_name
	 * @param user_state
	 * @param department_id
	 * @return
	 */
	public List<UserModel> selectUser(@Param("user_id") String user_id, @Param("user_name") String user_name, 
			@Param("user_state") String user_state,	@Param("department_id") String department_id) throws DataAccessException;

	/**
	 * 密码重置
	 * 
	 * @param user_id
	 * @param user_pwd
	 */
	public void resetPwd(@Param("user_id") String user_id, @Param("user_pwd") String user_pwd) throws DataAccessException;

	/**
	 * 修改密码
	 * 
	 * @param user_id
	 * @param user_new_pwd
	 */
	public boolean updatePwd(@Param("user_id") String user_id, @Param("user_new_pwd") String user_new_pwd) throws DataAccessException;

	/**
	 * 验证用户是否存在
	 * 
	 * @param user_id
	 * @param user_pwd
	 * @return
	 */
	public UserModel findByUserIdAndPwd(@Param("user_name") String user_name, @Param("user_pwd") String user_pwd) throws DataAccessException;

	/**
	 * 锁定/解锁用户
	 * 
	 * @param user_id
	 * @param user_state
	 */
	public void lockUser(@Param("user_id") String user_id, @Param("user_state") String user_state) throws DataAccessException;

	/**
	 * 批量删除
	 * 
	 * @param userList
	 * @return
	 */
	public boolean deleteBatch(List<String> list) throws DataAccessException;

}
