package com.sunyard.directbank.repayType.service.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Map;

import com.sunyard.directbank.enums.BATCHADDTYPE;
import com.sunyard.directbank.prod.model.ProdBaseInfo;
import com.sunyard.directbank.tools.DateUtil;

public class DisposableReply extends AbstractReplyType {

	public DisposableReply(ProdBaseInfo prod) {
		super(prod);
	}

	@Override
	public BigDecimal getEachInterest(BigDecimal limit, BigDecimal interest) {
		return limit.multiply(interest).multiply(new BigDecimal(getProd().getCycle())).divide(new BigDecimal(12), 4, BigDecimal.ROUND_HALF_UP);
	}
	@Override
	public BigDecimal getEachCapital(BigDecimal limit,int currPeriod ) {
		return limit;
	}

	@Override
	public Date getRepaymentDate(int currPeriod) {
		Date expire_date = getProd().getExpire_date();
		if(expire_date == null){
			expire_date = DateUtil.addOrSubMonth(DateUtil.laterDate(DateUtil.today(), 1), getProd().getCycle());
		}
		return expire_date;
	}
	
	@Override
	protected void getBatchDateOverviewDifference(Map<String,Object> paramOverview){
		paramOverview.put("batch_add", BATCHADDTYPE.DateType.getCode());
		paramOverview.put("month_start", "");
		paramOverview.put("month_end", "");
		paramOverview.put("date_start", getRepaymentDate(getPeriods()));
		paramOverview.put("date_start", getRepaymentDate(getPeriods()));
		paramOverview.put("spec_date", "");
	}
	
	@Override
	public int getPeriods() {
		return 1;
	}

}
