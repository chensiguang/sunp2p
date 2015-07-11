package com.sunyard.directbank.base.action;

import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import com.sunyard.directbank.base.BaseAction;
import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.base.service.IBaseService;
import com.sunyard.directbank.enums.REPORTTYPE;
import com.sunyard.directbank.tools.DateUtil;
import com.sunyard.directbank.tools.ParamUtil;

@SuppressWarnings("rawtypes")
public class ReportAction extends BaseAction implements Consts {

	private static final long serialVersionUID = 4050332470927784381L;
	private Logger logger = Logger.getLogger(ReportAction.class);
	
	/*
	 * 分页查询
	 * */
	protected void pageQuery(IBaseService baseService) throws Exception{
		this.pageQuery(baseService, null, null, "");
	}
	
	protected void pageQuery(IBaseService baseService,String[] constsArr, String[] columnArr) throws Exception{
		this.pageQuery(baseService, constsArr, columnArr, "");
	}
	
	@SuppressWarnings("unchecked")
	protected void pageQuery(IBaseService baseService,String[] constsArr, String[] columnArr, String date_type) throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		Map<String,Object> param = this.paramToMap(request, date_type);	
		int pageNo = ParamUtil.getInt(request, "pageNo", 1);
		
		IListPage page ;
		if("".equals(date_type)){
			page = baseService.pageQuery(param,pageNo);
		}else{
			page = baseService.pageQuery(param,pageNo,date_type);
		}
		List<Map<String,Object>> infoList = (List<Map<String, Object>>) page.getResult();
		resultProcess(infoList, constsArr, columnArr);
		page.setResult(infoList);
		logger.info("page="+ page.getResult());
		
		request.setAttribute("page", page);
	}
	
	/*
	 * 数据导入Excel
	 * */
	
	protected void fixedAssets(IBaseService baseService,String[] titleArr, String[] colNameArr,String fileName) throws Exception{
		this.fixedAssets(baseService, null, null, titleArr, colNameArr, fileName, "");
	}
	
	protected void fixedAssets(IBaseService baseService,String[] constsArr, String[] columnArr,String[] titleArr, String[] colNameArr,String fileName) throws Exception{
		this.fixedAssets(baseService, constsArr, columnArr, titleArr, colNameArr, fileName, "");
	}
	
	protected void fixedAssets(IBaseService baseService,String[] constsArr, String[] columnArr,String[] titleArr, 
			String[] colNameArr,String fileName, String date_type) throws Exception{
		
		HttpServletRequest request = ServletActionContext.getRequest();
		
		Map<String,Object> param = paramToMap(request, date_type);
		
		List<Map<String,Object>> infoList = new ArrayList<Map<String,Object>>();
		if("".equals(date_type)){
			infoList = baseService.selectList(param);
		}else{
			infoList = baseService.selectList(param, date_type);
			if(REPORTTYPE.Day.getCode().equals(date_type)){
				titleArr[0] = "统计日期";
			}else if(REPORTTYPE.Month.getCode().equals(date_type)){
				titleArr[0] = "统计月份";
			}else if(REPORTTYPE.Year.getCode().equals(date_type)){
				titleArr[0] = "统计年份";
			}
		}
				
		resultProcess(infoList, constsArr, columnArr);
		
		dataToExcel(infoList, titleArr, colNameArr,fileName);
	}
	
	/*
	 * 借助poi把数据下载到excel中
	 * 
	 * */
	protected void dataToExcel(List<Map<String,Object>> infoList, String[] titleArr, String[] colNameArr,String fileName) throws Exception{
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet(fileName);
		sheet.setDefaultColumnWidth(EXCEL_LEN);
		HSSFRow row = sheet.createRow(0);
		
		HSSFCell hfc = null;
		setCellValue(row,hfc,titleArr,null);//生成标题头
		
		for (int i = 1; i <= infoList.size(); i++) {
			row = sheet.createRow(i);
			Map<String,Object> item = infoList.get(i - 1);
			setCellValue(row,hfc,colNameArr,item);
		}
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		OutputStream out = response.getOutputStream();
		fileName = fileName + ".xls";
		response.setHeader("Content-disposition", "attachment;filename=" + new String( fileName.getBytes("UTF-8"), "ISO8859-1" ) );
		response.setContentType("application/msexcel;charset=UTF-8");
	    workbook.write(out);
	    out.close();
	}
	/*
	 * 对一行的单元格赋值
	 * 
	 * */
	private void setCellValue(HSSFRow row, HSSFCell hfc, String[] arr , Map<String,Object> item ){
		for(int j=0; j<arr.length; j++){
			hfc = row.createCell(j);
			if(item == null){
				hfc.setCellValue(arr[j]);
			}else{
				hfc.setCellValue(null == item.get(arr[j])? "" : item.get(arr[j]).toString());
			}
			
		}
	}
	 
	/*
	 * 请求参数转换到Map中；
	 * date_type为空时是默认时间间隔，不为空时是报表类型（分为日报、月报、年报）;
	 * 
	 * */
	protected Map<String,Object> paramToMap(HttpServletRequest request, String date_type){		
		Map<String,Object> param = ParamUtil.param2Map(request);
		
		String beginTime= (String)param.get("start_time");
		String endTime = (String)param.get("end_time");
		if((beginTime == null || "".equals(beginTime)) && (endTime == null || "".equals(endTime))) {
			logger.info("配置文件中常量=" + MONTH_INV + DATE_FORMATTER);
			endTime = DateUtil.todayStr();
			if("".equals(date_type)){
				beginTime = DateUtil.getMonth();
			}else if(REPORTTYPE.Day.getCode().equals(date_type)){
				beginTime = DateUtil.todayStr();
			}else if(REPORTTYPE.Month.getCode().equals(date_type)){
				beginTime = DateUtil.getMonthFirstDay();
			}else if(REPORTTYPE.Year.getCode().equals(date_type)){
				beginTime = DateUtil.getCurrYearFirst();
			}
			param.put("start_time", beginTime);
			param.put("end_time", endTime);
		}
		
		AddExtraParamToMap(param);
		logger.info("查询参数=" + param);
		request.setAttribute("para", param);
		request.setAttribute("month_inv", MONTH_INV);
		return param;
	}
	
	protected void AddExtraParamToMap(Map<String, Object> param) {
	}

	/*
	 * 对一些字段进行翻译
	 *
	 * */
	@SuppressWarnings("unchecked")
	protected void resultProcess(List<Map<String,Object>> infoList,String[] constsArr, String[] columnArr) throws Exception{		
		resultSpecProcess(infoList);
		resultBaseProcess(infoList, constsArr, columnArr);
	}

	protected void resultSpecProcess(List<Map<String, Object>> infoList) {
	}
	
	/*
	 * 统计功能默认的报表类型（月报）
	 *
	 * */
	protected String defaultDateType(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String date_type = request.getParameter("report_type");
		if("".equals(date_type) || date_type == null){
			date_type = REPORTTYPE.Month.getCode();
			request.setAttribute("defult_report_type", date_type);
		}
		return date_type;
	}
}
