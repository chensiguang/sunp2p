package com.sunyard.directbank.comActive.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunyard.directbank.base.DDUtil;
import com.sunyard.directbank.base.SpringUtil;
import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.base.model.ListPage;
import com.sunyard.directbank.comActive.dao.ComActiveDao;
import com.sunyard.directbank.comActive.service.IComActiveService;

@Service
@Transactional
public class ComActiveService implements IComActiveService, Consts {

	@Resource
	private ComActiveDao comActiveDao;
	
	@Override
	public ListPage pageQuery(Map<String, Object> param, int pageNo) throws Exception {

		int pageSize = PAGE_SIZE;
		int startRow = (pageNo - 1) * pageSize;
		param.put("startRow", startRow);
		param.put("rows", pageSize);
		int totalSize = comActiveDao.pageCount(param);
		List<Map<String, Object>> data = comActiveDao.pageQuery(param);
		
		// 翻译字段
		DDUtil cache = SpringUtil.getCache();
		for(Map<String, Object> map : data) {
			map.put("enable_flag_t", cache.getContent(ISSUE, (String) map.get("enable_flag")));
			map.put("score_way_t", cache.getContent(SCORE_WAY, (String) map.get("score_way")));
		}
		
		return new ListPage(startRow, totalSize, pageSize, data);
	}

	@Override
	public boolean addBatchOrder(Map<String, Object> param) {

		return comActiveDao.save(param);
	}

	@Override
	public Map<String, Object> getById(Map<String, Object> param) {

		return comActiveDao.getById(param);
	}

	@Override
	public boolean updateComActive(Map<String, Object> param) {

		return comActiveDao.update(param);
	}
	
	@Override
	public boolean deleteBatch(List<Map<String, Object>> list) {
		
		for(Map<String, Object> map : list) {
			comActiveDao.deleteBatch(map);
		}
		return true;
	}

	@Override
	public Map<String, Object> string2Map(String primarykey) {
		Map<String, Object> param = new HashMap<String, Object>();
		String[] id = primarykey.split(",");
		
		param.put("trans_id", id[0]);
		param.put("start_amt", new BigDecimal(id[1]));
		param.put("score_way", id[2]);
		
		return param;
	}

	@Override
	public List<Map<String, Object>> string2List(String primarykey) {

		List<Map<String, Object>> param = new ArrayList<Map<String,Object>>();
		Map<String, Object> map = new HashMap<String, Object>();
		primarykey = primarykey.substring(0, primarykey.length() - 1);
		String[] ids = primarykey.split(";");
		
		for(int i = 0; i < ids.length; i++) {
			map = string2Map(ids[i]);
			param.add(map);
		}
		return param;
	}

}
