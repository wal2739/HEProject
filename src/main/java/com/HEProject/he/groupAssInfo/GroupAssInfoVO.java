package com.HEProject.he.groupAssInfo;

import java.io.Serializable;

public class GroupAssInfoVO implements Serializable{
	private String groupCode;
	private	int st;
	private	String assUsRn;
	private	String grUsRn;
	public GroupAssInfoVO() {}
	@Override
	public String toString() {
		return "GroupAssInfoVO [groupCode=" + groupCode + ", st=" + st + ", assUsRn=" + assUsRn + ", grUsRn=" + grUsRn
				+ "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((assUsRn == null) ? 0 : assUsRn.hashCode());
		result = prime * result + ((grUsRn == null) ? 0 : grUsRn.hashCode());
		result = prime * result + ((groupCode == null) ? 0 : groupCode.hashCode());
		result = prime * result + st;
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
		GroupAssInfoVO other = (GroupAssInfoVO) obj;
		if (assUsRn == null) {
			if (other.assUsRn != null)
				return false;
		} else if (!assUsRn.equals(other.assUsRn))
			return false;
		if (grUsRn == null) {
			if (other.grUsRn != null)
				return false;
		} else if (!grUsRn.equals(other.grUsRn))
			return false;
		if (groupCode == null) {
			if (other.groupCode != null)
				return false;
		} else if (!groupCode.equals(other.groupCode))
			return false;
		if (st != other.st)
			return false;
		return true;
	}
	public String getGroupCode() {
		return groupCode;
	}
	public void setGroupCode(String groupCode) {
		this.groupCode = groupCode;
	}
	public int getSt() {
		return st;
	}
	public void setSt(int st) {
		this.st = st;
	}
	public String getAssUsRn() {
		return assUsRn;
	}
	public void setAssUsRn(String assUsRn) {
		this.assUsRn = assUsRn;
	}
	public String getGrUsRn() {
		return grUsRn;
	}
	public void setGrUsRn(String grUsRn) {
		this.grUsRn = grUsRn;
	}
	
	
}
