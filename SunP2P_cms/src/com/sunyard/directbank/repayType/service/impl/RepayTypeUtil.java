package com.sunyard.directbank.repayType.service.impl;

import com.sunyard.directbank.base.Exception.DBException;
import com.sunyard.directbank.enums.REPAYTYPE;
import com.sunyard.directbank.prod.model.ProdBaseInfo;
import com.sunyard.directbank.repayType.service.IRepayType;
 

public final class RepayTypeUtil {

	public static IRepayType getProdRepayType(ProdBaseInfo prod){
		String repay_type = prod.getRepay_type();
		if(repay_type.equals(REPAYTYPE.InterestMaturityM.getCode())){
			return new MonthlyInterestMaturityReply(prod);
		}else if(repay_type.equals(REPAYTYPE.Disposable.getCode())){
			return new DisposableReply(prod);
		}else{
			throw new DBException("目前不支持该产品还款方式！");
		}
	}
}
