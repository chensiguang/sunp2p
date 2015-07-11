package com.sunyard.directbank.department.model;

import java.io.Serializable;

public class DepartmentModel implements Serializable {

	private static final long serialVersionUID = -1930211854009989281L;
	private int department_id;
	private String department_name;
	private String department_level;
	private int parent_id;
	private int department_inner_id;
	private String department_desc;
	private String parent_depName;

	public int getDepartment_id() {
		return department_id;
	}

	public String getParent_depName() {
		return parent_depName;
	}

	public void setParent_depName(String parent_depName) {
		this.parent_depName = parent_depName;
	}

	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}

	public String getDepartment_name() {
		return department_name;
	}

	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}

	public String getDepartment_level() {
		return department_level;
	}

	public void setDepartment_level(String department_level) {
		this.department_level = department_level;
	}

	public int getParent_id() {
		return parent_id;
	}

	public void setParent_id(int parent_id) {
		this.parent_id = parent_id;
	}

	public int getDepartment_inner_id() {
		return department_inner_id;
	}

	public void setDepartment_inner_id(int department_inner_id) {
		this.department_inner_id = department_inner_id;
	}

	public String getDepartment_desc() {
		return department_desc;
	}

	public void setDepartment_desc(String department_desc) {
		this.department_desc = department_desc;
	}

	@Override
	public String toString() {
		return "DepartmentModel [department_id=" + department_id + ", department_name=" + department_name + ", department_level=" + department_level + ", parent_id=" + parent_id
				+ ", department_inner_id=" + department_inner_id + ", department_desc=" + department_desc + ", parent_depName=" + parent_depName + "]";
	}

}
