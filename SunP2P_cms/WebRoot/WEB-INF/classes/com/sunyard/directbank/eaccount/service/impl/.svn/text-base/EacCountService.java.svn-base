package com.sunyard.directbank.eaccount.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.base.service.impl.BaseService;
import com.sunyard.directbank.eaccount.dao.EacCountDao;



@Transactional
@Service
public class EacCountService extends BaseService {
	@Resource
	private EacCountDao eacCountDao;

	@Override
	public List<Map<String, Object>> selectList(Map<String, Object> param,
			String date_type) {
		return this.selectList(eacCountDao, param, date_type);
	}

	@Override
	public IListPage pageQuery(Map<String, Object> param, int pageNo,
			String date_type) {
		return this.pageQuery(eacCountDao, param, pageNo, date_type);
	}

	

}
