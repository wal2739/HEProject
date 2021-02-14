package com.HEProject.he.workersInfo;

import java.io.Serializable;

public class WorkersInfoVO implements Serializable{
	private String workerCode;
	private String workerName;
	private String workerRRN;
	private String workerPhone;
	private String workerCell;
	private String workerPW;
	private String WorkerAdd01;
	private String WorkerAdd02;
	private int st;
	private String usRn;
	public WorkersInfoVO() {}
	@Override
	public String toString() {
		return "WorkersInfoVO [workerCode=" + workerCode + ", workerName=" + workerName + ", workerRRN=" + workerRRN
				+ ", workerPhone=" + workerPhone + ", workerCell=" + workerCell + ", workerPW=" + workerPW
				+ ", WorkerAdd01=" + WorkerAdd01 + ", WorkerAdd02=" + WorkerAdd02 + ", st=" + st + ", usRn=" + usRn
				+ "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((WorkerAdd01 == null) ? 0 : WorkerAdd01.hashCode());
		result = prime * result + ((WorkerAdd02 == null) ? 0 : WorkerAdd02.hashCode());
		result = prime * result + st;
		result = prime * result + ((usRn == null) ? 0 : usRn.hashCode());
		result = prime * result + ((workerCell == null) ? 0 : workerCell.hashCode());
		result = prime * result + ((workerCode == null) ? 0 : workerCode.hashCode());
		result = prime * result + ((workerName == null) ? 0 : workerName.hashCode());
		result = prime * result + ((workerPW == null) ? 0 : workerPW.hashCode());
		result = prime * result + ((workerPhone == null) ? 0 : workerPhone.hashCode());
		result = prime * result + ((workerRRN == null) ? 0 : workerRRN.hashCode());
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
		WorkersInfoVO other = (WorkersInfoVO) obj;
		if (WorkerAdd01 == null) {
			if (other.WorkerAdd01 != null)
				return false;
		} else if (!WorkerAdd01.equals(other.WorkerAdd01))
			return false;
		if (WorkerAdd02 == null) {
			if (other.WorkerAdd02 != null)
				return false;
		} else if (!WorkerAdd02.equals(other.WorkerAdd02))
			return false;
		if (st != other.st)
			return false;
		if (usRn == null) {
			if (other.usRn != null)
				return false;
		} else if (!usRn.equals(other.usRn))
			return false;
		if (workerCell == null) {
			if (other.workerCell != null)
				return false;
		} else if (!workerCell.equals(other.workerCell))
			return false;
		if (workerCode == null) {
			if (other.workerCode != null)
				return false;
		} else if (!workerCode.equals(other.workerCode))
			return false;
		if (workerName == null) {
			if (other.workerName != null)
				return false;
		} else if (!workerName.equals(other.workerName))
			return false;
		if (workerPW == null) {
			if (other.workerPW != null)
				return false;
		} else if (!workerPW.equals(other.workerPW))
			return false;
		if (workerPhone == null) {
			if (other.workerPhone != null)
				return false;
		} else if (!workerPhone.equals(other.workerPhone))
			return false;
		if (workerRRN == null) {
			if (other.workerRRN != null)
				return false;
		} else if (!workerRRN.equals(other.workerRRN))
			return false;
		return true;
	}
	public String getWorkerCode() {
		return workerCode;
	}
	public void setWorkerCode(String workerCode) {
		this.workerCode = workerCode;
	}
	public String getWorkerName() {
		return workerName;
	}
	public void setWorkerName(String workerName) {
		this.workerName = workerName;
	}
	public String getWorkerRRN() {
		return workerRRN;
	}
	public void setWorkerRRN(String workerRRN) {
		this.workerRRN = workerRRN;
	}
	public String getWorkerPhone() {
		return workerPhone;
	}
	public void setWorkerPhone(String workerPhone) {
		this.workerPhone = workerPhone;
	}
	public String getWorkerCell() {
		return workerCell;
	}
	public void setWorkerCell(String workerCell) {
		this.workerCell = workerCell;
	}
	public String getWorkerPW() {
		return workerPW;
	}
	public void setWorkerPW(String workerPW) {
		this.workerPW = workerPW;
	}
	public String getWorkerAdd01() {
		return WorkerAdd01;
	}
	public void setWorkerAdd01(String workerAdd01) {
		WorkerAdd01 = workerAdd01;
	}
	public String getWorkerAdd02() {
		return WorkerAdd02;
	}
	public void setWorkerAdd02(String workerAdd02) {
		WorkerAdd02 = workerAdd02;
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
	
	
	
	
	
	
	
	
}
