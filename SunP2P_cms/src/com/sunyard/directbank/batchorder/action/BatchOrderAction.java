package com.sunyard.directbank.batchorder.action;

import java.util.Arrays;
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
import com.sunyard.directbank.batchorder.model.BatchOrderModel;
import com.sunyard.directbank.tools.ParamUtil;

@Controller
@Scope("prototype")
public class BatchOrderAction extends BaseAction<BatchOrderModel> implements Consts {

	private static final long serialVersionUID = -803488427766424501L;
	HttpServletRequest request = ServletActionContext.getRequest();
	private Logger logger = Logger.getLogger(BatchOrderAction.class);

	/**
	 * 分页查询
	 * @return
	 * @throws Exception 
	 */
	public String selectAllBatchOrder() throws Exception {
		
		Map<String, Object> param = ParamUtil.param2Map(request);
		int pageNo = ParamUtil.getInt(request, "pageNo", 1);
		ListPage page = iBatchOrderService.pageQuery(param, pageNo);
		request.setAttribute("param", param);
		request.setAttribute("page", page);
		logger.info("到查询页面，查询结果 page = " + page.getResult());
		
		// 数据字典翻译，在页面选择框显示
		String[] paramArr = {DEAL_STATUS};
		super.getDirtMap(paramArr);
		
		return "batchOrder";
	}
	
	/**
	 * 弹出添加页面
	 * @return
	 */
	public String addBatchOrderUI() throws Exception {
		
		String[] paramArr = {DELAY_FLAG, ISSUE};
		super.getDirtMap(paramArr);
		logger.info("弹出添加页面");
		
		return "addBatchOrderUI";
	}
	
	/**
	 * 添加到数据库
	 * @return
	 * @throws Exception 
	 */
	public String addBatchOrder() throws Exception {
		
		Map<String, Object> param = ParamUtil.param2Map(request);
		if(iBatchOrderService.addBatchOrder(param)) {
			logger.info("添加成功");
			request.setAttribute("msg", "添加清算信息成功！");
			return Consts.SYSSUCCESS;
		}
		return Consts.ERROR;
	}
	
	/**
	 * 修改页面
	 * @return
	 * @throws Exception
	 */
	public String updateBatchOrderUI() throws Exception {
		
		String task_code = request.getParameter("task_code");
		Map<String, Object> batchOrder = iBatchOrderService.getById(task_code);
		request.setAttribute("batchOrder", batchOrder);
		String[] paramArr = {DELAY_FLAG, ISSUE};
		super.getDirtMap(paramArr);
		logger.info("进入修改页面");
		
		return "updateBatchOrderUI";
	}
	
	/**
	 * 将修改内容写入数据库
	 * @return
	 * @throws Exception
	 */
	public String updateBatchOrder() throws Exception {
		
		Map<String, Object> batchOrder = ParamUtil.param2Map(request);
		if(iBatchOrderService.updateBatchOrder(batchOrder)) {
			logger.info("修改成功");
			request.setAttribute("msg", "修改清算信息成功！");
			return Consts.SYSSUCCESS;
		}
		return Consts.ERROR;
	}
	
	/**
	 * 删除（批量删除）
	 * @return
	 * @throws Exception
	 */
	public String deleteBatchOrder() throws Exception {

		String task_codes = request.getParameter("task_code");
		task_codes = task_codes.substring(0, task_codes.length()-1);
		String[] task_code = task_codes.split(",");
		
		// 由于mysql批量删除要求传入list，此处将String类型转为List类型
		List<String> list = Arrays.asList(task_code);
		
		// 调用批量删除方法
		if(iBatchOrderService.deleteBatch(list)) {
			request.setAttribute("msg", "删除清算信息成功！");
			logger.info("删除成功！");
			return Consts.SYSSUCCESS;
		}
		return Consts.ERROR;
		
	}

	@Override
	protected String getModuleName() throws Exception {
		return "清算流程管理";
	}
	
}
