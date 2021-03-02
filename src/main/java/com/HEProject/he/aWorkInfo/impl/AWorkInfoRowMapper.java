package com.HEProject.he.aWorkInfo.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.HEProject.he.aWorkInfo.AWorkInfoVO;

public class AWorkInfoRowMapper implements RowMapper<AWorkInfoVO>{

	@Override
	public AWorkInfoVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		AWorkInfoVO vo = new AWorkInfoVO();
		vo.setWorkCode(rs.getString("workCode"));
		vo.setEs(rs.getInt("es"));
		vo.setEt(rs.getInt("et"));
		vo.setAa(rs.getInt("aa"));
		return vo;
	}

}
