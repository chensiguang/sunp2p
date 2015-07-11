package com.sunyard.directbank.batchorder.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunyard.directbank.base.DDUtil;
import com.sunyard.directbank.base.SpringUtil;
import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.base.model.ListPage;
import com.sunyard.directbank.batchorder.dao.BatchOrderDao;
import com.sunyard.directbank.batchorder.service.IBatchOrderService;

@Service
@Transactional
public class BatchOrderService implements IBatchOrderService, Consts {
	
	@Resource
	private BatchOrderDao batchOrderDao;

	@Override
	public ListPage pageQuery(Map<String, Object> param, int pageNo) throws Exception {

		int pageSize = PAGE_SIZE;
		int startRow = (pageNo - 1) * pageSize;
		param.put("startRow", startRow);
		param.put("rows", pageSize);
		int totalSize = batchOrderDao.pageCount(param);
		List<Map<String, Object>> data = batchOrderDao.pageQuery(param);
		
		// 翻译字段
		DDUtil cache =  SpringUtil.getCache();
		for(Map<String, Object> map : data) {
			map.put("redo_flag", cache.getContent(ISSUE, (String) map.get("redo_flag")));
			map.put("deal_status", cache.getContent(DEAL_STATUS, (String) map.get("deal_status")));
		}
		
		return new ListPage(startRow, totalSize, pageSize, data);
	}

	@Override
	public boolean addBatchOrder(Map<String, Object> param) throws Exception {
		
		return batchOrderDao.save(param);
	}

	@Override
	public Map<String, Object> getById(String task_code) throws Exception {

		return batchOrderDao.getById(task_code);
	}

	@Override
	public boolean updateBatchOrder(Map<String, Object> param) throws Exception {

		return batchOrderDao.update(param);
	}

	@Override
	public boolean deleteBatch(List<String> list) throws Exception {

		return batchOrderDao.deleteBatch(list);
	}


}
