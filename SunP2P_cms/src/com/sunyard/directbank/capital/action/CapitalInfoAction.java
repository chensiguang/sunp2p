package com.sunyard.directbank.capital.action;

import javax.annotation.Resource;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.sunyard.directbank.base.action.ReportAction;
import com.sunyard.directbank.base.service.IBaseService;

@Controller
@Scope("prototype")
public class CapitalInfoAction extends ReportAction  {
	 
	private static final long serialVersionUID = 1L;	
	
	@Resource
	private IBaseService capitalInfoService;
	private String[] constsArr = {PROD_TYPE,TRANS_CHANNEL};
	private String[] columnArr = {"prod_type","trans_channel"};
	/*
	 * 产品销售统计
	 * 
	 * */
	public String toQuery() throws Exception{
		String[] paramArr = {PROD_TYPE,REPORT_TYPE};
		String date_type = defaultDateType();
		this.pageQuery(capitalInfoService, constsArr, columnArr, date_type);
		getDirtMap(paramArr);
		
		return "query";
	}
	
	
	/*
	 * 产品销售统计导出
	 * 
	 * */
	public void fixedAssets() throws Exception{
		String[] titleArr = {"时间类型","产品类型","产品代码","产品名称","交易渠道","交易笔数","交易金额"};
		String[] colNameArr = {"date_type","prod_type","prod_id","prod_name","trans_channel","total_count","sum_amount"};
		String fileName = "产品销售统计";
		String date_type = defaultDateType();
		this.fixedAssets(capitalInfoService, constsArr, columnArr, titleArr, colNameArr, fileName, date_type);
		
	}
	
	@Override
	protected String getModuleName() {
		return "产品销售统计";
	}
}
