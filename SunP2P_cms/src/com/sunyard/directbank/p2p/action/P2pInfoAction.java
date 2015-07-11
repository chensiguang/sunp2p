package com.sunyard.directbank.p2p.action;

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
import com.sunyard.directbank.p2p.model.P2pInfo;
import com.sunyard.directbank.p2p.service.IP2pInfoService;
import com.sunyard.directbank.tools.ParamUtil;

@Controller
@Scope("prototype")
public class P2pInfoAction extends BaseAction<P2pInfo> implements Consts {
	 
	private static final long serialVersionUID = 1L;
	private Logger logger = Logger.getLogger(P2pInfoAction.class);
	
	private P2pInfo p2pInfo;
	
	@Resource
	private IP2pInfoService p2pInfoService;
	
	/*
	 * 查询
	 * 方法执行步骤：1 从数据库查询结果并对一些字段翻译  2 从缓存中初始化查询条件 
	 * 
	 * */
	public String toQuery() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		Map<String,Object> param = ParamUtil.transBean2Map(p2pInfo);//model参数转换为map用于后面添加分页参数起始位置，pageSize
		if(param == null){
			param = new HashMap<String,Object>();
		}
		logger.info("bean2map=" + param);
		int pageNo = ParamUtil.getInt(request, "pageNo", 1);
		
		IListPage page = p2pInfoService.pageQuery(param,pageNo); 
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
		String[] paramArr = {PROD_TYPE,PROD_STATE,RISK_LVL,HPAGE_SHOW,QUOTA_CONTROL,SALE_CHANNEL_CONTROL,REPAY_TYPE,BORROWER_EDU};
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
		if(p2pInfo !=null ){
			logger.info("p2p产品=" + p2pInfo);
			if(p2pInfo.getProd_id() == null){
				request.setAttribute("msg", "p2p产品代码不能为空！");
				return Consts.ERROR;
			}
			
			P2pInfo rst = p2pInfoService.loadP2pInfoById(p2pInfo.getProd_id());
			if(rst != null){
				request.setAttribute("msg", "p2p产品代码已存在，不能重复增加!");
				return Consts.ERROR;
			}
			
			p2pInfo.setIssue_state(ISUSESTATE.UnCheck.getCode());//0 表示待复核
			p2pInfoService.insert(p2pInfo);
			request.setAttribute("msg", "p2p产品增加成功!");
			return Consts.SUCCESS;
			
		}else{
			request.setAttribute("msg", "p2p产品为空！");
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
			if(p2pInfo != null){
				logger.info("产品代码=" + p2pInfo.getProd_id());
				logger.info("产品名称=" + p2pInfo.getProd_name());
				logger.info("产品类型=" + p2pInfo.getProd_type());
				logger.info("产品状态=" + p2pInfo.getProd_state());
				logger.info("发布状态=" + p2pInfo.getIssue_state());
				logger.info("首页推荐=" + p2pInfo.getHpage_promoted());
				logger.info("风险等级=" + p2pInfo.getRisk_lvl());
			}
			if(p2pInfoService.deleteAll(p2pInfo)){
				request.setAttribute("msg", "p2p产品删除成功!");
				return Consts.SUCCESS;
			}else{
				request.setAttribute("msg", "p2p产品删除失败!");
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
			
			if(p2pInfoService.deleteBatch(paramList)){
				request.setAttribute("msg", "p2p产品删除成功!");
				return Consts.SUCCESS;
			}else{
				request.setAttribute("msg", "p2p产品删除失败!");
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
		
		P2pInfo rst = p2pInfoService.loadP2pInfoById(Long.valueOf(paramStr));
		request.setAttribute("p2pInfo", rst);
		
		String[] paramArr = {PROD_TYPE,PROD_STATE,RISK_LVL,HPAGE_SHOW,QUOTA_CONTROL,SALE_CHANNEL_CONTROL,REPAY_TYPE,BORROWER_EDU};
		getDirtMap(paramArr);
		return "modi";
	}
	
	/*
	 * 修改基金产品
	 * 
	 * */
	public String modi(){
		HttpServletRequest request = ServletActionContext.getRequest();
		if(p2pInfo !=null ){
			logger.info("p2p产品=" + p2pInfo);
			p2pInfo.setIssue_state(ISUSESTATE.UnCheck.getCode());//0 表示待复核    把发布状态设置为待复核
			p2pInfoService.update(p2pInfo);
			request.setAttribute("msg", "p2p产品修改成功!");
			return Consts.SUCCESS;
			
		}else{
			request.setAttribute("msg", "p2p产品为空！");
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
		
		P2pInfo rst = p2pInfoService.loadP2pInfoById(Long.valueOf(paramStr));
		if(!ISUSESTATE.UnCheck.getCode().equals(rst.getIssue_state())){
			request.setAttribute("msg", "该p2p产品已经复核！");
			return Consts.ERROR;
		}
		request.setAttribute("p2pInfo", rst);
		
		String[] paramArr = {PROD_TYPE,PROD_STATE,RISK_LVL,HPAGE_SHOW,QUOTA_CONTROL,SALE_CHANNEL_CONTROL,REPAY_TYPE,BORROWER_EDU};
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
		if(p2pInfo !=null ){
			logger.info("基金产品=" + p2pInfo);
			p2pInfo.setIssue_state(paramStr);
			p2pInfoService.check(p2pInfo);
			request.setAttribute("msg", "p2p产品复核成功!");
			return Consts.SUCCESS;
			
		}else{
			request.setAttribute("msg", "p2p产品为空！");
			return Consts.ERROR;
		}
	}

	public P2pInfo getP2pInfo() {
		return p2pInfo;
	}

	public void setP2pInfo(P2pInfo p2pInfo) {
		this.p2pInfo = p2pInfo;
	}

	@Override
	protected String getModuleName() {
		return "P2P网络贷款产品信息设置";
	}
	
	
	
    
}
