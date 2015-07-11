package com.sunyard.directbank.common.business.impl;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunyard.directbank.common.business.IDDMng;
import com.sunyard.directbank.common.dao.DDao;
import com.sunyard.directbank.common.module.Dict;

/********************************************
 * 文件名称: P2pQueryMng <br/>
 * 系统名称: 直销银行V1.0 
 * 模块名称: WEB业务平台帐户类 
 * 软件版权: 信雅达系统工程股份有限公司 
 * 功能说明: 数据字典具体实现
 * 系统版本: 1.0.0.1 
 * 开发人员: Terrance 
 * 开发时间: 2014年10月9日16:21:43
 * 审核人员: 
 * 相关文档: 
 * 修改记录: 
 * 修改日期 
 * 修改人员 修改说明 V3.0.0.2 20130530-01 XXXX 提示报错 M201305300011
 *********************************************/
@Transactional
@Service
public class DDMngImpl implements IDDMng {
	private Logger logger = Logger.getLogger(DDMngImpl.class);

	@Resource
	private DDao dDao;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public Map<String,Map<String,String>> getDDContent() throws Exception {
		
		Map<String,Map<String,String>> resultMap = new TreeMap<String,Map<String,String>>();
		
		List<Dict> dicts =  dDao.getDDContent();
		
		for(Dict dict:dicts){
			String val = dict.getVal();//值
			String prompt =dict.getPrompt();//中文内容
			String sunKey = dict.getSun_key();//主键名
			
			if(resultMap.containsKey(sunKey)){
				Map<String,String> nameValueMap =  resultMap.get(sunKey);
				if(nameValueMap.containsKey(val)){
					logger.info(sunKey+"数据库表com_dict中有重复"+val+"~~~~"+nameValueMap);
				}else{
					nameValueMap.put(val, prompt);
				}
			}else{
				Map newMap = new TreeMap<String,String>();
				newMap.put(val, prompt);
				resultMap.put(sunKey, newMap);
			}
			
		}
		logger.info("resultMap的size为"+resultMap.size());
		return resultMap;
		
	}
	//@Cacheable(value="ddCache", key="#key + #value")
	@Cacheable(value="ddCache")
	public String getDDContentSpec(String key,String value) throws Exception {
		logger.info("执行查询key为"+key +value);
		String result="";
		result  = dDao.getDDContentSpec(key,value);
		return result;
	}
	
	@Cacheable(value="ddCache", key="#key")
	public List<Map<String,String>> getSys(String key) throws Exception {
		logger.info("执行查询key为"+key);
		return dDao.getSys(key);
	}
	
	//@CacheEvict(value="ddCache", key="#key + #value")
	@CacheEvict(value="ddCache")
	public void clearDDContentSpecFromCache(String key, String value)
			throws Exception {
		
	}
	
	@CacheEvict(value="ddCache", key="#key")
	public void clearSysFromCache(String key) throws Exception {
		
	}
	
}
