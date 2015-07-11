package com.sunyard.directbank.batchorder.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface BatchOrderDao {

	/**
	 * 分页查询
	 * 
	 * @param param
	 * @return
	 * @throws DataAccessException
	 */
	public List<Map<String, Object>> pageQuery(Map<String, Object> param) throws DataAccessException;

	/**
	 * 统计总记录数
	 * 
	 * @param param
	 * @return
	 * @throws DataAccessException
	 */
	public int pageCount(Map<String, Object> param) throws DataAccessException;

	/**
	 * 添加
	 * 
	 * @param param
	 * @return
	 * @throws DataAccessException
	 */
	public boolean save(Map<String, Object> param) throws DataAccessException;

	/**
	 * 查找某一个
	 * 
	 * @param task_code
	 * @return
	 * @throws DataAccessException
	 */
	public Map<String, Object> getById(String task_code) throws DataAccessException;

	/**
	 * 修改
	 * 
	 * @param param
	 * @return
	 * @throws DataAccessException
	 */
	public boolean update(Map<String, Object> param) throws DataAccessException;

	/**
	 * 删除（批量删除）
	 * 
	 * @param list
	 * @return
	 * @throws DataAccessException
	 */
	public boolean deleteBatch(List<String> list) throws DataAccessException;

}
