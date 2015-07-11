package com.sunyard.directbank.eaccontAmt.dao;

import java.util.Map;

import com.sunyard.directbank.batchp2p.model.ShareInall;


public interface EaccountAmtDao {

	void updateEAcccoutBalance(Map<String, Object> map);

	void insertEAccountAmtList(Map<String, Object> map);

	void updateShareInall(ShareInall obj);

	void insertShareList(Map<String, Object> map);

}
