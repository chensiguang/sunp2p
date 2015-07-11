package com.sunyard.directbank.productInfo.service;

import java.util.List;
import java.util.Map;

import com.sunyard.directbank.batchp2p.model.ShareInall;
import com.sunyard.directbank.finance.model.FinanceModel;
import com.sunyard.directbank.prod.model.ProdBaseInfo;

public interface IProductInfoSerivce {

	List<ProdBaseInfo> getProducts(Map<String, Object> param);//满足产品成立条件的产品集
	
	FinanceModel loadFinanceObjectById(ProdBaseInfo prod);//根据产品代码获取融资利息
	
	List<ShareInall> getCustListBuyProd(ProdBaseInfo prod);//根据产品代码获取投资人购买份额信息
	
	void updateProductById(ProdBaseInfo prod);//更新产品表

	void updateProdTransStatus(Map<String, Object> map);//更新产品交易状态
	
	ProdBaseInfo loadProductObjectById(int prod_id); //获取单一产品
}
