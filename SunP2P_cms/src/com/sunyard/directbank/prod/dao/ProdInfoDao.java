package com.sunyard.directbank.prod.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.sunyard.directbank.prod.model.ProdBaseInfo;
import com.sunyard.directbank.prod.model.ProdExtInfo;

public interface ProdInfoDao {

	public abstract int pageCount(Map<String, Object> param);
    
	public abstract List<ProdBaseInfo> select(@Param("prod_type")String prod_type,@Param("prod_state")String prod_state);
	
	public abstract String selectMaxExt();
	
	public abstract List<ProdBaseInfo> pageQuery(Map<String, Object> param);

	public abstract ProdBaseInfo loadprodInfoById(int prod_id);

	public abstract void insert(ProdBaseInfo prodInfo);

	public abstract void insertExt(ProdExtInfo prodExtInfo);

	public abstract ProdExtInfo loadProdExtById(String exp_id);

	public abstract boolean update(ProdBaseInfo prodInfo);

	public abstract boolean updateExt(ProdExtInfo prodExtInfo);

	public abstract boolean deleteExt(List<String> extStr);

	public abstract boolean deleteBatch(List<Integer> paramList);

	public abstract void updateIssueState(ProdBaseInfo prodInfo);

    public abstract List<String> getId(ProdBaseInfo prodInfo);

	public abstract List<ProdBaseInfo> getProdInfoList(ProdBaseInfo prodInfo);
}
