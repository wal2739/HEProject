package com.HEProject.he.aWorkInfo.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.HEProject.he.aWorkInfo.AWorkInfoVO;

@Repository
public class AWorkInfoDAO {

	@Autowired
	JdbcTemplate jdbcTemplate;

	int newAworkInfo(AWorkInfoVO vo) {
		String sql = "insert into aworkInfo(WORKCODE,es,et,aa) values(?,?,?,?)";
		try {
			jdbcTemplate.update(sql,vo.getWorkCode(),vo.getEs(),vo.getEt(),vo.getAa());
			return 1;
		} catch (Exception e) {
			System.err.println(e);
			return 0;
		}
	}
}
