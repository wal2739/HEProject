package com.HEProject.he.vehicleInfo;

import java.io.Serializable;
import java.sql.Date;

public class VehicleVO implements Serializable{
//	EQUIPNUM	VARCHAR2(13 BYTE)
//	USERID	VARCHAR2(20 BYTE)
//	EQUIPTYPE	VARCHAR2(21 BYTE)
//	EQUIPCLASS	VARCHAR2(21 BYTE)
//	EQUIPOPTION	VARCHAR2(21 BYTE)
//	EQUIPRD	DATE
//	EQUIPID	DATE
//	ST	NUMBER(1,0)
	private String equipNum;
	private String equipType;
	private String equipClass;
	private String equipOption;
	private Date equipRD;
	private Date equipID;
	private int st;
	private String eqRn;
	private String usRn;
	public VehicleVO() {}
	public VehicleVO(String equipNum, String equipType, String equipClass, String equipOption, Date equipRD,
			Date equipID, int st, String eqRn, String usRn) {
		super();
		this.equipNum = equipNum;
		this.equipType = equipType;
		this.equipClass = equipClass;
		this.equipOption = equipOption;
		this.equipRD = equipRD;
		this.equipID = equipID;
		this.st = st;
		this.eqRn = eqRn;
		this.usRn = usRn;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((eqRn == null) ? 0 : eqRn.hashCode());
		result = prime * result + ((equipClass == null) ? 0 : equipClass.hashCode());
		result = prime * result + ((equipID == null) ? 0 : equipID.hashCode());
		result = prime * result + ((equipNum == null) ? 0 : equipNum.hashCode());
		result = prime * result + ((equipOption == null) ? 0 : equipOption.hashCode());
		result = prime * result + ((equipRD == null) ? 0 : equipRD.hashCode());
		result = prime * result + ((equipType == null) ? 0 : equipType.hashCode());
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
		VehicleVO other = (VehicleVO) obj;
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
		if (equipID == null) {
			if (other.equipID != null)
				return false;
		} else if (!equipID.equals(other.equipID))
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
		if (equipRD == null) {
			if (other.equipRD != null)
				return false;
		} else if (!equipRD.equals(other.equipRD))
			return false;
		if (equipType == null) {
			if (other.equipType != null)
				return false;
		} else if (!equipType.equals(other.equipType))
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
	public Date getEquipRD() {
		return equipRD;
	}
	public void setEquipRD(Date equipRD) {
		this.equipRD = equipRD;
	}
	public Date getEquipID() {
		return equipID;
	}
	public void setEquipID(Date equipID) {
		this.equipID = equipID;
	}
	public int getSt() {
		return st;
	}
	public void setSt(int st) {
		this.st = st;
	}
	public String getEqRn() {
		return eqRn;
	}
	public void setEqRn(String eqRn) {
		this.eqRn = eqRn;
	}
	public String getUsRn() {
		return usRn;
	}
	public void setUsRn(String usRn) {
		this.usRn = usRn;
	}
	
	
	
	
	
	
}
