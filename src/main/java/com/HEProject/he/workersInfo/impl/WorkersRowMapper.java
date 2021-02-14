package com.HEProject.he.workersInfo.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.HEProject.he.workersInfo.WorkersInfoVO;

public class WorkersRowMapper implements RowMapper<WorkersInfoVO>{

	@Override
	public WorkersInfoVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		WorkersInfoVO vo = new WorkersInfoVO();
		vo.setWorkerCode(rs.getString("workerCode"));
		vo.setUsRn(rs.getString("usRn"));
		vo.setWorkerName(rs.getString("workerName"));
		vo.setWorkerRRN(rs.getString("workerRRN"));
		vo.setWorkerPhone(rs.getString("workerPhone"));
		vo.setWorkerCell(rs.getString("workerCell"));
		vo.setWorkerPW(rs.getString("workerPW"));
		vo.setWorkerAdd01(rs.getString("workerAdd01"));
		vo.setWorkerAdd02(rs.getString("workerAdd02"));
		vo.setSt(rs.getInt("st"));
		return vo;
	}

}
