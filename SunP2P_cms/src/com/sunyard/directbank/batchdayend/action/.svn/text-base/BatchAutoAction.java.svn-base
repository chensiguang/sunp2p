package com.sunyard.directbank.batchdayend.action;

import java.lang.reflect.Method;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.sunyard.directbank.tools.BatchDayEndUtil;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.ReflectionUtils;

import com.sunyard.directbank.base.SpringUtil;
import com.sunyard.directbank.batchdayend.service.IBatchDayEndService;
import com.sunyard.directbank.batchorder.model.BatchOrderModel;

@Controller
@Scope("prototype")
public class BatchAutoAction {
	
	@Resource
	private IBatchDayEndService iBatchDayEndService;
	private Logger logger = Logger.getLogger(BatchAutoAction.class);
	HttpServletRequest request = ServletActionContext.getRequest();
	
	/**
	 * 清算流程自动化
	 * @param model 
	 * @throws Exception
	 */
	public void autoProcess() throws Exception {
		
		 List<BatchOrderModel> batchOrders = iBatchDayEndService.sortedBatchOrders(iBatchDayEndService.selectAllBatchOrders());
			for(BatchOrderModel model : batchOrders) {
				if(model.getDeal_status().equals("Activated")) {
					Object target = SpringUtil.getBean(model.getTask_code());
					/*Advised advised = (Advised) o;
					Object target = advised.getTargetSource().getTarget();*/
					logger.info("被代理对象 target = " + target.getClass());
				    Method[] method = target.getClass().getMethods();
				    logger.info("被代理对象执行的方法method = " + method[0].getName());
				    try {
						long beginTime = new Date().getTime();
						ReflectionUtils.invokeMethod(method[0], target);
						long endTime = new Date().getTime();
						String hold_time = BatchDayEndUtil.holdTime(endTime, beginTime);
						BatchOrderModel timeModel = new BatchOrderModel();
						timeModel.setHold_time(hold_time);
						timeModel.setTask_code(model.getTask_code());
						iBatchDayEndService.updateDealStatus(timeModel);
					}catch(Exception e){
						break;
			        }
				}
			}
	}
	
}
