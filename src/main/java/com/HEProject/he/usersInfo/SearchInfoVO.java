package com.HEProject.he.usersInfo;

import java.io.Serializable;

public class SearchInfoVO implements Serializable{

	private String userName;
	private String equipType;
	private String equipClass;
	private String equipOption;
	private String usRn;
	public SearchInfoVO() {}
	@Override
	public String toString() {
		return "SearchInfoVO [userName=" + userName + ", equipType=" + equipType + ", equipClass=" + equipClass
				+ ", equipOption=" + equipOption + ", usRn=" + usRn + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((equipClass == null) ? 0 : equipClass.hashCode());
		result = prime * result + ((equipOption == null) ? 0 : equipOption.hashCode());
		result = prime * result + ((equipType == null) ? 0 : equipType.hashCode());
		result = prime * result + ((usRn == null) ? 0 : usRn.hashCode());
		result = prime * result + ((userName == null) ? 0 : userName.hashCode());
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
		SearchInfoVO other = (SearchInfoVO) obj;
		if (equipClass == null) {
			if (other.equipClass != null)
				return false;
		} else if (!equipClass.equals(other.equipClass))
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
		if (usRn == null) {
			if (other.usRn != null)
				return false;
		} else if (!usRn.equals(other.usRn))
			return false;
		if (userName == null) {
			if (other.userName != null)
				return false;
		} else if (!userName.equals(other.userName))
			return false;
		return true;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
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
	public String getUsRn() {
		return usRn;
	}
	public void setUsRn(String usRn) {
		this.usRn = usRn;
	}
	
	
	
}
