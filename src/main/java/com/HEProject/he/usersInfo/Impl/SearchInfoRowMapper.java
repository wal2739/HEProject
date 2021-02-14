package com.HEProject.he.usersInfo.Impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.HEProject.he.usersInfo.SearchInfoVO;
import com.HEProject.he.usersInfo.UsersInfoVO;

public class SearchInfoRowMapper implements RowMapper<SearchInfoVO>{

	@Override
	public SearchInfoVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		SearchInfoVO vo = new SearchInfoVO();
		vo.setUsRn(rs.getString("USRN"));
		vo.setEquipClass(rs.getString("EQUIPCLASS"));
		vo.setEquipOption(rs.getString("EQUIPOPTION"));
		vo.setEquipType(rs.getString("EQUIPTYPE"));
		vo.setUserName(rs.getString("USERNAME"));
		return vo;
	}
	
}
