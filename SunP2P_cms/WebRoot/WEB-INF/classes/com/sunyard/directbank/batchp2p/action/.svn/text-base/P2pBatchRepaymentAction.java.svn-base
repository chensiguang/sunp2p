package com.sunyard.directbank.batchp2p.action;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.batchp2p.service.IP2pBatchRepaymentSerivce;
import com.sunyard.directbank.enums.REPAYMENTSTATUS;

@Controller
@Scope("prototype")
public class P2pBatchRepaymentAction {
	
	@Resource
	private IP2pBatchRepaymentSerivce p2pBatchRepaymentSerivce;
	/*
	 * p2p批量还款
	 * 
	 * */
	
	public String batchRepayment(){
		//还款检查
		List<Map<String,Object>> list = p2pBatchRepaymentSerivce.getRealRepayDateEqualTodayRecord(REPAYMENTSTATUS.NotPay.getCode());
		if(list != null && list.size() > 0){
			HttpServletRequest request = ServletActionContext.getRequest();
			request.setAttribute("msg", "有" + list.size() + "个产品未录入本次还款金额请查询并录入！");
			return Consts.ERROR;
		}else{
			List<Map<String,Object>> repaylist = p2pBatchRepaymentSerivce.getRealRepayDateEqualTodayRecord(REPAYMENTSTATUS.WaitingPay.getCode());
			if(repaylist !=null && repaylist.size() > 0){
				for(Map<String,Object> item : repaylist){
					p2pBatchRepaymentSerivce.p2pBatchRepayment(item);
				}
			}
			return Consts.SUCCESS;
		}
	}
	
}
