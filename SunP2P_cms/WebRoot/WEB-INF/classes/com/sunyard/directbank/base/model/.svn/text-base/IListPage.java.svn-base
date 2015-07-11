package com.sunyard.directbank.base.model;

/**
 * 分页对象. 包含当前页资料及分页资讯如总记录.
 */
public interface IListPage {

	public final static int DEFAULT_PAGE_SIZE = Properties.getInt("PAGE_SIZE");

	public abstract String getForm();

	public abstract void setForm(String form);

	public abstract long getStart();

	public abstract void setStart(long start);

	public abstract void setPageSize(int pageSize);

	public abstract void setTotalCount(long totalCount);

	/**
	 * 取每页资料容量.
	 */
	public abstract int getPageSize() throws Exception;

	/**
	 * 取总记录.
	 */
	public abstract long getTotalCount() throws Exception;

	/**
	 * 取总页.
	 */
	public abstract long getTotalPageCount() throws Exception;

	/**
	 * 取当前页中的记录.
	 */
	public abstract Object getResult() throws Exception;

	/**
	 * 设置记录
	 * @param data
	 */
	public abstract void setResult(Object data) throws Exception;
	
	/**
	 * 取该页当前页码,页码从1开始.
	 */
	public abstract long getCurrentPageNo() throws Exception;

	/**
	 * 该页是否有下一页.
	 */
	public abstract boolean hasNextPage() throws Exception;

	/**
	 * 该页是否有上一页.
	 */
	public abstract boolean hasPreviousPage() throws Exception;

	/**
	 * 获取HTML内容
	 * @return
	 * @throws Exception 
	 */
	public abstract String getFooterHtml() throws Exception;

	/**
	 * 分页按钮栏
	 * @return
	 */
	public abstract String getToolbarHtml() throws Exception;


}