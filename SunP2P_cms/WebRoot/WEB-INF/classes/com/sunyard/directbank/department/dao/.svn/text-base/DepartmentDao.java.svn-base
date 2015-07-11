package com.sunyard.directbank.department.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import com.sunyard.directbank.base.dao.BaseDao;
import com.sunyard.directbank.department.model.DepartmentModel;

public interface DepartmentDao extends BaseDao<DepartmentModel> {

	/**
	 * 根据参数进行模糊查询机构
	 * 
	 * @param department_id
	 * @param department_name
	 * @return
	 */
	public List<DepartmentModel> selectDepartment(@Param("department_id") int department_id, 
			@Param("department_name") String department_name) throws DataAccessException;

	/**
	 * 查询顶级机构
	 * 
	 * @return
	 */
	public List<DepartmentModel> selectTopDepartments() throws DataAccessException;

	/**
	 * 查询子机构
	 * 
	 * @param parent_id
	 * @return
	 */
	public List<DepartmentModel> selectChildrenDepartments(int parent_id) throws DataAccessException;

	/**
	 * 查询所以机构，用于resultMap
	 * 
	 * @return
	 */
	public List<DepartmentModel> selectAllDepartments() throws DataAccessException;

	/**
	 * 批量删除
	 * @param department_id
	 * @return
	 */
	public boolean deleteBatch(int department_id) throws DataAccessException;
	
	/**
	 * 通过id查找
	 * @param department_id
	 * @return
	 */
	public DepartmentModel getById(int department_id) throws DataAccessException;

}
