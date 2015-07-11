package com.sunyard.directbank.batchp2p.model;

import java.math.BigDecimal;
import java.util.Date;

public class ShareList {
	private String eacc_no;
	private String acc_type;
	private String account;
	private int prod_id;
	private Date system_date;
	private Date var_date;
	private String var_time;
	private String var_direction;
	private BigDecimal var_value;
	private String var_cause;
	private String reserve;
	public String getEacc_no() {
		return eacc_no;
	}
	public void setEacc_no(String eacc_no) {
		this.eacc_no = eacc_no;
	}
	public String getAcc_type() {
		return acc_type;
	}
	public void setAcc_type(String acc_type) {
		this.acc_type = acc_type;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public int getProd_id() {
		return prod_id;
	}
	public void setProd_id(int prod_id) {
		this.prod_id = prod_id;
	}
	public Date getSystem_date() {
		return system_date;
	}
	public void setSystem_date(Date system_date) {
		this.system_date = system_date;
	}
	public Date getVar_date() {
		return var_date;
	}
	public void setVar_date(Date var_date) {
		this.var_date = var_date;
	}
	public String getVar_time() {
		return var_time;
	}
	public void setVar_time(String var_time) {
		this.var_time = var_time;
	}
	public String getVar_direction() {
		return var_direction;
	}
	public void setVar_direction(String var_direction) {
		this.var_direction = var_direction;
	}
	public BigDecimal getVar_value() {
		return var_value;
	}
	public void setVar_value(BigDecimal var_value) {
		this.var_value = var_value;
	}
	public String getVar_cause() {
		return var_cause;
	}
	public void setVar_cause(String var_cause) {
		this.var_cause = var_cause;
	}
	public String getReserve() {
		return reserve;
	}
	public void setReserve(String reserve) {
		this.reserve = reserve;
	}
	
}
