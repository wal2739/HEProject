package com.HEProject.he.workInfo;

import java.io.Serializable;
import java.sql.Date;

public class WorkInfo_ST0VO implements Serializable{
	
	String userID;
	String userName;
	String workCode;
	String clientCode;
	String workField;
	String fieldManager;
	String fieldManagerPhone;
	String fieldManagerCell;
	String fieldManagerMail;
	String fieldAdd01;
	String fieldAdd02;
	String workAmount;
	String workTime;
	String workRequests;
	int st;
	String assUsRn;
	String indiUsRn;
	String workersData;
	String eqRn;
	String relative;
	Date workDate;
	String boName;
	String cpName;
	String clientCPName;
	String clientManager;
	String clientPhone;
	String rv;
	public WorkInfo_ST0VO() {}
	@Override
	public String toString() {
		return "WorkInfo_ST0VO [userID=" + userID + ", userName=" + userName + ", workCode=" + workCode
				+ ", clientCode=" + clientCode + ", workField=" + workField + ", fieldManager=" + fieldManager
				+ ", fieldManagerPhone=" + fieldManagerPhone + ", fieldManagerCell=" + fieldManagerCell
				+ ", fieldManagerMail=" + fieldManagerMail + ", fieldAdd01=" + fieldAdd01 + ", fieldAdd02=" + fieldAdd02
				+ ", workAmount=" + workAmount + ", workTime=" + workTime + ", workRequests=" + workRequests + ", st="
				+ st + ", assUsRn=" + assUsRn + ", indiUsRn=" + indiUsRn + ", workersData=" + workersData + ", eqRn="
				+ eqRn + ", relative=" + relative + ", workDate=" + workDate + ", boName=" + boName + ", cpName="
				+ cpName + ", clientCPName=" + clientCPName + ", clientManager=" + clientManager + ", clientPhone="
				+ clientPhone + ", rv=" + rv + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((assUsRn == null) ? 0 : assUsRn.hashCode());
		result = prime * result + ((boName == null) ? 0 : boName.hashCode());
		result = prime * result + ((clientCPName == null) ? 0 : clientCPName.hashCode());
		result = prime * result + ((clientCode == null) ? 0 : clientCode.hashCode());
		result = prime * result + ((clientManager == null) ? 0 : clientManager.hashCode());
		result = prime * result + ((clientPhone == null) ? 0 : clientPhone.hashCode());
		result = prime * result + ((cpName == null) ? 0 : cpName.hashCode());
		result = prime * result + ((eqRn == null) ? 0 : eqRn.hashCode());
		result = prime * result + ((fieldAdd01 == null) ? 0 : fieldAdd01.hashCode());
		result = prime * result + ((fieldAdd02 == null) ? 0 : fieldAdd02.hashCode());
		result = prime * result + ((fieldManager == null) ? 0 : fieldManager.hashCode());
		result = prime * result + ((fieldManagerCell == null) ? 0 : fieldManagerCell.hashCode());
		result = prime * result + ((fieldManagerMail == null) ? 0 : fieldManagerMail.hashCode());
		result = prime * result + ((fieldManagerPhone == null) ? 0 : fieldManagerPhone.hashCode());
		result = prime * result + ((indiUsRn == null) ? 0 : indiUsRn.hashCode());
		result = prime * result + ((relative == null) ? 0 : relative.hashCode());
		result = prime * result + ((rv == null) ? 0 : rv.hashCode());
		result = prime * result + st;
		result = prime * result + ((userID == null) ? 0 : userID.hashCode());
		result = prime * result + ((userName == null) ? 0 : userName.hashCode());
		result = prime * result + ((workAmount == null) ? 0 : workAmount.hashCode());
		result = prime * result + ((workCode == null) ? 0 : workCode.hashCode());
		result = prime * result + ((workDate == null) ? 0 : workDate.hashCode());
		result = prime * result + ((workField == null) ? 0 : workField.hashCode());
		result = prime * result + ((workRequests == null) ? 0 : workRequests.hashCode());
		result = prime * result + ((workTime == null) ? 0 : workTime.hashCode());
		result = prime * result + ((workersData == null) ? 0 : workersData.hashCode());
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
		WorkInfo_ST0VO other = (WorkInfo_ST0VO) obj;
		if (assUsRn == null) {
			if (other.assUsRn != null)
				return false;
		} else if (!assUsRn.equals(other.assUsRn))
			return false;
		if (boName == null) {
			if (other.boName != null)
				return false;
		} else if (!boName.equals(other.boName))
			return false;
		if (clientCPName == null) {
			if (other.clientCPName != null)
				return false;
		} else if (!clientCPName.equals(other.clientCPName))
			return false;
		if (clientCode == null) {
			if (other.clientCode != null)
				return false;
		} else if (!clientCode.equals(other.clientCode))
			return false;
		if (clientManager == null) {
			if (other.clientManager != null)
				return false;
		} else if (!clientManager.equals(other.clientManager))
			return false;
		if (clientPhone == null) {
			if (other.clientPhone != null)
				return false;
		} else if (!clientPhone.equals(other.clientPhone))
			return false;
		if (cpName == null) {
			if (other.cpName != null)
				return false;
		} else if (!cpName.equals(other.cpName))
			return false;
		if (eqRn == null) {
			if (other.eqRn != null)
				return false;
		} else if (!eqRn.equals(other.eqRn))
			return false;
		if (fieldAdd01 == null) {
			if (other.fieldAdd01 != null)
				return false;
		} else if (!fieldAdd01.equals(other.fieldAdd01))
			return false;
		if (fieldAdd02 == null) {
			if (other.fieldAdd02 != null)
				return false;
		} else if (!fieldAdd02.equals(other.fieldAdd02))
			return false;
		if (fieldManager == null) {
			if (other.fieldManager != null)
				return false;
		} else if (!fieldManager.equals(other.fieldManager))
			return false;
		if (fieldManagerCell == null) {
			if (other.fieldManagerCell != null)
				return false;
		} else if (!fieldManagerCell.equals(other.fieldManagerCell))
			return false;
		if (fieldManagerMail == null) {
			if (other.fieldManagerMail != null)
				return false;
		} else if (!fieldManagerMail.equals(other.fieldManagerMail))
			return false;
		if (fieldManagerPhone == null) {
			if (other.fieldManagerPhone != null)
				return false;
		} else if (!fieldManagerPhone.equals(other.fieldManagerPhone))
			return false;
		if (indiUsRn == null) {
			if (other.indiUsRn != null)
				return false;
		} else if (!indiUsRn.equals(other.indiUsRn))
			return false;
		if (relative == null) {
			if (other.relative != null)
				return false;
		} else if (!relative.equals(other.relative))
			return false;
		if (rv == null) {
			if (other.rv != null)
				return false;
		} else if (!rv.equals(other.rv))
			return false;
		if (st != other.st)
			return false;
		if (userID == null) {
			if (other.userID != null)
				return false;
		} else if (!userID.equals(other.userID))
			return false;
		if (userName == null) {
			if (other.userName != null)
				return false;
		} else if (!userName.equals(other.userName))
			return false;
		if (workAmount == null) {
			if (other.workAmount != null)
				return false;
		} else if (!workAmount.equals(other.workAmount))
			return false;
		if (workCode == null) {
			if (other.workCode != null)
				return false;
		} else if (!workCode.equals(other.workCode))
			return false;
		if (workDate == null) {
			if (other.workDate != null)
				return false;
		} else if (!workDate.equals(other.workDate))
			return false;
		if (workField == null) {
			if (other.workField != null)
				return false;
		} else if (!workField.equals(other.workField))
			return false;
		if (workRequests == null) {
			if (other.workRequests != null)
				return false;
		} else if (!workRequests.equals(other.workRequests))
			return false;
		if (workTime == null) {
			if (other.workTime != null)
				return false;
		} else if (!workTime.equals(other.workTime))
			return false;
		if (workersData == null) {
			if (other.workersData != null)
				return false;
		} else if (!workersData.equals(other.workersData))
			return false;
		return true;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getWorkCode() {
		return workCode;
	}
	public void setWorkCode(String workCode) {
		this.workCode = workCode;
	}
	public String getClientCode() {
		return clientCode;
	}
	public void setClientCode(String clientCode) {
		this.clientCode = clientCode;
	}
	public String getWorkField() {
		return workField;
	}
	public void setWorkField(String workField) {
		this.workField = workField;
	}
	public String getFieldManager() {
		return fieldManager;
	}
	public void setFieldManager(String fieldManager) {
		this.fieldManager = fieldManager;
	}
	public String getFieldManagerPhone() {
		return fieldManagerPhone;
	}
	public void setFieldManagerPhone(String fieldManagerPhone) {
		this.fieldManagerPhone = fieldManagerPhone;
	}
	public String getFieldManagerCell() {
		return fieldManagerCell;
	}
	public void setFieldManagerCell(String fieldManagerCell) {
		this.fieldManagerCell = fieldManagerCell;
	}
	public String getFieldManagerMail() {
		return fieldManagerMail;
	}
	public void setFieldManagerMail(String fieldManagerMail) {
		this.fieldManagerMail = fieldManagerMail;
	}
	public String getFieldAdd01() {
		return fieldAdd01;
	}
	public void setFieldAdd01(String fieldAdd01) {
		this.fieldAdd01 = fieldAdd01;
	}
	public String getFieldAdd02() {
		return fieldAdd02;
	}
	public void setFieldAdd02(String fieldAdd02) {
		this.fieldAdd02 = fieldAdd02;
	}
	public String getWorkAmount() {
		return workAmount;
	}
	public void setWorkAmount(String workAmount) {
		this.workAmount = workAmount;
	}
	public String getWorkTime() {
		return workTime;
	}
	public void setWorkTime(String workTime) {
		this.workTime = workTime;
	}
	public String getWorkRequests() {
		return workRequests;
	}
	public void setWorkRequests(String workRequests) {
		this.workRequests = workRequests;
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
	public String getIndiUsRn() {
		return indiUsRn;
	}
	public void setIndiUsRn(String indiUsRn) {
		this.indiUsRn = indiUsRn;
	}
	public String getWorkersData() {
		return workersData;
	}
	public void setWorkersData(String workersData) {
		this.workersData = workersData;
	}
	public String getEqRn() {
		return eqRn;
	}
	public void setEqRn(String eqRn) {
		this.eqRn = eqRn;
	}
	public String getRelative() {
		return relative;
	}
	public void setRelative(String relative) {
		this.relative = relative;
	}
	public Date getWorkDate() {
		return workDate;
	}
	public void setWorkDate(Date workDate) {
		this.workDate = workDate;
	}
	public String getBoName() {
		return boName;
	}
	public void setBoName(String boName) {
		this.boName = boName;
	}
	public String getCpName() {
		return cpName;
	}
	public void setCpName(String cpName) {
		this.cpName = cpName;
	}
	public String getClientCPName() {
		return clientCPName;
	}
	public void setClientCPName(String clientCPName) {
		this.clientCPName = clientCPName;
	}
	public String getClientManager() {
		return clientManager;
	}
	public void setClientManager(String clientManager) {
		this.clientManager = clientManager;
	}
	public String getClientPhone() {
		return clientPhone;
	}
	public void setClientPhone(String clientPhone) {
		this.clientPhone = clientPhone;
	}
	public String getRv() {
		return rv;
	}
	public void setRv(String rv) {
		this.rv = rv;
	}
	
	
	
}
