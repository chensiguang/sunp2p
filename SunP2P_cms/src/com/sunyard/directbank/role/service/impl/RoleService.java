package com.sunyard.directbank.role.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.base.model.ListPage;
import com.sunyard.directbank.role.dao.RoleDao;
import com.sunyard.directbank.role.model.RoleModel;
import com.sunyard.directbank.role.service.IRoleService;

@Transactional
@Service
public class RoleService implements IRoleService {

	@Resource
	private RoleDao roleDao;

	@Override
	public List<RoleModel> selectAllRoles() throws Exception {

		return roleDao.selectAll();
	}

	@Override
	public boolean deleteRole(String role_id) throws Exception {

		return roleDao.delete(role_id);
	}

	@Override
	public boolean addRole(RoleModel role) throws Exception {

		return roleDao.save(role);
	}

	@Override
	public RoleModel getById(String role_id) throws Exception {

		return roleDao.getById(role_id);
	}

	@Override
	public boolean updateRole(RoleModel role) throws Exception {

		return roleDao.update(role);
	}

	@Override
	public List<RoleModel> selectRole(String role_id, String role_name) throws Exception {

		return roleDao.selectRole(role_id, role_name);
	}

	@Override
	public List<RoleModel> selectAllocatedRoles(String user_id) throws Exception {

		return roleDao.selectAllocatedRoles(user_id);
	}

	@Override
	@Cacheable(value="ddCache")
	public List<RoleModel> selectAllocatedRoles_Cache(String user_id) throws Exception {
		
		return roleDao.selectAllocatedRoles(user_id);
	}
	
	@Override
	public void roleDistbAdd(String allocatedrole, String user_id) throws Exception {

		roleDao.roleDistbAdd(allocatedrole, user_id);
	}

	@Override
	public void roleDistbDelete(String distributablerole, String user_id) throws Exception {

		roleDao.roleDistbDelete(distributablerole, user_id);
	}

	@Override
	public boolean deleteBatch(List<String> rolelist) throws Exception {

		return roleDao.deleteBatch(rolelist);
	}

	@Override
	public IListPage pageQuery(Map<String, Object> param, int pageNo) throws Exception {

		// 每页显示的记录条数
		int pageSize = Consts.PAGE_SIZE;
		
		int startRow = (pageNo - 1) * pageSize;
		param.put("startRow", new Integer(startRow));	// 查询起始位置
		param.put("rows", pageSize);					// 查询条数
		
		// 查询数据库总数据条数和当前页面记录
		int total = roleDao.pageCount(param);
		List<RoleModel> data = roleDao.pageQuery(param);
		
		return new ListPage(startRow, total, pageSize, data);
	}

}
