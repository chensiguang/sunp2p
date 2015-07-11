package com.sunyard.directbank.mujifailed.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.enums.AMTTYPE;
import com.sunyard.directbank.enums.PAYCHANNEL;
import com.sunyard.directbank.enums.PRODSTATE;
import com.sunyard.directbank.enums.SEQCODETYPE;
import com.sunyard.directbank.mujifailed.dao.MujiFailedDao;
import com.sunyard.directbank.mujifailed.service.IMujiFailedService;
import com.sunyard.directbank.tools.GenerateSeqUtil;

@Service
@Transactional
public class MujiFailedService implements IMujiFailedService {

	@Resource
	private MujiFailedDao mujiFailedDao;
	private Logger logger = Logger.getLogger(MujiFailedService.class);
	
	@Override
	public Map<String, Object> getById(int prod_id) throws Exception {

		return mujiFailedDao.getById(prod_id);
	}

	@Override
	public void mujiFailed(int prod_id, String debit_account) throws Exception {

		// 查询客户产品份额表，得到电子账户和份额等信息
		List<Map<String, Object>> share_inall = mujiFailedDao.selectShareInall(prod_id);
		logger.info("客户产品份额表查询结果 = " + share_inall);
		
		// 更新产品份额表，将份额清零
		updateShareInall(prod_id);
		logger.info("产品份额表已清零！");
		
		// 记录份额明细表
		insertShareList(share_inall);
		logger.info("份额明细表已记录！");
		
		// 更新客户电子账号信息登记表，修改余额
		updateEaccAcct(share_inall);
		logger.info("客户电子账号信息登记表，已修改余额！");
		
		// 更新产品管理表，将产品状态置为失败
		updateProduct(prod_id);
		logger.info("已更新产品管理表，将产品状态置为失败！");
		
		// 电子账户资金进出明细表，记录流水
		insertAmtLists(share_inall, debit_account);
		logger.info("电子账户资金进出明细表，已记录流水！");
		
	}

	// 电子账户资金进出明细表，记录流水
	private void insertAmtLists(List<Map<String, Object>> share_inall, String debit_account) throws Exception {
		for(Map<String, Object> param : share_inall) {
			param.put("serial_id", GenerateSeqUtil.generateSeq(new String[]{SEQCODETYPE.EACC_AMT_FLOW_ID.getCode()})
					.get(SEQCODETYPE.EACC_AMT_FLOW_ID.getCode()));
			param.put("trans_code", "t00026");
			param.put("amt_type", AMTTYPE.Income.getCode());
			param.put("amt_channel", PAYCHANNEL.EAccount.getCode());
			param.put("system_date", Consts.SYSTEM_DATE);
			param.put("debit_account", debit_account);
		}
		mujiFailedDao.insertAmtList(share_inall);
	}

	// 更新产品管理表，将产品状态置为失败
	private void updateProduct(int prod_id) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("prod_id", prod_id);
		param.put("prod_state", PRODSTATE.Terminate.getCode());
		mujiFailedDao.updateProduct(param);
	}

	// 更新客户电子账号信息登记表，修改余额
	private void updateEaccAcct(List<Map<String, Object>> share_inall) throws Exception {

		for(Map<String, Object> map : share_inall) {
			mujiFailedDao.updateEaccAcct(map);
		}
	}

	// 记录份额明细表
	private void insertShareList(List<Map<String, Object>> share_inall) throws Exception {
		for(Map<String, Object> param : share_inall) {
			param.put("var_cause", "强制产品募集失败");
			param.put("var_direction", AMTTYPE.Expensive.getCode());
			param.put("system_date", Consts.SYSTEM_DATE);
		}
		mujiFailedDao.insertShareList(share_inall);
	}

	// 更新产品份额表，将份额清零
	private void updateShareInall(int prod_id) throws Exception {
		mujiFailedDao.updateShareInall(prod_id);
	}

}
