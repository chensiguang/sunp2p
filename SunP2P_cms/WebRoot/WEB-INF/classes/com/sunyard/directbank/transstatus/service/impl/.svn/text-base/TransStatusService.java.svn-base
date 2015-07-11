package com.sunyard.directbank.transstatus.service.impl;

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
import com.sunyard.directbank.transstatus.dao.TransStatusDao;
import com.sunyard.directbank.transstatus.model.TransStatus;
import com.sunyard.directbank.transstatus.service.ITransStatusService;

@Transactional
@Service
public class TransStatusService implements ITransStatusService, Consts {
	@Resource
	private TransStatusDao transStatusDao;

	@Override
	public IListPage pageQuery(Map<String, Object> param, int pageNo)
			throws Exception {
		int pageSize = PAGE_SIZE;
		int total = transStatusDao.pageCount(param);
		int start = (pageNo - 1) * pageSize;
		param.put("startRow", start);
		param.put("endRow", pageSize);
		List<TransStatus> data = transStatusDao.pageQuery(param);
		DDUtil cache = SpringUtil.getCache();
		for (int index = 0; index < data.size(); index++) {
			TransStatus trs = data.get(index);
			trs.setStatus(cache.getContent(ENABLE_FLAG, trs.getStatus()));
			trs.setEnable_flag(cache.getContent(ENABLE_FLAG, trs.getEnable_flag()));
		}
		return new ListPage(start, total, pageSize, data);
	}

	@Override
	public boolean deleteBatch(List<TransStatus> list) throws Exception {
		for (TransStatus transStatus : list) {
			transStatusDao.delete(transStatus);
		}
		return true;
	}

	@Override
	public boolean add(TransStatus map) throws Exception {
		return transStatusDao.save(map);
	}

	@Override
	public TransStatus findByKey(TransStatus transStatus) throws Exception {
		return transStatusDao.findByKey(transStatus);
	}

	@Override
	public boolean update(TransStatus map) throws Exception {
		return transStatusDao.update(map);
	}

	@Override
	public TransStatus string2Model(String str) {
		TransStatus transStatus = new TransStatus();
		String[] strs = str.split("/");
		transStatus.setProd_type(strs[0].trim());
		transStatus.setProd_id(strs[1].trim());
		transStatus.setTrans_code(strs[2].trim());
		return transStatus;
	}

	@Override
	public List<TransStatus> string2List(String detail) {
		String[] strs = detail.split(",");
		List<TransStatus> list = new ArrayList<TransStatus>();
		for (int i = 0; i < strs.length; i++) {
			TransStatus t = string2Model(strs[i]);
			list.add(t);
		}
		return list;
	}
}
