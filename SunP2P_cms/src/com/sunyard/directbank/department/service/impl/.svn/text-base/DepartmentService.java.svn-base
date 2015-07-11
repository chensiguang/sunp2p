package com.sunyard.directbank.department.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.base.model.ListPage;
import com.sunyard.directbank.department.dao.DepartmentDao;
import com.sunyard.directbank.department.model.DepartmentModel;
import com.sunyard.directbank.department.service.IDepartmentService;

@Service
@Transactional
public class DepartmentService implements IDepartmentService {

	@Resource
	private DepartmentDao departmentDao;

	@Override
	public List<DepartmentModel> selectAllDepartments() throws Exception {
		return departmentDao.selectAll();
	}

	@Override
	public boolean deleteDepartment(int department_id) throws Exception {
		
		return departmentDao.deleteBatch(department_id);
	}

	@Override
	public DepartmentModel getById(int department_id) throws Exception {

		return departmentDao.getById(department_id);
	}

	@Override
	public boolean updateDepartment(DepartmentModel department) throws Exception {

		return departmentDao.update(department);
	}

	@Override
	public boolean addDepartment(DepartmentModel model) throws Exception {

		return departmentDao.save(model);
	}

	@Override
	public List<DepartmentModel> selectDepartment(int department_id, String department_name) throws Exception {

		return departmentDao.selectDepartment(department_id, department_name);
	}

	@Override
	public List<DepartmentModel> selectTopDepartments() throws Exception {

		return departmentDao.selectTopDepartments();
	}

	@Override
	public List<DepartmentModel> selectChildrenDepartments(int parent_id) throws Exception {

		return departmentDao.selectChildrenDepartments(parent_id);
	}

	@Override
	public IListPage pageQuery(Map<String, Object> param, int pageNo) throws Exception {

		// 每页显示的记录条数
		int pageSize = Consts.PAGE_SIZE;
		
		int startRow = (pageNo - 1) * pageSize;
		param.put("startRow", new Integer(startRow));	// 查询起始位置
		param.put("rows", pageSize);					// 查询条数
		
		// 查询数据库总数据条数和当前页面记录
		int total = departmentDao.pageCount(param);
		List<DepartmentModel> data = departmentDao.pageQuery(param);
		
		return new ListPage(startRow, total, pageSize, data);
	}

}
