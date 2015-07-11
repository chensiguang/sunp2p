package com.sunyard.directbank.userapprove.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface UserApproveDao {

	public int pageCount(Map<String, Object> param);

	public List<Map<String, Object>> pageQuery(Map<String, Object> param);

	public Map<String, Object> getById(String eacc_no);

	public boolean updateAccInfo(Map<String, Object> param);

	public Map<String, Object> selectComActive(@Param("trans_id") String trans_id, @Param("enable_flag") String enable_flag);

	public void updateAccAmt(Map<String, Object> active);

	public void insertScoreList(Map<String, Object> active);

	public void insertAmtList(Map<String, Object> active);

	public void insertVoucherInfo(Map<String, Object> active);

	public void insertAccList(Map<String, Object> param);

}
