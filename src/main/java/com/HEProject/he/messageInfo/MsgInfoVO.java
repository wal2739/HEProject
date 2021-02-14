package com.HEProject.he.messageInfo;

import java.io.Serializable;
import java.sql.Date;

public class MsgInfoVO implements Serializable{
	
	private String messageCode;
	private Date messageDate;
	private String messageContents;
	private String relative;
	private int st;
	private String gUsRn;
	private String sUsRn;
	private int wMsg;
	private String userId;
	private String userName;
	public MsgInfoVO() {}
	@Override
	public String toString() {
		return "MsgInfoVO [messageCode=" + messageCode + ", messageDate=" + messageDate + ", messageContents="
				+ messageContents + ", relative=" + relative + ", st=" + st + ", gUsRn=" + gUsRn + ", sUsRn=" + sUsRn
				+ ", wMsg=" + wMsg + ", userId=" + userId + ", userName=" + userName + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((gUsRn == null) ? 0 : gUsRn.hashCode());
		result = prime * result + ((messageCode == null) ? 0 : messageCode.hashCode());
		result = prime * result + ((messageContents == null) ? 0 : messageContents.hashCode());
		result = prime * result + ((messageDate == null) ? 0 : messageDate.hashCode());
		result = prime * result + ((relative == null) ? 0 : relative.hashCode());
		result = prime * result + ((sUsRn == null) ? 0 : sUsRn.hashCode());
		result = prime * result + st;
		result = prime * result + ((userId == null) ? 0 : userId.hashCode());
		result = prime * result + ((userName == null) ? 0 : userName.hashCode());
		result = prime * result + wMsg;
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
		MsgInfoVO other = (MsgInfoVO) obj;
		if (gUsRn == null) {
			if (other.gUsRn != null)
				return false;
		} else if (!gUsRn.equals(other.gUsRn))
			return false;
		if (messageCode == null) {
			if (other.messageCode != null)
				return false;
		} else if (!messageCode.equals(other.messageCode))
			return false;
		if (messageContents == null) {
			if (other.messageContents != null)
				return false;
		} else if (!messageContents.equals(other.messageContents))
			return false;
		if (messageDate == null) {
			if (other.messageDate != null)
				return false;
		} else if (!messageDate.equals(other.messageDate))
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
		if (st != other.st)
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
		if (wMsg != other.wMsg)
			return false;
		return true;
	}
	public String getMessageCode() {
		return messageCode;
	}
	public void setMessageCode(String messageCode) {
		this.messageCode = messageCode;
	}
	public Date getMessageDate() {
		return messageDate;
	}
	public void setMessageDate(Date messageDate) {
		this.messageDate = messageDate;
	}
	public String getMessageContents() {
		return messageContents;
	}
	public void setMessageContents(String messageContents) {
		this.messageContents = messageContents;
	}
	public String getRelative() {
		return relative;
	}
	public void setRelative(String relative) {
		this.relative = relative;
	}
	public int getSt() {
		return st;
	}
	public void setSt(int st) {
		this.st = st;
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
	public int getwMsg() {
		return wMsg;
	}
	public void setwMsg(int wMsg) {
		this.wMsg = wMsg;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
	
}
