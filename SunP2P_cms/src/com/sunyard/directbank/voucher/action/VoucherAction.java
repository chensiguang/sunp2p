package com.sunyard.directbank.voucher.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.sunyard.directbank.base.BaseAction;
import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.tools.ParamUtil;
import com.sunyard.directbank.voucher.model.VoucherModel;

@Controller
@Scope("prototype")

public class VoucherAction extends BaseAction<VoucherModel> implements Consts{
	private static final long serialVersionUID = 2233301L;
	private Logger logger = Logger.getLogger(VoucherModel.class);

	HttpServletRequest request = ServletActionContext.getRequest();
	 /**
     * 页面查询和显示功能
     * @return
     * @throws Exception
     */
	public String toQuery()throws Exception{
    	Map<String, Object> param = ParamUtil.transBean2Map(model);
		logger.info("bean2map=" + param);
		int pageNo = ParamUtil.getInt(request, "pageNo", 1);
		IListPage page = iVoucherService.pageQuery(param, pageNo);
		logger.info("page=" + page.getResult());
		request.setAttribute("page", page);
		request.setAttribute("param", param);
		String[] paramArr = {VOUCHER_TYPE, VOUCHER_STATUS};
		getDirtMap(paramArr);
    	return "query";
    }
	 /**
     * 添加增加抵用券页面
     * @return
     * @throws Exception
     */
	public String addUI()throws Exception{
		String[] paramArr = {VOUCHER_TYPE, VOUCHER_STATUS};
		getDirtMap(paramArr);
		return "addUI";
	}
	/**
	 * 页面增加抵用券功能
	 */
	public String add()throws Exception{
		
		if(iVoucherService.add(model)){
			request.setAttribute("msg", "添加抵用券成功");
			return "syssuccess";
		}else{
			return Consts.ERROR;
		}
	}
	/**
	 * 页面删除抵用券功能
	 */
	public String delete()throws Exception{
		String detail = request.getParameter("detail");
		List<String> strs = iVoucherService.string2list(detail);
		if(iVoucherService.deleteBatch(strs)){
			request.setAttribute("msg", "删除抵用券成功");
			return "syssuccess";
		}else{
			return Consts.ERROR;
		}
	}
	/**
     * 添加修改抵用券页面
     * @return
     * @throws Exception
     */
	public String updateUI()throws Exception{
		String voucher_no = request.getParameter("updetail");
		model = iVoucherService.getById(voucher_no);
		request.setAttribute("voucher", model);
		String[] paramArr = {VOUCHER_TYPE, VOUCHER_STATUS};
		getDirtMap(paramArr);
		return "updateUI";
	}
	/**
	 * 页面修改抵用券功能
	 */
	public String update()throws Exception{
		if(iVoucherService.update(model)){
			request.setAttribute("msg", "修改抵用券成功");
			return "syssuccess";
		}else{
			return Consts.ERROR;
		}
	}
	/**
	 * 页面增加按钮功能
	 */
	protected String getModuleName() throws Exception {
		return "抵用券管理";
	}
}
