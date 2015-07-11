package com.sunyard.directbank.sharelist.service.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.base.service.impl.BaseService;
import com.sunyard.directbank.sharelist.dao.ShareListDao;


@Transactional
@Service
public class ShareListService extends  BaseService {
	@Resource
	private ShareListDao shareListDao;
	
	
	public List<Map<String,Object>> selectList(Map<String,Object> map) throws SQLException {
		
		return this.selectList(shareListDao, map);
	}

	
	public IListPage pageQuery(Map<String, Object> param, int pageNo) throws SQLException {
		return this.pageQuery(shareListDao, param, pageNo);
	}
	
	
}
