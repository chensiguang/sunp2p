package com.sunyard.directbank.base;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.sunyard.directbank.batchorder.service.IBatchOrderService;
import com.sunyard.directbank.comActive.service.IComActiveService;
import com.sunyard.directbank.department.service.IDepartmentService;
import com.sunyard.directbank.finance.service.IFinanceService;
import com.sunyard.directbank.privilege.model.PrivilegeModel;
import com.sunyard.directbank.privilege.service.IPrivilegeService;
import com.sunyard.directbank.role.service.IRoleService;
import com.sunyard.directbank.tools.JSONUtil;
import com.sunyard.directbank.tools.PrivilegeUtil;
import com.sunyard.directbank.transstatus.service.ITransStatusService;
import com.sunyard.directbank.user.model.UserModel;
import com.sunyard.directbank.user.service.IUserService;
import com.sunyard.directbank.voucher.service.IVoucherService;

public  class BaseAction<T> extends ActionSupport implements ModelDriven<T> {

	private static final long serialVersionUID = -3491481934610613512L;
	@Resource
	protected IRoleService iRoleService;
	@Resource
	protected IDepartmentService iDepartmentService;
	@Resource
	protected IUserService iUserService;
	@Resource
	protected IPrivilegeService iPrivilegeService;
	@Resource
	protected IFinanceService iFinanceService;
	@Resource
	protected IBatchOrderService iBatchOrderService;
	@Resource
	protected IComActiveService iComActiveService;
	@Resource
	protected ITransStatusService iTransStatusService;
	@Resource
	protected IVoucherService iVoucherService;
	protected T model;
	
	private Logger logger = Logger.getLogger(BaseAction.class);
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public BaseAction() {
		try {
			//	得到model的类型信息
			Type genType = this.getClass().getGenericSuperclass();
			if (!(genType instanceof ParameterizedType)) {  
			}else{
				ParameterizedType pt =(ParameterizedType)genType;
				Class clazz = (Class) pt.getActualTypeArguments()[0];
				//  通过反射生成model的实例
				model = (T) clazz.newInstance();
			}  
			
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		} 
	}
	
	public T getModel() {
		return model;
	}
	
	protected void write(String str) throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter out = null;	
	    response.setContentType("text/html;charset=utf-8");
		out = response.getWriter();
		out.write(str);
		out.flush();
		out.close();
	}
	
	public UserModel getUser() throws Exception {
		
		HttpServletRequest request = ServletActionContext.getRequest();
		UserModel model = (UserModel)request.getSession().getAttribute("user");
		return model;
	}
	
	/**
	 * 将有权限的按钮显示在页面上
	 * 
	 * @throws Exception
	 */
	public void getButton() throws Exception {
		String modelName = getModuleName();
		UserModel activeUser = getUser();
		List<PrivilegeModel> allocatedPrivileges = PrivilegeUtil.selectAllMyPrivileges(activeUser.getUser_id());
		List<PrivilegeModel> leafPrivileges = new ArrayList<PrivilegeModel>();
		String buttonID = "";
		
		// 获取用户管理的privilege_id
		for(PrivilegeModel priv : allocatedPrivileges) {
			if(modelName.equalsIgnoreCase(priv.getPrivilege_name())) {
				buttonID = priv.getPrivilege_id();
				break;
			}
		}
		
		// 父id的值为_id的叶子节点即为要在页面上显示的按钮
		for(PrivilegeModel privilege : allocatedPrivileges) {
			if(privilege.getParent_id()!=null && privilege.getParent_id().equalsIgnoreCase(buttonID) ) {
				
				leafPrivileges.add(privilege);
			}
		}
		logger.info("页面展示按钮权限list=" + leafPrivileges);
		
		// 将list类型的数据转换为json通过ajax在页面获取
		String result = JSONUtil.getJSONArrayFromList(leafPrivileges).toString();
		write(result);
	}
	
	protected  String getModuleName()  throws Exception {return null;}
	
	/*
	 * 从缓存（Ehcache）获取数据字典
	 * paramArr 要查询的key数组
	 * 
	 * */
	protected void getDirtMap(String[] paramArr) throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();		
		for(int i=0;i<paramArr.length;i++){
			String param = paramArr[i];
			request.setAttribute(param, SpringUtil.getCache().getSys(param));
		}
	}
	
	protected List<Map<String,Object>> resultBaseProcess(List<Map<String,Object>> infoList,String[] constsArr, String[] columnArr) throws Exception{
		if(columnArr != null && columnArr.length>0){
			for(int index=0; index<infoList.size(); index++){
				Map<String,Object> item = infoList.get(index);
				for(int i=0; i<columnArr.length; i++){
					item.put(columnArr[i], SpringUtil.getCache().getContent(constsArr[i],null == item.get(columnArr[i])? "" : item.get(columnArr[i]).toString()));
				}
			}
		}
		
		logger.info("满足查询条件个数="+ infoList.size());
		logger.info("查询结果=" + infoList);
		return infoList;
	}
}
