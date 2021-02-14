package com.HEProject.he.clientInfo.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.HEProject.he.clientInfo.ClientInfoVO;

@Repository
public class ClientInfoDAO {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	ClientInfoVO getClientInfo(ClientInfoVO vo) {
		String sql = "select * from clientInfo where usrn=? and st=0 and CLIENTCODE='" + vo.getClientCode() + "'";
		Object args[] = {vo.getUsRn()};
		try {
			return jdbcTemplate.queryForObject(sql, args, new ClientInfoRowMapper());
		} catch (EmptyResultDataAccessException e) {
			System.err.println("client DAO 오류 : " + e);
			return null;
		}
	}
	
	List<ClientInfoVO> getAllClientInfo(ClientInfoVO vo){
		String sql = "select * from clientInfo where usrn='" + vo.getUsRn() + "' and st=0";
		try {
			return jdbcTemplate.query(sql, new ClientInfoRowMapper());
		} catch (EmptyResultDataAccessException e) {
			System.err.println("client DAO 오류 : " + e);
			return null;
		}
	}
	
	int newClient(ClientInfoVO vo) {
		String sql = "insert into clientInfo(CLIENTCODE,CLIENTBONUMBER,CLIENTCEO,CLIENTMANAGER,CLIENTPHONE,CLIENTCELL,CLIENTMAIL,CLIENTADD01,CLIENTADD02,ST,USRN,RELATIVE,clientCpName) values(LPAD(LPAD(auserrn_sq.nextVal, '8', '0'),'9','C'),?,?,?,?,?,?,?,?,0,?,?,?)";
		try {
			jdbcTemplate.update(sql,vo.getClientBoNumber(),vo.getClientCeo(),vo.getClientManager(),vo.getClientPhone(),vo.getClientCell(),vo.getClientMail(),vo.getClientAdd01(),vo.getClientAdd02(),vo.getUsRn(),vo.getRelative(),vo.getClientCpName());
			return 1;
		} catch (Exception e) {
			System.err.println(e);
			return 0;
		}
	}
	
	int delClient(ClientInfoVO vo) {
		String sql = "update clientInfo set st=1 where CLIENTCODE=? and USRN=?";
		try {
			jdbcTemplate.update(sql,vo.getClientCode(),vo.getUsRn());
			return 1;
		} catch (Exception e) {
			System.err.println(e);
			return 0;
		}
	}
	
	int modifyClient(ClientInfoVO vo) {
		String sql = "update clientInfo set CLIENTBONUMBER=?,CLIENTCEO=?,CLIENTMANAGER=?,CLIENTPHONE=?,CLIENTCELL=?,CLIENTMAIL=?,CLIENTADD01=?,CLIENTADD02=?,RELATIVE=?,clientCpName=? where USRN=? and st=0 and CLIENTCODE=?";
		try {
			jdbcTemplate.update(sql,vo.getClientBoNumber(),vo.getClientCeo(),vo.getClientManager(),vo.getClientPhone(),vo.getClientCell(),vo.getClientMail(),vo.getClientAdd01(),vo.getClientAdd02(),vo.getRelative(),vo.getClientCpName(),vo.getUsRn(),vo.getClientCode());
			return 1;
		} catch (Exception e) {
			System.err.println(e);
			return 0;
		}
	}
}
