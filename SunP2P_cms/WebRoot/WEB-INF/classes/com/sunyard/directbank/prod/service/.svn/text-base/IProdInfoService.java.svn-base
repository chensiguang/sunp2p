package com.sunyard.directbank.prod.service;

import java.util.List;
import java.util.Map;

import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.prod.model.ProdBaseInfo;
import com.sunyard.directbank.prod.model.ProdExtInfo;

public interface IProdInfoService {

	public abstract IListPage pageQuery(Map<String, Object> param, int pageNo) throws Exception;

	public abstract ProdBaseInfo loadprodInfoById(int prod_id);

	public abstract ProdExtInfo loadProdExtById(String exp_id);

	public abstract boolean update(ProdBaseInfo prodInfo, ProdExtInfo prodExtInfo);

	public abstract boolean deleteBatch(List<Integer> paramList);

	public abstract void check(ProdBaseInfo prodInfo);

	public abstract void insert(ProdBaseInfo prodInfo, ProdExtInfo prodExtInfo);

	public abstract List<String> getId(ProdBaseInfo prodInfo);

	public abstract List<ProdBaseInfo> getProdInfoList(ProdBaseInfo prodInfo); 
}
