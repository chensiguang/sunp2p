package com.sunyard.directbank.p2p.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.sunyard.directbank.p2p.model.P2pInfo;


public interface P2pInfoDao {

	public List<P2pInfo> selectList(P2pInfo p2pInfo) throws SQLException;
	public void insert(P2pInfo p2pInfo);
	public P2pInfo loadById(Long id);
	public boolean deleteAll(P2pInfo p2pInfo);
	public boolean deleteBatch(List<Long> list);
	public void update(P2pInfo p2pInfo);
	public void updateIssueState(P2pInfo p2pInfo);
	public int pageCount(Map<String, Object> param);
	public List<P2pInfo> pageQuery(Map<String, Object> param);
	
}
