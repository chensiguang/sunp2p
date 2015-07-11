package com.sunyard.directbank.batchp2p.service;

import java.util.List;
import java.util.Map;

import com.sunyard.directbank.batchp2p.model.BatchProdRepay;

public interface IBatchP2pSerivce {
	List<Map<String, Object>> getRepayDateEqualTodayAndNotPay(
			BatchProdRepay p2pRepayInfo);
	
	void entryRepayment(BatchProdRepay prodRepayInfo);
}
