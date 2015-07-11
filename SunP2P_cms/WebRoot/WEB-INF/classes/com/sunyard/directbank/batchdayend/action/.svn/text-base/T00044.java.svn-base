package com.sunyard.directbank.batchdayend.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.sunyard.directbank.base.BaseAction;
import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.batchdayend.service.IBatchDayEndService;

@SuppressWarnings("rawtypes")
@Controller
@Scope("prototype")
public class T00044 extends BaseAction {

	@Resource
	private IBatchDayEndService iBatchDayEndService;
	private static final long serialVersionUID = 548098208992955282L;
	HttpServletRequest request = ServletActionContext.getRequest();
	
	/**
	 * 债权转让失效操作
	 * 
	 * @return
	 * @throws Exception
	 */
	public String invalid() throws Exception {
		if (iBatchDayEndService.invalid(super.getUser().getUser_id())) {
			request.setAttribute("msg", "债权转让失效操作成功");
			return Consts.SYSSUCCESS;
		} else {
			return Consts.ERROR;
		}
	}


}
