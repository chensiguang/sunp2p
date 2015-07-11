package com.sunyard.directbank.fund.action;

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
import com.sunyard.directbank.enums.ISUSESTATE;
import com.sunyard.directbank.fund.model.FundInfo;
import com.sunyard.directbank.fund.service.IFundInfoService;
import com.sunyard.directbank.tools.ParamUtil;

@Controller
@Scope("prototype")
public class FundInfoAction extends BaseAction<FundInfo> implements Consts {
	 
	private static final long serialVersionUID = 1L;
	private Logger logger = Logger.getLogger(FundInfoAction.class);
	
	private FundInfo fundInfo;
	
	@Resource
	private IFundInfoService fundInfoService;
	
	/*
	 * 查询
	 * 方法执行步骤：1 从数据库查询结果并对一些字段翻译  2 从缓存中初始化查询条件 
	 * 
	 * */
	public String toQuery() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		Map<String,Object> param = ParamUtil.transBean2Map(fundInfo);//model参数转换为map用于后面添加分页参数起始位置，pageSize
		if(param == null){
			param = new HashMap<String,Object>();
		}
		logger.info("bean2map=" + param);
		int pageNo = ParamUtil.getInt(request, "pageNo", 1);
		
		IListPage page = fundInfoService.pageQuery(param,pageNo); 
		logger.info("page="+ page.getResult());
		
		request.setAttribute("page", page);
		
		String[] paramArr = {PROD_TYPE,PROD_STATE,RISK_LVL,HPAGE_SHOW,ISSUE_STATE};
		getDirtMap(paramArr);
		
		return "query";
	}
	
	/*
	 * 跳转到新增页面的方法
	 * 方法执行：1 从缓存中获取数据字典
	 * 
	 * */
	public String toAdd() throws Exception {
		String[] paramArr = {PROD_TYPE,PROD_STATE,RISK_LVL,HPAGE_SHOW,QUOTA_CONTROL,SALE_CHANNEL_CONTROL};
		getDirtMap(paramArr);
		return "add";
	}
	
	
	/*
	 * 新增保存
	 * 方法执行步骤：1 校验参数不为空 2 校验产品代码是否重复 3 向数据库插入新的数据
	 * 
	 * */
	public String add(){
		HttpServletRequest request = ServletActionContext.getRequest();
		if(fundInfo !=null ){
			logger.info("基金产品=" + fundInfo);
			/*logger.info("销售渠道" + fundInfo.getSale_channel());*/
			if(fundInfo.getProd_id() == null){
				request.setAttribute("msg", "基金产品代码不能为空！");
				return Consts.ERROR;
			}
			
			FundInfo rst = fundInfoService.loadFundInfoById(fundInfo.getProd_id());
			if(rst != null){
				request.setAttribute("msg", "基金产品代码已存在，不能重复增加!");
				return Consts.ERROR;
			}
			
			fundInfo.setIssue_state(ISUSESTATE.UnCheck.getCode());//0 表示待复核
			fundInfoService.insert(fundInfo);
			request.setAttribute("msg", "基金产品增加成功!");
			return Consts.SUCCESS;
			
		}else{
			request.setAttribute("msg", "基金产品为空！");
			return Consts.ERROR;
		}
		
	}
	/*
	 * 删除
	 * 方法执行：1 全选 ，按查询条件全部删除  2 多选，批量删除
	 * 
	 * */
	public String delete(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String paramStr = request.getParameter("prodIdStr");
		logger.info("paramStr=" + paramStr);
		if(paramStr == null){
			if(fundInfo != null){
				logger.info("产品代码=" + fundInfo.getProd_id());
				logger.info("产品名称=" + fundInfo.getProd_name());
				logger.info("产品类型=" + fundInfo.getProd_type());
				logger.info("产品状态=" + fundInfo.getProd_state());
				logger.info("发布状态=" + fundInfo.getIssue_state());
				logger.info("首页推荐=" + fundInfo.getHpage_promoted());
				logger.info("风险等级=" + fundInfo.getRisk_lvl());
			}
			if(fundInfoService.deleteAll(fundInfo)){
				request.setAttribute("msg", "基金产品删除成功!");
				return Consts.SUCCESS;
			}else{
				request.setAttribute("msg", "基金产品删除失败!");
				return Consts.ERROR;
			}
			 
		}else{
			List<Long> paramList = new ArrayList<Long>();
			String[] paramArr = paramStr.split(",");
			
			for(int i=0; i<paramArr.length;i++){
				Long item = Long.valueOf(paramArr[i]);
				paramList.add(item);
			}
			logger.info("批量删除list=" + paramList);
			
			if(fundInfoService.deleteBatch(paramList)){
				request.setAttribute("msg", "基金产品删除成功!");
				return Consts.SUCCESS;
			}else{
				request.setAttribute("msg", "基金产品删除失败!");
				return Consts.ERROR;
			}
		}
	}
	
	/*
	 * 跳转到修改页面
	 * 
	 * */
	public String toModi() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		String paramStr = request.getParameter("prodIdStr");
		logger.info("修改参数=" + paramStr);
		
		FundInfo rst = fundInfoService.loadFundInfoById(Long.valueOf(paramStr));
		request.setAttribute("fundInfo", rst);
		
		String[] paramArr = {PROD_TYPE,PROD_STATE,RISK_LVL,HPAGE_SHOW,QUOTA_CONTROL,SALE_CHANNEL_CONTROL};
		getDirtMap(paramArr);
		return "modi";
	}
	
	/*
	 * 修改基金产品
	 * 
	 * */
	public String modi(){
		HttpServletRequest request = ServletActionContext.getRequest();
		if(fundInfo !=null ){
			logger.info("基金产品=" + fundInfo);
			fundInfo.setIssue_state(ISUSESTATE.UnCheck.getCode());//0 表示待复核    把发布状态设置为待复核
			fundInfoService.update(fundInfo);
			request.setAttribute("msg", "基金产品修改成功!");
			return Consts.SUCCESS;
			
		}else{
			request.setAttribute("msg", "基金产品为空！");
			return Consts.ERROR;
		}
	}
	
	/*
	 * 跳转到复核页面
	 * 
	 * */
	public String toCheck() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		String paramStr = request.getParameter("prodIdStr");
		logger.info("复核参数=" + paramStr);
		
		FundInfo rst = fundInfoService.loadFundInfoById(Long.valueOf(paramStr));
		if(!ISUSESTATE.UnCheck.getCode().equals(rst.getIssue_state())){
			request.setAttribute("msg", "该基金产品已经复核！");
			return Consts.ERROR;
		}
		request.setAttribute("fundInfo", rst);
		
		String[] paramArr = {PROD_TYPE,PROD_STATE,RISK_LVL,HPAGE_SHOW,QUOTA_CONTROL,SALE_CHANNEL_CONTROL};
		getDirtMap(paramArr);
		return "check";
	}
	
	/*
	 * 复核基金产品
	 * 
	 * */
	public String check(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String paramStr = request.getParameter("issue_state");
		logger.info("发布状态参数=" + paramStr);
		if(fundInfo !=null ){
			logger.info("基金产品=" + fundInfo);
			fundInfo.setIssue_state(paramStr);
			fundInfoService.check(fundInfo);
			request.setAttribute("msg", "基金产品复核成功!");
			return Consts.SUCCESS;
			
		}else{
			request.setAttribute("msg", "基金产品为空！");
			return Consts.ERROR;
		}
	}
	
	@Override
	protected  String getModuleName(){
		return "基金产品信息设置";
	}
	
	public FundInfo getFundInfo() {
		return fundInfo;
	}

	public void setFundInfo(FundInfo fundInfo) {
		this.fundInfo = fundInfo;
	}
	
    
}
