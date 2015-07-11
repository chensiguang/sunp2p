package com.sunyard.directbank.mujifailed.service;

import java.util.Map;

public interface IMujiFailedService {

	/**
	 * 查询某一个募集产品信息
	 * @param prod_id
	 * @return
	 * @throws Exception 
	 */
	public Map<String, Object> getById(int prod_id) throws Exception;

	/**
	 * 强制产品募集失败
	 * @param prod_id
	 * @param string 
	 * @throws Exception
	 */
	public void mujiFailed(int prod_id, String debit_account) throws Exception;

}
