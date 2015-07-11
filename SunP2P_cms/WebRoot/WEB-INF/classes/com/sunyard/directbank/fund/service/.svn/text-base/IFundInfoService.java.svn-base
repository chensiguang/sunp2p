package com.sunyard.directbank.fund.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.fund.model.FundInfo;

public interface IFundInfoService {
	
	public abstract List<FundInfo> selectList(FundInfo fundInfo) throws SQLException;
	public abstract void insert(FundInfo fundInfo);
	public abstract FundInfo loadFundInfoById(Long id);
	public boolean deleteAll(FundInfo fundInfo);
	public boolean deleteBatch(List<Long> list);
	public abstract void update(FundInfo fundInfo);
	public abstract void check(FundInfo fundInfo);
	public abstract IListPage pageQuery(Map<String, Object> param, int pageNo) throws Exception;
}