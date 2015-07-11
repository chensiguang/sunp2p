package com.sunyard.directbank.voucher.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunyard.directbank.base.DDUtil;
import com.sunyard.directbank.base.SpringUtil;
import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.base.model.ListPage;
import com.sunyard.directbank.tools.DateUtil;
import com.sunyard.directbank.voucher.dao.VoucherDao;
import com.sunyard.directbank.voucher.model.VoucherModel;
import com.sunyard.directbank.voucher.service.IVoucherService;

@Transactional
@Service
public class VoucherService implements IVoucherService,Consts {
	@Resource
	private VoucherDao voucherDao;
	
	@Override
	public IListPage pageQuery(Map<String, Object> param, int pageNo)throws Exception {
		
		int pageSize = Consts.PAGE_SIZE;
		int total = voucherDao.pageCount(param);
		int start = (pageNo - 1) * pageSize;
		param.put("startRow", start);
		param.put("endRow", pageSize);
		List<VoucherModel> data = voucherDao.pageQuery(param);
		DDUtil cache = SpringUtil.getCache();
		for (int index = 0; index < data.size(); index++) {
		    VoucherModel obj = data.get(index);
			obj.setStatus(cache.getContent(VOUCHER_STATUS, obj.getStatus()));
			obj.setVoucher_type(cache.getContent(VOUCHER_TYPE, obj.getVoucher_type()));
			
		}
		return new ListPage(start, total, pageSize, data);
	}
	
	@Override
	public boolean add(VoucherModel model)throws Exception {
		model.setCreate_date(DateUtil.todayStr());
		return voucherDao.save(model);
	}
	
	@Override
	public boolean deleteBatch(List<String> strs)throws Exception {
		return voucherDao.deleteBatch(strs);
	
	}
	
	@Override
	public VoucherModel getById(String voucher_no) throws Exception {
		return voucherDao.getById(voucher_no);
	}
	
	@Override
	public boolean update(VoucherModel model) throws Exception {
		return voucherDao.update(model);
	}
	
	@Override
	public List<String> string2list(String detail) {
		List<String> strs = new ArrayList<String>();
		String [] str = detail.split(",");
		for(int i=0;i<str.length;i++){
			strs.add(str[i]);
		}
		return strs;
	}

}
