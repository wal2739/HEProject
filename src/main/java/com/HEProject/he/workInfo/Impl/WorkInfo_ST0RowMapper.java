package com.HEProject.he.workInfo.Impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.HEProject.he.workInfo.WorkInfo_ST0VO;

public class WorkInfo_ST0RowMapper implements RowMapper<WorkInfo_ST0VO>{

	@Override
	public WorkInfo_ST0VO mapRow(ResultSet rs, int rowNum) throws SQLException {
		WorkInfo_ST0VO vo = new WorkInfo_ST0VO();
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
		vo.setUserID(rs.getString("USERID"));
		vo.setUserName(rs.getString("USERNAME"));
		vo.setBoName(rs.getString("BONAME"));
		vo.setCpName(rs.getString("CPNAME"));
		vo.setClientCPName(rs.getString("CLIENTCPNAME"));
		vo.setClientManager(rs.getString("CLIENTMANAGER"));
		vo.setClientPhone(rs.getString("CLIENTPHONE"));
		vo.setRv(rs.getString("RV"));
		return vo;
	}

}
