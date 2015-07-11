package com.sunyard.directbank.batchorder.service;

import java.util.List;
import java.util.Map;

import com.sunyard.directbank.base.model.ListPage;

public interface IBatchOrderService {

	/**
	 * 分页查询
	 * 
	 * @param param
	 * @param pageNo
	 * @return
	 */
	public ListPage pageQuery(Map<String, Object> param, int pageNo) throws Exception;

	/**
	 * 添加功能
	 * 
	 * @param param
	 * @return
	 */
	public boolean addBatchOrder(Map<String, Object> param) throws Exception;

	/**
	 * 根据id查询某一条记录
	 * 
	 * @param task_code
	 * @return
	 */
	public Map<String, Object> getById(String task_code) throws Exception;

	/**
	 * 修改功能
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public boolean updateBatchOrder(Map<String, Object> param) throws Exception;

	/**
	 * 批量删除
	 * 
	 * @param list
	 * @return
	 * @throws Exception
	 */
	public boolean deleteBatch(List<String> list) throws Exception;

}
