package com.sunyard.directbank.returncode.action;

import java.util.ArrayList;
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
import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.returncode.model.ReturnCode;
import com.sunyard.directbank.returncode.service.IReturnCodeService;
import com.sunyard.directbank.tools.ParamUtil;

@Controller
@Scope("prototype")
public class ReturnCodeAction extends BaseAction<ReturnCode>{
	private static final long serialVersionUID = 1L;
    private Logger logger = Logger.getLogger(ReturnCodeAction.class);
    HttpServletRequest request = ServletActionContext.getRequest();
	
    private ReturnCode returnCode;
    @Resource
    private IReturnCodeService returnCodeService;
    
    public String toQuery() throws Exception{
    	Map<String, Object> param = ParamUtil.transBean2Map(returnCode);// model参数转换为map用于后面添加分页参数起始位置，pageSize
		if (param == null) {
			param = new HashMap<String, Object>();
		}
		logger.info("bean2map=" + param);

		int pageNo = ParamUtil.getInt(request, "pageNo", 1);

		IListPage page = returnCodeService.pageQuery(param, pageNo);
		logger.info("page=" + page.getResult());

		request.setAttribute("page", page);
    	
    	return "query";
    }
    public String toAdd(){
    	return "add";
    }
    
    public String add(){
    	logger.info("returnCode="+returnCode);
    	if(returnCode.getReturn_code() == null){
    		request.setAttribute("msg", "返回码为空");
    		return Consts.ERROR;
    	}
    	if(returnCode.getReturn_msg() == null){
    		request.setAttribute("msg", "返回信息为空");
    		return Consts.ERROR;
    	}
    	
    	if(returnCodeService.loadRCodeById(returnCode.getReturn_code()) != null){
    		request.setAttribute("msg", "该返回码已存在");
    		return Consts.ERROR;
    	}
    	
    	returnCodeService.insert(returnCode);
    	request.setAttribute("msg", "添加成功");
		return "syssuccess";
    }
     
    public String toModi(){
    	String return_code = request.getParameter("return_code");
    	ReturnCode code = returnCodeService.loadRCodeById(return_code);
    	request.setAttribute("code", code);
    	return "modi";
    }
    
    public String modi(){
    	if(returnCode.getReturn_msg() == null){
    		request.setAttribute("msg", "返回信息不能为空");
    		return Consts.ERROR;
    	}
    	logger.info("**************returnCode="+returnCode);
    	if(!returnCodeService.update(returnCode)){
    		request.setAttribute("msg", "返回码修改失败");
    		return Consts.ERROR;
    	}
    	request.setAttribute("msg", "修改成功");
		return "syssuccess";
    }
   
    public String delete(){
    	String return_code = request.getParameter("return_code");
    	if(return_code == null){
			request.setAttribute("msg", "未获得要删除的返回码");
			return Consts.ERROR;
		}
    	List<String> paramList = new ArrayList<String>();
		String[] paramArr = return_code.split(",");
		for(int i=0; i<paramArr.length;i++){
			paramList.add(paramArr[i]);
		}
		if(!returnCodeService.deleteBatch(paramList)){
			request.setAttribute("msg", "返回码删除失败!");
			return Consts.ERROR;
		}
		request.setAttribute("msg", "返回码删除成功");
		return Consts.SUCCESS;
    }

	public ReturnCode getReturnCode() {
		return returnCode;
	}

	public void setReturnCode(ReturnCode returnCode) {
		this.returnCode = returnCode;
	}

	@Override
    protected String getModuleName() throws Exception {
    	return "返回码管理";
    }
}
