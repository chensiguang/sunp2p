package com.sunyard.directbank.batchorder.model;

import java.util.Date;

public class BatchOrderModel {

	private String task_code;
	private String task_name;
	private String batch_group;
	private String parent_task_code;
	private String redo_flag;
	private String delay_flag;
	private String delay_time;
	private String op_code;
	private int op_times;
	private String deal_status;
	private String return_code;
	private String return_msg;
	private String warn_flag;
	private String warn_msg;
	private String begin_time;
	private String end_time;
	private String hold_time;
	private Date last_trans_date;
	private String reserve1;
	private String reserve2;
	
	public String getTask_code() {
		return task_code;
	}
	public void setTask_code(String task_code) {
		this.task_code = task_code;
	}
	public String getTask_name() {
		return task_name;
	}
	public void setTask_name(String task_name) {
		this.task_name = task_name;
	}
	public String getBatch_group() {
		return batch_group;
	}
	public void setBatch_group(String batch_group) {
		this.batch_group = batch_group;
	}
	public String getParent_task_code() {
		return parent_task_code;
	}
	public void setParent_task_code(String parent_task_code) {
		this.parent_task_code = parent_task_code;
	}
	public String getRedo_flag() {
		return redo_flag;
	}
	public void setRedo_flag(String redo_flag) {
		this.redo_flag = redo_flag;
	}
	public String getDelay_flag() {
		return delay_flag;
	}
	public void setDelay_flag(String delay_flag) {
		this.delay_flag = delay_flag;
	}
	public String getDelay_time() {
		return delay_time;
	}
	public void setDelay_time(String delay_time) {
		this.delay_time = delay_time;
	}
	public String getOp_code() {
		return op_code;
	}
	public void setOp_code(String op_code) {
		this.op_code = op_code;
	}
	public int getOp_times() {
		return op_times;
	}
	public void setOp_times(int op_times) {
		this.op_times = op_times;
	}
	public String getDeal_status() {
		return deal_status;
	}
	public void setDeal_status(String deal_status) {
		this.deal_status = deal_status;
	}
	public String getReturn_code() {
		return return_code;
	}
	public void setReturn_code(String return_code) {
		this.return_code = return_code;
	}
	public String getReturn_msg() {
		return return_msg;
	}
	public void setReturn_msg(String return_msg) {
		this.return_msg = return_msg;
	}
	public String getWarn_flag() {
		return warn_flag;
	}
	public void setWarn_flag(String warn_flag) {
		this.warn_flag = warn_flag;
	}
	public String getWarn_msg() {
		return warn_msg;
	}
	public void setWarn_msg(String warn_msg) {
		this.warn_msg = warn_msg;
	}
	public String getBegin_time() {
		return begin_time;
	}
	public void setBegin_time(String begin_time) {
		this.begin_time = begin_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public String getHold_time() {
		return hold_time;
	}
	public void setHold_time(String hold_time) {
		this.hold_time = hold_time;
	}
	public Date getLast_trans_date() {
		return last_trans_date;
	}
	public void setLast_trans_date(Date last_trans_date) {
		this.last_trans_date = last_trans_date;
	}
	public String getReserve1() {
		return reserve1;
	}
	public void setReserve1(String reserve1) {
		this.reserve1 = reserve1;
	}
	public String getReserve2() {
		return reserve2;
	}
	public void setReserve2(String reserve2) {
		this.reserve2 = reserve2;
	}
	
	@Override
	public String toString() {
		return "BatchOrderModel [task_code=" + task_code + ", task_name=" + task_name + ", batch_group=" + batch_group + ", parent_task_code=" + parent_task_code + ", redo_flag="
				+ redo_flag + ", delay_flag=" + delay_flag + ", delay_time=" + delay_time + ", op_code=" + op_code + ", op_times=" + op_times + ", deal_status=" + deal_status
				+ ", return_code=" + return_code + ", return_msg=" + return_msg + ", warn_flag=" + warn_flag + ", warn_msg=" + warn_msg + ", begin_time=" + begin_time
				+ ", end_time=" + end_time + ", hold_time=" + hold_time + ", last_trans_date=" + last_trans_date + ", reserve1=" + reserve1 + ", reserve2=" + reserve2 + "]";
	}
	
	
}
