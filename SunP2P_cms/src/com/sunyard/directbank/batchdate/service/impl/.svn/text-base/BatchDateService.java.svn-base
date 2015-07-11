package com.sunyard.directbank.batchdate.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.base.model.ListPage;
import com.sunyard.directbank.batchdate.dao.BatchDateDao;
import com.sunyard.directbank.batchdate.service.IBatchDateSerivce;

@Transactional
@Service
public class BatchDateService implements IBatchDateSerivce {
	@Resource
	private BatchDateDao batchDateDao;

	@Override
	public IListPage pageQuery(Map<String, Object> param, int pageNo) {
		int pageSize = Consts.PAGE_SIZE;
		
		int total = batchDateDao.pageCount(param);
		
		int start = (pageNo - 1) * pageSize;
		param.put("startRow", new Integer(start));
		param.put("endRow", pageSize);
		
		List<Map<String,Object>> data = batchDateDao.pageQuery(param);
		return new ListPage(start, total, pageSize, data);
	}


	@Override
	public void insertBatch(List<Map<String, Object>> paralist,Map<String, Object> param) {
		int count = batchDateDao.getCountOverViewByPK(param);
		if(count > 0){
			batchDateDao.deleteBatchByPK(param);
			batchDateDao.deleteOverViewByPK(param);
		}
		batchDateDao.insertBatch(paralist);
		batchDateDao.insertOverViewByPK(param);
	}

	@Override
	public Map<String, Object> loadOverViewByPK(Map<String, Object> para) {
		return batchDateDao.loadOverViewByPK(para);
	}


	@Override
	public List<Date> selectBatchDate(Map<String, Object> map) {
		return batchDateDao.selectBatchDateByProductId(map);
	}


}
