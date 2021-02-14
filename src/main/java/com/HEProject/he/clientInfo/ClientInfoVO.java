package com.HEProject.he.clientInfo;

import java.io.Serializable;

public class ClientInfoVO implements Serializable {

//	CLIENTCODE	VARCHAR2(11 BYTE)
//	CLIENTBONUMBER	NUMBER(10,0)
//	CLIENTCEO	VARCHAR2(21 BYTE)
//	CLIENTMANAGER	VARCHAR2(21 BYTE)
//	CLIENTPHONE	VARCHAR2(15 BYTE)
//	CLIENTCELL	VARCHAR2(15 BYTE)
//	CLIENTMAIL	VARCHAR2(30 BYTE)
//	CLIENTADD01	VARCHAR2(100 BYTE)
//	CLIENTADD02	VARCHAR2(57 BYTE)
//	ST	NUMBER(5,0)
//	USRN	VARCHAR2(11 BYTE)
	
	private String clientCode;
	private String clientBoNumber;
	private String clientCeo;
	private String clientManager;
	private String clientPhone;
	private String clientCell;
	private String clientMail;
	private String clientAdd01;
	private String clientAdd02;
	private int st;
	private String usRn;
	private String relative;
	private String clientCpName;
	public ClientInfoVO() {}
	@Override
	public String toString() {
		return "ClientInfoVO [clientCode=" + clientCode + ", clientBoNumber=" + clientBoNumber + ", clientCeo="
				+ clientCeo + ", clientManager=" + clientManager + ", clientPhone=" + clientPhone + ", clientCell="
				+ clientCell + ", clientMail=" + clientMail + ", clientAdd01=" + clientAdd01 + ", clientAdd02="
				+ clientAdd02 + ", st=" + st + ", usRn=" + usRn + ", relative=" + relative + ", clientCpName="
				+ clientCpName + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((clientAdd01 == null) ? 0 : clientAdd01.hashCode());
		result = prime * result + ((clientAdd02 == null) ? 0 : clientAdd02.hashCode());
		result = prime * result + ((clientBoNumber == null) ? 0 : clientBoNumber.hashCode());
		result = prime * result + ((clientCell == null) ? 0 : clientCell.hashCode());
		result = prime * result + ((clientCeo == null) ? 0 : clientCeo.hashCode());
		result = prime * result + ((clientCode == null) ? 0 : clientCode.hashCode());
		result = prime * result + ((clientCpName == null) ? 0 : clientCpName.hashCode());
		result = prime * result + ((clientMail == null) ? 0 : clientMail.hashCode());
		result = prime * result + ((clientManager == null) ? 0 : clientManager.hashCode());
		result = prime * result + ((clientPhone == null) ? 0 : clientPhone.hashCode());
		result = prime * result + ((relative == null) ? 0 : relative.hashCode());
		result = prime * result + st;
		result = prime * result + ((usRn == null) ? 0 : usRn.hashCode());
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
		ClientInfoVO other = (ClientInfoVO) obj;
		if (clientAdd01 == null) {
			if (other.clientAdd01 != null)
				return false;
		} else if (!clientAdd01.equals(other.clientAdd01))
			return false;
		if (clientAdd02 == null) {
			if (other.clientAdd02 != null)
				return false;
		} else if (!clientAdd02.equals(other.clientAdd02))
			return false;
		if (clientBoNumber == null) {
			if (other.clientBoNumber != null)
				return false;
		} else if (!clientBoNumber.equals(other.clientBoNumber))
			return false;
		if (clientCell == null) {
			if (other.clientCell != null)
				return false;
		} else if (!clientCell.equals(other.clientCell))
			return false;
		if (clientCeo == null) {
			if (other.clientCeo != null)
				return false;
		} else if (!clientCeo.equals(other.clientCeo))
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
		if (clientMail == null) {
			if (other.clientMail != null)
				return false;
		} else if (!clientMail.equals(other.clientMail))
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
		if (relative == null) {
			if (other.relative != null)
				return false;
		} else if (!relative.equals(other.relative))
			return false;
		if (st != other.st)
			return false;
		if (usRn == null) {
			if (other.usRn != null)
				return false;
		} else if (!usRn.equals(other.usRn))
			return false;
		return true;
	}
	public String getClientCode() {
		return clientCode;
	}
	public void setClientCode(String clientCode) {
		this.clientCode = clientCode;
	}
	public String getClientBoNumber() {
		return clientBoNumber;
	}
	public void setClientBoNumber(String clientBoNumber) {
		this.clientBoNumber = clientBoNumber;
	}
	public String getClientCeo() {
		return clientCeo;
	}
	public void setClientCeo(String clientCeo) {
		this.clientCeo = clientCeo;
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
	public String getClientCell() {
		return clientCell;
	}
	public void setClientCell(String clientCell) {
		this.clientCell = clientCell;
	}
	public String getClientMail() {
		return clientMail;
	}
	public void setClientMail(String clientMail) {
		this.clientMail = clientMail;
	}
	public String getClientAdd01() {
		return clientAdd01;
	}
	public void setClientAdd01(String clientAdd01) {
		this.clientAdd01 = clientAdd01;
	}
	public String getClientAdd02() {
		return clientAdd02;
	}
	public void setClientAdd02(String clientAdd02) {
		this.clientAdd02 = clientAdd02;
	}
	public int getSt() {
		return st;
	}
	public void setSt(int st) {
		this.st = st;
	}
	public String getUsRn() {
		return usRn;
	}
	public void setUsRn(String usRn) {
		this.usRn = usRn;
	}
	public String getRelative() {
		return relative;
	}
	public void setRelative(String relative) {
		this.relative = relative;
	}
	public String getClientCpName() {
		return clientCpName;
	}
	public void setClientCpName(String clientCpName) {
		this.clientCpName = clientCpName;
	}
	
	
	
	
	
}
