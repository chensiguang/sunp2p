package com.sunyard.directbank.mujifailed.action;

import java.util.Arrays;
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
import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.mujifailed.service.IMujiFailedService;


@SuppressWarnings("rawtypes")
@Controller
@Scope("prototype")
public class MujiFailedAction extends BaseAction {

	@Resource
	private IMujiFailedService iMujiFailedService;
	private static final long serialVersionUID = 6094100254838370397L;
	HttpServletRequest request = ServletActionContext.getRequest();
	private Logger logger = Logger.getLogger(MujiFailedAction.class);

	/**
	 * 进入主页面
	 * @return
	 * @throws Exception
	 */
	public String mujiUI() throws Exception {
		return "mujiUI";
	}
	
	/**
	 * 查询募集信息
	 * @return
	 * @throws Exception
	 */
	public String selectMuji() throws Exception {
		
		String prodid = request.getParameter("prod_id");
		Map<String, Object> muji = iMujiFailedService.getById(Integer.parseInt(prodid));
		request.setAttribute("param", prodid);
		request.setAttribute("muji", muji);
		return "mujiUI";
	}
	
	/**
	 * 强制产品募集失败
	 * @return
	 * @throws Exception
	 */
	public String mujiFailed() throws Exception {
		
		String prodid = request.getParameter("prod_id");
		String muji = request.getParameter("muji");
		if(muji == null || muji.isEmpty()) {
			request.setAttribute("msg", "该产品不在募集期不能强制产品募集失败！");
			return Consts.ERROR;
		}else {
			muji = muji.replaceAll(" ", "");
			String[] strs = muji.split(",");
			List<String> lists = Arrays.asList(strs);
			Map<String, String> map = new HashMap<String, String>();
			for(String str : lists) {
				String[] s = str.split("=");
				List<String> list = Arrays.asList(s);
				map.put(list.get(0), list.get(1));
			}
			logger.info("强制产品募集失败开始，prod_id= " + prodid);
			iMujiFailedService.mujiFailed(Integer.parseInt(prodid), map.get("debit_account"));
			request.setAttribute("msg", "强制产品募集失败执行成功！");
			
			return Consts.SYSSUCCESS;
		}
	}

	@Override
	protected String getModuleName() throws Exception {
		return "强制产品募集失败";
	}
	
}
