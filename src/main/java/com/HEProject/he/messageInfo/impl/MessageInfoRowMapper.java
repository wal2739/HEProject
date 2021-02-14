package com.HEProject.he.messageInfo.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.HEProject.he.messageInfo.MessageInfoVO;

public class MessageInfoRowMapper implements RowMapper<MessageInfoVO>{

	@Override
	public MessageInfoVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		MessageInfoVO vo = new MessageInfoVO();
		vo.setgUsRn(rs.getString("GUSRN"));
		vo.setMessageCode(rs.getString("MESSAGECODE"));
		vo.setMessageContents(rs.getString("MESSAGECONTENTS"));
		vo.setMessageDate(rs.getDate("MESSAGEDATE"));
		vo.setRelative(rs.getString("RELATIVE"));
		vo.setSt(rs.getInt("ST"));
		vo.setsUsRn(rs.getString("SUSRN"));
		vo.setwMsg(rs.getInt("WMSG"));
		return vo;
	}

}
