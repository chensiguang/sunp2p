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
public class T00047 extends BaseAction {

	@Resource
	private IBatchDayEndService iBatchDayEndService;
	private static final long serialVersionUID = 5307586200934690306L;
	HttpServletRequest request = ServletActionContext.getRequest();
	
	/**
	 * 执行文件归档
	 * @return
	 * @throws Exception
	 */
	public String doFiling() throws Exception {
		if (iBatchDayEndService.doFiling(super.getUser().getUser_id())) {
			request.setAttribute("msg", "文件归档操作成功");
			return Consts.SYSSUCCESS;
		} else {
			return Consts.ERROR;
		}
		
	}

}
