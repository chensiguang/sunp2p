package com.sunyard.directbank.user.service;

import java.util.List;
import java.util.Map;

import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.user.model.UserModel;

public interface IUserService {

	/**
	 * 添加用户
	 * 
	 * @param model
	 */
	public boolean addUser(UserModel model) throws Exception;

	/**
	 * 通过user_id查询用户
	 * 
	 * @param user_id
	 * @return
	 */
	public UserModel getById(String user_id) throws Exception;

	/**
	 * 修改用户
	 * 
	 * @param model
	 */
	public boolean updateUser(UserModel model) throws Exception;

	/**
	 * 删除用户
	 * 
	 * @param user_id
	 */
	public void deleteUser(String user_id) throws Exception;

	/**
	 * 查询所有用户
	 * 
	 * @return
	 */
	public List<UserModel> selectAllUsers() throws Exception;

	/**
	 * 通过param模糊查询用户
	 * 
	 * @param user_id
	 * @param user_name
	 * @param user_state
	 * @param department_id
	 * @return
	 */
	public List<UserModel> selectUser(String user_id, String user_name, String user_state, String department_id) throws Exception;

	/**
	 * 密码重置
	 * 
	 * @param user_id
	 * @param user_pwd
	 */
	public void resetPwd(String user_id, String user_pwd) throws Exception;

	/**
	 * 修改密码
	 * 
	 * @param user_id
	 * @param user_new_pwd
	 */
	public boolean updatePwd(String user_id, String user_new_pwd) throws Exception;

	/**
	 * 验证用户是否存在
	 * 
	 * @param user_id
	 * @param user_pwd
	 * @return
	 */
	public UserModel findByUserIdAndPwd(String user_name, String user_pwd) throws Exception;

	/**
	 * 锁定用户
	 * 
	 * @param user_id
	 * @param user_state
	 */
	public void lockUser(String user_id, String user_state) throws Exception;

	/**
	 * 用户解锁
	 * 
	 * @param user_id
	 * @param user_state
	 */
	public void unlockUser(String user_id, String user_state) throws Exception;

	/**
	 * 批量删除方法
	 * @param userList
	 * @return
	 */
	public boolean deleteBatch(List<String> list) throws Exception;

	/**
	 * 
	 * @param param
	 * @param pageNo
	 * @return
	 */
	public IListPage pageQuery(Map<String, Object> param, int pageNo) throws Exception;

}
