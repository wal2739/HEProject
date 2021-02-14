package com.HEProject.he.workInfo.Impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.HEProject.he.workInfo.WorkInfoVO;

public class WorkInfoRowMapper implements RowMapper<WorkInfoVO>{

	@Override
	public WorkInfoVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		WorkInfoVO vo = new WorkInfoVO();
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
		vo.setRv(rs.getString("RV"));
		return vo;
	}

}
