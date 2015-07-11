package com.sunyard.directbank.batchp2p.action;

import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.sunyard.directbank.base.BaseAction;
import com.sunyard.directbank.base.SpringUtil;
import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.batchp2p.model.BatchProdRepay;
import com.sunyard.directbank.batchp2p.service.IBatchP2pSerivce;
import com.sunyard.directbank.enums.REPAYMENTSTATUS;
import com.sunyard.directbank.tools.DateUtil;

@SuppressWarnings("rawtypes")
@Controller
@Scope("prototype")
public class BatchP2pAction extends BaseAction implements Consts{
	
	private static final long serialVersionUID = 1L;
	@Resource
	private IBatchP2pSerivce batchP2pSerivce;
	private BatchProdRepay prodRepayInfo;
	/*
	 * 还款信息录入
	 * */
	public String entryRepaymentInfo() throws Exception{
		BatchProdRepay p2pRepayInfo = new BatchProdRepay();
		p2pRepayInfo.setStatus(REPAYMENTSTATUS.NotPay.getCode());
		List<Map<String,Object>> resultList = batchP2pSerivce.getRepayDateEqualTodayAndNotPay(p2pRepayInfo);
		
		for(Map<String,Object> item : resultList){
			item.put("repay_date", DateUtil.formatDateToStr((Date)item.get("repay_date")));
			item.put("status", SpringUtil.getCache().getContent(REPAYMENT_STATUS,null == item.get("status")? "" : item.get("status").toString()));

		}
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("rstlist", resultList);
		return "query";
		
	}
	
	public String entryRepaymentSave(){
		prodRepayInfo.setStatus(REPAYMENTSTATUS.WaitingPay.getCode());
		if(prodRepayInfo.getReal_repay_date() == null){
			prodRepayInfo.setReal_repay_date(DateUtil.today());
		}
		batchP2pSerivce.entryRepayment(prodRepayInfo);
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("msg", "还款成功！");
		return Consts.SUCCESS;
	}

	public BatchProdRepay getProdRepayInfo() {
		return prodRepayInfo;
	}

	public void setProdRepayInfo(BatchProdRepay prodRepayInfo) {
		this.prodRepayInfo = prodRepayInfo;
	}

	
}
