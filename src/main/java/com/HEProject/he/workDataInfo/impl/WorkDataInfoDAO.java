package com.HEProject.he.workDataInfo.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

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
}
