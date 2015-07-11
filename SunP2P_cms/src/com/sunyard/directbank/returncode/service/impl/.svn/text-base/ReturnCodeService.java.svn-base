package com.sunyard.directbank.returncode.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.base.model.ListPage;
import com.sunyard.directbank.returncode.dao.ReturnCodeDao;
import com.sunyard.directbank.returncode.model.ReturnCode;
import com.sunyard.directbank.returncode.service.IReturnCodeService;

@Service
@Transactional
public class ReturnCodeService implements IReturnCodeService{
    @Resource
	private ReturnCodeDao returnCodeDao;
	
	@Override
	public List<ReturnCode> select(String return_code, String return_msg) throws Exception {
		return returnCodeDao.select(return_code, return_msg);
	}

	@Override
	public IListPage pageQuery(Map<String, Object> param, int pageNo){
	int pageSize = Consts.PAGE_SIZE;
	
	int total = returnCodeDao.pageCount(param);
	
	int start = (pageNo - 1) * pageSize;
	param.put("startRow", new Integer(start));
	param.put("endRow", pageSize);
	
	List<ReturnCode> data = returnCodeDao.pageQuery(param);
     
	return new ListPage(start, total, pageSize, data);

	}

	@Override
	public ReturnCode loadRCodeById(String return_code) {
		return returnCodeDao.loadRCodeById(return_code);
	}

	@Override
	public void insert(ReturnCode returnCode) {
		returnCodeDao.insert(returnCode);
	}
	public boolean update(ReturnCode returnCode) {
		return returnCodeDao.update(returnCode);
	}

	@Override
	public boolean deleteBatch(List<String> paramList) {
		return returnCodeDao.deleteBatch(paramList);
	}

}
