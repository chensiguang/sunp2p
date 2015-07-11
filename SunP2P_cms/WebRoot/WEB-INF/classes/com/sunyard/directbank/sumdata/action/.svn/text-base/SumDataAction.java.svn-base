package com.sunyard.directbank.sumdata.action;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.sumdata.service.ISumDataService;

@Controller
@Scope("prototype")
public class SumDataAction extends ActionSupport {
	 
	private static final long serialVersionUID = 1L;
	
	@Resource
	private ISumDataService sumDataService;
	
	public String summarizationData(){
		generateTransAmtReport();
		generateAmtListReport();
		generateEAccountReport();
		return Consts.SUCCESS;
	}
	
	//生成电子账户开户统计表数据
	private void generateEAccountReport() {
		if(!haveStatisticsToday("EAccount")){
			sumDataService.generateEAccountReport();
		}
		
	}

	//生成产品资金流转统计表数据
	private void generateAmtListReport() {
		if(!haveStatisticsToday("AmtList")){
			sumDataService.generateAmtListReport();
		}
		
	}
	
	//生成产品交易资金统计表数据
	private void generateTransAmtReport() {
		if(!haveStatisticsToday("TransAmt")){
			sumDataService.generateTransAmtReport();
		}
		
	}

	private boolean haveStatisticsToday(String flag) {
		return sumDataService.haveStatisticsToday(flag);
	}
	
    
}
