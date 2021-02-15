package com.HEProject.he.orderInfo;

import java.io.Serializable;
import java.sql.Date;

public class OrderInfoVO implements Serializable{
	
	private String orderCode;
	private String workCode;
	private int appStatus;
	private String relative;
	private String gUsRn;
	private String sUsRn;
	private String eqRn;
	private Date newDate;
	public OrderInfoVO() {}
	@Override
	public String toString() {
		return "OrderInfoVO [orderCode=" + orderCode + ", workCode=" + workCode + ", appStatus=" + appStatus
				+ ", relative=" + relative + ", gUsRn=" + gUsRn + ", sUsRn=" + sUsRn + ", eqRn=" + eqRn + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + appStatus;
		result = prime * result + ((eqRn == null) ? 0 : eqRn.hashCode());
		result = prime * result + ((gUsRn == null) ? 0 : gUsRn.hashCode());
		result = prime * result + ((orderCode == null) ? 0 : orderCode.hashCode());
		result = prime * result + ((relative == null) ? 0 : relative.hashCode());
		result = prime * result + ((sUsRn == null) ? 0 : sUsRn.hashCode());
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
		OrderInfoVO other = (OrderInfoVO) obj;
		if (appStatus != other.appStatus)
			return false;
		if (eqRn == null) {
			if (other.eqRn != null)
				return false;
		} else if (!eqRn.equals(other.eqRn))
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
		if (sUsRn == null) {
			if (other.sUsRn != null)
				return false;
		} else if (!sUsRn.equals(other.sUsRn))
			return false;
		if (workCode == null) {
			if (other.workCode != null)
				return false;
		} else if (!workCode.equals(other.workCode))
			return false;
		return true;
	}
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	public String getWorkCode() {
		return workCode;
	}
	public void setWorkCode(String workCode) {
		this.workCode = workCode;
	}
	public int getAppStatus() {
		return appStatus;
	}
	public void setAppStatus(int appStatus) {
		this.appStatus = appStatus;
	}
	public String getRelative() {
		return relative;
	}
	public void setRelative(String relative) {
		this.relative = relative;
	}
	public String getgUsRn() {
		return gUsRn;
	}
	public void setgUsRn(String gUsRn) {
		this.gUsRn = gUsRn;
	}
	public String getsUsRn() {
		return sUsRn;
	}
	public void setsUsRn(String sUsRn) {
		this.sUsRn = sUsRn;
	}
	public String getEqRn() {
		return eqRn;
	}
	public void setEqRn(String eqRn) {
		this.eqRn = eqRn;
	}
	public Date getNewDate() {
		return newDate;
	}
	public void setNewDate(Date newDate) {
		this.newDate = newDate;
	}
	
	
	
}
