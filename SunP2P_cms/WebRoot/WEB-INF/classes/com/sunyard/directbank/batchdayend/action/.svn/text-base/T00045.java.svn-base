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
public class T00045 extends BaseAction {

	@Resource
	private IBatchDayEndService iBatchDayEndService;
	private static final long serialVersionUID = 6700842640741077766L;
	HttpServletRequest request = ServletActionContext.getRequest();

	/**
	 * 产品终止操作
	 * 
	 * @return
	 * @throws Exception
	 */
	public String prodEnd() throws Exception {
		if (iBatchDayEndService.prodEnd(super.getUser().getUser_id())) {
			request.setAttribute("msg", "产品终止操作成功");
			return Consts.SYSSUCCESS;
		} else {
			return Consts.ERROR;
		}
	}

}
