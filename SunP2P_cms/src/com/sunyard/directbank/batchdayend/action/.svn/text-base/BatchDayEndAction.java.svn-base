package com.sunyard.directbank.batchdayend.action;

import java.lang.reflect.Method;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.aop.framework.Advised;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.ReflectionUtils;

import com.sunyard.directbank.base.BaseAction;
import com.sunyard.directbank.base.SpringUtil;
import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.batchdayend.service.IBatchDayEndService;
import com.sunyard.directbank.batchorder.model.BatchOrderModel;

@SuppressWarnings("rawtypes")
@Controller
@Scope("prototype")
public class BatchDayEndAction extends BaseAction {

	@Resource
	private IBatchDayEndService iBatchDayEndService;
	private static final long serialVersionUID = 5268185778865074432L;
	HttpServletRequest request = ServletActionContext.getRequest();
	private Logger logger = Logger.getLogger(BatchDayEndAction.class);
	
	/**
	 * 清算流程自动化
	 * @param model 
	 * @throws Exception
	 */
	public String autoProcess() throws Exception {
		List<BatchOrderModel> batchOrders = iBatchDayEndService.sortedBatchOrders(iBatchDayEndService.selectAllBatchOrders());
		for(BatchOrderModel model : batchOrders) {
			if(model.getDeal_status().equals("Activated")) {
				Object o = SpringUtil.getBean(model.getTask_code());
				Advised advised = (Advised) o;
				Object target = advised.getTargetSource().getTarget();
				logger.info("被代理对象 target = " + target.getClass());
			    Method[] method = target.getClass().getMethods();
			    logger.info("被代理对象执行的方法method = " + method[0].getName());
			    try {
					ReflectionUtils.invokeMethod(method[0], target);
				}catch(Exception e){
					break;
		        }
			}
		}
		return batchDayEnd();
	}

	/**
	 * 转到日终清算页面
	 * 
	 * @return
	 * @throws Exception 
	 */
	public String batchDayEnd() throws Exception {

		List<BatchOrderModel> batchOrders = iBatchDayEndService.sortedBatchOrders(iBatchDayEndService.selectAllBatchOrders());
		logger.info("排序的结果：sortedBatchOrders = " + batchOrders);
		request.setAttribute("batchOrders", batchOrders);
		
		return "batchDayEnd";
	}
	
	/**
	 * 清算开始
	 * 
	 * @return
	 * @throws Exception
	 */
	public String batchStart() throws Exception {

		if (iBatchDayEndService.batchStart(super.getUser().getUser_id())) {
			request.setAttribute("msg", "清算已成功开始！");
			return Consts.SYSSUCCESS;
		} else {
			return Consts.ERROR;
		}

	}

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
			request.setAttribute("msg", "没有满足债权转让失效条件的债权");
			return Consts.ERROR;
		}
	}

	@Override
	protected String getModuleName() throws Exception {
		return "日终清算";
	}

}
