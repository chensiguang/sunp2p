package com.sunyard.directbank.dict.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.base.model.ListPage;
import com.sunyard.directbank.dict.dao.DictInfoDao;
import com.sunyard.directbank.dict.service.IDictInfoSerivce;
import com.sunyard.directbank.fund.model.FundInfo;

@Transactional
@Service
public class DictInfoService implements IDictInfoSerivce {
	@Resource
	private DictInfoDao dictInfoDao;

	@Override
	public IListPage pageQuery(Map<String, Object> param, int pageNo) {
		int pageSize = Consts.PAGE_SIZE;
		
		int total = dictInfoDao.pageCount(param);
		
		int start = (pageNo - 1) * pageSize;
		param.put("startRow", new Integer(start));
		param.put("endRow", pageSize);
		
		List<FundInfo> data = dictInfoDao.pageQuery(param);
		return new ListPage(start, total, pageSize, data);
	}

	@Override
	public void add(Map<String, Object> param,List<Map<String, Object>> insertList) {
		int mapCount = dictInfoDao.loadDictMapBykey(param);
		if(mapCount == 0) {
			dictInfoDao.insertDictMap(param);
		}
		dictInfoDao.insertDict(insertList);
	}

	@Override
	public List<Map<String,Object>> getDictListByKey(Map<String, Object> param) {
		return dictInfoDao.loadDictListByKey(param);
		
	}

	@Override
	public Map<String, Object> show2Modi(Map<String, Object> paraMap) {
		Map<String,Object> rst = dictInfoDao.getSpeciDictById(paraMap);
		rst.put("dict_name", dictInfoDao.getSpeciDictMapById(paraMap));
		return rst;
	}

	@Override
	public void update(Map<String, Object> param) {
		dictInfoDao.updateDictMap(param);
		dictInfoDao.updateDict(param);
	}

	@Override
	public void deleteBatch(List<Map<String, Object>> paraList, Set<String> keySet) {
		List<String> dictMapList = new ArrayList<String>();
		
		for(Map<String, Object> item : paraList){
			dictInfoDao.deleteDict(item);
		}
		
		for(String sun_key : keySet){
			int dictCount = dictInfoDao.getDictCountByKey(sun_key);
			if(dictCount == 0){
				dictMapList.add(sun_key);
			}
		}
		
		if(dictMapList != null && dictMapList.size() > 0){
			dictInfoDao.deleteDictMapBatch(dictMapList);
		}
	}
}
