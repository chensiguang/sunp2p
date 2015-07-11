package com.sunyard.directbank.sharelist.action;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.sunyard.directbank.base.action.ReportAction;
import com.sunyard.directbank.base.service.IBaseService;

@Controller
@Scope("prototype")
public class ShareListAction extends ReportAction {
	 
	private static final long serialVersionUID = 1L;
	
	@Resource
	private IBaseService shareListService;
	private String[] constsArr = {ACC_TYPE,PROD_TYPE,AMT_TYPE};
	private String[] columnArr = {"acc_type","prod_type","var_direction"};
	/*
	 * 查询
	 * 
	 * */
	public String toQuery() throws Exception{
		this.pageQuery(shareListService, constsArr, columnArr);
		getDirtMap(constsArr);
		
		return "query";
		
	}
	
	/*
	 * 导出
	 * 
	 * */
	public void fixedAssets() throws Exception{
		String[] titleArr = {"电子账号","账户类型","账户","产品类型","产品代码","变动份额","份额变动方向","变动日期","变动时间","变动原因"};
		String[] colNameArr = {"eacc_no","acc_type","account","prod_type","prod_id","var_value","var_direction","var_date","var_time","var_cause"};
		String fileName = "用户份额明细查询";
		this.fixedAssets(shareListService, constsArr, columnArr, titleArr, colNameArr, fileName);
		
	}
	
	@Override
	protected String getModuleName() {
		return "用户份额明细查询";
	}
    
}
