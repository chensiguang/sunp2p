package com.sunyard.directbank.cust.action;


import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.sunyard.directbank.base.action.ReportAction;
import com.sunyard.directbank.base.service.IBaseService;

@Controller
@Scope("prototype")
public class CustInfoAction extends ReportAction  {
	 
	private static final long serialVersionUID = 1L;
	
	@Resource
	private IBaseService custInfoService;
	
	/**
	 * 查询
	 * @return
	 * @throws Exception
	 */
	public String toQuery() throws Exception{
		
		String[] constsArr = {ACCOUNT_STATE, SEX, MAIL_STATE, RISK_LVL};
		String[] columnArr = {"acc_state", "sex", "email_state", "risk_lvl"};
		this.pageQuery(custInfoService, constsArr, columnArr);
		return "query";
	}
	
	/**
	 * 下载
	 * @throws Exception
	 */
	public void download() throws Exception{
		
		String[] constsArr = {ACCOUNT_STATE, SEX, MAIL_STATE, RISK_LVL};
		String[] columnArr = {"acc_state", "sex", "email_state", "risk_lvl"};
		String[] titleArr = {"电子账号","客户姓名","证件号码","手机号码","电子邮箱","电子邮箱是否验证",
				"当前可用余额","总余额","可用积分","总积分","注册时间","风险等级","用户等级","账户状态","性别","信用等级"};
		String[] colNameArr = {"eacc_no","name","id_code","mobile","email","email_state",
				"n_balance","t_balance","n_score","t_score","reg_time","risk_lvl","cus_lvl","acc_state","sex","trust_lvl"};
		String fileName = "客户信息查询";
		super.fixedAssets(custInfoService, constsArr, columnArr, titleArr, colNameArr, fileName);
		
	}

	@Override
	protected String getModuleName() {
		return "客户信息查询";
	}
	
}
