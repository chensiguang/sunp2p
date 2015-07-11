package com.sunyard.directbank.transaccreq.action;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.sunyard.directbank.base.action.ReportAction;
import com.sunyard.directbank.base.service.IBaseService;

@Controller
@Scope("prototype")
public class TransAccreqAction extends ReportAction {

	@Resource
	private IBaseService transAccreqService;
	private static final long serialVersionUID = 4534213035596609092L;
	
	/**
	 * 查询
	 * @return
	 * @throws Exception
	 */
	public String selectAllAcc() throws Exception {
		
		// 查询数据字典，翻译字段，在选择框中显示
		String[] paramArr = {TRANS_STATE};
		
		// 查询数据字典，翻译字段，在查询结果中显示
		String[] constsArr = {TRANS_STATE, CUS_TYPE, TRANS_CHANNEL};
		String[] columnArr = {"trade_state", "cus_type", "channel"};
		pageQuery(transAccreqService, constsArr, columnArr);
		getDirtMap(paramArr);	// 调用BaseAction中的方法翻译字段
		
		return "transAccreq";
	}
	
	/**
	 * 下载
	 * @throws Exception
	 */
	public void download() throws Exception {
		
		// 查询数据字典，翻译字段，在查询结果中显示
		String[] constsArr = {TRANS_STATE, CUS_TYPE, TRANS_CHANNEL};
		String[] columnArr = {"trade_state", "cus_type", "channel"};
		
		// excel表的列名
		String[] titleArr = {"交易流水","交易代码","交易名称","交易状态","交易日期","交易时间","电子账户","客户类型","客户姓名","交易渠道"};
		
		// 列名对应的字段
		String[] colNameArr = {"serial_id","trans_code","trans_name","trade_state","trans_date","trans_time","eacc_no","cus_type","name","channel"};
		
		// excel表的名称
		String fileName = "账户流水";
		fixedAssets(transAccreqService, constsArr, columnArr, titleArr, colNameArr, fileName);
	}

	@Override
	protected String getModuleName() throws Exception {

		return "账户流水查询";
	}
	
	
}
