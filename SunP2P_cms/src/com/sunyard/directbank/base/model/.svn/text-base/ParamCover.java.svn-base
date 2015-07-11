package com.sunyard.directbank.base.model;

import javax.servlet.http.HttpServletRequest;

import com.sunyard.directbank.tools.ParamUtil;


public class ParamCover {
	/**
	 * HttpServletRequest 参前缀
	 */
	private static final String PREX = "_";
	private HttpServletRequest request;
	private String[] forbids = new String[] { "action", "pageNo", "location", PREX + "pageNo" };

	public ParamCover(HttpServletRequest request) {
		this.request = request;
	}

	/**
	 * 加工参，a => _a ，参以Hidden Input方式存储
	 * <ul>
	 * <li>参名不包括action</li>
	 * <li>参名不包括空值及NULL值</li>
	 * </ul>
	 * 
	 * @return
	 */
	public String getCoveredInputs() {
		return ParamUtil.fixParamToHtml(request, PREX);
	}

	/**
	 * 解析参, 将a => a, 参以Hidden Input方式存储
	 * 
	 * @return
	 */
	public String getUnCoveredInputs() {
		return ParamUtil.fixParamToHtml(request, "");
	}

	/**
	 * 解析参, 将_a => _a, 参以Hidden Input方式存储
	 * 
	 * @return
	 */
	public String getUnCovered_Inputs() {
		return ParamUtil.generyFixParamToHtml(request, PREX);
	}

	/**
	 * 解析参, 将a => a, 参以Hidden Input方式存储, 除必要的forbids参外
	 * 
	 * @return
	 */
	public String getUnCoveredForbidInputs() {
		return ParamUtil.forbidFixParamToHtml(request, "", forbids);
	}

	/**
	 * 还原加工的参，将_a => a，参以Hidden Input方式存储
	 * 未包含_backUrl
	 * 
	 * @return
	 */
	public String getDecodeInputs() {
		return ParamUtil.revertFixParamToHtml(request, PREX);
	}

	public String[] getForbids() {
		return forbids;
	}

	public void setForbids(String[] forbids) {
		this.forbids = forbids;
	}
	
	

}