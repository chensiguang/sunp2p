package com.sunyard.directbank.batchdate.action;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.sunyard.directbank.base.BaseAction;
import com.sunyard.directbank.base.SpringUtil;
import com.sunyard.directbank.base.Exception.DateNullException;
import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.batchdate.service.IBatchDateSerivce;
import com.sunyard.directbank.enums.BATCHADDTYPE;
import com.sunyard.directbank.enums.BATCHDATETYPE;
import com.sunyard.directbank.tools.DateUtil;
import com.sunyard.directbank.tools.ParamUtil;
import com.sunyard.directbank.tools.StringUtil;

@SuppressWarnings("rawtypes")
@Controller
@Scope("prototype")
public class BatchDateAction extends BaseAction implements Consts{
	
	private static final long serialVersionUID = 1L;
	private Logger logger = Logger.getLogger(BatchDateAction.class);
	@Resource
	private IBatchDateSerivce batchDateSerivce;
	
	private List<String> initParam = new ArrayList<String>();
	/*
	 * 查询
	 * 
	 * */
	@SuppressWarnings("unchecked")
	public String toQuery() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		Map<String,Object> param = ParamUtil.param2Map(request);
		String[] paramArr = {BATCHDATE_TYPE,PROD_TYPE};
		String[] columnArr = {"batchdate_type","prod_type"};
		
		logger.info("查询参数=" + param);
		int pageNo = ParamUtil.getInt(request, "pageNo", 1);
		
		IListPage page = batchDateSerivce.pageQuery(param,pageNo); 
		List<Map<String,Object>> data = (List<Map<String, Object>>) page.getResult();
		page.setResult(resultProcess(data,paramArr,columnArr));
		
		request.setAttribute("page", page);
		request.setAttribute("param", param);
		
		getDirtMap(paramArr);
		
		return "query";
	}
	
	private List<Map<String,Object>> resultProcess(List<Map<String,Object>> infoList,String[] constsArr, String[] columnArr) throws Exception{
		if(columnArr != null && columnArr.length>0){
			for(int index=0; index<infoList.size(); index++){
				Map<String,Object> item = infoList.get(index);
				for(int i=0; i<columnArr.length; i++){
					item.put(columnArr[i]+"_name", SpringUtil.getCache().getContent(constsArr[i],null == item.get(columnArr[i])? "" : item.get(columnArr[i]).toString()));
				}
			}
		}
		
		logger.info("满足查询条件个数="+ infoList.size());
		logger.info("查询结果=" + infoList);
		return infoList;
	}
	/*
	 * 跳转到添加页面
	 * */
	public String toAdd() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		Map<String,Object> para = ParamUtil.param2Map(request);
		logger.info("查询参数=" + para);
		
		String batchdate_type = (String)StringUtil.getMapValue(para, "batchdate_type");
		String prod_type = (String)StringUtil.getMapValue(para, "prod_type");
		String prod_id = (String)StringUtil.getMapValue(para, "prod_id");
		if(StringUtil.isEmpty(batchdate_type) && StringUtil.isEmpty(prod_type) && StringUtil.isEmpty(prod_id)){
			
		}else{
			Map<String,Object> rst = batchDateSerivce.loadOverViewByPK(para);
			logger.info("响应报文：" + rst);
			request.setAttribute("rst", rst);
		}
		
		String[] paramArr = {BATCHDATE_TYPE,PROD_TYPE,BATCH_ADD};
		getDirtMap(paramArr);
		return "add";
	}
	
	/*
	 * 新增功能   先校验数据库是否存在；在进行批量添加
	 * 
	 * */
	
	public String add() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		Map<String,Object> param = ParamUtil.param2Map(request);
		logger.info("查询参数=" + param);
		
		initProdInfoByBatchType(param);
		initBatchTimeByDefulat(param);
		
		String[] beginAndEndDateArr = StringUtil.toArr(generateStartAndEndDateByBatchType(param));
		String beginDate = beginAndEndDateArr[0];
		String endDate = beginAndEndDateArr[1];
		
		List<Date> datelist = getInsertBatchDateList(param,beginDate,endDate);
		List<Map<String,Object>> insertParamList = generateParamList(datelist, param);
		
		batchDateSerivce.insertBatch(insertParamList,param);
		request.setAttribute("msg", "清算日批量保存成功！");
		return Consts.SUCCESS;
		
	}
	
	private void initProdInfoByBatchType(Map<String,Object> param){
		String batchdate_type = (String)StringUtil.getMapValue(param, "batchdate_type");
		if(batchdate_type.equals(BATCHDATETYPE.SysType.getCode())){
			initParam.add("prod_id");
			initParam.add("prod_type");
		}else if(batchdate_type.equals(BATCHDATETYPE.ProdType.getCode())){
			initParam.add("prod_id");
		}else {
			initParam.add("prod_type");
		}
		
		initParamterToDefault(param,null);
	}
	
	private void initBatchTimeByDefulat(Map<String,Object> param){
		String batch_time = (String)StringUtil.getMapValue(param, "batch_time");
		if(StringUtil.isEmpty(batch_time)){
			initParam.add("batch_time");
			initParamterToDefault(param,BATCH_TIME);
		}
	}
	
	private List<Map<String,Object>> generateParamList(List<Date> datelist,Map<String, Object> param) {
		List<Map<String,Object>> paralist = new ArrayList<Map<String,Object>>();
		for(Date batch_date : datelist){
			Map<String,Object> map = new HashMap<String,Object>();
			map.putAll(param);
			map.put("batch_date", batch_date);
			map.put("status", "");
			paralist.add(map);
		}
		
		logger.info("参数列表paralist=" + paralist );
		return paralist;
	}
	
	private void initParamterToDefault(Map<String,Object> param,Object value){
		for(String index : initParam){
			param.put(index, value);
		}
		initParam.clear();
	}
	
	private String generateStartAndEndDateByBatchType(Map<String, Object> param) {
		String beginDate = "";
		String endDate = "";
		String batch_add_type = (String)StringUtil.getMapValue(param, "batch_add");
		if(batch_add_type.equals(BATCHADDTYPE.YearType.getCode())){
			
			String choose_year = (String)StringUtil.getMapValue(param, "choose_year");
			if(StringUtil.isEmpty(choose_year)){
				throw new DateNullException("日期不能为空！");
			}
			beginDate = DateUtil.getYearFirst(Integer.parseInt(choose_year));
			endDate = DateUtil.getYearLast(Integer.parseInt(choose_year));
			
			initParam.add("month_start");
			initParam.add("month_end");
			initParam.add("date_start");
			initParam.add("date_end");
		}else if(batch_add_type.equals(BATCHADDTYPE.MonthType.getCode())){
			
			String month_start = (String)StringUtil.getMapValue(param, "month_start");
			String month_end = (String)StringUtil.getMapValue(param, "month_end");
			if(StringUtil.isEmpty(month_start)|| StringUtil.isEmpty(month_end)){
				throw new DateNullException("日期不能为空！");
			}
			String[] month_end_arr = StringUtil.toArr(month_end, "-");
			beginDate = month_start + "-01";
			endDate = DateUtil.getMonthLastDate(Integer.parseInt(month_end_arr[0]),Integer.parseInt(month_end_arr[1]),"-");
			
			initParam.add("choose_year");
			initParam.add("date_start");
			initParam.add("date_end");
		}else if(batch_add_type.equals(BATCHADDTYPE.DateType.getCode())){
			beginDate = (String)StringUtil.getMapValue(param, "date_start");
			endDate = (String)StringUtil.getMapValue(param, "date_end");
			initParam.add("choose_year");
			initParam.add("month_start");
			initParam.add("month_end");
		}
		
		
		if(StringUtil.isEmpty(beginDate) || StringUtil.isEmpty(endDate)){
			throw new DateNullException("日期不能为空！");
		}
		
		initParamterToDefault(param,null);
		
		logger.info("日期范围=" + beginDate + " - " + endDate);
		
		return beginDate + "," + endDate;
	}

	private List<Date> getInsertBatchDateList(Map<String,Object> param, String beginDate, String endDate) throws ParseException{
		List<Date> datelist = new ArrayList<Date>();
		String spec_date = (String)StringUtil.getMapValue(param, "spec_date");
		String not_batch_date = (String)StringUtil.getMapValue(param, "not_batch_date");
		
		if(!StringUtil.isEmpty(spec_date)){
			datelist.addAll(generateDateListByGivingArr(spec_date,beginDate,endDate));
		}
		
		if(datelist.size() == 0){
			datelist.add(DateUtil.parseDate(beginDate));
			int daysBetween = DateUtil.daysBetween(beginDate, endDate);
			for(int i=1; i<=daysBetween; i++){
				datelist.add(DateUtil.laterDate(DateUtil.parseDate(beginDate), i));
			}
		}
		
		if(!StringUtil.isEmpty(not_batch_date)){
			datelist.removeAll(generateDateListByGivingArr(not_batch_date,beginDate,endDate));
		}
		
		logger.info("最终清算日期集合=" + datelist);
		return datelist;
	}
	
	
	private List<Date> generateDateListByGivingArr(String datestr,String beginDate, String endDate) throws ParseException{
		String[] dateArr = StringUtil.toArr(datestr, ";");
		List<String> monthlist = DateUtil.getMonthBetween(beginDate, endDate);
		List<Date> generateDateList = new ArrayList<Date>(); 
		for(int i=0; i<dateArr.length;i++){
			String item = dateArr[i];
			if(item.length() > 7){
				String[] arr = StringUtil.toArr(item,"-");
				item = arr[0] + "-" + StringUtil.lpadString(arr[1], 2, "0") + "-" + StringUtil.lpadString(arr[2], 2, "0");
				generateDateList.add(DateUtil.parseDate(item));
			}else{
				item = StringUtil.lpadString(item, 2, "0");
				for(String month : monthlist){
					String newDate = month + "-" + item;
					generateDateList.add(DateUtil.parseDate(newDate));
				}
			}
		}
		
		return generateDateList;
	}
	
	@Override
	protected String getModuleName() {
		return "产品清算日管理";
	}
	
}
