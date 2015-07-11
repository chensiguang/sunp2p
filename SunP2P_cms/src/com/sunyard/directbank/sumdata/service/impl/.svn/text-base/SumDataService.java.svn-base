package com.sunyard.directbank.sumdata.service.impl;


import java.math.BigDecimal;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.enums.AMTTYPE;
import com.sunyard.directbank.enums.CARDTYPE;
import com.sunyard.directbank.enums.PAYTYPE;
import com.sunyard.directbank.enums.TRANSSTATE;
import com.sunyard.directbank.sumdata.dao.SumDataDao;
import com.sunyard.directbank.sumdata.service.ISumDataService;
import com.sunyard.directbank.tools.DateUtil;


@Transactional
@Service
public class SumDataService implements ISumDataService {
	@Resource
	private SumDataDao sumDataDao;

	@Override
	public boolean haveStatisticsToday(String flag) {
		int count = 0;
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("report_date", DateUtil.todayStr());
		if("TransAmt".equals(flag)){
			count = sumDataDao.haveStatisticsTodayForTransAmt(map);
		}else if("AmtList".equals(flag)){
			count = sumDataDao.haveStatisticsTodayForAmtList(map);
		}else if("EAccount".equals(flag)){
			count = sumDataDao.haveStatisticsTodayForEAccount(map);
		}
		
		if(count > 0){
			return true;
		}
		return false;
	}

	@Override
	public void generateTransAmtReport() {
		Map<String,Object> param = dateConditionParam();
		param.put("trade_state", TRANSSTATE.Success.getCode());
		param.put("pay_type", PAYTYPE.buy.getCode());
		
		List<Map<String,Object>> list = sumDataDao.getTransAmtList(param);
		if(!isEmptyList(list)){
			for(Map<String,Object> item : list){
				item.put("report_date", DateUtil.today());
			}
			sumDataDao.insertTransAmtBatch(list);
		}
		
	}
	
	@Override
	public void generateAmtListReport() {
		Map<String,Object> param = dateConditionParam();
		param.put("amt_type", AMTTYPE.Income.getCode());
		
		Map<String,Object> map = new HashMap<String,Object>();
		List<String> bankCardList = sumDataDao.bankCardList();
		
		List<Map<String,Object>> incomeList = sumDataDao.getTransAmtListList(param);
		calculateSumAmt(map, incomeList, true, bankCardList);
		
		param.put("amt_type", AMTTYPE.Expensive.getCode());
		List<Map<String,Object>> expensiveList = sumDataDao.getTransAmtListList(param);
		calculateSumAmt(map, expensiveList, false, bankCardList);
		
		BigDecimal bank_amt = ((BigDecimal)map.get("tot_in_amt")).subtract((BigDecimal)map.get("tot_out_amt"));
		map.put("bank_amt", bank_amt);
		map.put("report_date", DateUtil.today());
		if(isEmptyList(incomeList) && isEmptyList(expensiveList)){
			
		}else{
			sumDataDao.insertAmtList(map);
		}
	}
	
	private boolean isEmptyList(List<Map<String,Object>> list){
		if(list == null){
			return true;
		}else if(list.size() == 0){
			return true;
		}else{
			return false;
		}
	}
	private Map<String,Object> dateConditionParam(){
		Map<String,Object> param = new HashMap<String,Object>();
		String start_date = DateUtil.formatDateToStr(DateUtil.beforeDate(DateUtil.today(), 1));
		param.put("start_date", start_date);
		param.put("end_date", DateUtil.todayStr());
		param.put("batch_time", Consts.BATCH_TIME);
		return param;
	}
	
	
	private void calculateSumAmt(Map<String,Object> map,List<Map<String,Object>> list, boolean flag,List<String> bankCardList){
		BigDecimal sumAmt = BigDecimal.ZERO;
		BigDecimal sumMyBankAmt = BigDecimal.ZERO;
		for(Map<String,Object> item : list){
			String oppo_acc = (String)item.get("oppo_acc");
			if(hasContainBankCard(oppo_acc,bankCardList)){
				BigDecimal varAmt = (BigDecimal)item.get("amt");
				sumAmt = sumAmt.add(varAmt);
				if(isMyBankCard(oppo_acc)){
					sumMyBankAmt = sumMyBankAmt.add(varAmt);
				}
			}
		}
		
		if(flag){
			map.put("tot_in_amt", sumAmt);
			map.put("mybank_in_amt", sumMyBankAmt);
			map.put("othbank_in_amt", sumAmt.subtract(sumMyBankAmt));
		}else{
			map.put("tot_out_amt", sumAmt);
			map.put("mybank_out_amt", sumMyBankAmt);
			map.put("othbank_out_amt", sumAmt.subtract(sumMyBankAmt));
		}
		
	}
	
	private boolean isMyBankCard(String oppo_acc) {
		String bank_no = sumDataDao.loadBankNoById(oppo_acc);
		if(Consts.BANK_NO.equals(bank_no)){
			return true;
		}
		return false;
	}

	private boolean hasContainBankCard(String oppo_acc,List<String> bankCardList) {
		for(String item : bankCardList){
			if(oppo_acc.equals(item)){
				return true;
			}
		}
		return false;
	}

	@Override
	public void generateEAccountReport() {
		Map<String,Object> param = new HashMap<String,Object>();
		String start_date = DateUtil.formatDateToStr(DateUtil.beforeDate(DateUtil.today(), 1));
		param.put("start_date", start_date + " " + Consts.BATCH_TIME);
		param.put("end_date", DateUtil.todayStr() + " " + Consts.BATCH_TIME);
		
		List<Map<String,Object>> list = sumDataDao.getEAccountList(param);
		if(!isEmptyList(list)){
			Set<Object> eaccs = new HashSet<Object>();
			int mybank_num = 0;
			int othbank_num = 0;
			int mybank_card_num = 0;
			int othbank_card_num = 0;
			for(Map<String,Object> item : list){
				eaccs.add(item.get("eacc_no"));
				if(item.get("bank_no").toString().equals(Consts.BANK_NO)){
					mybank_card_num ++;
					if(item.get("card_type").toString().equals(CARDTYPE.WithDraw.getCode())){
						mybank_num ++;
					}
				}else{
					othbank_card_num++;
					if(item.get("card_type").toString().equals(CARDTYPE.WithDraw.getCode())){
						othbank_num ++;
					}
				}
			}
			
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("tot_num", eaccs.size());
			map.put("mybank_num", mybank_num);
			map.put("othbank_num", othbank_num);
			map.put("mybank_card_num", mybank_card_num);
			map.put("othbank_card_num", othbank_card_num);
			map.put("report_date", DateUtil.today());
			sumDataDao.insertEAccountList(map);
		}
	}
}
