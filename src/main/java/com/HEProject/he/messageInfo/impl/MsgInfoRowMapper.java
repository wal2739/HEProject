package com.HEProject.he.messageInfo.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.HEProject.he.messageInfo.MsgInfoVO;

public class MsgInfoRowMapper implements RowMapper<MsgInfoVO>{

	@Override
	public MsgInfoVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		MsgInfoVO vo = new MsgInfoVO();
		vo.setgUsRn(rs.getString("GUSRN"));
		vo.setMessageCode(rs.getString("MESSAGECODE"));
		vo.setMessageContents(rs.getString("MESSAGECONTENTS"));
		vo.setMessageDate(rs.getDate("MESSAGEDATE"));
		vo.setRelative(rs.getString("RELATIVE"));
		vo.setSt(rs.getInt("ST"));
		vo.setsUsRn(rs.getString("SUSRN"));
		vo.setwMsg(rs.getInt("WMSG"));
		vo.setUserId(rs.getString("USERID"));
		vo.setUserName(rs.getString("USERNAME"));
		return vo;
	}
}
