package com.sunyard.directbank.amtlist.action;

import javax.annotation.Resource;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.sunyard.directbank.base.action.ReportAction;
import com.sunyard.directbank.base.service.IBaseService;

@Controller
@Scope("prototype")
public class AmtListAction extends ReportAction  {
	 
	private static final long serialVersionUID = 1L;	
	
	@Resource
	private IBaseService amtListService;
	private String[] constsArr = {};
	private String[] columnArr = {};
	/*
	 * 资金进出统计查询
	 * 
	 * */
	public String toQuery() throws Exception{
		String[] paramArr = {REPORT_TYPE};
		String date_type = defaultDateType();
		this.pageQuery(amtListService, constsArr, columnArr, date_type);
		getDirtMap(paramArr);
		
		return "query";
	}
	
	
	/*
	 * 资金进出统计导出
	 * 
	 * */
	public void fixedAssets() throws Exception{
		String[] titleArr = {"时间类型","流入资金总量","本行流入量","外部流入量","资金净增保有量"};
		String[] colNameArr = {"date_type","total_income","innerBank_total_income","outerBank_total_income","incr_total_income"};
		String fileName = "资金进出统计";
		String date_type = defaultDateType();
		this.fixedAssets(amtListService, constsArr, columnArr, titleArr, colNameArr, fileName, date_type);
		
	}
	
	@Override
	protected String getModuleName() {
		return "资金进出统计";
	}
}
