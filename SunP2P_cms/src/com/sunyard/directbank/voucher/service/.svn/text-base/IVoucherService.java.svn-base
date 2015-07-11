package com.sunyard.directbank.voucher.service;

import java.util.List;
import java.util.Map;

import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.voucher.model.VoucherModel;

public interface IVoucherService {
   
	/**
     * 分页查询抵用券
     * @param param
     * @param pageNo
     * @return
     * @throws Exception
     */
	public IListPage pageQuery(Map<String, Object> param, int pageNo)throws Exception;
   
	/**
     * 添加抵用券
     * @param model
     * @return
     * @throws Exception
     */
	public boolean add(VoucherModel model) throws Exception;
	
	/**
	 * 批量删除抵用券
	 * @param detail
	 * @return
	 */
	public boolean deleteBatch(List<String> strs) throws Exception;
    
	/**
	 * 根据抵用券编号查询
	 * @param voucher_no
	 * @return
	 * @throws Exception
	 */
	public VoucherModel getById(String voucher_no) throws Exception;

	/**
	 * 修改抵用券
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public boolean update(VoucherModel model)throws Exception;

	/**
	 * string转换为list
	 * @param detail
	 * @return
	 */
	public List<String> string2list(String detail);
}
