package com.HEProject.he.workersInfo.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.HEProject.he.workersInfo.WorkersInfoVO;

@Repository
public class WorkersInfoDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public WorkersInfoVO getWorker(WorkersInfoVO vo) {
		String sql = "select * from workersInfo where workerCode = ? and st=0";
		Object[] args = {vo.getWorkerCode()};
		try {
			return jdbcTemplate.queryForObject(sql, args, new WorkersRowMapper());
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
	
	public WorkersInfoVO loginWorker(WorkersInfoVO vo) {
		String sql = "select * from workersInfo where workerCode = ? and workerPW = ? and st=0";
		Object[] args = {vo.getWorkerCode(),vo.getWorkerPW()};
		try {
			return jdbcTemplate.queryForObject(sql, args, new WorkersRowMapper());
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
	
	public WorkersInfoVO checkWorker(WorkersInfoVO vo) {
		String sql = "select * from workersInfo where workerCode = ? and st=0 and usRn = '" + vo.getUsRn() +"'";
		Object[] args = {vo.getWorkerCode()};
		try {
			return jdbcTemplate.queryForObject(sql, args, new WorkersRowMapper());
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
	
	public List<WorkersInfoVO> getAllWorker(WorkersInfoVO vo,HttpSession session) {
		String sql = "select * from workersInfo where usRn= '" + vo.getUsRn() + "' and st=0";
		try {
			return jdbcTemplate.query(sql, new WorkersRowMapper());
		}catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
	
	public void newWorker(WorkersInfoVO vo) {
		String sql = "insert into workersInfo(WORKERCODE,USRN,WORKERNAME,WORKERRRN,WORKERPHONE,WORKERCELL,WORKERPW,WORKERADD01,WORKERADD02,ST) values(?,?,?,?,?,?,?,?,?,0)";
		jdbcTemplate.update(sql,vo.getWorkerCode(),vo.getUsRn(),vo.getWorkerName(),vo.getWorkerRRN(),vo.getWorkerPhone(),vo.getWorkerCell(),vo.getWorkerPW(),vo.getWorkerAdd01(),vo.getWorkerAdd02());
	}
	
	public void deleteWorker(WorkersInfoVO vo) {
		String sql = "update workersInfo set st=(select max(st) from workersInfo where workerCode=?)+1 where workerCode=? and st=0";
		jdbcTemplate.update(sql,vo.getWorkerCode(),vo.getWorkerCode());
	}//st값 조정
}
