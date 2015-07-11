/********************************************
 * 文件名称: TRANSTYPE <br/>
 * 系统名称: 直销银行V1.0
 * 模块名称: WEB业务平台帐户类
 * 软件版权: 信雅达系统工程股份有限公司
 * 功能说明: TODO ADD FUNCTION. <br/>
 * 系统版本: 1.0.0.1
 * 开发人员:  Terrance
 * 开发时间: 2014年10月11日 上午10:27:56 <br/> 
 * 审核人员:
 * 相关文档:
 * 修改记录: 修改日期    修改人员    修改说明
 * V3.0.0.2 20130530-01  XXXX        提示报错 M201305300011
 *********************************************/

package com.sunyard.directbank.enums;

/*
 * 产品起息方式
0-	满额度起息
1-	成立日起息
2-	交易日起息
 */
public enum VALUETYPE {
	
	FullValue("0"),DateValue("1"),TranDate("2");
	
	private String code;
	
	private VALUETYPE(String code){
		this.code=code;
	}
	
	public String getCode(){
		return code;
	}
}
