package com.sunyard.directbank.eaccount.action;

import javax.annotation.Resource;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.sunyard.directbank.base.action.ReportAction;
import com.sunyard.directbank.base.service.IBaseService;

@Controller
@Scope("prototype")
public class EacCountAction extends ReportAction  {
	 
	private static final long serialVersionUID = 1L;	
	
	@Resource
	private IBaseService eacCountService;
	private String[] constsArr = {};
	private String[] columnArr = {};
	/*
	 * 开户量统计
	 * 
	 * */
	public String toQuery() throws Exception{
		String[] paramArr = {REPORT_TYPE};
		String date_type = defaultDateType();
		this.pageQuery(eacCountService, constsArr, columnArr, date_type);
		getDirtMap(paramArr);
		
		return "query";
	}
	
	
	/*
	 * 开户量统计导出
	 * 
	 * */
	public void fixedAssets() throws Exception{
		String[] titleArr = {"时间类型","开户总人数","本行用户数","他行用户数","绑定本行卡数量","绑定他行卡数量"};
		String[] colNameArr = {"date_type","tot_num","mybank_num","othbank_num","mybank_card_num","othbank_card_num"};
		String fileName = "开户量统计";
		String date_type = defaultDateType();
		this.fixedAssets(eacCountService, constsArr, columnArr, titleArr, colNameArr, fileName, date_type);
		
	}
	
	@Override
	protected String getModuleName() {
		return "开户量统计";
	}
}
