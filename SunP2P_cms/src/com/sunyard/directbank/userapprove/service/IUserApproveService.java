package com.sunyard.directbank.userapprove.service;

import java.util.Map;

import com.sunyard.directbank.base.model.ListPage;

public interface IUserApproveService {

	public ListPage pageQuery(Map<String, Object> param, int pageNo) throws Exception;

	public Map<String, Object> getById(String eacc_no) throws Exception;

	public boolean updateAccInfo(Map<String, Object> param) throws Exception;

	public boolean userApproved(Map<String, Object> param) throws Exception;

}
