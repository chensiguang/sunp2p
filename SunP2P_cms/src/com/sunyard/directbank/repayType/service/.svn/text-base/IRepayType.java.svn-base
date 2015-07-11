package com.sunyard.directbank.repayType.service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.sunyard.directbank.prod.model.ProdBaseInfo;


public interface IRepayType {
	BigDecimal getEachInterest(BigDecimal limit);//返回每期应还利息，默认利率为产品的年化收益率
	
	BigDecimal getEachInterest(BigDecimal limit,BigDecimal interest);
	
	BigDecimal getEachCapital(BigDecimal limit,int currPeriod);//返回每期应还本金
	
	BigDecimal getEachAmt(BigDecimal limit,int currPeriod,BigDecimal interest);//返回每期应还总额
	
	Date getRepaymentDate(int currPeriod); //返回每期应还款日期
	
	int getPeriods();//返回该还款方式产品还款期数

	ProdBaseInfo getProd();//返回当前产品信息
	
	List<Map<String,Object>> getProdBatchDate();//返回产品清算日集合
}
