package com.sunyard.directbank.eaccontAmt.service;

import java.util.Map;

import com.sunyard.directbank.batchp2p.model.ShareInall;


public interface IEaccountAmtService {

	void updateEAcccoutBalance(Map<String,Object> map);//更新电子账户的余额和可用余额
	
	void insertEAccountAmtList(Map<String, Object> obj);//记录电子账户余额资金变动
	
	void updateShareInall(ShareInall obj);//更新用户份额表

	void insertShareList(Map<String, Object> map);//记录客户产品份额明细
}
