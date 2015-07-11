package com.sunyard.directbank.repayType.service.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Map;

import com.sunyard.directbank.enums.BATCHADDTYPE;
import com.sunyard.directbank.prod.model.ProdBaseInfo;
import com.sunyard.directbank.tools.DateUtil;

public class MonthlyInterestMaturityReply extends AbstractReplyType {
	public MonthlyInterestMaturityReply(ProdBaseInfo prod){
		super(prod);
	}
	
	@Override
	public BigDecimal getEachInterest(BigDecimal limit, BigDecimal interest) {
		return limit.multiply(interest).divide(new BigDecimal(12), 4, BigDecimal.ROUND_HALF_UP);
	}
	
	@Override
	public BigDecimal getEachCapital(BigDecimal limit,int currPeriod) {
		if( currPeriod == getPeriods()){
			return  limit;
		}else{
			return BigDecimal.ZERO;
		}
		
	}

	@Override
	public Date getRepaymentDate(int currPeriod) {
		return DateUtil.addOrSubMonth(DateUtil.laterDate(DateUtil.today(), 1), currPeriod);
	}
	
	@Override
	protected void getBatchDateOverviewDifference(Map<String,Object> paramOverview){
		paramOverview.put("batch_add", BATCHADDTYPE.MonthType.getCode());
		paramOverview.put("month_start", DateUtil.formatDateToStr(getRepaymentDate(1), "yyyy-MM"));
		paramOverview.put("month_end", DateUtil.formatDateToStr(getRepaymentDate(getPeriods()), "yyyy-MM"));
		paramOverview.put("date_start", null);
		paramOverview.put("date_end", null);
		String firstRepayDate = DateUtil.formatDateToStr(getRepaymentDate(1));
		paramOverview.put("spec_date", firstRepayDate.substring(firstRepayDate.length()-2));
	}

	
	
}
