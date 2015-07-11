package com.sunyard.directbank.syslog.service.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.base.service.impl.BaseService;
import com.sunyard.directbank.syslog.dao.OperLogDao;
import com.sunyard.directbank.syslog.service.IOperLogService;


@Transactional
@Service
public class OperLogService extends BaseService implements IOperLogService{
	@Resource
	private OperLogDao operLogDao;


	@Override
	public void saveOperLog(Map<String, String> map) {
		operLogDao.insertToOperLog(map);
		
	}

	@Override
	public void updateRstCode(Map<String, String> map) {
		operLogDao.updateOperRstCode(map);
	}

	
	@Override
	public Map<String, Object> getByName(String user_name) {
		return operLogDao.getByName(user_name);
	}

	@Override
	public List<Map<String, Object>> selectList(Map<String, Object> param)
			throws SQLException {
		return this.selectList(operLogDao, param);
	}

	@Override
	public IListPage pageQuery(Map<String, Object> param, int pageNo) throws SQLException {
		return this.pageQuery(operLogDao, param, pageNo);
	}

		
}
