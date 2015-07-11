package com.sunyard.directbank.batchdayend.service;

import java.util.List;
import java.util.Map;

import com.sunyard.directbank.batchorder.model.BatchOrderModel;

public interface IBatchDayEndService {

	/**
	 * 更新batch_order的执行状态
	 * @param batchOrModel
	 */
	public void updateDealStatus(BatchOrderModel batchOrModel);

	/**
	 * 更新prod_transstatus的当前状态
	 * @param status
	 * @return
	 */
	public boolean updateStatus(String status);

	/**
	 * 清算开始
	 * @param user_id
	 * @return
	 */
	public boolean batchStart(String user_id) throws Exception;

	/**
	 * 清算结束
	 * @param user_id 
	 * @return
	 */
	public boolean batchEnd(String user_id) throws Exception;
	
	/**
	 * 产品终止操作
	 * @param string 
	 * 
	 * @return
	 * @throws Exception
	 */
	public boolean prodEnd(String user_id) throws Exception;

	/**
	 * 债权转让失效操作
	 * @param string 
	 * 
	 * @return
	 * @throws Exception
	 */
	public boolean invalid(String user_id) throws Exception;

	/**
	 * Get all records
	 * @return
	 */
	public List<BatchOrderModel> selectAllBatchOrders() throws Exception;

	/**
	 * 根据父id排序清算流程
	 * @param batchOrders
	 * @return 
	 */
	public List<BatchOrderModel> sortedBatchOrders(List<BatchOrderModel> batchOrders);
	
	/**
	 * 获取当前系统日期
	 * 
	 * @param param_id
	 * @return
	 */
	public String getSystemDate(String param_id);
	
	/**
	 * 系统日期更新
	 * 
	 * @param param_id
	 * @param systemDate
	 */
	public void updateSystemDate(String param_id, String systemDate);
	
	/**
	 * 查询需要终止操作产品的数目
	 * @param sysDate
	 * @return
	 */
	public int toCount(String sysDate);
	
	/**
	 * 产品终止操作
	 * @param sysDate
	 * @param state
	 * @return
	 */
	public boolean prodEnd(String sysDate, String state);
	
	/**
	 * 查询当前需要债权转让失效的客户产品份额
	 * @param sysDate
	 * @return
	 */
	public List<Map<String, Object>> findShare(String sysDate);

	/**
	 * 债权转让失效操作
	 * @param sysDate
	 * @param state
	 * @return
	 */
	public boolean invalid(String sysDate, String state);
	
	/**
	 * 将客户产品份额表的可转让份额设置为可用份额的数目
	 * @param map
	 */
	public void changeTransfer_vol(Map<String, Object> map);

	/**
	 * 文件归档
	 * @param user_id
	 * @return
	 */
	public boolean doFiling(String user_id) throws Exception;
	
}
