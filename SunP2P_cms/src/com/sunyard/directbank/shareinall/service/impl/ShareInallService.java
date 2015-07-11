package com.sunyard.directbank.shareinall.service.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.base.service.impl.BaseService;
import com.sunyard.directbank.shareinall.dao.ShareInallDao;


@Transactional
@Service
public class ShareInallService extends  BaseService {
	@Resource
	private ShareInallDao shareInallDao;
	
	
	public List<Map<String,Object>> selectList(Map<String,Object> map) throws SQLException {
		
		return this.selectList(shareInallDao, map);
	}

	
	public IListPage pageQuery(Map<String, Object> param, int pageNo) throws SQLException {
		return this.pageQuery(shareInallDao, param, pageNo);
	}
	
	
}
