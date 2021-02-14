package com.HEProject.he.boardInfo.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.HEProject.he.boardInfo.BoardInfoVO;

@Repository
public class BoardInfoDAO {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	BoardInfoVO getBoard(BoardInfoVO vo) {
		String sql = "select * from boardInfo where boardCode=?";
		Object[] args = {vo.getBoardCode()};
		try {
			return jdbcTemplate.queryForObject(sql, args, new BoardInfoRowMapper());
		} catch (EmptyResultDataAccessException e) {
			System.err.println(e);
			return null;
		}
	}
	
	int increaseView(BoardInfoVO vo){
		String sql = "update boardInfo set views=views + 1 where boardCode=?";
		try {
			jdbcTemplate.update(sql,vo.getBoardCode());
			return 1;
		} catch (Exception e) {
			System.err.println(e);
			return 0;
		}
	}
	
	List<BoardInfoVO> getAllBoard(){
		String sql = "select * from boardInfo where boardClass=0";
		try {
			return jdbcTemplate.query(sql, new BoardInfoRowMapper());
		} catch (EmptyResultDataAccessException e) {
			System.err.println(e);
			return null;
		}
		
	}
	
	int insertBoard(BoardInfoVO vo) {
		String sql = "insert into boardInfo(BOARDCODE,BOARDCLASS,BOARDTITLE,BOARDCONTENTS,USRN,USERNAME,VIEWS) values(LPAD(LPAD(auserrn_sq.nextVal, '8', '0'),'9','N'),?,?,?,?,?,0)";
		try {
			jdbcTemplate.update(sql,vo.getBoardClass(),vo.getBoardTitle(),vo.getBoardContents(),vo.getUsRn(),vo.getUserName());
			return 1;
		} catch (Exception e) {
			System.err.println(e);
			return 0;
		}
	}
	
	int modifyBoard(BoardInfoVO vo) {
		String sql = "update boardInfo set BOARDTITLE=?,BOARDCONTENTS=?,fixDate=sysdate where boardCode=?";
		try {
			jdbcTemplate.update(sql,vo.getBoardTitle(),vo.getBoardContents(),vo.getBoardCode());
			return 1;
		} catch (Exception e) {
			System.err.println(e);
			return 0;
		}
	}
	
}
