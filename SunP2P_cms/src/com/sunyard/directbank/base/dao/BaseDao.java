package com.sunyard.directbank.base.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface BaseDao<T> {

	/**
	 * 保存实体
	 * 
	 * @return
	 */
	public boolean save(T entity) throws DataAccessException;

	/**
	 * 删除实体
	 * 
	 * @return
	 */
	public boolean delete(String id) throws DataAccessException;

	/**
	 * 更新实体
	 * 
	 * @return
	 */
	public boolean update(T entity) throws DataAccessException;

	/**
	 * 查询单个实体
	 * 
	 * @return
	 */
	public T getById(String id) throws DataAccessException;

	/**
	 * 查询多个实体
	 * 
	 * @return
	 */
	public List<T> getByIds(String[] ids) throws DataAccessException;

	/**
	 * 查询所有
	 * 
	 * @return
	 */
	public List<T> selectAll() throws DataAccessException;

	/**
	 * 查询记录总数
	 * 
	 * @param param
	 * @return
	 */
	public int pageCount(Map<String, Object> param) throws DataAccessException;

	/**
	 * 查询某一页对应的数据
	 * 
	 * @param param
	 * @return
	 */
	public List<T> pageQuery(Map<String, Object> param) throws DataAccessException;
	
}
