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
public class T00039 extends BaseAction {

	@Resource
	private IBatchDayEndService iBatchDayEndService;
	private static final long serialVersionUID = 930057543434642922L;
	HttpServletRequest request = ServletActionContext.getRequest();

	/**
	 * 清算结束
	 * 
	 * @return
	 * @throws Exception
	 */
	public String batchEnd() throws Exception {

		if (iBatchDayEndService.batchEnd(super.getUser().getUser_id())) {
			request.setAttribute("msg", "清算已成功结束！");
			return Consts.SYSSUCCESS;
		} else {
			return Consts.ERROR;
		}

	}
}
