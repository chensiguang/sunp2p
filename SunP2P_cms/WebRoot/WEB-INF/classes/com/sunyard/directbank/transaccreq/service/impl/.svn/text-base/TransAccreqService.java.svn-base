package com.sunyard.directbank.transaccreq.service.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.base.service.impl.BaseService;
import com.sunyard.directbank.transaccreq.dao.TransAccreqDao;

@Service
@Transactional
public class TransAccreqService extends BaseService {

	@Resource
	private TransAccreqDao transAccreqDao;
	
	/**
	 * 查询所有记录，供下载使用
	 */
	@Override
	public List<Map<String, Object>> selectList(Map<String, Object> param) throws SQLException {
		
		return selectList(transAccreqDao, param);
	}

	/**
	 * 分页查询
	 * @throws SQLException 
	 */
	@Override
	public IListPage pageQuery(Map<String, Object> param, int pageNo) throws SQLException {
		
		return pageQuery(transAccreqDao, param, pageNo);
	}

}
