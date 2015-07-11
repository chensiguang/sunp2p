package com.sunyard.directbank.prod.service.impl;

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
import com.sunyard.directbank.enums.ISUSESTATE;
import com.sunyard.directbank.enums.PRODTYPE;
import com.sunyard.directbank.prod.dao.ProdInfoDao;
import com.sunyard.directbank.prod.model.ProdBaseInfo;
import com.sunyard.directbank.prod.model.ProdExtInfo;
import com.sunyard.directbank.prod.service.IProdInfoService;
import com.sunyard.directbank.tools.DateUtil;
import com.sunyard.directbank.tools.PrimaryGenerater;

@Transactional
@Service
public class ProdInfoService implements IProdInfoService, Consts {
	@Resource
	private ProdInfoDao prodInfoDao;

	@Override
	public IListPage pageQuery(Map<String, Object> param, int pageNo) throws Exception {
		int pageSize = Consts.PAGE_SIZE;

		int total = prodInfoDao.pageCount(param);

		int start = (pageNo - 1) * pageSize;
		param.put("startRow", new Integer(start));
		param.put("endRow", pageSize);

		List<ProdBaseInfo> data = prodInfoDao.pageQuery(param);

		DDUtil cache = (DDUtil) SpringUtil.getWebApplicationContext().getBean("dDUtil");
		for (int index = 0; index < data.size(); index++) {
			ProdBaseInfo obj = data.get(index);
			if (obj.getValue_date() != null) {// 日期格式化
				String value_date = DateUtil.ymd.format(obj.getValue_date());
				obj.setValue_date(java.sql.Date.valueOf(value_date));
			}
			if(obj.getExpire_date() != null){
				String expire_date = DateUtil.ymd.format(obj.getExpire_date());
				obj.setExpire_date(java.sql.Date.valueOf(expire_date));
			}
			obj.setProd_type(cache.getContent(PROD_TYPE, obj.getProd_type()));
			obj.setProd_state(cache.getContent(PROD_STATE, obj.getProd_state()));
			obj.setIssue_state(cache.getContent(ISSUE_STATE,obj.getIssue_state()));
		}
		return new ListPage(start, total, pageSize, data);
	}

	@Override
	public ProdBaseInfo loadprodInfoById(int prod_id) {
		return prodInfoDao.loadprodInfoById(prod_id);
	}

	@Override
	public ProdExtInfo loadProdExtById(String exp_id) {
		return prodInfoDao.loadProdExtById(exp_id);
	}

	@Override
	public boolean update(ProdBaseInfo prodInfo, ProdExtInfo prodExtInfo) {
		String sno = prodInfoDao.selectMaxExt();
		prodInfo.setIssue_state(ISUSESTATE.UnCheck.getCode());
		prodInfo.setRemain_limit(prodInfo.getTotal_limit());
		// 判断融资人的信息是否为空
		if (!("").equals(prodExtInfo.getBorrower_name())) {
			ProdBaseInfo prod = prodInfoDao.loadprodInfoById(prodInfo.getProd_id());
			if (prod.getExp_id() == null) {// 为空，修改后的产品类型为p2p，需插入新的数据
				sno = PrimaryGenerater.DEFAULT.generaterNextNumber(sno);
				prodExtInfo.setBorrower_id(sno);
				prodInfo.setExp_id(sno);
				prodInfoDao.update(prodInfo);
				prodInfoDao.insertExt(prodExtInfo);
				return true;
			} else {
				// 本来产品类型就是p2p，只需更新数据
				prodExtInfo.setBorrower_id(prod.getExp_id());
				prodInfo.setExp_id(prod.getExp_id());
				prodInfoDao.update(prodInfo);
				prodInfoDao.updateExt(prodExtInfo);
				return true;
			}
		} else {
			return prodInfoDao.update(prodInfo);// 贷款人的信息为空时，只更新产品表
		}
	}

	@Override
	public boolean deleteBatch(List<Integer> paramList) {
		List<String> extStr = new ArrayList<String>();
		for (int i = 0; i < paramList.size(); i++) {
			ProdBaseInfo prod = prodInfoDao.loadprodInfoById(paramList.get(i));// 要删除的产品
			String borrower_id = prod.getExp_id();
			if (prodInfoDao.loadProdExtById(borrower_id) != null) {// 是否关联扩展表
				extStr.add(borrower_id);
			}
		}
		if (extStr.size() != 0) {
			// 批量删除扩展表,产品表
			prodInfoDao.deleteExt(extStr);
			prodInfoDao.deleteBatch(paramList);
			return true;
		}
		return prodInfoDao.deleteBatch(paramList);
	}

	@Override
	public void check(ProdBaseInfo prodInfo) {
		prodInfoDao.updateIssueState(prodInfo);
	}
    
	@Override
	public void insert(ProdBaseInfo prodInfo, ProdExtInfo prodExtInfo) {
    	String sno = prodInfoDao.selectMaxExt();//查出扩展表中做大的id
    	// 判断产品类型是否为p2p网络贷款
		if (PRODTYPE.LoanP2p.getCode().equals(prodInfo.getProd_type())) {
			if (!("").equals(prodExtInfo.getBorrower_name())) {
				sno = PrimaryGenerater.DEFAULT.generaterNextNumber(sno);
				prodExtInfo.setBorrower_id(sno);
				prodInfo.setExp_id(sno);
				prodInfoDao.insert(prodInfo);
				prodInfoDao.insertExt(prodExtInfo);
			}
		} else {
			prodInfoDao.insert(prodInfo);
		}
	}

	@Override
	public List<String> getId(ProdBaseInfo prodInfo) {
	    return prodInfoDao.getId(prodInfo);
	}

	@Override
	public List<ProdBaseInfo> getProdInfoList(ProdBaseInfo prodInfo) {
		return prodInfoDao.getProdInfoList(prodInfo);
	}

}
