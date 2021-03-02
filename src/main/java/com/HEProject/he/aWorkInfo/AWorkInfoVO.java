package com.HEProject.he.aWorkInfo;

import java.io.Serializable;

public class AWorkInfoVO implements Serializable{

	private String workCode;
	private int es;
	private int et;
	private int aa;
	public AWorkInfoVO() {}
	@Override
	public String toString() {
		return "AWorkInfoVO [workCode=" + workCode + ", es=" + es + ", et=" + et + ", aa=" + aa + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + aa;
		result = prime * result + es;
		result = prime * result + et;
		result = prime * result + ((workCode == null) ? 0 : workCode.hashCode());
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
		AWorkInfoVO other = (AWorkInfoVO) obj;
		if (aa != other.aa)
			return false;
		if (es != other.es)
			return false;
		if (et != other.et)
			return false;
		if (workCode == null) {
			if (other.workCode != null)
				return false;
		} else if (!workCode.equals(other.workCode))
			return false;
		return true;
	}
	public String getWorkCode() {
		return workCode;
	}
	public void setWorkCode(String workCode) {
		this.workCode = workCode;
	}
	public int getEs() {
		return es;
	}
	public void setEs(int es) {
		this.es = es;
	}
	public int getEt() {
		return et;
	}
	public void setEt(int et) {
		this.et = et;
	}
	public int getAa() {
		return aa;
	}
	public void setAa(int aa) {
		this.aa = aa;
	}
	
	
	
	
}
