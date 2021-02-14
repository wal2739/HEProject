package com.HEProject.he.boInfo;

import java.io.Serializable;

public class BOInfoVO implements Serializable {
	private String boNumber;
	private String boName;
	private String boRrn;
	private String boPhone;
	private String boCell;
	private String boMail;
	private int boLicense;
	private String boAdd01;
	private String boAdd02;
	private long boAcc;
	private String boAccBack;
	private int st;
	private String boRn;
	private String usRn;
	private String tob01;
	private String tob02;
	private String cpName;
	public BOInfoVO() {}
	@Override
	public String toString() {
		return "BOInfoVO [boNumber=" + boNumber + ", boName=" + boName + ", boRrn=" + boRrn + ", boPhone=" + boPhone
				+ ", boCell=" + boCell + ", boMail=" + boMail + ", boLicense=" + boLicense + ", boAdd01=" + boAdd01
				+ ", boAdd02=" + boAdd02 + ", boAcc=" + boAcc + ", boAccBack=" + boAccBack + ", st=" + st + ", boRn="
				+ boRn + ", usRn=" + usRn + ", tob01=" + tob01 + ", tob02=" + tob02 + ", cpName=" + cpName + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (boAcc ^ (boAcc >>> 32));
		result = prime * result + ((boAccBack == null) ? 0 : boAccBack.hashCode());
		result = prime * result + ((boAdd01 == null) ? 0 : boAdd01.hashCode());
		result = prime * result + ((boAdd02 == null) ? 0 : boAdd02.hashCode());
		result = prime * result + ((boCell == null) ? 0 : boCell.hashCode());
		result = prime * result + boLicense;
		result = prime * result + ((boMail == null) ? 0 : boMail.hashCode());
		result = prime * result + ((boName == null) ? 0 : boName.hashCode());
		result = prime * result + ((boNumber == null) ? 0 : boNumber.hashCode());
		result = prime * result + ((boPhone == null) ? 0 : boPhone.hashCode());
		result = prime * result + ((boRn == null) ? 0 : boRn.hashCode());
		result = prime * result + ((boRrn == null) ? 0 : boRrn.hashCode());
		result = prime * result + ((cpName == null) ? 0 : cpName.hashCode());
		result = prime * result + st;
		result = prime * result + ((tob01 == null) ? 0 : tob01.hashCode());
		result = prime * result + ((tob02 == null) ? 0 : tob02.hashCode());
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
		BOInfoVO other = (BOInfoVO) obj;
		if (boAcc != other.boAcc)
			return false;
		if (boAccBack == null) {
			if (other.boAccBack != null)
				return false;
		} else if (!boAccBack.equals(other.boAccBack))
			return false;
		if (boAdd01 == null) {
			if (other.boAdd01 != null)
				return false;
		} else if (!boAdd01.equals(other.boAdd01))
			return false;
		if (boAdd02 == null) {
			if (other.boAdd02 != null)
				return false;
		} else if (!boAdd02.equals(other.boAdd02))
			return false;
		if (boCell == null) {
			if (other.boCell != null)
				return false;
		} else if (!boCell.equals(other.boCell))
			return false;
		if (boLicense != other.boLicense)
			return false;
		if (boMail == null) {
			if (other.boMail != null)
				return false;
		} else if (!boMail.equals(other.boMail))
			return false;
		if (boName == null) {
			if (other.boName != null)
				return false;
		} else if (!boName.equals(other.boName))
			return false;
		if (boNumber == null) {
			if (other.boNumber != null)
				return false;
		} else if (!boNumber.equals(other.boNumber))
			return false;
		if (boPhone == null) {
			if (other.boPhone != null)
				return false;
		} else if (!boPhone.equals(other.boPhone))
			return false;
		if (boRn == null) {
			if (other.boRn != null)
				return false;
		} else if (!boRn.equals(other.boRn))
			return false;
		if (boRrn == null) {
			if (other.boRrn != null)
				return false;
		} else if (!boRrn.equals(other.boRrn))
			return false;
		if (cpName == null) {
			if (other.cpName != null)
				return false;
		} else if (!cpName.equals(other.cpName))
			return false;
		if (st != other.st)
			return false;
		if (tob01 == null) {
			if (other.tob01 != null)
				return false;
		} else if (!tob01.equals(other.tob01))
			return false;
		if (tob02 == null) {
			if (other.tob02 != null)
				return false;
		} else if (!tob02.equals(other.tob02))
			return false;
		if (usRn == null) {
			if (other.usRn != null)
				return false;
		} else if (!usRn.equals(other.usRn))
			return false;
		return true;
	}
	public String getBoNumber() {
		return boNumber;
	}
	public void setBoNumber(String boNumber) {
		this.boNumber = boNumber;
	}
	public String getBoName() {
		return boName;
	}
	public void setBoName(String boName) {
		this.boName = boName;
	}
	public String getBoRrn() {
		return boRrn;
	}
	public void setBoRrn(String boRrn) {
		this.boRrn = boRrn;
	}
	public String getBoPhone() {
		return boPhone;
	}
	public void setBoPhone(String boPhone) {
		this.boPhone = boPhone;
	}
	public String getBoCell() {
		return boCell;
	}
	public void setBoCell(String boCell) {
		this.boCell = boCell;
	}
	public String getBoMail() {
		return boMail;
	}
	public void setBoMail(String boMail) {
		this.boMail = boMail;
	}
	public int getBoLicense() {
		return boLicense;
	}
	public void setBoLicense(int boLicense) {
		this.boLicense = boLicense;
	}
	public String getBoAdd01() {
		return boAdd01;
	}
	public void setBoAdd01(String boAdd01) {
		this.boAdd01 = boAdd01;
	}
	public String getBoAdd02() {
		return boAdd02;
	}
	public void setBoAdd02(String boAdd02) {
		this.boAdd02 = boAdd02;
	}
	public long getBoAcc() {
		return boAcc;
	}
	public void setBoAcc(long boAcc) {
		this.boAcc = boAcc;
	}
	public String getBoAccBack() {
		return boAccBack;
	}
	public void setBoAccBack(String boAccBack) {
		this.boAccBack = boAccBack;
	}
	public int getSt() {
		return st;
	}
	public void setSt(int st) {
		this.st = st;
	}
	public String getBoRn() {
		return boRn;
	}
	public void setBoRn(String boRn) {
		this.boRn = boRn;
	}
	public String getUsRn() {
		return usRn;
	}
	public void setUsRn(String usRn) {
		this.usRn = usRn;
	}
	public String getTob01() {
		return tob01;
	}
	public void setTob01(String tob01) {
		this.tob01 = tob01;
	}
	public String getTob02() {
		return tob02;
	}
	public void setTob02(String tob02) {
		this.tob02 = tob02;
	}
	public String getCpName() {
		return cpName;
	}
	public void setCpName(String cpName) {
		this.cpName = cpName;
	}
	
	
	
	
	
	
}
