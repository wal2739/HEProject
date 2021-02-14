package com.HEProject.he.workInfo.Impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.HEProject.he.workInfo.WorkerInfoVO;

public class WorkerInfoRowMapper implements RowMapper<WorkerInfoVO>{

	@Override
	public WorkerInfoVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		WorkerInfoVO vo = new WorkerInfoVO();
		vo.setEquipClass(rs.getString("EQUIPCLASS"));
		vo.setEquipOption(rs.getString("EQUIPOPTION"));
		vo.setEquipType(rs.getString("EQUIPTYPE"));
		vo.setUserCell(rs.getString("USERCELL"));
		vo.setUserName(rs.getString("USERNAME"));
		vo.setUsRn(rs.getString("USRN"));
		vo.setAssUsRn(rs.getString("ASSUSRN"));
		vo.setEqRn(rs.getString("EQRN"));
		return vo;
	}
	

}
