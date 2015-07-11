package com.sunyard.directbank.batchp2p.dao;

import java.util.List;
import java.util.Map;
import com.sunyard.directbank.batchp2p.model.BatchProdRepay;
import com.sunyard.directbank.batchp2p.model.BatchRepaymentList;

public interface BatchP2pDao {
	
	List<Map<String, Object>> getRepayDateEqualTodayAndNotPay(
			BatchProdRepay p2pRepayInfo);

	void updateProdRealRepayAmt(BatchProdRepay prodRepayInfo);

	List<BatchRepaymentList> getCustRepaymentlistByPK(
			BatchProdRepay prodRepayInfo);

	void updateEachCustRealRepay(BatchRepaymentList item);



}
