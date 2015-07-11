package com.sunyard.directbank.tools;

import com.sunyard.directbank.batchorder.model.BatchOrderModel;
import com.sunyard.directbank.enums.DEALSTATUS;

public class BatchDayEndUtil {

	public static String holdTime(long endTime, long beginTime) {
		long between = (endTime - beginTime) / 1000;
		long hour = between / 3600;
		long minute = between / 60 % 60;
		long second = between % 60;
		return hour + ":" + minute + ":" + second;
	}
	
	public static BatchOrderModel batchInProgress(String task_code ,String user_id) {
		BatchOrderModel batchOrModel = new BatchOrderModel();
		batchOrModel.setTask_code(task_code);
		batchOrModel.setOp_code(user_id);
		batchOrModel.setDeal_status(DEALSTATUS.Processing.getCode());
		batchOrModel.setBegin_time(DateUtil.curTimeStr());
		batchOrModel.setLast_trans_date(DateUtil.today());
		return batchOrModel;
	}
	
	public static BatchOrderModel batchResult(String deal_status, String task_code, String return_msg, int op_times) {
		BatchOrderModel batchOrdModel = new BatchOrderModel();
		batchOrdModel.setDeal_status(deal_status);
		batchOrdModel.setTask_code(task_code);
		batchOrdModel.setReturn_msg(return_msg);
		batchOrdModel.setOp_times(op_times);
		batchOrdModel.setEnd_time(DateUtil.curTimeStr());
		return batchOrdModel;
	}
	
}
