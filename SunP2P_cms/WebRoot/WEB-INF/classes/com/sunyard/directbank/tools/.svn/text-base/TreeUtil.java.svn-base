package com.sunyard.directbank.tools;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Service;

import com.sunyard.directbank.department.model.DepartmentModel;
import com.sunyard.directbank.department.service.IDepartmentService;
import com.sunyard.directbank.privilege.model.PrivilegeModel;
import com.sunyard.directbank.privilege.service.IPrivilegeService;

@Service
public class TreeUtil implements InitializingBean{
	
	public static IDepartmentService staticDepartmentService;
	public static IPrivilegeService staticPrivilegeService;
	
	@Resource
	public IDepartmentService departmentService;
	@Resource
	public IPrivilegeService privilegeService;
	
	/**
	 * 遍历树状结构，更改节点名称以防写进数据库
	 * 
	 * @param topDepartments
	 * @param prefix
	 * @param list
	 * @throws Exception 
	 */
	public static List<DepartmentModel> walkDepartmentTreeList(Collection<DepartmentModel> topDepartments, 
			String prefix, List<DepartmentModel> list) throws Exception {

		for (DepartmentModel top : topDepartments) {
			
			// 循环顶点，将顶点机构的department_id和department_name的副本放到list中
			DepartmentModel copy = new DepartmentModel();
			copy.setDepartment_id(top.getDepartment_id());
			copy.setDepartment_name(prefix + top.getDepartment_name());
			list.add(copy);
			
			// 根据顶点机构的department_id得到子机构
			List<DepartmentModel> childrenDepartments = staticDepartmentService.selectChildrenDepartments(top.getDepartment_id());
			
			// 遍历子树
			walkDepartmentTreeList(childrenDepartments, "├┈" + prefix, list);
		}
		return list;
		
	}
	
	/**
	 * 遍历出机构的所有子机构
	 * 
	 * @param departmentids
	 * @param list
	 * @throws Exception 
	 */
	public static void walkLowerDepartments(List<Integer> departmentids, List<Integer> list) throws Exception {
		
		for(int dpt : departmentids) {
			
			list.add(dpt);
			
			// 查询下级机构
			List<DepartmentModel> childrenDepartments = staticDepartmentService.selectChildrenDepartments(dpt);
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
	 * 给dTree准备数据
	 * 
	 * @param childrenPrivileges
	 * @return
	 */
	public static String showTree(List<DepartmentModel> childrenPrivileges) throws Exception {

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
	
	/**
	 * 给dTree准备数据
	 * 
	 * @param childrenPrivileges
	 * @return
	 */
	public static String showLeftTree(List<PrivilegeModel> childrenPrivileges, String parent_id) throws Exception {

		String childrenList = "d.add(" + parent_id + ",-1,'管理后台');";

		// 循环所有子权限，将子权限格式改为 d.add(1,0,'Node','example.html');
		for (PrivilegeModel children : childrenPrivileges) {

			String id = children.getPrivilege_id();
			String parentid = children.getParent_id();
			String name = children.getPrivilege_name();
			String url = children.getUrl();

			if (url == null || url == "" || url.isEmpty()) {
				url = "''";
			} else {
				url = "'" + url + "'";
			}
			childrenList += " d.add(" + id + "," + parentid + "," + "'" + name + "'" + "," + url + "); ";
		}
		return childrenList;
	}
	
	/**
	 * 遍历单个parent的所有子权限
	 * 
	 * @param parent
	 * @param list
	 * @throws Exception 
	 */
	public static void walkChildrenPrivilege(PrivilegeModel parent, List<PrivilegeModel> list) throws Exception {
		
		// 查询所有的子权限
		List<PrivilegeModel> childrenPri = staticPrivilegeService.selectChildrenPrivileges(parent.getPrivilege_id());
		list.addAll(childrenPri);
		
		for(PrivilegeModel parentid : childrenPri) {
			walkChildrenPrivilege(parentid, list);
		}
	}
	
	@Override
	public void afterPropertiesSet() throws Exception {
		
		staticDepartmentService = departmentService;
		staticPrivilegeService = privilegeService;
	}
	
}
