package com.sunyard.directbank.syslog.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.sunyard.directbank.base.action.ReportAction;
import com.sunyard.directbank.base.service.IBaseService;

@Controller
@Scope("prototype")
public class SysLogAction extends ReportAction  {
	 
	private static final long serialVersionUID = 1L;	
	
	@Resource
	private IBaseService sysLogService;
	
	/*
	 * 运行日志查询
	 * 
	 * */
	public String toQuery() throws Exception{
		String[] constsArr = {SYSTEM_TYPE};
		String[] columnArr = {"system_type"};
		this.pageQuery(sysLogService, constsArr, columnArr);
		getDirtMap(constsArr);
		return "query";
	}
	
	
	/*
	 * 运行日志导出
	 * 
	 * */
	public void fixedAssets() throws Exception{
		String[] constsArr = {SYSTEM_TYPE};
		String[] columnArr = {"system_type"};
		String[] titleArr = {"日期","系统","系统动作"};
		String[] colNameArr = {"run_time","system_type","system_action"};
		String fileName = "系统运行日志";
		this.fixedAssets(sysLogService, constsArr, columnArr, titleArr, colNameArr, fileName);
		
	}
	@Override
	protected void resultSpecProcess(List<Map<String, Object>> infoList) {
		for(Map<String,Object> item : infoList){
			String datestr = item.get("run_time").toString();
			item.put("run_time", datestr.substring(0, datestr.length()-2));
		}
	}
	
	@Override
	protected String getModuleName() {
		return "系统运行日志查询";
	}
	
}
