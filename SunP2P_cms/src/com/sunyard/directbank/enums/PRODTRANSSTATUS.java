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
 * 0-产品当前状态不允许
1-允许
日初批量时根据产品状态修改.
对于某产品不开通的交易，建议不在此表保留
 */
public enum PRODTRANSSTATUS {
	
	NotAllow("0"),Allow("1");
	
	private String code;
	
	private PRODTRANSSTATUS(String code){
		this.code=code;
	}
	
	public String getCode(){
		return code;
	}
}
