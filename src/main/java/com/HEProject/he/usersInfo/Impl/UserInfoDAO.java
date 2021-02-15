package com.HEProject.he.usersInfo.Impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.HEProject.he.usersInfo.SearchInfoVO;
import com.HEProject.he.usersInfo.UsersInfoVO;

@Repository
public class UserInfoDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public UsersInfoVO getUser(UsersInfoVO vo) {
		String sql = "select * from usersInfo where USERID = ? and st=0";
		Object[] args = {vo.getUserID()};
		try {
			return jdbcTemplate.queryForObject(sql, args, new UsersInfoRowmapper());
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
	
	public List<UsersInfoVO> getAllUsers(UsersInfoVO vo,HttpSession session) {
		String sql = "select * from UsersInfo where st=0";
		return jdbcTemplate.query(sql, new UsersInfoRowmapper());
	}
	
	public List<UsersInfoVO> getAllUsersClass(UsersInfoVO vo,HttpSession session,int num) {
		String sql = "select * from UsersInfo where st=0 and USERCLASS='" + num + "'";
		return jdbcTemplate.query(sql, new UsersInfoRowmapper());
	}
	
	public List<UsersInfoVO> getAllUsersClass(UsersInfoVO vo,HttpSession session,int num,int num02) {
		String sql = "select * from UsersInfo where st=0 and USERCLASS='" + num + "' or USERCLASS='" + num02 + "'";
		return jdbcTemplate.query(sql, new UsersInfoRowmapper());
	}
	
	public List<SearchInfoVO> getAllEqInfo(SearchInfoVO vo, String eqType){
		String sql = "select sinfo.* from searchInfo sInfo where EQUIPTYPE = '"+ eqType +"' and sinfo.usrn!=NVL((select grusrn from groupassinfo where assUsrn='"+ vo.getUsRn() +"'),0)";
		return jdbcTemplate.query(sql, new SearchInfoRowMapper());
	}//문제의 소지가 있음
	
	public List<SearchInfoVO> getAllEqInfo(SearchInfoVO vo){
		String sql = "select * from searchInfo where usrn in (select grusrn from groupassinfo where st=4 and ASSUSRN='" + vo.getUsRn() + "')";
		return jdbcTemplate.query(sql, new SearchInfoRowMapper());
	}
	
	public UsersInfoVO getUserInfo(UsersInfoVO vo) {
		String sql = "select * from usersInfo where USRN = ? and st=0";
		Object[] args = {vo.getUsRn()};
		try {
			return jdbcTemplate.queryForObject(sql, args, new UsersInfoRowmapper());
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
	
	public void newIUser(UsersInfoVO vo) {
		String sql = "insert into usersinfo(USRN,USERID,USERPW,USERNAME,USERCELL,USERADD01,USERADD02,USERCLASS,USEREMAIL,USERCONSENT01,USERCONSENT02,USERCONSENT03,ST) values(LPAD(LPAD(Iuserrn_sq.nextVal, '8', '0'),'9','I'),?,?,?,?,?,?,?,?,?,?,?,0)";
		jdbcTemplate.update(sql,vo.getUserID(),vo.getUserPW(),vo.getUserName(),vo.getUserCell(),vo.getUserAdd01(),vo.getUserAdd02(),vo.getUserClass(),vo.getUserEmail(),vo.getUserConsent01(),vo.getUserConsent02(),vo.getUserConsent03());
	}
	public void newAUser(UsersInfoVO vo) {
		String sql = "insert into usersinfo(USRN,USERID,USERPW,USERNAME,USERCELL,USERADD01,USERADD02,USERCLASS,USEREMAIL,USERCONSENT01,USERCONSENT02,USERCONSENT03,ST) values(LPAD(LPAD(AuserRn_sq.nextVal, '8', '0'),'9','A'),?,?,?,?,?,?,?,?,?,?,?,0)";
		jdbcTemplate.update(sql,vo.getUserID(),vo.getUserPW(),vo.getUserName(),vo.getUserCell(),vo.getUserAdd01(),vo.getUserAdd02(),vo.getUserClass(),vo.getUserEmail(),vo.getUserConsent01(),vo.getUserConsent02(),vo.getUserConsent03());
	}
	public void newAllUser(UsersInfoVO vo) {
		String sql = "insert into usersinfo(USRN,USERID,USERPW,USERNAME,USERCELL,USERADD01,USERADD02,USERCLASS,USEREMAIL,USERCONSENT01,USERCONSENT02,USERCONSENT03,ST) values(LPAD(LPAD(ALLuserRn_sq.nextVal, '8', '0'),'9','L'),?,?,?,?,?,?,?,?,?,?,?,0)";
		jdbcTemplate.update(sql,vo.getUserID(),vo.getUserPW(),vo.getUserName(),vo.getUserCell(),vo.getUserAdd01(),vo.getUserAdd02(),vo.getUserClass(),vo.getUserEmail(),vo.getUserConsent01(),vo.getUserConsent02(),vo.getUserConsent03());
	}
	
	public int modifyUserInfo(UsersInfoVO vo) {
		String sql = "update usersInfo set USERNAME=?,USERCELL=?,USERADD01=?,USERADD02=?,USEREMAIL=? where usrn=?";
		try {
			jdbcTemplate.update(sql,vo.getUserName(),vo.getUserCell(),vo.getUserAdd01(),vo.getUserAdd02(),vo.getUserEmail(),vo.getUsRn());
			return 1;
		} catch (Exception e) {
			System.err.println(e);
			return 0;
		}
	}
	
}
