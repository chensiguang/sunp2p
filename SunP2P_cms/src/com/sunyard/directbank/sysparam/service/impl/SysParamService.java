package com.sunyard.directbank.sysparam.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunyard.directbank.base.DDUtil;
import com.sunyard.directbank.base.SpringUtil;
import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.base.model.ListPage;
import com.sunyard.directbank.sysparam.dao.SysParamDao;
import com.sunyard.directbank.sysparam.model.SysParam;
import com.sunyard.directbank.sysparam.service.ISysParamService;

@Service
@Transactional
public class SysParamService implements ISysParamService,Consts {

	@Resource
	private SysParamDao sysParamDao;
	
	@Override
	public List<SysParam> selectSysParam(String param_type, String value_name)
	    throws Exception{
		
		return sysParamDao.selectSysParam(param_type, value_name);
	}

	@Override
	public IListPage pageQuery(Map<String, Object> param, int pageNo) throws Exception {
        int pageSize = Consts.PAGE_SIZE;
		
		int total = sysParamDao.pageCount(param);
		
		int start = (pageNo - 1) * pageSize;
		param.put("startRow", new Integer(start));
		param.put("endRow", pageSize);
		
		List<SysParam> data = sysParamDao.pageQuery(param);
	     
		DDUtil cache = (DDUtil)SpringUtil.getWebApplicationContext().getBean("dDUtil");
		for (int index = 0; index < data.size(); index++) {
             SysParam obj = data.get(index);
             String param_type = cache.getContent(PARAM_TYPE, obj.getParam_type());
             obj.setParam_type(param_type);
		}
		
		return new ListPage(start, total, pageSize, data);
	}

	@Override
	public SysParam loadSysParamById(String param_id) {
		return sysParamDao.loadById(param_id);
	}

	@Override
	public void insert(SysParam sysParam) {
		sysParamDao.insert(sysParam);
	}

	@Override
	public boolean update(SysParam sysParam) {
		return sysParamDao.update(sysParam);
	}

	@Override
	public boolean deleteAll(SysParam sysParam) {
		return sysParamDao.deleteAll(sysParam);
	}

	@Override
	public boolean deleteBatch(List<String> paramList) {
		return sysParamDao.deleteBatch(paramList);
	}

	

}
