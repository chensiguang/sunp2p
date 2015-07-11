package com.sunyard.directbank.productInfo.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunyard.directbank.batchp2p.model.ShareInall;
import com.sunyard.directbank.finance.model.FinanceModel;
import com.sunyard.directbank.prod.model.ProdBaseInfo;
import com.sunyard.directbank.productInfo.dao.ProductInfoDao;
import com.sunyard.directbank.productInfo.service.IProductInfoSerivce;

@Transactional
@Service
public class ProductInfoService implements IProductInfoSerivce{
	@Resource
	private ProductInfoDao productInfoDao;

	@Override
	public List<ProdBaseInfo> getProducts(Map<String, Object> param) {
		return productInfoDao.getProducts(param);
	}

	@Override
	public FinanceModel loadFinanceObjectById(ProdBaseInfo prod) {
		return productInfoDao.loadFinanceObjectById(prod);
	}

	@Override
	public List<ShareInall> getCustListBuyProd(ProdBaseInfo prod) {
		return productInfoDao.getCustListBuyProd(prod);
	}

	@Override
	public void updateProductById(ProdBaseInfo prod) {
		productInfoDao.updateProductById(prod);
	}

	@Override
	public void updateProdTransStatus(Map<String, Object> map) {
		productInfoDao.updateProdTransStatus(map);
		
	}

	@Override
	public ProdBaseInfo loadProductObjectById(int prod_id) {
		return productInfoDao.loadProductObjectById(prod_id);
	}

}
