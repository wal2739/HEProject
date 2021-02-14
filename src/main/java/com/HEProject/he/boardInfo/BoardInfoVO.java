package com.HEProject.he.boardInfo;

import java.io.Serializable;
import java.sql.Date;

public class BoardInfoVO implements Serializable{
	
	private String boardCode;
	private int boardClass;
	private String boardTitle;
	private String boardContents;
	private String usRn;
	private String userName;
	private int views;
	private Date writeDate; 
	private Date fixDate;
	public BoardInfoVO() {}
	@Override
	public String toString() {
		return "BoardInfoVO [boardCode=" + boardCode + ", boardClass=" + boardClass + ", boardTitle=" + boardTitle
				+ ", boardContents=" + boardContents + ", usRn=" + usRn + ", userName=" + userName + ", views=" + views
				+ ", writeDate=" + writeDate + ", fixDate=" + fixDate + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + boardClass;
		result = prime * result + ((boardCode == null) ? 0 : boardCode.hashCode());
		result = prime * result + ((boardContents == null) ? 0 : boardContents.hashCode());
		result = prime * result + ((boardTitle == null) ? 0 : boardTitle.hashCode());
		result = prime * result + ((fixDate == null) ? 0 : fixDate.hashCode());
		result = prime * result + ((usRn == null) ? 0 : usRn.hashCode());
		result = prime * result + ((userName == null) ? 0 : userName.hashCode());
		result = prime * result + views;
		result = prime * result + ((writeDate == null) ? 0 : writeDate.hashCode());
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
		BoardInfoVO other = (BoardInfoVO) obj;
		if (boardClass != other.boardClass)
			return false;
		if (boardCode == null) {
			if (other.boardCode != null)
				return false;
		} else if (!boardCode.equals(other.boardCode))
			return false;
		if (boardContents == null) {
			if (other.boardContents != null)
				return false;
		} else if (!boardContents.equals(other.boardContents))
			return false;
		if (boardTitle == null) {
			if (other.boardTitle != null)
				return false;
		} else if (!boardTitle.equals(other.boardTitle))
			return false;
		if (fixDate == null) {
			if (other.fixDate != null)
				return false;
		} else if (!fixDate.equals(other.fixDate))
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
		if (views != other.views)
			return false;
		if (writeDate == null) {
			if (other.writeDate != null)
				return false;
		} else if (!writeDate.equals(other.writeDate))
			return false;
		return true;
	}
	public String getBoardCode() {
		return boardCode;
	}
	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
	}
	public int getBoardClass() {
		return boardClass;
	}
	public void setBoardClass(int boardClass) {
		this.boardClass = boardClass;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContents() {
		return boardContents;
	}
	public void setBoardContents(String boardContents) {
		this.boardContents = boardContents;
	}
	public String getUsRn() {
		return usRn;
	}
	public void setUsRn(String usRn) {
		this.usRn = usRn;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public Date getFixDate() {
		return fixDate;
	}
	public void setFixDate(Date fixDate) {
		this.fixDate = fixDate;
	}
	
	
	
}
