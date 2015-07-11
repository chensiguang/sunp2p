package com.sunyard.directbank.fund.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.sunyard.directbank.fund.model.FundInfo;


public interface FundInfoDao {

	public List<FundInfo> selectList(FundInfo fundInfo) throws SQLException;
	public void insert(FundInfo fundInfo);
	public FundInfo loadById(Long id);
	public boolean deleteAll(FundInfo fundInfo);
	public boolean deleteBatch(List<Long> list);
	public void update(FundInfo fundInfo);
	public void updateIssueState(FundInfo fundInfo);
	public int pageCount(Map<String, Object> param);
	public List<FundInfo> pageQuery(Map<String, Object> param);
	
}
