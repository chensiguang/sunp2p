package com.sunyard.directbank.finance.service;

import java.util.List;
import java.util.Map;

import com.sunyard.directbank.base.model.IListPage;

public interface IFinanceService {

	/**
	 * 查询所有融资信息
	 * @return
	 * @throws Exception 
	 */
	public List<Map<String,Object>> selectFinance(Map<String,Object> map) throws Exception;
	
	/**
	 * 查询某一页对应的数据
	 * 
	 * @param param
	 * @param pageNo
	 * @return
	 */
	public IListPage pageQuery(Map<String, Object> param, int pageNo) throws Exception;
	
	/**
	 * 查询明细
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> details(Map<String, Object> param) throws Exception ;
	
	/**
	 * 审核方法
	 * @param param
	 */
	public void approve(Map<String, Object> param);
	
	/**
	 * 审核拒绝
	 * @param param
	 */
	public void refuse(Map<String, Object> param);
	
	/**
	 * 选择单个融资信息显示
	 * @param param
	 * @return
	 */
	public Map<String, Object> selectOneFinance(Map<String, Object> param);
}
