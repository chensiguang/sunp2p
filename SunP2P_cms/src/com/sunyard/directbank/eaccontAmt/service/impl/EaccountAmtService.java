package com.sunyard.directbank.eaccontAmt.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunyard.directbank.batchp2p.model.ShareInall;
import com.sunyard.directbank.eaccontAmt.dao.EaccountAmtDao;
import com.sunyard.directbank.eaccontAmt.service.IEaccountAmtService;
import com.sunyard.directbank.enums.AMTTYPE;
import com.sunyard.directbank.enums.PAYCHANNEL;
import com.sunyard.directbank.enums.SEQCODETYPE;
import com.sunyard.directbank.tools.DateUtil;
import com.sunyard.directbank.tools.GenerateSeqUtil;

@Transactional
@Service
public class EaccountAmtService implements IEaccountAmtService{
	@Resource
	private EaccountAmtDao eaccountAmtDao;
	
	@Override
	public void updateEAcccoutBalance(Map<String,Object> map) {
		eaccountAmtDao.updateEAcccoutBalance(map);
	}

	@Override
	public void insertEAccountAmtList(Map<String, Object> obj) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.putAll(obj);
		map.put("amt_channel", PAYCHANNEL.Cms.getCode());
		map.put("amt_type", AMTTYPE.Income.getCode());
		map.put("trans_date", DateUtil.today());
		map.put("system_date", DateUtil.today());
		map.put("trans_time", DateUtil.curTimeStr());
		try {
			map.put("serial_id", GenerateSeqUtil.generateSeq(new String[]{SEQCODETYPE.EACC_AMT_FLOW_ID.getCode()}).get(SEQCODETYPE.EACC_AMT_FLOW_ID.getCode()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		eaccountAmtDao.insertEAccountAmtList(map);
	}

	@Override
	public void updateShareInall(ShareInall obj) {
		eaccountAmtDao.updateShareInall(obj);
	}

	@Override
	public void insertShareList(Map<String, Object> map) {
		eaccountAmtDao.insertShareList(map);
		
	}
}
