package com.HEProject.he.boInfo.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.HEProject.he.boInfo.BOInfoVO;

public class BOInfoRowMapper implements RowMapper<BOInfoVO>{

	@Override
	public BOInfoVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		BOInfoVO vo = new BOInfoVO();
		vo.setBoNumber(rs.getString("BONUMBER"));
		vo.setBoName(rs.getString("BONAME"));
		vo.setUsRn(rs.getString("USRN"));
		vo.setBoRn(rs.getString("BORN"));
		vo.setBoRrn(rs.getString("BORRN"));
		vo.setBoPhone(rs.getString("BOPHONE"));
		vo.setBoCell(rs.getString("BOCELL"));
		vo.setBoMail(rs.getString("BOMAIL"));
		vo.setBoLicense(rs.getInt("BOLICENSE"));
		vo.setBoAdd01(rs.getString("BOADD01"));
		vo.setBoAdd02(rs.getString("BOADD02"));
		vo.setBoAcc(rs.getLong("BOACC"));
		vo.setBoAccBack(rs.getString("BOACCBANK"));
		vo.setSt(rs.getInt("ST"));
		vo.setTob01(rs.getString("TOB01"));
		vo.setTob02(rs.getString("TOB02"));
		vo.setCpName(rs.getString("CPNAME"));
		return vo;
	}

}
