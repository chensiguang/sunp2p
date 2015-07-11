/********************************************
 * 文件名称: ACCTSTA <br/>
 * 系统名称: 直销银行V1.0
 * 模块名称: WEB业务平台帐户类
 * 软件版权: 信雅达系统工程股份有限公司
 * 功能说明: 账户状态
 * 系统版本: 1.0.0.1
 * 开发人员:  Terrance
 * 开发时间: 2014年10月11日 上午11:35:07 <br/> 
 * 审核人员:
 * 相关文档:
 * 修改记录: 修改日期    修改人员    修改说明
 * V3.0.0.2 20130530-01  XXXX        提示报错 M201305300011
 *********************************************/

package com.sunyard.directbank.enums;


public enum ACCTSTA {
	UnActive("0") ,Active("1"),forzen("2");
	
	private String code;
	
	private ACCTSTA(String code){
		this.code= code;
	}
	
	public String getCode(){
		return code;
	}
}
