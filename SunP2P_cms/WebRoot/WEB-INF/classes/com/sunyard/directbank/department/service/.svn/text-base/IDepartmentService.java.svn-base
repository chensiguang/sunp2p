package com.sunyard.directbank.department.service;

import java.util.List;
import java.util.Map;

import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.department.model.DepartmentModel;

public interface IDepartmentService {

	/**
	 * 查询所以机构
	 * 
	 * @return
	 */
	public List<DepartmentModel> selectAllDepartments() throws Exception;

	/**
	 * 根据department_id删除某个机构
	 * 
	 * @param department_id
	 */
	public boolean deleteDepartment(int department_id) throws Exception;

	/**
	 * 根据department_id查询某个机构
	 * 
	 * @param department_id
	 * @return
	 */
	public DepartmentModel getById(int department_id) throws Exception;

	/**
	 * 修改某个机构
	 * 
	 * @param department
	 */
	public boolean updateDepartment(DepartmentModel department) throws Exception;

	/**
	 * 添加机构
	 * 
	 * @param model
	 */
	public boolean addDepartment(DepartmentModel model) throws Exception;

	/**
	 * 根据department_id 和 department_name查找机构
	 * 
	 * @param department_id
	 * @param department_name
	 * @return
	 */
	public List<DepartmentModel> selectDepartment(int department_id, String department_name) throws Exception;

	/**
	 * 查找顶级机构
	 * 
	 * @return
	 */
	public List<DepartmentModel> selectTopDepartments() throws Exception;

	/**
	 * 查找子机构
	 * 
	 * @param parent_id
	 * @return
	 */
	public List<DepartmentModel> selectChildrenDepartments(int parent_id) throws Exception;

	/**
	 * 分页查询
	 * 
	 * @param param
	 * @param pageNo
	 * @return
	 * @throws Exception
	 */
	public IListPage pageQuery(Map<String, Object> param, int pageNo) throws Exception;

}
