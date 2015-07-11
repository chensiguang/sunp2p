package com.sunyard.directbank.transstatus.model;


public class TransStatus {
	private String prod_type;//产品类型
	private String prod_id;//产品代码
	private String trans_code;//交易代码
	private String enable_flag;//交易允许
	private String status;//当前状态
	private String flag1;//备用标志

	public TransStatus() {

	}

	public String getProd_type() {
		return prod_type;
	}

	public void setProd_type(String prod_type) {
		this.prod_type = prod_type;
	}

	public String getProd_id() {
		return prod_id;
	}

	public void setProd_id(String prod_id) {
		this.prod_id = prod_id;
	}

	public String getTrans_code() {
		return trans_code;
	}

	public void setTrans_code(String trans_code) {
		this.trans_code = trans_code;
	}

	public String getEnable_flag() {
		return enable_flag;
	}

	public void setEnable_flag(String enable_flag) {
		this.enable_flag = enable_flag;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getFlag1() {
		return flag1;
	}

	public void setFlag1(String flag1) {
		this.flag1 = flag1;
	}

	@Override
	public String toString() {
		return "TransStatus [prod_type=" + prod_type + ", prod_id=" + prod_id
				+ ", trans_code=" + trans_code + ", enable_flag=" + enable_flag
				+ ", status=" + status + ", flag1=" + flag1 + "]";
	}



}
