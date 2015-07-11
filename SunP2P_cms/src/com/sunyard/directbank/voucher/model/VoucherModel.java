package com.sunyard.directbank.voucher.model;

import java.math.BigDecimal;


public class VoucherModel {
	private String voucher_no;
	private BigDecimal voucher_amt;
	private String eacc_no;
	private String create_date;
	private String begin_date;
	private String end_date;
	private String used_date;
	private String voucher_type;
	private String status;
	private String description;

	public VoucherModel() {

	}

	public String getVoucher_no() {
		return voucher_no;
	}

	public void setVoucher_no(String voucher_no) {
		this.voucher_no = voucher_no;
	}

	public BigDecimal getVoucher_amt() {
		return voucher_amt;
	}

	public void setVoucher_amt(BigDecimal voucher_amt) {
		this.voucher_amt = voucher_amt;
	}

	public String getEacc_no() {
		return eacc_no;
	}

	public void setEacc_no(String eacc_no) {
		this.eacc_no = eacc_no;
	}

	public String getCreate_date() {
		return create_date;
	}

	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}

	public String getBegin_date() {
		return begin_date;
	}

	public void setBegin_date(String begin_date) {
		this.begin_date = begin_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public String getUsed_date() {
		return used_date;
	}

	public void setUsed_date(String used_date) {
		this.used_date = used_date;
	}

	public String getVoucher_type() {
		return voucher_type;
	}

	public void setVoucher_type(String voucher_type) {
		this.voucher_type = voucher_type;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "VoucherModel [voucher_no=" + voucher_no + ", voucher_amt="
				+ voucher_amt + ", eacc_no=" + eacc_no + ", create_date="
				+ create_date + ", begin_date=" + begin_date + ", end_date="
				+ end_date + ", used_date=" + used_date + ", voucher_type="
				+ voucher_type + ", status=" + status + ", description="
				+ description + "]";
	}
}
