package com.sunyard.directbank.batchp2p.action;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.batchp2p.service.IP2pEstablishSerivce;
import com.sunyard.directbank.enums.ISUSESTATE;
import com.sunyard.directbank.enums.PRODSTATE;
import com.sunyard.directbank.enums.VALUETYPE;
import com.sunyard.directbank.prod.model.ProdBaseInfo;
import com.sunyard.directbank.productInfo.service.IProductInfoSerivce;
import com.sunyard.directbank.tools.DateUtil;

@Controller
@Scope("prototype")
public class P2pEstablishAction {
	
	@Resource
	private IP2pEstablishSerivce p2pEstablishSerivce;
	@Resource
	private IProductInfoSerivce productInfoService;
	/*
	 * p2p产品成立
	 * 
	 * */
	public String establish(){
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("value_type_full", VALUETYPE.FullValue.getCode());
		param.put("remain_limit", BigDecimal.ZERO);
		param.put("value_type_date", VALUETYPE.DateValue.getCode());
		param.put("prod_state", PRODSTATE.P2pRecruitment.getCode());
		param.put("issue_state", ISUSESTATE.CheckPas.getCode());
		param.put("saled_limit", BigDecimal.ZERO);
		
		List<ProdBaseInfo> prodList = productInfoService.getProducts(param);
		if(prodList != null && prodList.size()>0){
			for(ProdBaseInfo prod : prodList){
				Date value_date = prod.getValue_date();
				if(value_date == null ||value_date.equals(DateUtil.today()) ){
					p2pEstablishSerivce.establishedProduct(prod); 
				}
			}
		}
		return Consts.SUCCESS;
	}
	
}
