package com.sunyard.directbank.base.model;

import java.util.ArrayList;

import com.sunyard.directbank.tools.StringUtil;


/**
 * 分页对象. 包含当前页资料及分页资讯如总记录.
 */
public class ListPage implements IListPage {

	private static String DEFAULT_FORM = "listForm";
	private int pageSize = DEFAULT_PAGE_SIZE; // 每页的记录
	private long start; // 当前页第一条资料在List中的位置,从0开始
	private Object data; // 当前页中存放的记录,类型一般为List
	private long totalCount; // 总记录
	private long totalPageCount;// 总页
	private String form = DEFAULT_FORM; // 页面Form名称
	
	/**
	 * 构造方法，只构造空页.
	 */
	@SuppressWarnings("rawtypes")
	public ListPage() {
		this(0, 0, DEFAULT_PAGE_SIZE, new ArrayList());
	}

	/**
	 * 预设构造方法.
	 * 
	 * @param start
	 *            本页资料在资料库中的起始位置
	 * @param totalSize
	 *            资料库中总记录条
	 * @param pageSize
	 *            本页容量
	 * @param data
	 *            本页包含的资料
	 */
	public ListPage(long start, long totalSize, int pageSize, Object data) {
		this.start = start;
		this.totalCount = totalSize;
		this.pageSize = pageSize;
		this.data = data;
	}

	public String getForm() {
		return form;
	}

	public void setForm(String form) {
		this.form = form;
	}

	
	public long getStart() {
		return start;
	}

	
	public void setStart(long start) {
		this.start = start;
	}

	public int getPageSize() {
		return pageSize;
	}
	
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public long getTotalCount() {
		return this.totalCount;
	}
	
	public void setTotalCount(long totalCount) {
		this.totalCount = totalCount;
	}

	public Object getResult() {
		return data;
	}
	
	public void setResult(Object data){
		this.data = data;
	}
	
	public long getTotalPageCount() {
		if (totalPageCount == 0) {
			if (totalCount % pageSize == 0)
				totalPageCount = totalCount / pageSize;
			else
				totalPageCount = totalCount / pageSize + 1;
		}
		return totalPageCount;
	}

	public long getCurrentPageNo() {
		return start / pageSize + 1;
	}

	public boolean hasNextPage() {
		return this.getCurrentPageNo() < this.getTotalPageCount();
	}

	
	public boolean hasPreviousPage() {
		return this.getCurrentPageNo() > 1;
	}

	/**
	 * 获取任一页第一条资料在资料集的位置，每页条使用预设值.
	 * 
	 * @param pageNo
	 * @return
	 */
	public static int getStartOfPage(int pageNo) {
		return getStartOfPage(pageNo, DEFAULT_PAGE_SIZE);
	}

	/**
	 * 获取任一页第一条资料在资料集的位置.
	 * 
	 * @param pageNo
	 *            从1开始的页号
	 * @param pageSize
	 *            每页记录条
	 * @return 该页第一条资料
	 */
	public static int getStartOfPage(int pageNo, int pageSize) {
		return (pageNo - 1) * pageSize;
	}

	public String getFooterHtml() throws Exception {
		long curPageNo = getCurrentPageNo();
		long totalPage = getTotalPageCount();
		StringBuffer html = new StringBuffer();
		html.append("【第").append(curPageNo).append("页】");
		html.append("【共").append(totalPage).append("页】");
		html.append("【共").append(getTotalCount()).append("条】");

		// 显示快进页面
		if (totalPage > 1) {
			html.append("&nbsp;&nbsp;页码  <input id=\"_gotoPageNo\" class=\"gotoPage\" maxlength=\"5\"");
			html.append(" onKeyUp=\"if(isNaN(value))execCommand('undo')\" ");
			html.append(" onAfterPaste=\"if(isNaN(value))execCommand('undo')\" ");	//限制文本框只能输入数字
			html.append(" onchange=\"if(/\\D/.test(this.value)){alert('只能输入正整数');this.value='';}\">&nbsp;&nbsp;");
			html.append("<a  class=\"button gotoPageBtn\"  ");
			html.append(" onclick=\"javascript:_gotoPage2();\">进入</a>");
			html.append("<script type=\"text/javascript\">");
			html.append("function _gotoPage2(){");
			html.append("var inpt=document.getElementById('_gotoPageNo');");
			html.append("var pageNo = inpt.value*1;");
			html.append("if(").append(curPageNo).append(" == pageNo ){return;");	// 页码等於当前页码时，不翻页
			html.append("}else if (").append(totalPage).append(" < pageNo){");	// 页码是否超出范围
			html.append("alert(\"页码超出范围!\");inpt.value='';return;");	//html.append("showMsgPanel(\"页码超出范围!\");return;");
			html.append("}else if ( 1 > pageNo){");
			html.append("alert(\"页码超出范围!\");inpt.value='';return;");	//html.append("showMsgPanel(\"页码超出范围!\");return;");
			html.append("}");
			html.append(getForm()).append(".pageNo.value = pageNo;");	// 页码跳转
			html.append("setTimeout(\"").append(getForm()).append(".submit()\",100);");	//html.append("showWaitPanel('');");
			html.append("}");
			html.append("</script>");
		}
		return html.toString();
	}

	/**
	 * 翻页控制
	 * 
	 * @return
	 */
	public String getToolbarHtml() {
		StringBuffer html = new StringBuffer();
		String temp = "<span class='{0}' onclick='gotoPage(" + getForm() + ",{1})'></span>";
		String temp2 = "<span class='{0}'></span>";
		long curPageNo = getCurrentPageNo();
		long totalPage = getTotalPageCount();
		if (curPageNo > 1) {
			html.append(StringUtil.getMessage(temp, "firstPage", "1"));
			html.append(StringUtil.getMessage(temp, "prevPage", "" + (curPageNo - 1)));
		} else {
			html.append(StringUtil.getMessage(temp2, "firstDis2"));
			html.append(StringUtil.getMessage(temp2, "prevDis2"));
		} 
		html.append("第").append(curPageNo).append("页"); 
		if (curPageNo < totalPage) {
			html.append(StringUtil.getMessage(temp, "nextPage", "" + (curPageNo + 1)));
			html.append(StringUtil.getMessage(temp, "lastPage", "" + totalPage));
		} else {
			html.append(StringUtil.getMessage(temp2, "nextDis2"));
			html.append(StringUtil.getMessage(temp2, "lastDis2"));
		} 
		
		html.append("<script type=\"text/javascript\">");
		html.append("function gotoPage(form,pageNo){");
		html.append("form.pageNo.value=pageNo;");
		html.append("setTimeout(form.name + \".submit()\",100);");
		html.append("}");
		html.append("</script>");
		return html.toString();
	}
	
	
}