package com.sunyard.directbank.base;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.cache.ehcache.EhCacheCacheManager;

import com.sunyard.directbank.common.business.IDDMng;
import com.sunyard.directbank.privilege.model.PrivilegeModel;
import com.sunyard.directbank.privilege.service.IPrivilegeService;
import com.sunyard.directbank.role.model.RoleModel;
import com.sunyard.directbank.role.service.IRoleService;

/********************************************
 * 文件名称: DDUtil <br/>
 * 系统名称: 直销银行V1.0 模块名称: WEB业务平台帐户类 软件版权: 信雅达系统工程股份有限公司 功能说明: 缓存工具类 系统版本: 1.0.0.1
 * 开发人员: Terrance 开发时间: 2014年10月9日 下午4:05:32 <br/>
 * 审核人员: 相关文档: 修改记录: 修改日期 修改人员 修改说明 V3.0.0.2 20130530-01 XXXX 提示报错 M201305300011
 *********************************************/
public class DDUtil implements InitializingBean {

	private static Logger logger = Logger.getLogger(DDUtil.class);

	@Resource
	private IDDMng ddMng;
	@Resource
	private IPrivilegeService iPrivilegeService;
	@Resource
	private IRoleService iRoleService;
	@Resource
	private CacheManager manager;

	private static IDDMng staticDdMng;
	private static IPrivilegeService staticIPrivilegeService;
	private static IRoleService staticIRoleService;


	public void afterPropertiesSet() throws Exception {
		staticDdMng = ddMng;
		staticIPrivilegeService = iPrivilegeService;
		staticIRoleService = iRoleService;
		logger.info("准备加入缓存");
	}

	public String getContent(String key, String value) throws Exception {
		if (value == null) {
			return "";
		}

		return getContentFromDB(key, value);
	}

	private String getContentFromDB(String key, String value) throws Exception {
		return staticDdMng.getDDContentSpec(key, value);
	}

	public List<Map<String, String>> getSys(String key) throws Exception {
		return staticDdMng.getSys(key);
	}


	/**
	 * 查询所有权限
	 * 
	 * @return
	 * @throws Exception
	 */
	public static List<PrivilegeModel> selectAllPrivileges() throws Exception {

		return staticIPrivilegeService.selectAllPrivileges_Cache();
	}

	/**
	 * 查询当前用户已分配的角色
	 * 
	 * @param user_id
	 * @return
	 * @throws Exception
	 */
	public static List<RoleModel> selectAllocatedRoles(String user_id) throws Exception {

		return staticIRoleService.selectAllocatedRoles_Cache(user_id);
	}

	/**
	 * 查询当前角色已分配的权限
	 * 
	 * @param role_id
	 * @return
	 * @throws Exception
	 */
	public static List<PrivilegeModel> selectAllocatedPrivileges(String role_id) throws Exception {

		return staticIPrivilegeService.selectAllocatedPrivileges_Cache(role_id);
	}

	/*
	 * private static DDUtil instance;
	 * 
	 * public static DDUtil getInstance(){ if(instance!=null){ return instance;
	 * }else{ return new DDUtil(); } }
	 */
	private DDUtil() {
	}
	public static void getCache(){
		EhCacheCacheManager cacheManager = (EhCacheCacheManager)SpringUtil.getWebApplicationContext().getBean("cacheManager");
		Cache cache = (Cache) cacheManager.getCache("ddCache");
		for (Object key : cache.getKeys()) {

		    System.out.println(key);

		}
	}
	
	public void  cacheTest(){
		String[] name = manager.getCacheNames();
		for(int i=0;i<name.length;i++){
			System.out.println("cache姓名=" + name[i]);
		}
		
		Cache cache = manager.getCache("ddCache");
		for(Object key : cache.getKeys()){
			System.out.println(key);
		}
	}
}
