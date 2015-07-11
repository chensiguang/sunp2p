package com.sunyard.directbank.privilege.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.base.model.ListPage;
import com.sunyard.directbank.privilege.dao.PrivilegeDao;
import com.sunyard.directbank.privilege.model.PrivilegeModel;
import com.sunyard.directbank.privilege.service.IPrivilegeService;

@Service
@Transactional
public class PrivilegeService implements IPrivilegeService {

	@Resource
	private PrivilegeDao privilegeDao;

	@Override
	public List<PrivilegeModel> selectPrivilege(String privilege_id, String privilege_name) throws Exception {

		return privilegeDao.selectPrivilege(privilege_id, privilege_name);
	}

	@Override
	public boolean addPrivilege(PrivilegeModel model) throws Exception {

		return privilegeDao.save(model);
	}

	@Override
	public PrivilegeModel getById(String privilege_id) throws Exception {

		if (privilege_id == null || privilege_id.length() == 0) {
			return null;
		} else {
			return privilegeDao.getById(privilege_id);
		}
	}

	@Override
	public boolean updatePrivilege(PrivilegeModel privilege) throws Exception {

		return privilegeDao.update(privilege);
	}

	@Override
	public void deletePrivilege(String privilege_id) throws Exception {

		privilegeDao.delete(privilege_id);
	}

	@Override
	public List<PrivilegeModel> selectAllPrivileges() throws Exception {

		return privilegeDao.selectAll();
	}
	
	@Override
	@Cacheable(value="ddCache")
	public List<PrivilegeModel> selectAllPrivileges_Cache() throws Exception {

		return privilegeDao.selectAll();
	}

	@Override
	public List<PrivilegeModel> selectTopPrivileges() throws Exception {

		return privilegeDao.selectTopPrivileges();
	}

	@Override
	public List<PrivilegeModel> selectChildrenPrivileges(String privilege_id) throws Exception {

		return privilegeDao.selectChildrenPrivileges(privilege_id);
	}

	@Override
	public List<PrivilegeModel> selectAllocatedPrivileges(String role_id) throws Exception {

		return privilegeDao.selectAllocatedPrivileges(role_id);
	}
	
	@Override
	@Cacheable(value="ddCache")
	public List<PrivilegeModel> selectAllocatedPrivileges_Cache(String role_id) throws Exception {

		return privilegeDao.selectAllocatedPrivileges(role_id);
	}

	@Override
	public void privilegeDistbAdd(String role_id, String allocatedprivilege) throws Exception {

		privilegeDao.privilegeDistbAdd(role_id, allocatedprivilege);
	}

	@Override
	public void privilegeDistbDelete(String role_id, String distributableprivilege) throws Exception {

		privilegeDao.privilegeDistbDelete(role_id, distributableprivilege);
	}

	@Override
	public boolean deleteBatch(List<String> privilegelist) throws Exception {

		return privilegeDao.deleteBatch(privilegelist);
	}

	@Override
	public List<String> selectAllParentID() throws Exception {

		return privilegeDao.selectAllParentID();
	}

	@Override
	public List<String> selectAllUrl() throws Exception {

		return privilegeDao.selectAllUrl();
	}

	@Override
	public IListPage pageQuery(Map<String, Object> param, int pageNo) throws Exception {
		
		// 每页显示的记录条数
		int pageSize = Consts.PAGE_SIZE;
		
		int startRow = (pageNo - 1) * pageSize;
		param.put("startRow", new Integer(startRow));	// 查询起始位置
		param.put("rows", pageSize);					// 查询条数
		
		// 查询数据库总数据条数和当前页面记录
		int total = privilegeDao.pageCount(param);
		List<PrivilegeModel> data = privilegeDao.pageQuery(param);
		
		return new ListPage(startRow, total, pageSize, data);
	}

}
