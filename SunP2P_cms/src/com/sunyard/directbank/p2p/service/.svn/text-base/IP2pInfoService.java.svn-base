package com.sunyard.directbank.p2p.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.p2p.model.P2pInfo;

public interface IP2pInfoService {
	
	public abstract List<P2pInfo> selectList(P2pInfo p2pInfo) throws SQLException;
	public abstract void insert(P2pInfo p2pInfo);
	public abstract P2pInfo loadP2pInfoById(Long id);
	public boolean deleteAll(P2pInfo p2pInfo);
	public boolean deleteBatch(List<Long> list);
	public abstract void update(P2pInfo p2pInfo);
	public abstract void check(P2pInfo p2pInfo);
	public abstract IListPage pageQuery(Map<String, Object> param, int pageNo) throws Exception;
}