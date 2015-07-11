package com.sunyard.directbank.transfrozen.action;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.sunyard.directbank.base.action.ReportAction;
import com.sunyard.directbank.base.service.IBaseService;

@Controller
@Scope("prototype")
public class TransFrozenAction extends ReportAction {

	@Resource
	private IBaseService transFrozenService;
	private static final long serialVersionUID = -7985997960333447333L;
	
	/**
	 * 查询
	 * @return
	 * @throws Exception
	 */
	public String selectTransFrozen() throws Exception {
		
		// 查询数据字典，在页面选择框中显示
		String[] paramArr = {FROZEN_STATUS, FROZEN_TYPE};
		
		// 查询数据字典，翻译字段，在查询结果中显示
		String[] constsArr = {FROZEN_STATUS, FROZEN_TYPE, FROZEN_CAUSE, CUS_TYPE, TRANS_CHANNEL};
		String[] columnArr = {"status", "frozen_type", "frozen_cause", "cus_type", "channel"};
		pageQuery(transFrozenService, constsArr, columnArr);
		getDirtMap(paramArr);
		
		return "transFrozen";
	}
	
	/**
	 * 下载
	 * @throws Exception
	 */
	public void download() throws Exception {
		
		// 查询数据字典，翻译字段，在查询结果中显示
		String[] constsArr = {FROZEN_STATUS, FROZEN_TYPE, FROZEN_CAUSE, CUS_TYPE, TRANS_CHANNEL};
		String[] columnArr = {"status", "frozen_type", "frozen_cause", "cus_type", "channel"};
		
		// excel表的列名
		String[] titleArr = {"冻结流水号","冻结状态","冻结日期","解冻日期","冻结类型","冻结金额","冻结原因","电子账号","账户类型","账户名称","直接账户","交易渠道","解冻流水号"};
		
		// 列名对应的字段
		String[] colNameArr = {"frozen_serial","status","frozen_date","unfrozen_date","frozen_type","frozen_amt","frozen_cause","eacc_no","cus_type","name","account","channel","unfrozen_serial"};
		
		// excel表的名称
		String fileName = "冻结解冻流水";
		fixedAssets(transFrozenService, constsArr, columnArr, titleArr, colNameArr, fileName);
	}

	@Override
	protected String getModuleName() throws Exception {

		return "冻结解冻流水查询";
	}
	
	
}
