package com.sunyard.directbank.batchp2p.service.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.sunyard.directbank.batchp2p.dao.BatchP2pDao;
import com.sunyard.directbank.batchp2p.model.BatchProdRepay;
import com.sunyard.directbank.batchp2p.model.BatchRepaymentList;
import com.sunyard.directbank.batchp2p.service.IBatchP2pSerivce;
import com.sunyard.directbank.enums.REPAYMENTSTATUS;

@Transactional
@Service
public class BatchP2pService implements IBatchP2pSerivce {
	@Resource
	private BatchP2pDao batchP2pDao;
	
	@Override
	public List<Map<String, Object>> getRepayDateEqualTodayAndNotPay(
			BatchProdRepay p2pRepayInfo) {
		return batchP2pDao.getRepayDateEqualTodayAndNotPay(p2pRepayInfo);
	}

	@Override
	public void entryRepayment(BatchProdRepay prodRepayInfo) {
		entryProdRealRepayAmt(prodRepayInfo);
		entryAllCustRealRepayAmt(prodRepayInfo);
		
	}

	private void entryProdRealRepayAmt(BatchProdRepay prodRepayInfo) {
		batchP2pDao.updateProdRealRepayAmt(prodRepayInfo);//根据产品id和当前期数作为主键
		
	}

	private void entryAllCustRealRepayAmt(BatchProdRepay prodRepayInfo) {
		BigDecimal realScale = prodRepayInfo.getReal_repay_amt().divide(prodRepayInfo.getRepay_amt(), 4, BigDecimal.ROUND_HALF_UP);
		Date realRepayDate = prodRepayInfo.getReal_repay_date();
		List<BatchRepaymentList> list = getCustRepaymentlist(prodRepayInfo);
		for(BatchRepaymentList item : list){
			updateEachCustRealRepay(item,realScale,realRepayDate);
		}	
	}

	private void updateEachCustRealRepay(BatchRepaymentList item,
			BigDecimal realScale, Date realRepayDate) {
		item.setReal_repay_amount(realScale.multiply(item.getRepay_amount()));
		item.setReal_repay_val(realScale.multiply(item.getRepay_val()));
		item.setReal_repay_amt(item.getReal_repay_amount().add(item.getReal_repay_val()));
		item.setReal_repay_date(realRepayDate);
		item.setRepay_status(REPAYMENTSTATUS.WaitingPay.getCode());
		batchP2pDao.updateEachCustRealRepay(item);
	}

	private List<BatchRepaymentList> getCustRepaymentlist(BatchProdRepay prodRepayInfo) {
		return batchP2pDao.getCustRepaymentlistByPK(prodRepayInfo);
	}

	

}
