package com.sunyard.directbank.comActive.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.sunyard.directbank.base.BaseAction;
import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.base.model.ListPage;
import com.sunyard.directbank.batchorder.action.BatchOrderAction;
import com.sunyard.directbank.tools.ParamUtil;

@SuppressWarnings("rawtypes")
@Controller
@Scope("prototype")
public class ComActiveAction extends BaseAction implements Consts{

	private static final long serialVersionUID = -8239874967041198192L;
	HttpServletRequest request = ServletActionContext.getRequest();
	private Logger logger = Logger.getLogger(BatchOrderAction.class);

	/**
	 * 查询
	 * @return
	 * @throws Exception 
	 */
	public String selectAllActive() throws Exception {
		
		Map<String, Object> param = ParamUtil.param2Map(request);
		int pageNo = ParamUtil.getInt(request, "pageNo", 1);
		ListPage page = iComActiveService.pageQuery(param, pageNo);
		request.setAttribute("param", param);
		request.setAttribute("page", page);
		logger.info("进入查询页面，查询结果 page = " + page.getResult());
		
		// 数据字典翻译，在页面选择框显示
		String[] paramArr = {ISSUE};
		super.getDirtMap(paramArr);
		
		return "comActive";
	}
	
	/**
	 * 添加页面
	 * @return
	 * @throws Exception 
	 */
	public String addComActiveUI() throws Exception {
		
		String[] paramArr = {ISSUE, SCORE_WAY};
		super.getDirtMap(paramArr);
		logger.info("进入添加页面");
		
		return "addComActiveUI";
	}
	
	/**
	 * 添加功能
	 * @return
	 */
	public String addComActive() {
		
		Map<String, Object> param = ParamUtil.param2Map(request);
		if(iComActiveService.addBatchOrder(param)) {
			logger.info("添加成功");
			request.setAttribute("msg", "添加活动信息成功！");
			return Consts.SYSSUCCESS;
		}
		return Consts.ERROR;
	}
	
	/**
	 * 修改页面
	 * @return
	 * @throws Exception 
	 */
	public String updateComActiveUI() throws Exception {
		
		String primarykey = request.getParameter("primarykey");
		Map<String, Object> param = iComActiveService.string2Map(primarykey);
		
		Map<String, Object> comActive = iComActiveService.getById(param);
		request.setAttribute("comActive", comActive);
		String[] paramArr = {ISSUE, SCORE_WAY};
		super.getDirtMap(paramArr);
		logger.info("进入修改页面");
		
		return "updateComActiveUI";
	}
	
	/**
	 * 修改功能
	 * @return
	 */
	public String updateComActive() {
		
		Map<String, Object> batchOrder = ParamUtil.param2Map(request);
		if(iComActiveService.updateComActive(batchOrder)) {
			logger.info("修改成功");
			request.setAttribute("msg", "修改活动信息成功！");
			return Consts.SYSSUCCESS;
		}
		return Consts.ERROR;
	}
	
	/**
	 * 删除功能
	 * @return
	 */
	public String deleteComActive() {
		
		String primarykey = request.getParameter("primarykey");
		List<Map<String, Object>> list = iComActiveService.string2List(primarykey);
		
		// 调用批量删除方法
		if(iComActiveService.deleteBatch(list)) {
			request.setAttribute("msg", "删除活动信息成功！");
			logger.info("删除成功！");
			return Consts.SYSSUCCESS;
		}
		return Consts.ERROR;
		
	}

	@Override
	protected String getModuleName() throws Exception {
		return "活动信息管理";
	}
	
}
