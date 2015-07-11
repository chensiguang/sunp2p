package com.sunyard.directbank.fund.model;

import java.math.BigDecimal;
import java.sql.Timestamp;


public class FundInfo{
	
	private Long prod_id;
	private String prod_name;
	private String prod_type;
	private BigDecimal issue_total;
	private BigDecimal remaining;
	private BigDecimal saled;
	private String currency;
	private Timestamp value_date;
	private Timestamp expire_date;
	private BigDecimal ist_year;
	private BigDecimal lowest_limit;
	private String risk_lvl;
	private String prod_state;
	private String prod_readme;
	private String prod_publisher;
	private String prod_checker;
	private String hpage_promoted;
	private BigDecimal ist_7day;
	private BigDecimal net_worth;
	private Timestamp net_date;
	private BigDecimal addition_limit;
	private String quota_control;
	private BigDecimal web_total;
	private BigDecimal app_total;
	private BigDecimal weixin_total;
	private String sale_channel_control;
	private String sale_channel;
	private String issue_state;
	private String prod_typist;
	//private String formattedAmount;
	public Long getProd_id() {
		return prod_id;
	}
	public void setProd_id(Long prod_id) {
		this.prod_id = prod_id;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public String getProd_type() {
		return prod_type;
	}
	public void setProd_type(String prod_type) {
		this.prod_type = prod_type;
	}
	public BigDecimal getIssue_total() {
		return issue_total;
	}
	public void setIssue_total(BigDecimal issue_total) {
		this.issue_total = issue_total;
	}
	public BigDecimal getRemaining() {
		return remaining;
	}
	public void setRemaining(BigDecimal remaining) {
		this.remaining = remaining;
	}
	public BigDecimal getSaled() {
		return saled;
	}
	public void setSaled(BigDecimal saled) {
		this.saled = saled;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public Timestamp getValue_date() {
		return value_date;
	}
	public void setValue_date(Timestamp value_date) {
		this.value_date = value_date;
	}
	public Timestamp getExpire_date() {
		return expire_date;
	}
	public void setExpire_date(Timestamp expire_date) {
		this.expire_date = expire_date;
	}
	public BigDecimal getIst_year() {
		return ist_year;
	}
	public void setIst_year(BigDecimal ist_year) {
		this.ist_year = ist_year;
	}
	public BigDecimal getLowest_limit() {
		return lowest_limit;
	}
	public void setLowest_limit(BigDecimal lowest_limit) {
		this.lowest_limit = lowest_limit;
	}
	public String getRisk_lvl() {
		return risk_lvl;
	}
	public void setRisk_lvl(String risk_lvl) {
		this.risk_lvl = risk_lvl;
	}
	public String getProd_state() {
		return prod_state;
	}
	public void setProd_state(String prod_state) {
		this.prod_state = prod_state;
	}
	public String getProd_readme() {
		return prod_readme;
	}
	public void setProd_readme(String prod_readme) {
		this.prod_readme = prod_readme;
	}
	public String getProd_publisher() {
		return prod_publisher;
	}
	public void setProd_publisher(String prod_publisher) {
		this.prod_publisher = prod_publisher;
	}
	public String getProd_checker() {
		return prod_checker;
	}
	public void setProd_checker(String prod_checker) {
		this.prod_checker = prod_checker;
	}
	public String getHpage_promoted() {
		return hpage_promoted;
	}
	public void setHpage_promoted(String hpage_promoted) {
		this.hpage_promoted = hpage_promoted;
	}
	public BigDecimal getIst_7day() {
		return ist_7day;
	}
	public void setIst_7day(BigDecimal ist_7day) {
		this.ist_7day = ist_7day;
	}
	public BigDecimal getNet_worth() {
		return net_worth;
	}
	public void setNet_worth(BigDecimal net_worth) {
		this.net_worth = net_worth;
	}
	public Timestamp getNet_date() {
		return net_date;
	}
	public void setNet_date(Timestamp net_date) {
		this.net_date = net_date;
	}
	public BigDecimal getAddition_limit() {
		return addition_limit;
	}
	public void setAddition_limit(BigDecimal addition_limit) {
		this.addition_limit = addition_limit;
	}
	public String getQuota_control() {
		return quota_control;
	}
	public void setQuota_control(String quota_control) {
		this.quota_control = quota_control;
	}
	public BigDecimal getWeb_total() {
		return web_total;
	}
	public void setWeb_total(BigDecimal web_total) {
		this.web_total = web_total;
	}
	public BigDecimal getApp_total() {
		return app_total;
	}
	public void setApp_total(BigDecimal app_total) {
		this.app_total = app_total;
	}
	public BigDecimal getWeixin_total() {
		return weixin_total;
	}
	public void setWeixin_total(BigDecimal weixin_total) {
		this.weixin_total = weixin_total;
	}
	public String getSale_channel_control() {
		return sale_channel_control;
	}
	public void setSale_channel_control(String sale_channel_control) {
		this.sale_channel_control = sale_channel_control;
	}
	public String getSale_channel() {
		return sale_channel;
	}
	public void setSale_channel(String sale_channel) {
		this.sale_channel = sale_channel;
	}
	public String getIssue_state() {
		return issue_state;
	}
	public void setIssue_state(String issue_state) {
		this.issue_state = issue_state;
	}
	public String getProd_typist() {
		return prod_typist;
	}
	public void setProd_typist(String prod_typist) {
		this.prod_typist = prod_typist;
	}
	@Override
	public String toString() {
		return prod_id + "||" + prod_name;
	}
	
	/*public String getFormattedAmount() { return app_total.toString(); }
	public void setFormattedAmount(String amtString) { app_total = new BigDecimal(amtString); }*/
	
	
}