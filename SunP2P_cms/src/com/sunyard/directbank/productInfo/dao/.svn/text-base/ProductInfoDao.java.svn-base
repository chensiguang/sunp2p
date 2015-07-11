package com.sunyard.directbank.productInfo.dao;

import java.util.List;
import java.util.Map;

import com.sunyard.directbank.batchp2p.model.ShareInall;
import com.sunyard.directbank.finance.model.FinanceModel;
import com.sunyard.directbank.prod.model.ProdBaseInfo;


public interface ProductInfoDao {

	List<ProdBaseInfo> getProducts(Map<String, Object> param);

	FinanceModel loadFinanceObjectById(ProdBaseInfo prod);

	List<ShareInall> getCustListBuyProd(ProdBaseInfo prod);

	void updateProductById(ProdBaseInfo prod);

	void updateProdTransStatus(Map<String, Object> map);

	ProdBaseInfo loadProductObjectById(int prod_id);


}
