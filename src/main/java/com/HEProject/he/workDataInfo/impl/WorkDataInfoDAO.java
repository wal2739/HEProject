package com.HEProject.he.workDataInfo.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.HEProject.he.workDataInfo.WorkDataInfoVO;

@Repository
public class WorkDataInfoDAO {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	int newWorkData(String workCode) {
		String sql = "insert into workDataInfo(workCode,de) values(?,0)";
		try {
			jdbcTemplate.update(sql, workCode);
			return 1;
		} catch (Exception e) {
			System.err.println(e);
			return 0;
		}
	}
	
	int workDataUpload(String dtName ,String workCode) {
		String sql = "update workDataInfo set de=1 ,dtName=? where workCode=?";
		try {
			jdbcTemplate.update(sql, dtName, workCode);
			return 1;
		} catch (Exception e) {
			System.err.println(e);
			return 0;
		}
	}
	
	WorkDataInfoVO getDataName(String workCode) {
		String sql = "select * from workDataInfo where workCode=?";
		Object[] args = {workCode};
		try {
			return jdbcTemplate.queryForObject(sql, args, new WorkDataInfoRowMapper());
		} catch (EmptyResultDataAccessException e) {
			System.err.println(e);
			return null;
		}
	}
}
