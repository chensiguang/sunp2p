/********************************************
 * 文件名称: TRANSTYPE <br/>
 * 系统名称: 直销银行V1.0
 * 模块名称: WEB业务平台帐户类
 * 软件版权: 信雅达系统工程股份有限公司
 * 功能说明: 交易状态常量
 * 系统版本: 1.0.0.1
 * 开发人员:  Terrance
 * 开发时间: 2014年10月11日 上午10:27:56 <br/> 
 * 审核人员:
 * 相关文档:
 * 修改记录: 修改日期    修改人员    修改说明
 * V3.0.0.2 20130530-01  XXXX        提示报错 M201305300011
 *********************************************/

package com.sunyard.directbank.enums;

/**
 * 0 - 未激活
 * 1 - 已激活
 * 2 - 作业暂停
 * 3 - 作业成功
 * 4 - 作业失败
 * 5 - 作业中断
 * Z - 正在处理 
 *
 */

public enum DEALSTATUS {
	
	UnActivated("0"),Activated("1"),Pending("2"),Success("3"),Failure("4"),Abort("5"),Processing("Z");
	
	private String code;
	
	private DEALSTATUS(String code){
		this.code=code;
	}
	
	public String getCode(){
		return code;
	}
	
}
