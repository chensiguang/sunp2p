package com.sunyard.directbank.syslog.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.sunyard.directbank.base.action.ReportAction;
import com.sunyard.directbank.base.service.IBaseService;
import com.sunyard.directbank.enums.RSTCODE;

@Controller
@Scope("prototype")
public class OperLogAction extends ReportAction  {
	 
	private static final long serialVersionUID = 1L;	
	
	@Resource
	private IBaseService operLogService;
	
	/*
	 * 操作日志查询
	 * 
	 * */
	public String toQuery() throws Exception{
		String[] constsArr = {RST_CODE};
		String[] columnArr = {"rst_code"};
		this.pageQuery(operLogService, constsArr, columnArr, "");
		return "query";
	}
	
	
	/*
	 * 操作日志导出
	 * 
	 * */
	public void fixedAssets() throws Exception {
		String[] constsArr = {RST_CODE};
		String[] columnArr = {"rst_code"};
		String[] titleArr = {"用户ID","用户名称","操作日期","用户终端IP","用户操作URL","用户操作","操作结果"};
		String[] colNameArr = {"user_id","user_name","oper_time","user_ip","fun_url","privilege_name","rst_code"};
		String fileName = "用户操作日志";
		
		this.fixedAssets(operLogService, constsArr, columnArr, titleArr, colNameArr, fileName, "");
		
	}
	
	@Override
	protected String getModuleName() {
		return "系统用户操作日志查询";
	}
	
	@Override
	protected void resultSpecProcess(List<Map<String, Object>> infoList) {
		for(Map<String,Object> item : infoList){
			String datestr = item.get("oper_time").toString();
			item.put("oper_time", datestr.substring(0, datestr.length()-2));
		}
		
		if(infoList.size()>0){
			infoList.get(infoList.size()-1).put("rst_code", RSTCODE.SUC.getCode());
		}
	}
}
