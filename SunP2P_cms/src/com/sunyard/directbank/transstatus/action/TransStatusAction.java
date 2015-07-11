package com.sunyard.directbank.transstatus.action;

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
import com.sunyard.directbank.transstatus.model.TransStatus;

@Controller
@Scope("prototype")
public class TransStatusAction extends BaseAction<TransStatus>implements Consts {
	private static final long serialVersionUID = 2220001L;
	private Logger logger = Logger.getLogger(TransStatusAction.class);
	
	HttpServletRequest request = ServletActionContext.getRequest();
     /**
      * 页面查询和显示功能
      * @return
      * @throws Exception
      */
	public String toQuery() throws Exception {
		Map<String, Object> param = ParamUtil.transBean2Map(model);
		logger.info("bean2map=" + param);
		int pageNo = ParamUtil.getInt(request, "pageNo", 1);
		IListPage page = iTransStatusService.pageQuery(param, pageNo);
		logger.info("page=" + page.getResult());
		request.setAttribute("page", page);
		request.setAttribute("param", param);
		String[] paramArr = {ENABLE_FLAG,PROD_TYPE};
		getDirtMap(paramArr);
		return "query";
	}
    
	/**
	 * 页面删除功能
	 * @return
	 * @throws Exception
	 */
	public String delete()throws Exception{
		String detail = request.getParameter("detail");
		List<TransStatus> list =iTransStatusService.string2List(detail);
		if(iTransStatusService.deleteBatch(list)) {
			request.setAttribute("msg", "删除成功");
			return SYSSUCCESS;
		}else {
			return Consts.ERROR;
		}
	}
	/**
	 * 增加添加页面
	 * @return
	 * @throws Exception
	 */
	public String addUI() throws Exception {
		String[] paramArr = {ENABLE_FLAG,PROD_TYPE};
		getDirtMap(paramArr);
		return "addUI";
	}

	/**
	 * 页面添加功能
	 * @return
	 * @throws Exception
	 */
	public String add()throws Exception{
		if(iTransStatusService.add(model)){
			request.setAttribute("msg", "添加成功");
			return SYSSUCCESS;
		}else {
			return Consts.ERROR;
		}
	}
	/**
	 * 增加修改页面
	 * @return
	 * @throws Exception
	 */
	
	public String updateUI()throws Exception{
		String updetail = request.getParameter("updetail");
		model = iTransStatusService.string2Model(updetail);
		TransStatus transStatus = iTransStatusService.findByKey(model);
		request.setAttribute("transStatus", transStatus);
		String[] paramArr = {ENABLE_FLAG,PROD_TYPE};
		getDirtMap(paramArr);
		return "updateUI";
	}
	
	/**
	 * 页面修改功能
	 * @return
	 * @throws Exception
	 */
	
	public String update()throws Exception{
		if(iTransStatusService.update(model)){
			request.setAttribute("msg", "修改成功");
			return SYSSUCCESS;
		}else{
			return Consts.ERROR;
		}
	}
	

	/**
	 * 页面增加按钮功能
	 */
	protected String getModuleName() throws Exception {
		return "产品交易状态管理";
	}
}
