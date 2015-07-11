/********************************************
 * 文件名称: LogUtil <br/>
 * 系统名称: 直销银行V1.0
 * 模块名称: WEB业务平台帐户类
 * 软件版权: 信雅达系统工程股份有限公司
 * 功能说明: TODO ADD FUNCTION. <br/>
 * 系统版本: 1.0.0.1
 * 开发人员:  Terrance
 * 开发时间: 2014年10月23日 下午2:01:55 <br/> 
 * 审核人员:
 * 相关文档:
 * 修改记录: 修改日期    修改人员    修改说明
 * V3.0.0.2 20130530-01  XXXX        提示报错 M201305300011
 *********************************************/

package com.sunyard.directbank.base;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Aspect
@Service
public class LogUtil {

	private Logger logger = LoggerFactory.getLogger(LogUtil.class);

	/*@Around("execution(* com.sunyard.directbank.*.service.impl..*.*(..))")*/
	/*@Around("execution(* com.sunyard.directbank.*.*.*(..))")*/

//	@Pointcut("execution(public * com.sunyard.directbank.*.*.T00038(..))")
	/*@Pointcut("execution(public * com.sunyard.directbank.*.*.T00038.*(..))")
	public void recordLog(){}*/

	/*@Around("execution(* com.sunyard.directbank.batchdayend.service.impl.BatchDayEndService.batchStart(..))")*/
	@Around("execution(* com.sunyard.directbank.*.action.T000*.*(..))")
	public Object logTheMethod(ProceedingJoinPoint pj) throws Throwable{

		logger.info("执行{}方法的名字{}", pj.getTarget(),pj.getSignature().getName());
		StringBuffer sb = new StringBuffer();
		for(Object obj :pj.getArgs()){
			sb.append(","+obj+",");
		}
		logger.info("方法{}的参数为{}",pj.getSignature().getName(),sb);
		Object result = null;
		try {
			result = pj.proceed();
		} catch (Exception e) {
			logger.error("方法{}发生异常{}",pj.getSignature().getName(),e);
			throw e;
		}
		logger.info("执行方法的名字{} 完成", pj.getSignature().getName());
		return result;
	}

}