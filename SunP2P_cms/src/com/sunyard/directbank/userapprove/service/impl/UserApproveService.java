package com.sunyard.directbank.userapprove.service.impl;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunyard.directbank.base.DDUtil;
import com.sunyard.directbank.base.SpringUtil;
import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.base.model.ListPage;
import com.sunyard.directbank.enums.ACCTSTA;
import com.sunyard.directbank.enums.AMTTYPE;
import com.sunyard.directbank.enums.CHANGEREASON;
import com.sunyard.directbank.enums.CHANGETYPE;
import com.sunyard.directbank.enums.PAYCHANNEL;
import com.sunyard.directbank.enums.SCORETYPE;
import com.sunyard.directbank.enums.SEQCODETYPE;
import com.sunyard.directbank.tools.GenerateSeqUtil;
import com.sunyard.directbank.userapprove.dao.UserApproveDao;
import com.sunyard.directbank.userapprove.service.IUserApproveService;

@Service
@Transactional
public class UserApproveService implements IUserApproveService, Consts {

	@Resource
	private UserApproveDao userApproveDao;
	
	@Override
	public ListPage pageQuery(Map<String, Object> param, int pageNo) throws Exception {

		int pageSize = PAGE_SIZE;
		int startRow = (pageNo - 1) * pageSize;
		param.put("startRow", startRow);
		param.put("rows", pageSize);
		param.put("acc_state", ACCTSTA.UnActive.getCode());	// 仅查询状态为未激活的记录
		int totalSize = userApproveDao.pageCount(param);
		List<Map<String, Object>> data = userApproveDao.pageQuery(param);
		
		return new ListPage(startRow, totalSize, pageSize, data);
	}

	@Override
	public Map<String, Object> getById(String eacc_no) throws Exception {

		Map<String, Object> userInfo = userApproveDao.getById(eacc_no);
		
		// 翻译字段
		DDUtil cache = SpringUtil.getCache();
		userInfo.put("email_state", cache.getContent(MAIL_STATE, userInfo.get("email_state").toString()));
		userInfo.put("acc_state", cache.getContent(ACCOUNT_STATE, userInfo.get("acc_state").toString()));
		return userInfo;
	}

	@Override
	public boolean updateAccInfo(Map<String, Object> param) {

		return userApproveDao.updateAccInfo(param);
	}

	@Override
	public boolean userApproved(Map<String, Object> param) throws Exception {

		// 更新客户电子账号信息登记表，状态+审核人+审核日期
		updateAccInfo(param);
		
		// 查询活动信息表，通过交易码和启用状态查询红包+积分+抵用券
		Map<String, Object> active = selectComActive();
		
		// 更新客户电子账号信息登记表，积分+余额
		active.put("eacc_no", param.get("eacc_no"));
		userApproveDao.updateAccAmt(active);
		
		if(!active.get("score").equals(BigDecimal.ZERO)) {
			// 积分不为0，记录积分明细表
			insertScoreList(active);
		}
		if(!active.get("amt").equals(BigDecimal.ZERO)){
			// 红包不为0，记录资金进出明细表
			insertAmtList(active);
		}
		if(!active.get("voucher_amt").equals(BigDecimal.ZERO)){
			// 抵用券金额不为0，记录抵用券表
			insertVoucherInfo(active);
		}
		// 记录客户账户表
		param.put("acc_status", "00000");
		userApproveDao.insertAccList(param);
		
		return true;
	}

	private void insertVoucherInfo(Map<String, Object> active) {
		active.put("description", "人工身份验证激活");
		userApproveDao.insertVoucherInfo(active);
	}

	private void insertAmtList(Map<String, Object> active) throws Exception {
		active.put("serial_id", GenerateSeqUtil.generateSeq(new String[]{SEQCODETYPE.EACC_AMT_FLOW_ID.getCode()}).get(SEQCODETYPE.EACC_AMT_FLOW_ID.getCode()));
		active.put("amt_type", AMTTYPE.Income.getCode());
		active.put("amt_channel", PAYCHANNEL.Cms.getCode());
		active.put("system_date", Consts.SYSTEM_DATE);
		userApproveDao.insertAmtList(active);
	}

	private void insertScoreList(Map<String, Object> active) {
		active.put("change_type", CHANGETYPE.Add.getCode());
		active.put("change_reason", CHANGEREASON.Give.getCode());
		active.put("score_type", SCORETYPE.Common.getCode());
		active.put("description", "人工身份验证激活");
		userApproveDao.insertScoreList(active);
	}

	private Map<String, Object> selectComActive() {
		String trans_id = "t00011";
		String enable_flag = "1";
		return userApproveDao.selectComActive(trans_id, enable_flag);
	}

}
