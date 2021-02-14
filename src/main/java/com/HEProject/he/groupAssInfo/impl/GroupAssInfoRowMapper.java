package com.HEProject.he.groupAssInfo.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.HEProject.he.groupAssInfo.GroupAssInfoVO;

public class GroupAssInfoRowMapper implements RowMapper<GroupAssInfoVO>{

	@Override
	public GroupAssInfoVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		GroupAssInfoVO vo = new GroupAssInfoVO();
		vo.setGroupCode(rs.getString("GROUPCODE"));
		vo.setGrUsRn(rs.getString("GRUSRN"));
		vo.setAssUsRn(rs.getString("ASSUSRN"));
		vo.setSt(rs.getInt("ST"));
		return vo;
	}
	

}
