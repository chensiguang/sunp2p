package com.sunyard.directbank.prod.action;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.sunyard.directbank.base.BaseAction;
import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.enums.ISUSESTATE;
import com.sunyard.directbank.enums.QUOTACONTROL;
import com.sunyard.directbank.enums.SALECHANNELCONTROL;
import com.sunyard.directbank.enums.VALUETYPE;
import com.sunyard.directbank.prod.model.ProdBaseInfo;
import com.sunyard.directbank.prod.model.ProdExtInfo;
import com.sunyard.directbank.prod.service.IProdInfoService;
import com.sunyard.directbank.tools.DateUtil;
import com.sunyard.directbank.tools.JSONUtil;
import com.sunyard.directbank.tools.ParamUtil;
import com.sunyard.directbank.tools.StringUtil;
import com.sunyard.directbank.user.model.UserModel;

@Controller
@Scope("prototype")
public class ProdInfoAction extends BaseAction<ProdBaseInfo> implements Consts {

	private static final long serialVersionUID = 1L;
	private Logger logger = Logger.getLogger(ProdInfoAction.class);
	private ProdBaseInfo prodInfo;
	private ProdExtInfo  prodExtInfo;
	@Resource
	private IProdInfoService prodInfoService;

	HttpServletRequest request = ServletActionContext.getRequest();
 
	public void getId(){
	    List<String> list = prodInfoService.getId(prodInfo);
        String jsonStr = JSONArray.fromObject(list).toString();
		try {
			ServletActionContext.getResponse().getWriter().print(jsonStr);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
      
       }
	public void getProdInfoList() throws IOException{
	    List<ProdBaseInfo> list = prodInfoService.getProdInfoList(prodInfo);
	    if(list != null){
	    	request.setAttribute("prodInfoList", list);
	    }
	    String result = JSONUtil.getJSONArrayFromList(list).toString();
		write(result);
      
     }
	public String toQuery() throws Exception {
		Map<String, Object> param = ParamUtil.transBean2Map(prodInfo);
		if (param == null) {
			param = new HashMap<String, Object>();
		}
		logger.info("bean2map=" + param);
		int pageNo = ParamUtil.getInt(request, "pageNo", 1);
		IListPage page = prodInfoService.pageQuery(param, pageNo);
		logger.info("page=" + page.getResult());
		request.setAttribute("page", page);

		String[] paramArr = {PROD_STATE,PROD_TYPE,ISSUE_STATE,REPAY_TYPE};
		getDirtMap(paramArr);
		if(prodInfo != null ){
			if(prodInfo.getValue_date() != null){
				request.setAttribute("value_date_fmt", DateUtil.formatDateToStr(prodInfo.getValue_date()));
			}
			if(prodInfo.getExpire_date() != null){
				request.setAttribute("expire_date_fmt", DateUtil.formatDateToStr(prodInfo.getExpire_date()));
			}
		}
		return "query";
	}
     /**
      * 跳转到新增页面
      * @return
      * @throws Exception
      */
	public String toAdd() throws Exception {
		String[] paramArr = {PROD_TYPE,PROD_STATE,RISK_LVL,HPAGE_SHOW,QUOTA_CONTROL,SALE_CHANNEL_CONTROL,REPAY_TYPE,BORROWER_EDU,VALUE_TYPE,BORROWER_TYPE};
		getDirtMap(paramArr);
		logger.info("prodInfo="+prodInfo+"model_id="+request.getParameter("model_id"));
		//判断是否由模板页面跳转过来
		if(request.getParameter("model_id") != null && !("").equals(request.getParameter("model_id"))){
		 int prod_id = Integer.valueOf(request.getParameter("model_id"));
		 ProdBaseInfo prod = prodInfoService.loadprodInfoById(prod_id);
			 if(prod == null){
				 request.setAttribute("msg", "无此产品代码模板！");
					return Consts.ERROR;
			 }
			 if(prod.getExp_id() != null){
				 ProdExtInfo prodExt = prodInfoService.loadProdExtById(prod.getExp_id());
				 request.setAttribute("prodExt", prodExt);
			 }
	     logger.info("prod="+prod);
	     formatDate(prod);
		 request.setAttribute("prod", prod);
		 request.setAttribute("prod_id", request.getParameter("prod_id"));
		 String prod_name = new String(request.getParameter("prod_name").getBytes("ISO-8859-1"),"UTF-8");//防止中午乱码
		 request.setAttribute("prod_name",prod_name );
		}
		return "add";
	}
	/**
	 * 跳转到按模块增加页面
	 * @return
	 * @throws Exception
	 */
	public String toAddModel() throws Exception{
		return "addModel";
	}
	/**
	 * 增加
	 * @return
	 */
    public String add(){
    	logger.info("Prod_id=" + prodInfo.getProd_id());
    	if(prodInfo !=null ){
			logger.info("prodInfo产品=" + prodInfo);
			if(prodInfo.getProd_id() == 0 ){
				request.setAttribute("msg", "产品代码不能为空！");
				return Consts.ERROR;
			}	
			if(prodInfo.getProd_name() == null ){
				request.setAttribute("msg", "产品名称不能为空！");
				return Consts.ERROR;
			}
			if(prodInfo.getDebit_account() == null){
				request.setAttribute("msg", "产品收款账号不能为空！");
				return Consts.ERROR;
			}
			if(prodInfo.getCrebit_account() == null){
				request.setAttribute("msg", "产品付款账户不能为空！");
				return Consts.ERROR;
			}
			if(prodInfo.getTransfer_rate() == null){
				prodInfo.setTransfer_rate(new BigDecimal(StringUtil.decimal(null)));
			}
			if(prodInfo.getTransfer_valid_day() == 0){
				prodInfo.setTransfer_valid_day(Integer.parseInt(StringUtil.decimal(null)));
			}
			ProdBaseInfo rst = prodInfoService.loadprodInfoById(prodInfo.getProd_id());
			if(rst != null){
				request.setAttribute("msg", "产品代码已存在，不能重复增加!");
				return Consts.ERROR;
			}
		    
			
			initDataByChooseType(prodInfo);
			
			prodInfo.setProd_typist(getCurrUserId());
			prodInfo.setIssue_state(ISUSESTATE.UnCheck.getCode());//0 表示待复核
			prodInfo.setSaled_limit(BigDecimal.ZERO);
			prodInfo.setRemain_limit(prodInfo.getTotal_limit());
			prodInfoService.insert(prodInfo,prodExtInfo);
			
			request.setAttribute("msg", "产品增加成功，等待复核!");
			return Consts.SUCCESS;
		}else{
			request.setAttribute("msg", "产品为空！");
			return Consts.ERROR;
		}
    }
	
    private void initDataByChooseType(ProdBaseInfo prodInfo){
    	if(QUOTACONTROL.NotControl.getCode().equals(prodInfo.getQuota_control())){
			prodInfo.setTotal_limit(null);
			prodInfo.setWeb_total(null);
			prodInfo.setApp_total(null);
			prodInfo.setWeixin_total(null);
		}else if(QUOTACONTROL.Control.getCode().equals(prodInfo.getQuota_control())){
			prodInfo.setWeb_total(null);
			prodInfo.setApp_total(null);
			prodInfo.setWeixin_total(null);
		}else if(QUOTACONTROL.ControlChannel.getCode().equals(prodInfo.getQuota_control())){
			prodInfo.setTotal_limit(null);
		}
		
		if(SALECHANNELCONTROL.NotControl.getCode().equals(prodInfo.getSale_channel_control())){
			prodInfo.setSale_channel("");
		}
		
		if(VALUETYPE.FullValue.getCode().equals(prodInfo.getValue_type())){
			prodInfo.setValue_date(null);
			prodInfo.setExpire_date(null);
		}
    }
    private String  getCurrUserId(){
    	String user_id = "";
    	UserModel user = (UserModel) request.getSession().getAttribute("user");
		logger.info("当前用户user="+user);
		user_id = user.getUser_id();
    	return user_id;
    }
    /**
     * 跳转到修改页面
     * @return
     * @throws Exception
     */
	public String toModi() throws Exception{
		int prodStr = Integer.valueOf(request.getParameter("prodIdStr"));
		ProdBaseInfo prod = prodInfoService.loadprodInfoById(prodStr);
		
		if(prod != null){
			if(!getCurrUserId().equals(prod.getProd_typist())){
				request.setAttribute("msg", "只有录入人有修改权限！");
				return Consts.ERROR;
			}
		}
		
		if(prod.getExp_id() != null){
		  logger.info("------>toModi()---prod.getExp_id="+prod.getExp_id());
		  ProdExtInfo prodExt = prodInfoService.loadProdExtById(prod.getExp_id());
		  request.setAttribute("prodExt", prodExt);
		}
		formatDate(prod);
		request.setAttribute("prod", prod);
		String[] paramArr = {PROD_TYPE,PROD_STATE,RISK_LVL,HPAGE_SHOW,QUOTA_CONTROL,SALE_CHANNEL_CONTROL,REPAY_TYPE,BORROWER_EDU,VALUE_TYPE,BORROWER_TYPE};
		getDirtMap(paramArr);
		return "modi";
	}
	
	/**
	 * 修改
	 * @return
	 */
	public String modi(){
	  if(prodInfo != null){	
			if(prodInfo.getProd_id() == 0 ){
				request.setAttribute("msg", "产品代码不能为空！");
				return Consts.ERROR;
			}	
			if(prodInfo.getProd_name() == null ){
				request.setAttribute("msg", "产品名称不能为空！");
				return Consts.ERROR;
			}
			if(prodInfo.getDebit_account() == null){
				request.setAttribute("msg", "产品收款账号不能为空！");
				return Consts.ERROR;
			}
			if(prodInfo.getCrebit_account() == null){
				request.setAttribute("msg", "产品付款账户不能为空！");
				return Consts.ERROR;
			}
		
		logger.info("prodExtInfo="+prodExtInfo);
		
		initDataByChooseType(prodInfo);
		
		if(prodInfoService.update(prodInfo,prodExtInfo)){
			request.setAttribute("msg", "产品修改成功，等待复核!");
			logger.info("prodInfo="+prodInfo);
			return Consts.SUCCESS;
		   }else{
			request.setAttribute("msg", "产品修改失败!");
			return Consts.ERROR;
		   }
		
	  }else{
		  request.setAttribute("msg", "产品为空！");
		  return Consts.ERROR;
	  }
	}
	
	/**
	 * 删除
	 * @return
	 */
	public String delete(){
		String prodStr = request.getParameter("prodIdStr");
		logger.info("prod_id=" + prodStr);
		if(prodStr == null){
			request.setAttribute("msg", "未获得要删除的产品id");
			return Consts.ERROR;
		}
		List<Integer> paramList = new ArrayList<Integer>();
		String[] paramArr = prodStr.split(",");
		
		for(int i=0; i<paramArr.length;i++){
			int item = Integer.valueOf(paramArr[i]);
			paramList.add(item);
		}
		logger.info("批量删除产品list=" + paramList);
		if(!prodInfoService.deleteBatch(paramList)){
			request.setAttribute("msg", "产品删除失败!");
			return Consts.ERROR;
		}
		
		request.setAttribute("msg", "产品删除成功!");
		return Consts.SUCCESS;
	}
	/**
	 * 跳转到复核页面
	 * @return
	 * @throws Exception 
	 */
	public String toCheck() throws Exception{
		int prodStr = Integer.valueOf(request.getParameter("prodIdStr"));
		logger.info("要复核的产品id"+prodStr);
		ProdBaseInfo  prod = prodInfoService.loadprodInfoById(prodStr);
		
		if(prod.getProd_typist() == null ){
			request.setAttribute("msg", "录入者为空！");
			return Consts.ERROR;
		}
		if(getCurrUserId().equals(prod.getProd_typist())){
			request.setAttribute("msg", "录入者无法为自己复核！");
			return Consts.ERROR;
		}
		if(!ISUSESTATE.UnCheck.getCode().equals(prod.getIssue_state()) ){
			request.setAttribute("msg", "该产品已经复核！");
			return Consts.ERROR;
		}
		if(prod.getExp_id() != null){
			ProdExtInfo prodExt = prodInfoService.loadProdExtById(prod.getExp_id());
			request.setAttribute("prodExt", prodExt);
		}
		formatDate(prod);
		request.setAttribute("prod", prod);
		String[] paramArr = { PROD_TYPE,PROD_STATE,RISK_LVL,HPAGE_SHOW,QUOTA_CONTROL,SALE_CHANNEL_CONTROL,REPAY_TYPE,BORROWER_EDU,VALUE_TYPE,BORROWER_TYPE};
		getDirtMap(paramArr);
		return "check";
	}
	/**
	 * 复核产品
	 * @return
	 */
	public String check(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String paramStr = request.getParameter("issue_state");
		logger.info("产品发布状态  issue_state=" + paramStr);
		if(prodInfo != null ){
			logger.info("产品 prodInfo=" + prodInfo);
			prodInfo.setIssue_state(paramStr);
			prodInfo.setProd_checker(getCurrUserId());//产品复核人为当前用户
			prodInfoService.check(prodInfo);
			request.setAttribute("msg", "产品复核成功!");
			return Consts.SUCCESS;
			
		}else{
			request.setAttribute("msg", "产品为空！");
			return Consts.ERROR;
		}
	}
	/**
	 * 日期格式化
	 * @param prod
	 */
	public void formatDate(ProdBaseInfo prod) {
		if(prod.getValue_date() != null){
			String value_date  = DateUtil.ymd.format(prod.getValue_date());
			String expire_date = DateUtil.ymd.format(prod.getExpire_date());	
			prod.setValue_date(java.sql.Date.valueOf(value_date));
			prod.setExpire_date(java.sql.Date.valueOf(expire_date));
		}
		prod.setSell_date(java.sql.Date.valueOf(DateUtil.ymd.format(prod.getSell_date())));
	}
	
	public ProdBaseInfo getProdInfo() {
		return prodInfo;
	}

	public void setProdInfo(ProdBaseInfo prodInfo) {
		this.prodInfo = prodInfo;
	}
	
	public ProdExtInfo getProdExtInfo() {
		return prodExtInfo;
	}

	public void setProdExtInfo(ProdExtInfo prodExtInfo) {
		this.prodExtInfo = prodExtInfo;
	}

	@Override
	protected String getModuleName() throws Exception {
		return "P2P贷款产品信息设置";
	}
}
