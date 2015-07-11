package com.sunyard.directbank.transstatus.service;


import java.util.List;
import java.util.Map;

import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.transstatus.model.TransStatus;

public interface ITransStatusService {
  
	/**
     * 分页查询
     * @param param
     * @param pageNo
     * @return
     * @throws Exception
     */
	public IListPage pageQuery(Map<String, Object> param, int pageNo)throws Exception;

	/**
	 * 批量删除
	 * @param list
	 * @return
	 * @throws Exception
	 */
	public boolean deleteBatch(List<TransStatus> list)throws Exception;

	/**
	 * 新增
	 * @param transSataus
	 * @return
	 * @throws Exception
	 */
	public boolean add(TransStatus transSataus)throws Exception;

	/**
	 * 查询
	 * @param transSataus
	 * @return
	 * @throws Exception
	 */
	public TransStatus findByKey(TransStatus transSataus)throws Exception;

	/**
	 * 修改
	 * @param transSataus
	 * @return
	 * @throws Exception
	 */
	public boolean update(TransStatus transSataus)throws Exception;

	/**
	 * string转换为model
	 * @param str
	 * @return
	 */
	public TransStatus string2Model(String str);

	/**
	 * string转为list
	 * @param detail
	 * @return
	 */
	public List<TransStatus> string2List(String detail);
  
}
