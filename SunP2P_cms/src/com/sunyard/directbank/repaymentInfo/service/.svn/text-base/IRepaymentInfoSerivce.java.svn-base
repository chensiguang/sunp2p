package com.sunyard.directbank.repaymentInfo.service;

import java.util.List;
import java.util.Map;

import com.sunyard.directbank.repayType.service.IRepayType;


public interface IRepaymentInfoSerivce {

	void saveRepaymentInfoByBatch(Object in);// 产品成立时向还款表批量插入记录
	
	void setRepayType(IRepayType repayType);// 设置还款方式
	
	List<Map<String,Object>> selectListByKey(Map<String,Object> map);//根据条件查询结果集
	
	void updateRepayStatus(Map<String, Object> map);//更新还款表还款状态

}
