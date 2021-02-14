package com.HEProject.he.orderInfo;

import java.io.Serializable;
import java.sql.Date;

public class OrderInfoForIndiVO implements Serializable{
	private String userName;
	private String workCode;
	private String clientCode;
	private String workField;
	private String fieldManager;
	private String fieldManagerPhone;
	private String fieldManagerCell;
	private String fieldManagerMail;
	private String fieldAdd01;
	private String fieldAdd02;
	private String workAmount;
	private String workTime;
	private String workRequests;
	private int st;
	private String assUsRn;
	private Date workDate;
	private String RV;
	private String eqRn;
	private String gUsRn;
	private int appStatus;
	private String userCell;
	private String clientCpName;
	private String clientManager;
	private String clientPhone;
	private String equipOption;
	private String userId;
	private String equipType;
	private String equipClass;
	private String relative;
	private String orderCode;
	private String equipNum;
	private String cpName;
	private String boPhone;
	public OrderInfoForIndiVO() {}
	@Override
	public String toString() {
		return "OrderInfoForIndiVO [userName=" + userName + ", workCode=" + workCode + ", clientCode=" + clientCode
				+ ", workField=" + workField + ", fieldManager=" + fieldManager + ", fieldManagerPhone="
				+ fieldManagerPhone + ", fieldManagerCell=" + fieldManagerCell + ", fieldManagerMail="
				+ fieldManagerMail + ", fieldAdd01=" + fieldAdd01 + ", fieldAdd02=" + fieldAdd02 + ", workAmount="
				+ workAmount + ", workTime=" + workTime + ", workRequests=" + workRequests + ", st=" + st + ", assUsRn="
				+ assUsRn + ", workDate=" + workDate + ", RV=" + RV + ", eqRn=" + eqRn + ", gUsRn=" + gUsRn
				+ ", appStatus=" + appStatus + ", userCell=" + userCell + ", clientCpName=" + clientCpName
				+ ", clientManager=" + clientManager + ", clientPhone=" + clientPhone + ", equipOption=" + equipOption
				+ ", userId=" + userId + ", equipType=" + equipType + ", equipClass=" + equipClass + ", relative="
				+ relative + ", orderCode=" + orderCode + ", equipNum=" + equipNum + ", cpName=" + cpName + ", boPhone="
				+ boPhone + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((RV == null) ? 0 : RV.hashCode());
		result = prime * result + appStatus;
		result = prime * result + ((assUsRn == null) ? 0 : assUsRn.hashCode());
		result = prime * result + ((boPhone == null) ? 0 : boPhone.hashCode());
		result = prime * result + ((clientCode == null) ? 0 : clientCode.hashCode());
		result = prime * result + ((clientCpName == null) ? 0 : clientCpName.hashCode());
		result = prime * result + ((clientManager == null) ? 0 : clientManager.hashCode());
		result = prime * result + ((clientPhone == null) ? 0 : clientPhone.hashCode());
		result = prime * result + ((cpName == null) ? 0 : cpName.hashCode());
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
		result = prime * result + ((gUsRn == null) ? 0 : gUsRn.hashCode());
		result = prime * result + ((orderCode == null) ? 0 : orderCode.hashCode());
		result = prime * result + ((relative == null) ? 0 : relative.hashCode());
		result = prime * result + st;
		result = prime * result + ((userCell == null) ? 0 : userCell.hashCode());
		result = prime * result + ((userId == null) ? 0 : userId.hashCode());
		result = prime * result + ((userName == null) ? 0 : userName.hashCode());
		result = prime * result + ((workAmount == null) ? 0 : workAmount.hashCode());
		result = prime * result + ((workCode == null) ? 0 : workCode.hashCode());
		result = prime * result + ((workDate == null) ? 0 : workDate.hashCode());
		result = prime * result + ((workField == null) ? 0 : workField.hashCode());
		result = prime * result + ((workRequests == null) ? 0 : workRequests.hashCode());
		result = prime * result + ((workTime == null) ? 0 : workTime.hashCode());
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
		OrderInfoForIndiVO other = (OrderInfoForIndiVO) obj;
		if (RV == null) {
			if (other.RV != null)
				return false;
		} else if (!RV.equals(other.RV))
			return false;
		if (appStatus != other.appStatus)
			return false;
		if (assUsRn == null) {
			if (other.assUsRn != null)
				return false;
		} else if (!assUsRn.equals(other.assUsRn))
			return false;
		if (boPhone == null) {
			if (other.boPhone != null)
				return false;
		} else if (!boPhone.equals(other.boPhone))
			return false;
		if (clientCode == null) {
			if (other.clientCode != null)
				return false;
		} else if (!clientCode.equals(other.clientCode))
			return false;
		if (clientCpName == null) {
			if (other.clientCpName != null)
				return false;
		} else if (!clientCpName.equals(other.clientCpName))
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
		if (gUsRn == null) {
			if (other.gUsRn != null)
				return false;
		} else if (!gUsRn.equals(other.gUsRn))
			return false;
		if (orderCode == null) {
			if (other.orderCode != null)
				return false;
		} else if (!orderCode.equals(other.orderCode))
			return false;
		if (relative == null) {
			if (other.relative != null)
				return false;
		} else if (!relative.equals(other.relative))
			return false;
		if (st != other.st)
			return false;
		if (userCell == null) {
			if (other.userCell != null)
				return false;
		} else if (!userCell.equals(other.userCell))
			return false;
		if (userId == null) {
			if (other.userId != null)
				return false;
		} else if (!userId.equals(other.userId))
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
		return true;
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
	public Date getWorkDate() {
		return workDate;
	}
	public void setWorkDate(Date workDate) {
		this.workDate = workDate;
	}
	public String getRV() {
		return RV;
	}
	public void setRV(String rV) {
		RV = rV;
	}
	public String getEqRn() {
		return eqRn;
	}
	public void setEqRn(String eqRn) {
		this.eqRn = eqRn;
	}
	public String getgUsRn() {
		return gUsRn;
	}
	public void setgUsRn(String gUsRn) {
		this.gUsRn = gUsRn;
	}
	public int getAppStatus() {
		return appStatus;
	}
	public void setAppStatus(int appStatus) {
		this.appStatus = appStatus;
	}
	public String getUserCell() {
		return userCell;
	}
	public void setUserCell(String userCell) {
		this.userCell = userCell;
	}
	public String getClientCpName() {
		return clientCpName;
	}
	public void setClientCpName(String clientCpName) {
		this.clientCpName = clientCpName;
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
	public String getEquipOption() {
		return equipOption;
	}
	public void setEquipOption(String equipOption) {
		this.equipOption = equipOption;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	public String getRelative() {
		return relative;
	}
	public void setRelative(String relative) {
		this.relative = relative;
	}
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	public String getEquipNum() {
		return equipNum;
	}
	public void setEquipNum(String equipNum) {
		this.equipNum = equipNum;
	}
	public String getCpName() {
		return cpName;
	}
	public void setCpName(String cpName) {
		this.cpName = cpName;
	}
	public String getBoPhone() {
		return boPhone;
	}
	public void setBoPhone(String boPhone) {
		this.boPhone = boPhone;
	}
	
}
