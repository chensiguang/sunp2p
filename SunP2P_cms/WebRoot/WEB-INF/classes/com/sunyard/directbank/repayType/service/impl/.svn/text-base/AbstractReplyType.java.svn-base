package com.sunyard.directbank.repayType.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.enums.BATCHDATETYPE;
import com.sunyard.directbank.prod.model.ProdBaseInfo;
import com.sunyard.directbank.repayType.service.IRepayType;
import com.sunyard.directbank.tools.DateUtil;

public abstract class AbstractReplyType implements IRepayType {
	
	private ProdBaseInfo prod;
	
	public AbstractReplyType(ProdBaseInfo prod){
		this.prod = prod;
	}
	
	@Override
	public BigDecimal getEachInterest(BigDecimal limit){
		return getEachInterest(limit, prod.getIst_year());
	}
	
	@Override
	public abstract BigDecimal getEachInterest(BigDecimal limit,BigDecimal interest);

	@Override
	public abstract BigDecimal getEachCapital(BigDecimal limit,int currPeriod);
	
	@Override
	public BigDecimal getEachAmt(BigDecimal limit, int currPeriod,
			BigDecimal interest) {
		return getEachInterest(limit, interest).add(getEachCapital(limit, currPeriod));
		
	}
		
	@Override
	public abstract Date getRepaymentDate(int currPeriod) ;
		
	public  ProdBaseInfo getProd(){
		return prod;
	}

	@Override
	public int getPeriods() {
		return prod.getCycle();
	}
	
	@Override
	public List<Map<String,Object>> getProdBatchDate(){
		List<Map<String,Object>> datelist = new ArrayList<Map<String,Object>>(); 
		Map<String,Object> paramOverview = new HashMap<String,Object>();
		getBatchDateOverviewCommon(paramOverview);
		getBatchDateOverviewDifference(paramOverview);
		datelist.add(paramOverview);
		getBatchDateList(datelist,paramOverview);
		return datelist;
	}
	
	private void getBatchDateOverviewCommon(Map<String,Object> paramOverview){
		paramOverview.put("batchdate_type", BATCHDATETYPE.ProdId.getCode());
		paramOverview.put("prod_type", "");
		paramOverview.put("prod_id", prod.getProd_id());
		paramOverview.put("choose_year", "");
		paramOverview.put("not_batch_date", "");
		paramOverview.put("batch_time", Consts.BATCH_TIME);
	}
	
	protected void getBatchDateOverviewDifference(Map<String,Object> paramOverview){
	}
	
	private void getBatchDateList(List<Map<String,Object>> datelist,Map<String,Object> paramOverview){
		for(int currPeriod=1;currPeriod<=getPeriods();currPeriod++){
			Map<String,Object> map = new HashMap<String,Object>();
			map.putAll(paramOverview);
			map.put("batch_date", DateUtil.formatDateToStr(getRepaymentDate(currPeriod)));
			map.put("status", "");
			datelist.add(map);
		}
	}
}
