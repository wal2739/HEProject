package com.HEProject.he.usersInfo;

import java.io.Serializable;
import java.sql.Date;

public class UsersInfoVO implements Serializable{
	private String userID;
	private String userPW;
	private String userName;
	private String userCell;
	private String userAdd01;
	private String userAdd02;
	private int userClass;
	private String userEmail;
	private int userConsent01;
	private int userConsent02;
	private int userConsent03;
	private int st;
	private String usRn;
	private Date regiDate;
	public UsersInfoVO() {}
	@Override
	public String toString() {
		return "UsersInfoVO [userID=" + userID + ", userPW=" + userPW + ", userName=" + userName + ", userCell="
				+ userCell + ", userAdd01=" + userAdd01 + ", userAdd02=" + userAdd02 + ", userClass=" + userClass
				+ ", userEmail=" + userEmail + ", userConsent01=" + userConsent01 + ", userConsent02=" + userConsent02
				+ ", userConsent03=" + userConsent03 + ", st=" + st + ", usRn=" + usRn + ", regiDate=" + regiDate + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((regiDate == null) ? 0 : regiDate.hashCode());
		result = prime * result + st;
		result = prime * result + ((usRn == null) ? 0 : usRn.hashCode());
		result = prime * result + ((userAdd01 == null) ? 0 : userAdd01.hashCode());
		result = prime * result + ((userAdd02 == null) ? 0 : userAdd02.hashCode());
		result = prime * result + ((userCell == null) ? 0 : userCell.hashCode());
		result = prime * result + userClass;
		result = prime * result + userConsent01;
		result = prime * result + userConsent02;
		result = prime * result + userConsent03;
		result = prime * result + ((userEmail == null) ? 0 : userEmail.hashCode());
		result = prime * result + ((userID == null) ? 0 : userID.hashCode());
		result = prime * result + ((userName == null) ? 0 : userName.hashCode());
		result = prime * result + ((userPW == null) ? 0 : userPW.hashCode());
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
		UsersInfoVO other = (UsersInfoVO) obj;
		if (regiDate == null) {
			if (other.regiDate != null)
				return false;
		} else if (!regiDate.equals(other.regiDate))
			return false;
		if (st != other.st)
			return false;
		if (usRn == null) {
			if (other.usRn != null)
				return false;
		} else if (!usRn.equals(other.usRn))
			return false;
		if (userAdd01 == null) {
			if (other.userAdd01 != null)
				return false;
		} else if (!userAdd01.equals(other.userAdd01))
			return false;
		if (userAdd02 == null) {
			if (other.userAdd02 != null)
				return false;
		} else if (!userAdd02.equals(other.userAdd02))
			return false;
		if (userCell == null) {
			if (other.userCell != null)
				return false;
		} else if (!userCell.equals(other.userCell))
			return false;
		if (userClass != other.userClass)
			return false;
		if (userConsent01 != other.userConsent01)
			return false;
		if (userConsent02 != other.userConsent02)
			return false;
		if (userConsent03 != other.userConsent03)
			return false;
		if (userEmail == null) {
			if (other.userEmail != null)
				return false;
		} else if (!userEmail.equals(other.userEmail))
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
		if (userPW == null) {
			if (other.userPW != null)
				return false;
		} else if (!userPW.equals(other.userPW))
			return false;
		return true;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPW() {
		return userPW;
	}
	public void setUserPW(String userPW) {
		this.userPW = userPW;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserCell() {
		return userCell;
	}
	public void setUserCell(String userCell) {
		this.userCell = userCell;
	}
	public String getUserAdd01() {
		return userAdd01;
	}
	public void setUserAdd01(String userAdd01) {
		this.userAdd01 = userAdd01;
	}
	public String getUserAdd02() {
		return userAdd02;
	}
	public void setUserAdd02(String userAdd02) {
		this.userAdd02 = userAdd02;
	}
	public int getUserClass() {
		return userClass;
	}
	public void setUserClass(int userClass) {
		this.userClass = userClass;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public int getUserConsent01() {
		return userConsent01;
	}
	public void setUserConsent01(int userConsent01) {
		this.userConsent01 = userConsent01;
	}
	public int getUserConsent02() {
		return userConsent02;
	}
	public void setUserConsent02(int userConsent02) {
		this.userConsent02 = userConsent02;
	}
	public int getUserConsent03() {
		return userConsent03;
	}
	public void setUserConsent03(int userConsent03) {
		this.userConsent03 = userConsent03;
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
	public Date getRegiDate() {
		return regiDate;
	}
	public void setRegiDate(Date regiDate) {
		this.regiDate = regiDate;
	}
	
	
	
}
