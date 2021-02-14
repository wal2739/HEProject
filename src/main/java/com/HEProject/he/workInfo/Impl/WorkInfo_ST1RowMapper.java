package com.HEProject.he.workInfo.Impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.HEProject.he.workInfo.WorkInfo_ST0VO;
import com.HEProject.he.workInfo.WorkInfo_ST1VO;

public class WorkInfo_ST1RowMapper implements RowMapper<WorkInfo_ST1VO>{

	@Override
	public WorkInfo_ST1VO mapRow(ResultSet rs, int rowNum) throws SQLException {
		WorkInfo_ST1VO vo = new WorkInfo_ST1VO();
		vo.setWorkCode(rs.getString("WORKCODE"));
		vo.setClientCode(rs.getString("CLIENTCODE"));
		vo.setWorkField(rs.getString("WORKFIELD"));
		vo.setFieldManager(rs.getString("FIELDMANAGER"));
		vo.setFieldManagerPhone(rs.getString("FIELDMANAGERPHONE"));
		vo.setFieldManagerCell(rs.getString("FIELDMANAGERCELL"));
		vo.setFieldManagerMail(rs.getString("FIELDMANAGERMAIL"));
		vo.setFieldAdd01(rs.getString("FIELDADD01"));
		vo.setFieldAdd02(rs.getString("FIELDADD02"));
		vo.setWorkAmount(rs.getString("WORKAMOUNT"));
		vo.setWorkTime(rs.getString("WORKTIME"));
		vo.setWorkRequests(rs.getString("WORKREQUESTS"));
		vo.setSt(rs.getInt("ST"));
		vo.setAssUsRn(rs.getString("ASSUSRN"));
		vo.setIndiUsRn(rs.getString("INDIUSRN"));
		vo.setWorkersData(rs.getString("WORKERSDATA"));
		vo.setEqRn(rs.getString("EQRN"));
		vo.setRelative(rs.getString("RELATIVE"));
		vo.setWorkDate(rs.getDate("WORKDATE"));
		vo.setAssUserID(rs.getString("ASSUSERID"));
		vo.setAssUserName(rs.getString("ASSUSERNAME"));
		vo.setAssBOName(rs.getString("ASSBONAME"));
		vo.setAssCPName(rs.getString("ASSCPNAME"));
		vo.setIndiUserID(rs.getString("INDIUSERID"));
		vo.setIndiUserName(rs.getString("INDIUSERNAME"));
		vo.setIndiBOName(rs.getString("INDIBONAME"));
		vo.setIndiCPName(rs.getString("INDICPNAME"));
		vo.setEquipNum(rs.getString("EQUIPNUM"));
		vo.setEquipType(rs.getString("EQUIPTYPE"));
		vo.setEquipClass(rs.getString("EQUIPCLASS"));
		vo.setEquipOption(rs.getString("EQUIPOPTION"));
		vo.setClientCPName(rs.getString("CLIENTCPNAME"));
		vo.setClientManager(rs.getString("CLIENTMANAGER"));
		vo.setClientPhone(rs.getString("CLIENTPHONE"));
		vo.setRv(rs.getString("RV"));
		return vo;
	}
	
}
