package com.sunyard.directbank.manager.action;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.sunyard.directbank.base.action.ReportAction;
import com.sunyard.directbank.base.service.IBaseService;
import com.sunyard.directbank.enums.FINANCEAPP;

@Controller
@Scope("prototype")
public class ManagerFinanceAction extends ReportAction {
	 
	private static final long serialVersionUID = 1L;
	
	@Resource
	private IBaseService managerFinanceService;
	private String[] constsArr = {CUS_TYPE};
	private String[] columnArr = {"cus_type"};
	/*
	 * 查询
	 * 
	 * */
	public String toQuery() throws Exception{
		this.pageQuery(managerFinanceService, constsArr, columnArr);
		return "query";
		
	}
	
	/*
	 * 导出
	 * 
	 * */
	public void fixedAssets() throws Exception{
		String[] titleArr = {"客户经理编号","客户经理名称","客户类型","融资次数","融资金额"};
		String[] colNameArr = {"manage","user_name","cus_type","finance_count","finance_amt"};
		String fileName = "客户经理融资统计";
		this.fixedAssets(managerFinanceService, constsArr, columnArr, titleArr, colNameArr, fileName);
		
	}
	
	@Override
	protected String getModuleName() {
		return "客户经理融资统计";
	}
    
	@Override
	protected void AddExtraParamToMap(Map<String, Object> param) {
		param.put("refuse_finance_status", FINANCEAPP.refuse.getCode());
	}
}
