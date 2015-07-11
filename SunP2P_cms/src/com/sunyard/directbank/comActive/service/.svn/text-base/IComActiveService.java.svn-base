package com.sunyard.directbank.comActive.service;

import java.util.List;
import java.util.Map;

import com.sunyard.directbank.base.model.ListPage;

public interface IComActiveService {

	/**
	 * Query
	 * @param param
	 * @param pageNo
	 * @return
	 * @throws Exception
	 */
	public ListPage pageQuery(Map<String, Object> param, int pageNo) throws Exception;

	/**
	 * Add a record 
	 * @param param
	 * @return
	 */
	public boolean addBatchOrder(Map<String, Object> param);

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
	public boolean updateComActive(Map<String, Object> param);

	/**
	 * Delete batch
	 * @param list
	 * @return
	 */
	public boolean deleteBatch(List<Map<String, Object>> list);

	/**
	 * Translate String to Map 
	 * @param primarykey
	 * @return
	 */
	public Map<String, Object> string2Map(String primarykey);

	/**
	 * Translate String to List
	 * @param primarykey
	 * @return
	 */
	public List<Map<String, Object>> string2List(String primarykey);

}
