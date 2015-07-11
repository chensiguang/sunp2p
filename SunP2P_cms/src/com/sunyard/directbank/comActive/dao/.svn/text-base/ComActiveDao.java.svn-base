package com.sunyard.directbank.comActive.dao;

import java.util.List;
import java.util.Map;

public interface ComActiveDao {

	/**
	 * To count how many records
	 * @param param
	 * @return
	 */
	public int pageCount(Map<String, Object> param);

	/**
	 * Query
	 * @param param
	 * @return
	 */
	public List<Map<String, Object>> pageQuery(Map<String, Object> param);

	/**
	 * Add a record
	 */
	public boolean save(Map<String, Object> param);

	/**
	 * Get a record by id
	 * @param param
	 * @return
	 */
	public Map<String, Object> getById(Map<String, Object> param);

	/**
	 * Update a record
	 * @param param
	 * @return
	 */
	public boolean update(Map<String, Object> param);

	/**
	 * Delete batch
	 * @param map
	 */
	public void deleteBatch(Map<String, Object> map);

}
