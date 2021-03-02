package com.HEProject.he.workDataInfo;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class WorkDataInfoVO implements Serializable{

	private String workCode;
	private int de;
	private String dtName;
	private MultipartFile uploadFile;
	public WorkDataInfoVO() {}
	@Override
	public String toString() {
		return "WorkDataInfoVO [workCode=" + workCode + ", de=" + de + ", dtName=" + dtName + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + de;
		result = prime * result + ((dtName == null) ? 0 : dtName.hashCode());
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
		WorkDataInfoVO other = (WorkDataInfoVO) obj;
		if (de != other.de)
			return false;
		if (dtName == null) {
			if (other.dtName != null)
				return false;
		} else if (!dtName.equals(other.dtName))
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
	public int getDe() {
		return de;
	}
	public void setDe(int de) {
		this.de = de;
	}
	public String getDtName() {
		return dtName;
	}
	public void setDtName(String dtName) {
		this.dtName = dtName;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	
	
	
	
}
