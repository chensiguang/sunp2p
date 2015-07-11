package com.sunyard.directbank.borrower.action;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.sunyard.directbank.base.action.ReportAction;
import com.sunyard.directbank.base.service.IBaseService;
import com.sunyard.directbank.enums.FINANCEAPP;

@Controller
@Scope("prototype")
public class BorrowerFinanceAction extends ReportAction {
	 
	private static final long serialVersionUID = 1L;
	
	@Resource
	private IBaseService borrowerFinanceService;
	private String[] constsArr = {CUS_TYPE};
	private String[] columnArr = {"cus_type"};
	/*
	 * 查询
	 * 
	 * */
	public String toQuery() throws Exception{
		this.pageQuery(borrowerFinanceService, constsArr, columnArr);
		return "query";
		
	}
	
	/*
	 * 导出
	 * 
	 * */
	public void fixedAssets() throws Exception{
		String[] titleArr = {"电子账号","客户类型","客户名称","在途融资笔数","在途融资金额","成功融资笔数","成功融资金额"};
		String[] colNameArr = {"eacc_no","cus_type","name","on_passage_count","on_passage_amt","succ_finance_count","succ_finance_amt"};
		String fileName = "借款人融资信用统计";
		this.fixedAssets(borrowerFinanceService, constsArr, columnArr, titleArr, colNameArr, fileName);
		
	}
	
	@Override
	protected String getModuleName() {
		return "借款人融资信用统计";
	}
	
	@Override
	protected void AddExtraParamToMap(Map<String, Object> param) {
		param.put("on_passage_status", FINANCEAPP.wait.getCode());
		param.put("succ_finance_status", FINANCEAPP.approve.getCode());
	}
}
