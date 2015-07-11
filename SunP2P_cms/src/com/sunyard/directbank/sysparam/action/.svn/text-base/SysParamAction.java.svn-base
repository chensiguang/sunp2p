package com.sunyard.directbank.sysparam.action;

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
import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.sysparam.model.SysParam;
import com.sunyard.directbank.sysparam.service.ISysParamService;
import com.sunyard.directbank.tools.ParamUtil;
import com.sunyard.directbank.tools.StringUtil;
import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.enums.MODIFLAG;
import com.sunyard.directbank.enums.PARAMTYPE;

@Controller
@Scope("prototype")
public class SysParamAction extends BaseAction<SysParam> implements Consts {

	private static final long serialVersionUID = -1685249115867814802L;
	private Logger logger = Logger.getLogger(SysParamAction.class);

	private SysParam sysParam;

	@Resource
	private ISysParamService sysParamService;

	/**
	 * 查询
	 * 
	 * @return
	 * @throws Exception
	 */
	public String toQuery() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		if (sysParam != null && sysParam.getValue_name() != null) {
			sysParam.setValue_name(StringUtil.delSpace(sysParam.getValue_name()));
		}
		Map<String, Object> param = ParamUtil.transBean2Map(sysParam);// model参数转换为map用于后面添加分页参数起始位置，pageSize
		if (param == null) {
			param = new HashMap<String, Object>();
		}
		logger.info("bean2map=" + param);

		int pageNo = ParamUtil.getInt(request, "pageNo", 1);

		IListPage page = sysParamService.pageQuery(param, pageNo);
		logger.info("page=" + page.getResult());

		request.setAttribute("page", page);

		String[] paramArr = { PARAM_TYPE, PROD_TYPE };
		getDirtMap(paramArr);

		return "query";
	}

	/*
	 * 跳转到新增页面的方法 方法执行：1 从缓存中获取数据字典
	 */
	public String toAdd() throws Exception {
		String[] paramArr = { PARAM_TYPE, PROD_TYPE };
		getDirtMap(paramArr);
		return "add";
	}

	/*
	 * 新增保存 方法执行步骤：1 校验参数不为空 2 校验参数标识是否重复 3 向数据库插入新的数据
	 */
	public String add() {
		HttpServletRequest request = ServletActionContext.getRequest();
		if (sysParam != null) {
			logger.info("系统参数=" + sysParam);

			confirm(request);
			
			if (sysParam.getModi_flag() == null) {
				sysParam.setModi_flag(MODIFLAG.No.getCode());
			}
			SysParam rst = sysParamService.loadSysParamById(sysParam.getParam_id());
			if (rst != null) {
				request.setAttribute("msg", "参数ID已存在，不能重复增加!");
				return Consts.ERROR;
			}
            
			sysParamService.insert(sysParam);
			request.setAttribute("msg", "系统参数增加成功!");
			return "syssuccess";

		} else {
			request.setAttribute("msg", "系统参数为空！");
			return Consts.ERROR;
		}

	}

	/*
	 * 跳转到修改页面
	 */
	public String toModi() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		String paramStr = request.getParameter("sysParam_id");
		logger.info("修改参数=" + paramStr);

		SysParam rst = sysParamService.loadSysParamById(paramStr);
		
		if(MODIFLAG.No.getCode().equals(rst.getModi_flag())){
		    request.setAttribute("msg", "该参数不允许修改");
		    return Consts.NO_OK_ERROR;
		}
		
		request.setAttribute("sysParam", rst);

		String[] paramArr = { PARAM_TYPE, PROD_TYPE };
		getDirtMap(paramArr);
		return "modi";
	}

	/*
	 * 修改系统参数
	 */
	public String modi() {
		HttpServletRequest request = ServletActionContext.getRequest();

		logger.info("系统参数=**********************" + sysParam);
		
		/*SysParam rst = sysParamService.loadSysParamById(sysParam.getParam_id());
		if(MODIFLAG.No.getCode().equals(rst.getModi_flag())){
		    request.setAttribute("msg", "该参数不允许修改");
		    return Consts.ERROR;
		}*/
		confirm(request);
		if (sysParam.getModi_flag() == null) {
			sysParam.setModi_flag(MODIFLAG.No.getCode());
		}
		if (sysParamService.update(sysParam)) {
			request.setAttribute("msg", "系统参数修改成功!");
			return "syssuccess";
		} else {
			request.setAttribute("msg", "系统参数修改失败！");
			return Consts.ERROR;
		}
	}
    
	/*
	 * 删除 方法执行：1 全选 ，按查询条件全部删除 2 多选，批量删除
	 */
	public String delete() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String paramStr = request.getParameter("sysParam_id");
		logger.info("paramStr=" + paramStr);

		if (paramStr == null) {
			if (sysParam != null) {
				logger.info("要删除的系统参数=" + sysParam);
			}
			if (sysParamService.deleteAll(sysParam)) {
				request.setAttribute("msg", "系统参数删除成功!");
				return Consts.SUCCESS;
			} else {
				request.setAttribute("msg", "系统参数删除失败!");
				return Consts.ERROR;
			}

		} else {
			String[] paramtemp = paramStr.split(",");

			// 由于mysql批量删除要求传入list，此处将String类型转为List类型
			List<String> list = Arrays.asList(paramtemp);
			System.out.println(list.size());

			// 调用批量删除方法
			if (sysParamService.deleteBatch(list)) {
				logger.info("======================>批量删除参数成功！");
				request.setAttribute("msg", "系统参数删除成功!");
				return Consts.SUCCESS;
			} else {
				return Consts.ERROR;
			}
		}
	}

	@Override
	protected String getModuleName() throws Exception {
		return "系统参数管理";
	}

	public SysParam getSysParam() {
		return sysParam;
	}

	public void setSysParam(SysParam sysParam) {
		this.sysParam = sysParam;
	}
    /**
     * 非空校验
     * @param request
     * @return
     */
	public  String confirm(HttpServletRequest request) {
		if (sysParam.getParam_type() == null
				|| ("").equals(sysParam.getParam_type())) {
			request.setAttribute("msg", "参数类型不能为空！");
			return Consts.ERROR;
		} else if (sysParam.getParam_type() == PARAMTYPE.Products.getCode()) {
			if (sysParam.getProd_type() == null) {
				request.setAttribute("msg", "产品种类不能为空！");
				return Consts.ERROR;
			}
		} else if (sysParam.getParam_type() == PARAMTYPE.Single.getCode()) {
			if (sysParam.getProd_id() == null) {
				request.setAttribute("msg", "产品代码不能为空！");
				return Consts.ERROR;
			}
		}

		if (sysParam.getParam_id() == null) {
			request.setAttribute("msg", "参数ID不能为空！");
			return Consts.ERROR;
		}

		if (sysParam.getParam_value() == null) {
			request.setAttribute("msg", "参数值不能为空！");
			return Consts.ERROR;
		}

		if (sysParam.getParam_name() == null) {
			request.setAttribute("msg", "参数识别名称不能为空！");
			return Consts.ERROR;
		}

		if (sysParam.getValue_name() == null) {
			request.setAttribute("msg", "参数名称不能为空！");
			return Consts.ERROR;
		}
		
		return null;
	}
}
