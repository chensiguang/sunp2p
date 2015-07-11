/********************************************
 * 文件名称: PRODTYPE <br/>
 * 系统名称: 直销银行V1.0
 * 模块名称: WEB业务平台帐户类
 * 软件版权: 信雅达系统工程股份有限公司
 * 功能说明: 产品类别
 * 系统版本: 1.0.0.1
 * 开发人员:  Terrance
 * 开发时间: 2014年10月11日 上午11:52:59 <br/> 
 * 审核人员:
 * 相关文档:
 * 修改记录: 修改日期    修改人员    修改说明
 * V3.0.0.2 20130530-01  XXXX        提示报错 M201305300011
 *********************************************/

package com.sunyard.directbank.enums;

/*
 * 
1-	日报
2-	月报
3-	年报

 */
public enum REPORTTYPE {

	Day("1"),Month("2"),Year("3");
	
private String code;
	
	private REPORTTYPE(String code){
		this.code= code;
	}
	
	public String getCode(){
		return code;
	}
}
