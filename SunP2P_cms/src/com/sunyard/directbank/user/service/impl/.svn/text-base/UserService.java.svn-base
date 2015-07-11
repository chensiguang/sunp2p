package com.sunyard.directbank.user.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunyard.directbank.base.DDUtil;
import com.sunyard.directbank.base.SpringUtil;
import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.base.model.ListPage;
import com.sunyard.directbank.user.dao.UserDao;
import com.sunyard.directbank.user.model.UserModel;
import com.sunyard.directbank.user.service.IUserService;

@Service
@Transactional
public class UserService implements IUserService, Consts {

	@Resource
	private UserDao userDao;
	
	@Override
	public boolean addUser(UserModel model) throws Exception {

		return userDao.save(model);
	}

	@Override
	public UserModel getById(String user_id) throws Exception {

		return userDao.getById(user_id);
	}

	@Override
	public boolean updateUser(UserModel model) throws Exception {

		return userDao.update(model);
	}

	@Override
	public void deleteUser(String user_id) throws Exception {

		userDao.delete(user_id);
	}

	@Override
	public List<UserModel> selectAllUsers() throws Exception {

		return userDao.selectAll();
	}

	@Override
	public List<UserModel> selectUser(String user_id, String user_name, String user_state, String department_id) throws Exception {

		return userDao.selectUser(user_id, user_name, user_state, department_id);
	}

	@Override
	public void resetPwd(String user_id, String user_pwd) throws Exception {

		userDao.resetPwd(user_id, user_pwd);
	}

	@Override
	public boolean updatePwd(String user_id, String user_new_pwd) throws Exception {

		return userDao.updatePwd(user_id, user_new_pwd);
	}

	@Override
	public UserModel findByUserIdAndPwd(String user_name, String user_pwd) throws Exception {

		return userDao.findByUserIdAndPwd(user_name, user_pwd);
	}

	@Override
	public void lockUser(String user_id, String user_state) throws Exception {

		userDao.lockUser(user_id, user_state);
	}

	@Override
	public void unlockUser(String user_id, String user_state) throws Exception {

		userDao.lockUser(user_id, user_state);
	}

	@Override
	public boolean deleteBatch(List<String> list) throws Exception {

		return userDao.deleteBatch(list);
	}

	@Override
	public IListPage pageQuery(Map<String, Object> param, int pageNo) throws Exception {

		// 每页显示的记录条数
		int pageSize = PAGE_SIZE;
		
		int startRow = (pageNo - 1) * pageSize;
		param.put("startRow", new Integer(startRow));	// 查询起始位置
		param.put("rows", pageSize);				// 查询条数
		param.put("admin", ADMIN_USER);		// 查询限制条件
		
		// 查询数据库总数据条数和当前页面记录
		int totalCount = userDao.pageCount(param);
		List<UserModel> data = userDao.pageQuery(param);
		
		// 翻译数据字典的字段
		DDUtil cache = (DDUtil)SpringUtil.getWebApplicationContext().getBean("dDUtil");
		for(int i = 0; i < data.size(); i ++){
			UserModel userModel = data.get(i);
			userModel.setUser_state(cache.getContent(USER_STATE, userModel.getUser_state()));
			userModel.setUser_type(cache.getContent(USER_TYPE, userModel.getUser_type()));
		}
		
		return new ListPage(startRow, totalCount, pageSize, data);
	}

}
