package com.sunyard.directbank.batchp2p.model;

import java.math.BigDecimal;
import java.util.Date;

public class EAccountAmtList {
	private String serial_id;
	private String trans_code;
	private Date system_date;
	private Date trans_date;
	private String trans_time;
	private String eacc_no;
	private String amt_type;
	private String amt_channel;
	private String oppo_acc;
	private BigDecimal amt;
	public String getSerial_id() {
		return serial_id;
	}
	public void setSerial_id(String serial_id) {
		this.serial_id = serial_id;
	}
	public String getTrans_code() {
		return trans_code;
	}
	public void setTrans_code(String trans_code) {
		this.trans_code = trans_code;
	}
	public Date getSystem_date() {
		return system_date;
	}
	public void setSystem_date(Date system_date) {
		this.system_date = system_date;
	}
	public Date getTrans_date() {
		return trans_date;
	}
	public void setTrans_date(Date trans_date) {
		this.trans_date = trans_date;
	}
	public String getTrans_time() {
		return trans_time;
	}
	public void setTrans_time(String trans_time) {
		this.trans_time = trans_time;
	}
	public String getEacc_no() {
		return eacc_no;
	}
	public void setEacc_no(String eacc_no) {
		this.eacc_no = eacc_no;
	}
	public String getAmt_type() {
		return amt_type;
	}
	public void setAmt_type(String amt_type) {
		this.amt_type = amt_type;
	}
	public String getAmt_channel() {
		return amt_channel;
	}
	public void setAmt_channel(String amt_channel) {
		this.amt_channel = amt_channel;
	}
	public String getOppo_acc() {
		return oppo_acc;
	}
	public void setOppo_acc(String oppo_acc) {
		this.oppo_acc = oppo_acc;
	}
	public BigDecimal getAmt() {
		return amt;
	}
	public void setAmt(BigDecimal amt) {
		this.amt = amt;
	}
	
}
