package com.sunyard.directbank.finance.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.sunyard.directbank.base.BaseAction;
import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.enums.FINANCEAPP;
import com.sunyard.directbank.finance.model.FinanceModel;
import com.sunyard.directbank.tools.DateUtil;
import com.sunyard.directbank.tools.ParamUtil;

@Controller
@Scope("prototype")
public class FinanceAction extends BaseAction<FinanceModel> {
	
	private Logger logger = Logger.getLogger(FinanceAction.class);
	private static final long serialVersionUID = 5885632626805257152L;
	HttpServletRequest request = ServletActionContext.getRequest();

	/**
	 * 查询
	 * @return
	 * @throws Exception
	 */
	public String selectAllFinances() throws Exception {
		Map<String, Object> param = ParamUtil.param2Map(request);
		logger.info("查询条件信息||"+param);
		String status = (String) param.get("status");
		if(("").equals(status)||status==null){
			param.put("status", FINANCEAPP.wait.getCode());
		}else{
			param.put("status", status);
		}
		// 得到当前的页数，默认值是1
		int pageNo = ParamUtil.getInt(request, "pageNo", 1);
		// 根据条件查询要显示的记录
		IListPage page =  iFinanceService.pageQuery(param,pageNo);
		logger.info("进入查询页面");
		request.setAttribute("page", page);
		request.setAttribute("param", param);
		String[] paramArr = {Consts.APPROVE_STATUS};
		super.getDirtMap(paramArr );

		return "selectFinances";
	}
	
	/**
	 * 查看明细方法
	 * @return
	 * @throws Exception 
	 */
	public String details() throws Exception{
		Map<String, Object> param = new HashMap<String, Object>();
		String financ_id = request.getParameter("financ_id");
		param.put("status", FINANCEAPP.wait.getCode());
		param.put("financ_id", financ_id);
		Map<String,Object> details = iFinanceService.details(param);
		logger.info("进入明细页面，明细信息||"+details);
		request.setAttribute("details", details);
		return "addFinancesUI";		
	}
	
	/**
	 * 审核方法
	 * @return
	 */
	public String approve(){
		Map<String,Object> param = ParamUtil.param2Map(request);
		String remark = (String) param.get("remark");
		String financ_id = (String) param.get("financ_id");
		String status = (String) param.get("status");
		String from = (String) param.get("from");
		String approve_date = DateUtil.todayStr();
		param.put("approve_date", approve_date);
		if(status==null||("".equals(status))||financ_id==null||("".equals(financ_id))||financ_id==remark||("".equals(remark))){
			logger.error("数据获取错误||Status="+status+"||financ_id="+financ_id+"||remark="+remark);
			return Consts.ERROR;
		}else if(status.equals(FINANCEAPP.approve.getCode())){
			logger.info("数据获取||Status="+status+"||financ_id="+financ_id+"||remark="+remark);
			iFinanceService.approve(param);
			request.setAttribute("msg", "审查通过！");
			if("detail".equals(from)){
				return Consts.SUCCESS;
			}else{
				return Consts.SYSSUCCESS;
			}
			
		}else{
			logger.info("数据获取||Status="+status+"||financ_id="+financ_id+"||approveInfo="+remark);
			request.setAttribute("msg", "审查拒绝！");
			iFinanceService.refuse(param);
			if("detail".equals(from)){
				return Consts.SUCCESS;
			}else{
				return Consts.SYSSUCCESS;
			}
		}
		
	}
	
	/**
	 * 构建审核通过页面
	 * @return
	 */
	public String approveUI(){
		Map<String,Object> param = ParamUtil.param2Map(request);
		param.put("status", FINANCEAPP.wait.getCode());
		Map<String,Object> finance = iFinanceService.selectOneFinance(param);
		/*String status = (String) finance.get("status");
		if(FINANCEAPP.wait.getCode().equals(status)){*/
		request.setAttribute("finance", finance);
		logger.info("进入审核通过页面");
		return "approveUI";
		/*}else{
			request.setAttribute("msg", "该交易已审核，不可重复审核！");
			return Consts.ERROR;
		}*/
	}
	
	/**
	 * 构建审核拒绝页面
	 * @return
	 */
	public String refuseUI(){
		Map<String,Object> param = ParamUtil.param2Map(request);
		param.put("status", FINANCEAPP.wait.getCode());
		Map<String,Object> finance = iFinanceService.selectOneFinance(param);
		/*String status = (String) finance.get("status");
		if(FINANCEAPP.wait.getCode().equals(status)){*/
		request.setAttribute("finance", finance);
		logger.info("进入审核拒绝页面");
		return "refuseUI";
		/*}else{
			request.setAttribute("msg", "该交易已审核，不可重复审核！");
			return Consts.ERROR;
		}*/
	}
	
	@Override
	protected String getModuleName() throws Exception {
		return "客户融资信息管理";
	}
}
