package com.sunyard.directbank.p2p.service.impl;

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
import com.sunyard.directbank.p2p.dao.P2pInfoDao;
import com.sunyard.directbank.p2p.model.P2pInfo;
import com.sunyard.directbank.p2p.service.IP2pInfoService;

@Transactional
@Service
public class P2pInfoService implements IP2pInfoService,Consts {
	@Resource
	private P2pInfoDao p2pInfoDao;
	
	@Override
	public List<P2pInfo> selectList(P2pInfo p2pInfo) throws SQLException {
		return p2pInfoDao.selectList(p2pInfo);
	}
	
	public void insert(P2pInfo p2pInfo) {
		p2pInfoDao.insert(p2pInfo);
	}
	
	public P2pInfo loadP2pInfoById(Long prod_id){
		return p2pInfoDao.loadById(prod_id);
	}
	
	public boolean deleteAll(P2pInfo p2pInfo){
		return p2pInfoDao.deleteAll(p2pInfo);
	}
	
	public boolean deleteBatch(List<Long> list){
		return p2pInfoDao.deleteBatch(list);
	}

	@Override
	public void update(P2pInfo p2pInfo) {
		p2pInfoDao.update(p2pInfo);
	}

	@Override
	public void check(P2pInfo p2pInfo) {
		p2pInfoDao.updateIssueState(p2pInfo);
		
	}

	@Override
	public IListPage pageQuery(Map<String, Object> param, int pageNo) throws Exception {
		int pageSize = Consts.PAGE_SIZE;
		
		int total = p2pInfoDao.pageCount(param);
		
		int start = (pageNo - 1) * pageSize;
		param.put("startRow", new Integer(start));
		param.put("endRow", pageSize);
		
		List<P2pInfo> data = p2pInfoDao.pageQuery(param);
		
		DDUtil cache = (DDUtil)SpringUtil.getWebApplicationContext().getBean("dDUtil");
		for(int index=0; index<data.size(); index++){
			P2pInfo obj = data.get(index);
			obj.setProd_type(cache.getContent(PROD_TYPE, obj.getProd_type()));
			obj.setProd_state(cache.getContent(PROD_STATE, obj.getProd_state()));
			obj.setIssue_state(cache.getContent(ISSUE_STATE, obj.getIssue_state()));
		}
		
		return new ListPage(start, total, pageSize, data);
	}
}
