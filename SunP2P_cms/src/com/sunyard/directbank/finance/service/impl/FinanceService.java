package com.sunyard.directbank.finance.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunyard.directbank.base.DDUtil;
import com.sunyard.directbank.base.SpringUtil;
import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.base.model.ListPage;
import com.sunyard.directbank.finance.dao.FinanceDao;
import com.sunyard.directbank.finance.service.IFinanceService;

@Service
@Transactional
public class FinanceService implements IFinanceService {

	@Resource
	private FinanceDao financeDao;
	
	@Override
	public List<Map<String,Object>> selectFinance(Map<String,Object> map) throws Exception {

		return financeDao.pageQuery(map);
	}
	
	@Override
	public IListPage pageQuery(Map<String, Object> param, int pageNo) throws Exception {

		// 每页显示的记录条数
		int pageSize = Consts.PAGE_SIZE;
		
		int startRow = (pageNo - 1) * pageSize;
		param.put("startRow", new Integer(startRow));	// 查询起始位置
		param.put("rows", pageSize);					// 查询条数
		
		// 查询数据库总数据条数和当前页面记录
		int total = financeDao.pageCount(param);
		List<Map<String,Object>> data = financeDao.pageQuery(param);
		
		// 数据字典翻译
		DDUtil cache = SpringUtil.getCache();
		for(Map<String,Object> map : data){
			map.put("status",cache.getContent(Consts.APPROVE_STATUS, (String) map.get("status")));
			map.put("repay_type",cache.getContent(Consts.REPAY_TYPE, (String) map.get("repay_type")));
			map.put("cus_type",cache.getContent(Consts.CUS_TYPE, (String) map.get("cus_type")));
			map.put("guarantee_way",cache.getContent(Consts.GUAR_WAY, (String) map.get("guarantee_way")));
		}
		
		return new ListPage(startRow, total, pageSize, data);
	}
	
	@Override
	public Map<String, Object> details(Map<String, Object> param) throws Exception   {
		Map<String, Object> map = financeDao.details(param);
		// 数据字典翻译
		DDUtil cache = SpringUtil.getCache();
		map.put("status",cache.getContent(Consts.APPROVE_STATUS, (String) map.get("status")));
		map.put("repay_type",cache.getContent(Consts.REPAY_TYPE, (String) map.get("repay_type")));
		map.put("cus_type",cache.getContent(Consts.CUS_TYPE, (String) map.get("cus_type")));
		map.put("guarantee_way",cache.getContent(Consts.GUAR_WAY, (String) map.get("guarantee_way")));
		
		return map;
	}
	
	@Override
	public void approve(Map<String, Object> param) {
		financeDao.approve(param);
	}
	
	@Override
	public void refuse(Map<String, Object> param) {
		financeDao.refuse(param);
	}
	
	@Override
	public Map<String, Object> selectOneFinance(Map<String, Object> param) {
		return financeDao.selectOneFinance(param);
		
	}
	
	public String translation(String s) throws Exception{
		DDUtil cache = SpringUtil.getCache();
		return cache.getContent(Consts.APPROVE_STATUS, s);
	} 
	
}
