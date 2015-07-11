package com.sunyard.directbank.dict.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.sunyard.directbank.base.BaseAction;
import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.common.business.IDDMng;
import com.sunyard.directbank.dict.service.IDictInfoSerivce;
import com.sunyard.directbank.tools.ParamUtil;
import com.sunyard.directbank.tools.StringUtil;

@SuppressWarnings("rawtypes")
@Controller
@Scope("prototype")
public class DictInfoAction extends BaseAction {
	
	private static final long serialVersionUID = 1L;
	private Logger logger = Logger.getLogger(DictInfoAction.class);
	@Resource
	private IDictInfoSerivce dictInfoSerivce;
	@Resource
	private IDDMng ddMng;
	/*
	 * 查询
	 * 
	 * */
	public String toQuery() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		Map<String,Object> param = ParamUtil.param2Map(request);
		
		logger.info("查询参数=" + param);
		int pageNo = ParamUtil.getInt(request, "pageNo", 1);
		
		IListPage page = dictInfoSerivce.pageQuery(param,pageNo); 
		logger.info("page="+ page.getResult());
		
		request.setAttribute("page", page);
		request.setAttribute("param", param);
		
		return "query";
	}
	
	/*
	 * 跳转到添加页面
	 * */
	public String toAdd() {
		return "add";
	}
	
	/*
	 * 新增功能   先校验数据库是否存在；在进行批量添加
	 * 
	 * */
	public String add() throws Exception{
		boolean hasDict = false;
		String errMsg = "";
		HttpServletRequest request = ServletActionContext.getRequest();
		Map<String,Object> param = ParamUtil.param2Map(request);
		logger.info("查询参数=" + param);

		
		String val_str = (String)StringUtil.getMapValue(param, "val_str");
		String dict_desc_str = (String)StringUtil.getMapValue(param, "dict_desc_str");
		String sun_key = (String)StringUtil.getMapValue(param, "sun_key");
		
		if(StringUtil.isEmpty(val_str) || StringUtil.isEmpty(dict_desc_str)){
			errMsg = "输入的值和说明不能为空！";
		}else{
			String[] valArr = val_str.substring(0, val_str.length()-1).split(",");
			String[] descArr = dict_desc_str.substring(0, dict_desc_str.length()-1).split(",");
			
			List<Map<String,Object>> list4DB = dictInfoSerivce.getDictListByKey(param);
			
			List<Map<String,Object>> insertList = new ArrayList<Map<String,Object>>();
			Set<String> valset = new HashSet<String>();
			
			for(int i=0;i<valArr.length;i++){
				hasDict = ParamUtil.containsKey(list4DB, "val", valArr[i]);
				if(hasDict){
					break;
				}
				valset.add(valArr[i]);
				
				Map<String,Object> item = new HashMap<String,Object>();
				item.put("sun_key", sun_key);
				item.put("val", valArr[i]);
				item.put("dict_desc", descArr[i]);
				insertList.add(item);
			}
			
			if(hasDict){
				request.setAttribute("msg", "当前插入的值已存在，请重新输入！");
				return Consts.ERROR;
			}
			
			if(valset.size() < valArr.length){
				request.setAttribute("msg", "当前输入值有重复，请确认！");
				return Consts.ERROR;
			}
			
			dictInfoSerivce.add(param,insertList);
			clearDictFromCache(param);
			request.setAttribute("msg", "数据字典添加成功！");
			return Consts.SUCCESS;
		}
		
		request.setAttribute("msg", errMsg);
		return Consts.ERROR;
		
	}
	
	/*
	 * 跳转到修改页面
	 * */
	public String toModi(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String paraStr = request.getParameter("selectedItemStr");
		logger.info("要修改的参数=" + paraStr);
		
		if(!StringUtil.isEmpty(paraStr)){
			String[] paraArr = StringUtil.toArr(paraStr);
			Map<String,Object> paraMap = new HashMap<String,Object>();
			paraMap.put("sun_key", paraArr[0]);
			paraMap.put("val", paraArr[1]);
			logger.info("请求参数map：" + paraMap);
			
			Map<String,Object> rst = dictInfoSerivce.show2Modi(paraMap);
			
			logger.info("响应报文：" + rst);
			request.setAttribute("rst", rst);
			return "modi";
		}
		return Consts.ERROR;
	}
	
	/*
	 * 修改
	 * 
	 * */
	public String modi() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		Map<String,Object> param = ParamUtil.param2Map(request);
		logger.info("请求参数=" + param);
		dictInfoSerivce.update(param);
		clearDictFromCache(param);
		clearSpecDictFromCache(param);
		request.setAttribute("msg", "数据字典修改成功！");
		return Consts.SUCCESS;
	}
	
	
	/*
	 * 删除
	 * */
	public String delete() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		String paraStr = request.getParameter("selectedItemStr");
		logger.info("参数=" + paraStr);
		
		if(!StringUtil.isEmpty(paraStr)){
			String[] paraArr = StringUtil.toArr(paraStr, "&");
			List<Map<String,Object>> paraList = new ArrayList<Map<String,Object>>();
			Set<String> keySet = new HashSet<String>();
			
			for(int i=0; i<paraArr.length; i++){
				Map<String,Object> itemMap = new HashMap<String,Object>();
				String[] itemArr = StringUtil.toArr(paraArr[i]);
				keySet.add(itemArr[0]);
				itemMap.put("sun_key", itemArr[0]);
				itemMap.put("val", itemArr[1]);
				paraList.add(itemMap);
			}
			
			dictInfoSerivce.deleteBatch(paraList,keySet);
			for(Map<String, Object> item : paraList){
				clearSpecDictFromCache(item);
				clearDictFromCache(item);
			}
			
			request.setAttribute("msg", "数据字典删除成功！");
			return Consts.SUCCESS;
		}
		request.setAttribute("msg", "删除中发生错误了！请重试");
		return Consts.ERROR;
	}
	
	private void clearSpecDictFromCache(Map<String,Object> param) throws Exception{
		ddMng.clearDDContentSpecFromCache((String)param.get("sun_key"), (String)param.get("val"));
	}
	
	private void clearDictFromCache(Map<String,Object> param) throws Exception{
		ddMng.clearSysFromCache((String)param.get("sun_key"));
	}
	@Override
	protected String getModuleName() {
		return "数据字典设置";
	}
	
}
