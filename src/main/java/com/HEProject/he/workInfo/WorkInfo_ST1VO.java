package com.HEProject.he.workInfo;

import java.io.Serializable;
import java.sql.Date;

public class WorkInfo_ST1VO implements Serializable{
	String assUserID;
	String assUserName;
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
	String assBOName;
	String assCPName;
	String indiUserID;
	String indiUserName;
	String indiBOName;
	String indiCPName;
	String equipNum;
	String equipType;
	String equipClass;
	String equipOption;
	String clientCPName;
	String clientManager;
	String clientPhone;
	String rv;
	public WorkInfo_ST1VO() {}
	@Override
	public String toString() {
		return "WorkInfo_ST1VO [assUserID=" + assUserID + ", assUserName=" + assUserName + ", workCode=" + workCode
				+ ", clientCode=" + clientCode + ", workField=" + workField + ", fieldManager=" + fieldManager
				+ ", fieldManagerPhone=" + fieldManagerPhone + ", fieldManagerCell=" + fieldManagerCell
				+ ", fieldManagerMail=" + fieldManagerMail + ", fieldAdd01=" + fieldAdd01 + ", fieldAdd02=" + fieldAdd02
				+ ", workAmount=" + workAmount + ", workTime=" + workTime + ", workRequests=" + workRequests + ", st="
				+ st + ", assUsRn=" + assUsRn + ", indiUsRn=" + indiUsRn + ", workersData=" + workersData + ", eqRn="
				+ eqRn + ", relative=" + relative + ", workDate=" + workDate + ", assBOName=" + assBOName
				+ ", assCPName=" + assCPName + ", indiUserID=" + indiUserID + ", indiUserName=" + indiUserName
				+ ", indiBOName=" + indiBOName + ", indiCPName=" + indiCPName + ", equipNum=" + equipNum
				+ ", equipType=" + equipType + ", equipClass=" + equipClass + ", equipOption=" + equipOption
				+ ", clientCPName=" + clientCPName + ", clientManager=" + clientManager + ", clientPhone=" + clientPhone
				+ ", rv=" + rv + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((assBOName == null) ? 0 : assBOName.hashCode());
		result = prime * result + ((assCPName == null) ? 0 : assCPName.hashCode());
		result = prime * result + ((assUsRn == null) ? 0 : assUsRn.hashCode());
		result = prime * result + ((assUserID == null) ? 0 : assUserID.hashCode());
		result = prime * result + ((assUserName == null) ? 0 : assUserName.hashCode());
		result = prime * result + ((clientCPName == null) ? 0 : clientCPName.hashCode());
		result = prime * result + ((clientCode == null) ? 0 : clientCode.hashCode());
		result = prime * result + ((clientManager == null) ? 0 : clientManager.hashCode());
		result = prime * result + ((clientPhone == null) ? 0 : clientPhone.hashCode());
		result = prime * result + ((eqRn == null) ? 0 : eqRn.hashCode());
		result = prime * result + ((equipClass == null) ? 0 : equipClass.hashCode());
		result = prime * result + ((equipNum == null) ? 0 : equipNum.hashCode());
		result = prime * result + ((equipOption == null) ? 0 : equipOption.hashCode());
		result = prime * result + ((equipType == null) ? 0 : equipType.hashCode());
		result = prime * result + ((fieldAdd01 == null) ? 0 : fieldAdd01.hashCode());
		result = prime * result + ((fieldAdd02 == null) ? 0 : fieldAdd02.hashCode());
		result = prime * result + ((fieldManager == null) ? 0 : fieldManager.hashCode());
		result = prime * result + ((fieldManagerCell == null) ? 0 : fieldManagerCell.hashCode());
		result = prime * result + ((fieldManagerMail == null) ? 0 : fieldManagerMail.hashCode());
		result = prime * result + ((fieldManagerPhone == null) ? 0 : fieldManagerPhone.hashCode());
		result = prime * result + ((indiBOName == null) ? 0 : indiBOName.hashCode());
		result = prime * result + ((indiCPName == null) ? 0 : indiCPName.hashCode());
		result = prime * result + ((indiUsRn == null) ? 0 : indiUsRn.hashCode());
		result = prime * result + ((indiUserID == null) ? 0 : indiUserID.hashCode());
		result = prime * result + ((indiUserName == null) ? 0 : indiUserName.hashCode());
		result = prime * result + ((relative == null) ? 0 : relative.hashCode());
		result = prime * result + ((rv == null) ? 0 : rv.hashCode());
		result = prime * result + st;
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
		WorkInfo_ST1VO other = (WorkInfo_ST1VO) obj;
		if (assBOName == null) {
			if (other.assBOName != null)
				return false;
		} else if (!assBOName.equals(other.assBOName))
			return false;
		if (assCPName == null) {
			if (other.assCPName != null)
				return false;
		} else if (!assCPName.equals(other.assCPName))
			return false;
		if (assUsRn == null) {
			if (other.assUsRn != null)
				return false;
		} else if (!assUsRn.equals(other.assUsRn))
			return false;
		if (assUserID == null) {
			if (other.assUserID != null)
				return false;
		} else if (!assUserID.equals(other.assUserID))
			return false;
		if (assUserName == null) {
			if (other.assUserName != null)
				return false;
		} else if (!assUserName.equals(other.assUserName))
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
		if (eqRn == null) {
			if (other.eqRn != null)
				return false;
		} else if (!eqRn.equals(other.eqRn))
			return false;
		if (equipClass == null) {
			if (other.equipClass != null)
				return false;
		} else if (!equipClass.equals(other.equipClass))
			return false;
		if (equipNum == null) {
			if (other.equipNum != null)
				return false;
		} else if (!equipNum.equals(other.equipNum))
			return false;
		if (equipOption == null) {
			if (other.equipOption != null)
				return false;
		} else if (!equipOption.equals(other.equipOption))
			return false;
		if (equipType == null) {
			if (other.equipType != null)
				return false;
		} else if (!equipType.equals(other.equipType))
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
		if (indiBOName == null) {
			if (other.indiBOName != null)
				return false;
		} else if (!indiBOName.equals(other.indiBOName))
			return false;
		if (indiCPName == null) {
			if (other.indiCPName != null)
				return false;
		} else if (!indiCPName.equals(other.indiCPName))
			return false;
		if (indiUsRn == null) {
			if (other.indiUsRn != null)
				return false;
		} else if (!indiUsRn.equals(other.indiUsRn))
			return false;
		if (indiUserID == null) {
			if (other.indiUserID != null)
				return false;
		} else if (!indiUserID.equals(other.indiUserID))
			return false;
		if (indiUserName == null) {
			if (other.indiUserName != null)
				return false;
		} else if (!indiUserName.equals(other.indiUserName))
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
	public String getAssUserID() {
		return assUserID;
	}
	public void setAssUserID(String assUserID) {
		this.assUserID = assUserID;
	}
	public String getAssUserName() {
		return assUserName;
	}
	public void setAssUserName(String assUserName) {
		this.assUserName = assUserName;
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
	public String getAssBOName() {
		return assBOName;
	}
	public void setAssBOName(String assBOName) {
		this.assBOName = assBOName;
	}
	public String getAssCPName() {
		return assCPName;
	}
	public void setAssCPName(String assCPName) {
		this.assCPName = assCPName;
	}
	public String getIndiUserID() {
		return indiUserID;
	}
	public void setIndiUserID(String indiUserID) {
		this.indiUserID = indiUserID;
	}
	public String getIndiUserName() {
		return indiUserName;
	}
	public void setIndiUserName(String indiUserName) {
		this.indiUserName = indiUserName;
	}
	public String getIndiBOName() {
		return indiBOName;
	}
	public void setIndiBOName(String indiBOName) {
		this.indiBOName = indiBOName;
	}
	public String getIndiCPName() {
		return indiCPName;
	}
	public void setIndiCPName(String indiCPName) {
		this.indiCPName = indiCPName;
	}
	public String getEquipNum() {
		return equipNum;
	}
	public void setEquipNum(String equipNum) {
		this.equipNum = equipNum;
	}
	public String getEquipType() {
		return equipType;
	}
	public void setEquipType(String equipType) {
		this.equipType = equipType;
	}
	public String getEquipClass() {
		return equipClass;
	}
	public void setEquipClass(String equipClass) {
		this.equipClass = equipClass;
	}
	public String getEquipOption() {
		return equipOption;
	}
	public void setEquipOption(String equipOption) {
		this.equipOption = equipOption;
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
