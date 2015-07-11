package com.sunyard.directbank.amtlist.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunyard.directbank.amtlist.dao.AmtListDao;
import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.base.service.impl.BaseService;



@Transactional
@Service
public class AmtListService extends BaseService {
	@Resource
	private AmtListDao amtListDao;

	@Override
	public List<Map<String, Object>> selectList(Map<String, Object> param,
			String date_type) {
		return this.selectList(amtListDao, param, date_type);
	}

	@Override
	public IListPage pageQuery(Map<String, Object> param, int pageNo,
			String date_type) {
		return this.pageQuery(amtListDao, param, pageNo, date_type);
	}

	

}
