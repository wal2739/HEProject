package com.HEProject.he.boardInfo.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.HEProject.he.boardInfo.BoardInfoVO;

public class BoardInfoRowMapper implements RowMapper<BoardInfoVO>{

	@Override
	public BoardInfoVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		BoardInfoVO vo = new BoardInfoVO();
		vo.setBoardCode(rs.getString("BOARDCODE"));
		vo.setBoardClass(rs.getInt("BOARDCLASS"));
		vo.setBoardTitle(rs.getString("BOARDTITLE"));
		vo.setBoardContents(rs.getString("BOARDCONTENTS"));
		vo.setUsRn(rs.getString("USRN"));
		vo.setUserName(rs.getString("USERNAME"));
		vo.setViews(rs.getInt("VIEWS"));
		vo.setWriteDate(rs.getDate("writeDate"));
		vo.setFixDate(rs.getDate("fixDate"));
		return vo;
	}

}
