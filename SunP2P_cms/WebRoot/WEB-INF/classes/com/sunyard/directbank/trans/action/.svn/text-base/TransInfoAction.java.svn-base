package com.sunyard.directbank.trans.action;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.sunyard.directbank.base.action.ReportAction;
import com.sunyard.directbank.base.service.IBaseService;

@Controller
@Scope("prototype")
public class TransInfoAction extends ReportAction {
	 
	private static final long serialVersionUID = 1L;
	
	@Resource
	private IBaseService transInfoService;
	
	/*
	 * 查询
	 * 
	 * */
	public String toQuery() throws Exception{
		String[] constsArr = {TRANS_STATE,TRANS_CHANNEL};
		String[] columnArr = {"trade_state","channel"};
		
		this.pageQuery(transInfoService, constsArr, columnArr);
		getDirtMap(constsArr);
		
		return "query";
		
	}
	
	/*
	 * 导出
	 * 
	 * */
	public void fixedAssets() throws Exception{
		String[] constsArr = {TRANS_STATE,TRANS_CHANNEL};
		String[] columnArr = {"trade_state","channel"};
		String[] titleArr = {"流水号","交易类型","产品代码","交易金额","交易渠道","交易状态","交易人姓名","交易人手机","电子账户"};
		String[] colNameArr = {"serial_id","trans_code","prod_id","amt","channel","trade_state","name","mobile","eacc_no"};
		String fileName = "交易流水";
		this.fixedAssets(transInfoService, constsArr, columnArr, titleArr, colNameArr, fileName);
		
	}
	
	@Override
	protected String getModuleName() {
		return "交易流水查询";
	}
    
}
