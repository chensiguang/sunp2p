package com.sunyard.directbank.transfrozen.service.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.base.service.impl.BaseService;
import com.sunyard.directbank.transfrozen.dao.TransFrozenDao;

@Service
@Transactional
public class TransFrozenService extends BaseService {

	@Resource
	private TransFrozenDao transFrozenDao;
	
	/**
	 * 查询所有记录，共下载使用
	 * @param param
	 * @return
	 * @throws SQLException
	 */
	@Override
	public List<Map<String, Object>> selectList(Map<String, Object> param) throws SQLException {
		
		return selectList(transFrozenDao, param);
	}

	/**
	 * 分页查询
	 * @param param
	 * @param pageNo
	 * @return
	 * @throws SQLException 
	 */
	@Override
	public IListPage pageQuery(Map<String, Object> param, int pageNo) throws SQLException {
		
		return pageQuery(transFrozenDao, param, pageNo);
	}

}
