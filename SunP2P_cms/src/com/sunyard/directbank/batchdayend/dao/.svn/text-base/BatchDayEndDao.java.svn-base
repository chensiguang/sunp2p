package com.sunyard.directbank.batchdayend.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.sunyard.directbank.batchorder.model.BatchOrderModel;

public interface BatchDayEndDao {

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
	 * 获取当前系统日期
	 * @param param_id
	 * @return
	 */
	public String getSystemDate(String param_id);

	/**
	 * 更新系统日期
	 * @param param_id
	 * @param system_date
	 */
	public void udpateSystemDate(@Param("param_id") String param_id, @Param("system_date") String system_date);

	/**
	 * 产品终止操作
	 * 
	 * @return
	 * @throws Exception
	 */
	public boolean prodEnd(@Param("sysDate")String sysDate,@Param("state")String state);

	/**
	 * 债权转让失效操作
	 * 
	 * @return
	 * @throws Exception
	 */
	public boolean invalid(@Param("sysDate")String sysDate,@Param("state")String state);
     
	/**
	 * 查询当前需要债权转让失效的客户产品份额
	 * @param sysDate
	 * @return
	 */
	public List<Map<String, Object>> findShare(String sysDate);

	/**
     * 将客户产品份额表的可转让份额设置为可用份额的数目
     * @param map
     */
	public void changeTransfer_vol(Map<String, Object> map);

	/**
	 * 查询需要终止操作产品的数目
	 * @param sysDate
	 * @return
	 */
	public int toCount(String sysDate);

	/**
	 * Get all records
	 * @return
	 */
	public List<BatchOrderModel> selectAllBatchOrders();
}
