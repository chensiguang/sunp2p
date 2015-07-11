package com.sunyard.directbank.department.action;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.sunyard.directbank.base.BaseAction;
import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.base.model.IListPage;
import com.sunyard.directbank.department.model.DepartmentModel;
import com.sunyard.directbank.tools.ParamUtil;
import com.sunyard.directbank.tools.TreeUtil;

@Controller
@Scope("prototype")
public class DepartmentAction extends BaseAction<DepartmentModel> {

	private static final long serialVersionUID = 2040038630327087986L;
	private Logger logger = Logger.getLogger(DepartmentAction.class);
	HttpServletRequest request = ServletActionContext.getRequest();

	/**
	 * 查询某些机构
	 * 
	 * @return
	 */
	public String selectDepartment() throws Exception {
		
		// 根据条件查询机构列表
		List<DepartmentModel> departmentList = iDepartmentService.selectDepartment(model.getDepartment_id(), model.getDepartment_name());
		
		// 将查询结果放到request中
		request.setAttribute("departmentList", departmentList);
		
		// 显示机构树
		List<DepartmentModel> allDepartment = iDepartmentService.selectAllDepartments();
		String departmentTree = TreeUtil.showTree(allDepartment);
		request.setAttribute("departmentTree", departmentTree);

		// 跳转到显示页面
		return "selectDepartments";

	}

	/**
	 * 添加机构页面
	 * 
	 * @return
	 */
	public String addDepartmentUI() throws Exception {
		
		// 准备上级机构信息
		List<DepartmentModel> topDepartments = iDepartmentService.selectTopDepartments();
		
		// 显示树状结构
		List<DepartmentModel> departmentTree = getAllDepartments(topDepartments);
		
		// 将查询结果放到request中
		request.setAttribute("departmentTree", departmentTree);
		logger.info("进入添加页面");

		// 转到添加页面
		return "addDepartmentUI";
	}

	/**
	 * 添加机构
	 * 
	 * @return
	 */
	public String addDepartment() throws Exception {

		// 将model存到数据库
		if(iDepartmentService.addDepartment(model)) {
			logger.info("添加成功");
			request.setAttribute("msg", "添加机构成功！");
			return Consts.SYSSUCCESS;
		}
		return Consts.ERROR;
		
	}

	/**
	 * 修改机构页面
	 * 
	 * @return
	 */
	public String updateDepartmentUI() throws Exception {
		
		// 准备上级机构信息
		List<DepartmentModel> departments = iDepartmentService.selectAllDepartments();
		request.setAttribute("departments", departments);

		// 数据回显
		String departmentid = request.getParameter("departmentid");
		int department_id = Integer.parseInt(departmentid);
		DepartmentModel department = iDepartmentService.getById(department_id);
		request.setAttribute("department", department);
		logger.info("进入修改页面");

		// 转到修改页面
		return "updateDepartmentUI";
	}

	/**
	 * 修改机构
	 * 
	 * @return
	 */
	public String updateDepartment() throws Exception {

		// 根据department_id查询出model对象
		DepartmentModel department = iDepartmentService.getById(model.getDepartment_id());

		// 更新对应的字段
		department.setDepartment_name(model.getDepartment_name());
		department.setDepartment_level(model.getDepartment_level());
		department.setParent_id(model.getParent_id());
		department.setDepartment_desc(model.getDepartment_desc());

		// 更新数据库
		if(iDepartmentService.updateDepartment(department)) {
			logger.info("修改成功");
			request.setAttribute("msg", "修改机构成功！");
			return Consts.SYSSUCCESS;
		}
		return Consts.ERROR;

	}

	/**
	 * 删除机构
	 * 
	 * @return
	 */
	public String deleteDepartment() throws Exception {

		// 根据department_id删除对应的机构
		String departments = request.getParameter("departmentid");
		String[] departmentemp = departments.split(",");
		List<Integer> department_id = new ArrayList<Integer>();
		for(int i = 0; i < departmentemp.length; i++) {
			int temp = Integer.valueOf(departmentemp[i]);
			department_id.add(temp);
		}
		
		// 遍历出所有需要删除的department_id
		List<Integer> list = new ArrayList<Integer>();
		TreeUtil.walkLowerDepartments(department_id, list);
		
		// 设置parent_id的值
		model.setParent_id(iDepartmentService.getById(list.get(0)).getParent_id());
		
		for(int i = 0; i < list.size(); i++) {
			if(iDepartmentService.deleteDepartment(list.get(i))) {
				logger.info("成功删除  " + list.get(i) + " !");
			}
		}
		return "toSelectDepartments";
	}

	/**
	 * 查询所有机构并显示机构树
	 * 
	 * @return
	 * @throws Exception 
	 */
	public String selectAllDepartments() throws Exception {

		// model参数转换为map用于后面添加分页参数
		Map<String, Object> param = ParamUtil.transBean2Map(model);
		if(param == null) {
			param = new HashMap<String, Object>();
		}
		logger.info("model = " + param);
		
		// 得到当前的页数，默认值是1
		int pageNo = ParamUtil.getInt(request, "pageNo", 1);
		
		// 根据条件查询要显示的记录
		IListPage page = iDepartmentService.pageQuery(param,pageNo);
		logger.info("查询结果 page = " + page.getResult());
		request.setAttribute("page", page);
		request.setAttribute("param", param);
		
		// 显示机构树
		List<DepartmentModel> allDepartment = iDepartmentService.selectAllDepartments();
		String departmentTree = TreeUtil.showTree(allDepartment);
		request.setAttribute("departmentTree", departmentTree);

		return "selectDepartments";

	}

	/**
	 * 遍历出机构的所有子机构
	 * 
	 * @param departmentids
	 * @param list
	 */
	@Deprecated
	public void walkLowerDepartments(List<Integer> departmentids, List<Integer> list) throws Exception {
		
		for(int dpt : departmentids) {
			
			list.add(dpt);
			
			// 查询下级机构
			List<DepartmentModel> childrenDepartments = iDepartmentService.selectChildrenDepartments(dpt);
			List<Integer> lowerDepartmentid = new ArrayList<Integer>();
			
			// 将下级机构的department_id放到lowerDepartmentid
			if(!childrenDepartments.isEmpty()) {
				for(int i = 0; i < childrenDepartments.size(); i++) {
					
					lowerDepartmentid.add(childrenDepartments.get(i).getDepartment_id());
				}
			}
			
			walkLowerDepartments(lowerDepartmentid, list);
		}
	}
	
	/**
	 * 遍历树状结构，更改节点名称以防写进数据库
	 * 
	 * @param topDepartments
	 * @param prefix
	 * @param list
	 */
	@Deprecated
	public void walkDepartmentTreeList(Collection<DepartmentModel> topDepartments, String prefix, List<DepartmentModel> list) throws Exception {

		for (DepartmentModel top : topDepartments) {
			
			// 循环顶点，将顶点机构的department_id和department_name的副本放到list中
			DepartmentModel copy = new DepartmentModel();
			copy.setDepartment_id(top.getDepartment_id());
			copy.setDepartment_name(prefix + top.getDepartment_name());
			list.add(copy);
			
			// 根据顶点机构的department_id得到子机构
			List<DepartmentModel> childrenDepartments = iDepartmentService.selectChildrenDepartments(top.getDepartment_id());
			
			// 遍历子树
			walkDepartmentTreeList(childrenDepartments, "├┈" + prefix, list);
		}
	}

	/**
	 * 调用遍历树状结构方法，将遍历结果放到list中返回
	 * 
	 * @param topDepartments
	 * @return
	 */
	public List<DepartmentModel> getAllDepartments(List<DepartmentModel> topDepartments) throws Exception {

		List<DepartmentModel> list = new ArrayList<DepartmentModel>();
		
		// 调用遍历方法
		TreeUtil.walkDepartmentTreeList(topDepartments, "", list);

		return list;
	}
	
	/**
	 * 给dTree准备数据
	 * 
	 * @param childrenPrivileges
	 * @return
	 */
	@Deprecated
	public String showTree(List<DepartmentModel> childrenPrivileges) throws Exception {

		String childrenList = "d.add(0,-1,'机构树');";

		// 循环所有子权限，将子权限格式改为 d.add(1,0,'Node','example.html');
		for (DepartmentModel children : childrenPrivileges) {

			int id = children.getDepartment_id();
			int parentid = children.getParent_id();
			String name = children.getDepartment_name();
			String url = "departmentAction_selectAllDepartments?parent_id=" + parentid;
			
			childrenList += " d.add(" + id + "," + parentid + "," + "'" + name + "'" + "," + "'" + url + "'" + "); ";
		}
		return childrenList;
	}

	@Override
	protected String getModuleName()  throws Exception {
		return "机构管理";
	}
	
}
