package com.sunyard.directbank.capital.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.base.service.impl.BaseService;
import com.sunyard.directbank.capital.dao.CapitalInfoDao;



@Transactional
@Service
public class CapitalInfoService extends BaseService {
	@Resource
	private CapitalInfoDao capitalInfoDao;

	@Override
	public List<Map<String, Object>> selectList(Map<String, Object> param,
			String date_type) {
		return this.selectList(capitalInfoDao, param, date_type);
	}

	@Override
	public IListPage pageQuery(Map<String, Object> param, int pageNo,
			String date_type) {
		return this.pageQuery(capitalInfoDao, param, pageNo, date_type);
	}

	

}
