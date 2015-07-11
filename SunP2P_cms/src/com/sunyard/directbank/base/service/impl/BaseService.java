package com.sunyard.directbank.base.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunyard.directbank.base.dao.ReportDao;
import com.sunyard.directbank.base.dao.StatisticsDao;
import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.base.model.ListPage;
import com.sunyard.directbank.base.service.IBaseService;
import com.sunyard.directbank.enums.REPORTTYPE;


@Transactional
@Service
public  class BaseService implements IBaseService {
	
	@Override
	public List<Map<String,Object>> selectList(ReportDao baseDao, Map<String,Object> map) throws SQLException {
		
		return baseDao.selectList(map);
	}

	@Override
	public IListPage pageQuery(ReportDao baseDao,Map<String, Object> param, int pageNo) throws SQLException {
		int pageSize = Consts.PAGE_SIZE;
		
		int total = baseDao.pageCount(param);
		
		int start = (pageNo - 1) * pageSize;
		param.put("startRow", new Integer(start));
		param.put("endRow", pageSize);
		
		List<Map<String,Object>> data = baseDao.pageQuery(param);
		return new ListPage(start, total, pageSize, data);
	}

	@Override
	public List<Map<String, Object>> selectList(Map<String, Object> param)
			throws SQLException {
		return null;
	}

	@Override
	public IListPage pageQuery(Map<String, Object> param, int pageNo)
			throws SQLException {
		return null;
	}

	@Override
	public List<Map<String, Object>> selectList(Map<String, Object> param,
			String date_type) {
		return null;
	}
	
	@Override
	public IListPage pageQuery(Map<String, Object> param, int pageNo,
			String date_type) {
		return null;
	}
	
	@Override
	public List<Map<String, Object>> selectList(StatisticsDao dao,
			Map<String, Object> param, String date_type) {
		if(date_type.equals(REPORTTYPE.Day.getCode())){
			return dao.selectListByDay(param);
		}else if(date_type.equals(REPORTTYPE.Month.getCode())){
			return dao.selectListByMonth(param);
		}else if(date_type.equals(REPORTTYPE.Year.getCode())){
			return dao.selectListByYear(param);
		}else{
			return null;
		}
	}

	

	@Override
	public IListPage pageQuery(StatisticsDao dao, Map<String, Object> param,
			int pageNo, String date_type) {
		int total = 0;
		int pageSize = Consts.PAGE_SIZE;
		int start = (pageNo - 1) * pageSize;
		List<Map<String,Object>> data = new ArrayList<Map<String,Object>>();
		param.put("startRow", new Integer(start));
		param.put("endRow", pageSize);
		if (date_type.equals(REPORTTYPE.Day.getCode())) {
			total = dao.pageCountByDay(param);
			data = dao.pageQueryByDay(param);
		} else if (date_type.equals(REPORTTYPE.Month.getCode())) {
			total = dao.pageCountByMonth(param);
			data = dao.pageQueryByMonth(param);
		} else if (date_type.equals(REPORTTYPE.Year.getCode())) {
			total = dao.pageCountByYear(param);
			data = dao.pageQueryByYear(param);
		}

		return new ListPage(start, total, pageSize, data);
	}
	
	
}
