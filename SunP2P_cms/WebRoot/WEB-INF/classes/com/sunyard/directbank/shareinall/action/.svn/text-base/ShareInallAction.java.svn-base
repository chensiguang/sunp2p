package com.sunyard.directbank.shareinall.action;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.sunyard.directbank.base.action.ReportAction;
import com.sunyard.directbank.base.service.IBaseService;

@Controller
@Scope("prototype")
public class ShareInallAction extends ReportAction {
	 
	private static final long serialVersionUID = 1L;
	
	@Resource
	private IBaseService shareInallService;
	private String[] constsArr = {ACC_TYPE,PROD_TYPE};
	private String[] columnArr = {"acc_type","prod_type"};
	/*
	 * 查询
	 * 
	 * */
	public String toQuery() throws Exception{
		this.pageQuery(shareInallService, constsArr, columnArr);
		getDirtMap(constsArr);
		
		return "query";
		
	}
	
	/*
	 * 导出
	 * 
	 * */
	public void fixedAssets() throws Exception{
		String[] titleArr = {"电子账号","账户类型","账户","产品类型","产品代码","产品持有份额","可用份额","已兑付收益","预计总收益","冻结份额","长期冻结份额","最终变动日期"};
		String[] colNameArr = {"eacc_no","acc_type","account","prod_type","prod_id","tot_vol","use_vol","payed_val","tot_val","frozen_vol","long_frozen_vol","last_date"};
		String fileName = "用户份额查询";
		this.fixedAssets(shareInallService, constsArr, columnArr, titleArr, colNameArr, fileName);
		
	}
	
	@Override
	protected String getModuleName() {
		return "用户份额查询";
	}
    
}
