package com.HEProject.he.usersInfo.Impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.HEProject.he.usersInfo.UsersInfoVO;

public class UsersInfoRowmapper implements RowMapper<UsersInfoVO>{

	@Override
	public UsersInfoVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		UsersInfoVO vo = new UsersInfoVO();
		vo.setUsRn(rs.getString("usRn"));
		vo.setUserID(rs.getString("userID"));
		vo.setUserPW(rs.getString("userPW"));
		vo.setUserName(rs.getString("userName"));
		vo.setUserCell(rs.getString("userCell"));
		vo.setUserAdd01(rs.getString("userAdd01"));
		vo.setUserAdd02(rs.getString("userAdd02"));
		vo.setUserClass(rs.getInt("userClass"));
		vo.setUserEmail(rs.getString("userEmail"));
		vo.setUserConsent01(rs.getInt("USERCONSENT01"));
		vo.setUserConsent02(rs.getInt("USERCONSENT02"));
		vo.setUserConsent03(rs.getInt("USERCONSENT03"));
		vo.setSt(rs.getInt("ST"));
		vo.setRegiDate(rs.getDate("REGIDATE"));
		return vo;
	}
	

}
