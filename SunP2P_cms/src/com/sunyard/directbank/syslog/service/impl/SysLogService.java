package com.sunyard.directbank.syslog.service.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.base.service.impl.BaseService;
import com.sunyard.directbank.syslog.dao.SysLogDao;
import com.sunyard.directbank.syslog.service.ISysLogService;


@Transactional
@Service
public class SysLogService extends BaseService implements ISysLogService {
	@Resource
	private SysLogDao sysLogDao;

	@Override
	public void saveRunLog(Map<String, String> map) {
		sysLogDao.insertToRunLog(map);
	}


	@Override
	public List<Map<String, Object>> selectList(Map<String, Object> param)
			throws SQLException {
		return this.selectList(sysLogDao, param);
	}

	@Override
	public IListPage pageQuery(Map<String, Object> param, int pageNo) throws SQLException {
		return this.pageQuery(sysLogDao, param, pageNo);
	}
	
	
	
	
}
