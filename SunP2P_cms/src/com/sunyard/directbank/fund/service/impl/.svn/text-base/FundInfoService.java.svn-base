package com.sunyard.directbank.fund.service.impl;

import java.sql.SQLException;
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
import com.sunyard.directbank.fund.dao.FundInfoDao;
import com.sunyard.directbank.fund.model.FundInfo;
import com.sunyard.directbank.fund.service.IFundInfoService;

@Transactional
@Service
public class FundInfoService implements IFundInfoService,Consts {
	@Resource
	private FundInfoDao fundInfoDao;
	
	@Override
	public List<FundInfo> selectList(FundInfo fundInfo) throws SQLException {
		
		return fundInfoDao.selectList(fundInfo);
	}
	
	public void insert(FundInfo fundInfo) {
		fundInfoDao.insert(fundInfo);
	}
	
	public FundInfo loadFundInfoById(Long prod_id){
		return fundInfoDao.loadById(prod_id);
	}
	
	public boolean deleteAll(FundInfo fundInfo){
		return fundInfoDao.deleteAll(fundInfo);
	}
	
	public boolean deleteBatch(List<Long> list){
		return fundInfoDao.deleteBatch(list);
	}

	@Override
	public void update(FundInfo fundInfo) {
		fundInfoDao.update(fundInfo);
	}

	@Override
	public void check(FundInfo fundInfo) {
		fundInfoDao.updateIssueState(fundInfo);
		
	}

	@Override
	public IListPage pageQuery(Map<String, Object> param, int pageNo) throws Exception {
		int pageSize = Consts.PAGE_SIZE;
		
		int total = fundInfoDao.pageCount(param);
		
		int start = (pageNo - 1) * pageSize;
		param.put("startRow", new Integer(start));
		param.put("endRow", pageSize);
		
		List<FundInfo> data = fundInfoDao.pageQuery(param);
		
		DDUtil cache = (DDUtil)SpringUtil.getWebApplicationContext().getBean("dDUtil");
		for(int index=0; index<data.size(); index++){
			FundInfo obj = data.get(index);
			obj.setProd_type(cache.getContent(PROD_TYPE, obj.getProd_type()));
			obj.setProd_state(cache.getContent(PROD_STATE, obj.getProd_state()));
			obj.setRisk_lvl(cache.getContent(RISK_LVL, obj.getRisk_lvl()));
			obj.setIssue_state(cache.getContent(ISSUE_STATE, obj.getIssue_state()));
			obj.setHpage_promoted(cache.getContent(HPAGE_SHOW, obj.getHpage_promoted()));
		}
		
		return new ListPage(start, total, pageSize, data);
	}
}
