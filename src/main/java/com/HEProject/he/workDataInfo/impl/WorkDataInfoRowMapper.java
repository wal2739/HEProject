package com.HEProject.he.workDataInfo.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.HEProject.he.workDataInfo.WorkDataInfoVO;

public class WorkDataInfoRowMapper implements RowMapper<WorkDataInfoVO>{

	@Override
	public WorkDataInfoVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		WorkDataInfoVO vo = new WorkDataInfoVO();
		vo.setWorkCode(rs.getString("workCode"));
		vo.setDe(rs.getInt("de"));
		vo.setDtName(rs.getString("dtname"));
		return vo;
	}

}
