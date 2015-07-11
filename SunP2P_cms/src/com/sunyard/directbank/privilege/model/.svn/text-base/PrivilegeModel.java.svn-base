package com.sunyard.directbank.privilege.model;

import java.io.Serializable;

public class PrivilegeModel implements Serializable {

	private static final long serialVersionUID = 7656552419277619144L;
	private String privilege_id;
	private String privilege_name;
	private String parent_id;
	private String url;
	private String parent_PriName;

	public String getPrivilege_id() {
		return privilege_id;
	}

	public void setPrivilege_id(String privilege_id) {
		this.privilege_id = privilege_id;
	}

	public String getPrivilege_name() {
		return privilege_name;
	}

	public void setPrivilege_name(String privilege_name) {
		this.privilege_name = privilege_name;
	}

	public String getParent_id() {
		return parent_id;
	}

	public void setParent_id(String parent_id) {
		this.parent_id = parent_id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getParent_PriName() {
		return parent_PriName;
	}

	public void setParent_PriName(String parent_PriName) {
		this.parent_PriName = parent_PriName;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((parent_PriName == null) ? 0 : parent_PriName.hashCode());
		result = prime * result + ((parent_id == null) ? 0 : parent_id.hashCode());
		result = prime * result + ((privilege_id == null) ? 0 : privilege_id.hashCode());
		result = prime * result + ((privilege_name == null) ? 0 : privilege_name.hashCode());
		result = prime * result + ((url == null) ? 0 : url.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PrivilegeModel other = (PrivilegeModel) obj;
		boolean outer=parent_PriName ==null || parent_PriName.equalsIgnoreCase("");
		boolean inner = other.parent_PriName ==null || other.parent_PriName.equalsIgnoreCase("");
		if(outer && inner){}else{
			if(!handleString(parent_PriName).equalsIgnoreCase(handleString(other.parent_PriName))){
				return false;
			}
		}
		boolean outer1=parent_id ==null || parent_id.equalsIgnoreCase("");
		boolean inner1 = other.parent_id ==null || other.parent_id.equalsIgnoreCase("");
		if(outer1 && inner1){}else{
			if(!handleString(parent_id).equalsIgnoreCase(handleString(other.parent_id))){
				return false;
			}
		}
		boolean outer2=url ==null || url.equalsIgnoreCase("");
		boolean inner2 = other.url ==null || other.url.equalsIgnoreCase("");
		if(outer2 && inner2){}else{
			if(!handleString(url).equalsIgnoreCase(handleString(other.url))){
				return false;
			}
		}
		if (privilege_id == null) {
			if (other.privilege_id != null)
				return false;
		} else if (!privilege_id.equals(other.privilege_id))
			return false;
		if (privilege_name == null) {
			if (other.privilege_name != null)
				return false;
		} else if (!privilege_name.equals(other.privilege_name))
			return false;
		return true;
	}

	public String handleString(String mess){
		return mess==null?"":mess;
	}
	
	@Override
	public String toString() {
		return "PrivilegeModel [privilege_id=" + privilege_id + ", privilege_name=" + privilege_name + ", parent_id=" + parent_id + ", url=" + url + ", parent_PriName="
				+ parent_PriName + "]";
	}

}
