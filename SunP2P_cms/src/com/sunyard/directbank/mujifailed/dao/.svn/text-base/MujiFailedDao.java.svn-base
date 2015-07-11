package com.sunyard.directbank.mujifailed.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface MujiFailedDao {

	/**
	 * 查询募集产品
	 * @param prod_id
	 * @return
	 * @throws DataAccessException
	 */
	public Map<String, Object> getById(int prod_id) throws DataAccessException;

	/**
	 * 查询客户产品份额表，得到电子账户和份额等信息
	 * @param prod_id
	 * @return
	 * @throws DataAccessException
	 */
	public List<Map<String, Object>> selectShareInall(int prod_id) throws DataAccessException;

	/**
	 * 更新产品份额表，将份额清零
	 * @param prod_id
	 * @throws DataAccessException
	 */
	public void updateShareInall(int prod_id) throws DataAccessException;

	/**
	 * 记录份额明细表
	 * @param share_inall
	 */
	public void insertShareList(List<Map<String, Object>> share_inall) throws DataAccessException;

	/**
	 * 更新客户电子账号信息登记表，修改余额
	 * @param eacc_no
	 * @param use_vol
	 */
	public void updateEaccAcct(Map<String, Object> map) throws DataAccessException;

	/**
	 * 更新产品管理表，将产品状态置为失败
	 * @param prod_id
	 */
	public void updateProduct(Map<String, Object> param) throws DataAccessException;

	/**
	 * 电子账户资金进出明细表，记录流水
	 * @param share_inall
	 */
	public void insertAmtList(List<Map<String, Object>> share_inall) throws DataAccessException;



}
