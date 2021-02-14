package com.HEProject.he.boInfo.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.HEProject.he.boInfo.BOInfoVO;

@Repository
public class BOInfoDAO {
	
	@Autowired
	JdbcTemplate jdbcTemplate;

	public BOInfoVO getBOInfo(BOInfoVO vo) {
		String sql = "select * from boInfo where USRN = ? and st=0";
		Object[] args = {vo.getUsRn()};
		try {
			return jdbcTemplate.queryForObject(sql, args, new BOInfoRowMapper());
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
	
	public BOInfoVO checkBOInfo(BOInfoVO vo) {
		String sql = "select * from boInfo where BONUMBER = ? and st=0";
		Object[] args = {vo.getBoNumber()};
		try {
			return jdbcTemplate.queryForObject(sql, args, new BOInfoRowMapper());
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
	
	public void createBO(BOInfoVO vo) {
		String sql = "insert into boInfo(BORN,BONUMBER,BONAME,USRN,BORRN,BOPHONE,BOCELL,BOMAIL,BOLICENSE,BOADD01,BOADD02,BOACC,BOACCBANK,ST,TOB01,TOB02,CPNAME) values(LPAD(LPAD(BORn_sq.nextVal, '8', '0'),'9','B'),?,?,?,?,?,?,?,?,?,?,?,?,0,?,?,?)";
		jdbcTemplate.update(sql, vo.getBoNumber(),vo.getBoName(),vo.getUsRn(),vo.getBoRrn(),vo.getBoPhone(),vo.getBoCell(),vo.getBoMail(),vo.getBoLicense(),vo.getBoAdd01(),vo.getBoAdd02(),vo.getBoAcc(),vo.getBoAccBack(),vo.getTob01(),vo.getTob02(),vo.getCpName());
	}

	public int modifyBO(BOInfoVO vo) {
		try {
			String sql = "update boInfo set BONUMBER=?,BONAME=?,BORRN=?,BOPHONE=?,BOCELL=?,BOMAIL=?,BOLICENSE=?,BOADD01=?,BOADD02=?,BOACC=?,BOACCBANK=?,TOB01=?,TOB02=?,CPNAME=? where USRN=? and st=0";
			jdbcTemplate.update(sql, vo.getBoNumber(),vo.getBoName(),vo.getBoRrn(),vo.getBoPhone(),vo.getBoCell(),vo.getBoMail(),vo.getBoLicense(),vo.getBoAdd01(),vo.getBoAdd02(),vo.getBoAcc(),vo.getBoAccBack(),vo.getTob01(),vo.getTob02(),vo.getCpName(),vo.getUsRn());
			return 1;
		} catch (Exception e) {
			System.err.println(e);
			return 0;
		}
		
	}
	
	public int deleteBO(BOInfoVO vo) {
		String sql = "update boInfo set st=(select max(st) from boInfo where USRN=?)+1 where USRN=? and st=0";
		try {
			jdbcTemplate.update(sql, vo.getUsRn(), vo.getUsRn());
			return 1;
		}catch (Exception e) {
			System.err.println("삭제 오류 [dao]");
			return 0;
		}
	}
	
}
