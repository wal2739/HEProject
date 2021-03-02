package com.HEProject.he.workInfo.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.HEProject.he.clientInfo.impl.ClientInfoRowMapper;
import com.HEProject.he.workInfo.WorkInfoVO;
import com.HEProject.he.workInfo.WorkInfo_ST0VO;
import com.HEProject.he.workInfo.WorkInfo_ST1VO;
import com.HEProject.he.workInfo.WorkerInfoVO;

@Repository
public class WorkInfoDAO {

	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	WorkInfoVO getWorkInfo(WorkInfoVO vo) {//작업 정보만 가져오는 메서드 [workInfo의 모든 컬럼]
		String sql = "";
		Object[] args = {vo.getWorkCode()};
		try {
			return jdbcTemplate.queryForObject(sql, args, new WorkInfoRowMapper());
		} catch (EmptyResultDataAccessException e) {
			System.err.println("work DAO 오류 : " + e);
			return null;
		}
	}
	
	List<WorkInfoVO> getAllWork(WorkInfoVO vo){
		String sql = "select * from workInfo where ASSUSRN='" + vo.getAssUsRn() + "' and st=0 or st=1";
		try {
			return jdbcTemplate.query(sql, new WorkInfoRowMapper());
		} catch (EmptyResultDataAccessException e) {
			System.err.println("work DAO 오류 : " + e);
			return null;
		}	
	}
	
	List<WorkInfo_ST0VO> getAllWork_toSt3(WorkInfo_ST0VO vo){//assUsRn 을 이용한 work_st0 테이블의 st = 3 값 조회
		String sql = "select * from work_st0 where ASSUSRN = '"+ vo.getAssUsRn() +"' and st=3";
		try {
			return jdbcTemplate.query(sql, new WorkInfo_ST0RowMapper());
		} catch (EmptyResultDataAccessException e) {
			System.err.println("work DAO 오류 : " + e);
			return null;
		}	
	}
	
	List<WorkInfo_ST0VO> getAllWork_toSt3ForIndi(WorkInfo_ST0VO vo){//indiUsRn 을 이용한 work_st0 테이블의 st = 3 값 조회
		String sql = "select * from work_st0 where indiusrn = '"+ vo.getIndiUsRn() +"' and st=3";
		try {
			return jdbcTemplate.query(sql, new WorkInfo_ST0RowMapper());
		} catch (EmptyResultDataAccessException e) {
			System.err.println("work DAO 오류 : " + e);
			return null;
		}	
	}
	
	WorkInfo_ST0VO getAllWorkInfo_st3(WorkInfo_ST0VO vo) {//workCode를 이용한 work_st3 조회
		String sql = "select * from work_st0 where workCode = ? and st=3";
		Object[] args = {vo.getWorkCode()};
		try {
			return jdbcTemplate.queryForObject(sql, args, new WorkInfo_ST0RowMapper());
		} catch (EmptyResultDataAccessException e) {
			System.err.println("work DAO 오류 : " + e);
			return null;
		}
	}
	
	List<WorkInfo_ST0VO> getAllWork_toSt0(WorkInfo_ST0VO vo){//assUsRn 을 이용한 work_st0 조회
		String sql = "select * from work_st0 where ASSUSRN = '"+ vo.getAssUsRn() +"' and st=0";
		try {
			return jdbcTemplate.query(sql, new WorkInfo_ST0RowMapper());
		} catch (EmptyResultDataAccessException e) {
			System.err.println("work DAO 오류 : " + e);
			return null;
		}	
	}
	
	WorkInfo_ST0VO getAllWorkInfo_st0(WorkInfo_ST0VO vo) {//workCode를 이용한 work_st0 조회
		String sql = "select * from work_st0 where workCode = ?";
		Object[] args = {vo.getWorkCode()};
		try {
			return jdbcTemplate.queryForObject(sql, args, new WorkInfo_ST0RowMapper());
		} catch (EmptyResultDataAccessException e) {
			System.err.println("work DAO 오류 : " + e);
			return null;
		}
	}
	
	List<WorkInfo_ST1VO> getAllWork_toSt1(String usRn,String userClass){//assUsRn 을 이용한 work_st1 조회
		String sql = "select * from work_st1 where " + userClass + " = '"+ usRn +"' and st=1";
		try {
			return jdbcTemplate.query(sql, new WorkInfo_ST1RowMapper());
		} catch (EmptyResultDataAccessException e) {
			System.err.println("work DAO 오류 : " + e);
			return null;
		}	
	}

	WorkInfo_ST1VO getAllWorkInfo_st1(WorkInfo_ST1VO vo) {//workCode를 이용한 work_st1 조회
		String sql = "select * from work_st1 where workCode = ? and st=1";
		Object[] args = {vo.getWorkCode()};
		try {
			return jdbcTemplate.queryForObject(sql, args, new WorkInfo_ST1RowMapper());
		} catch (EmptyResultDataAccessException e) {
			System.err.println("work DAO 오류 : " + e);
			return null;
		}
	}
	
	List<WorkerInfoVO> getWorkerList(WorkerInfoVO vo){
		String sql = "select * from workerInfo where EQUIPTYPE = '" + vo.getEquipType() + "' and assusrn='" + vo.getAssUsRn() + "'";
		try {
			return jdbcTemplate.query(sql, new WorkerInfoRowMapper());
		} catch (EmptyResultDataAccessException e) {
			System.err.println("work DAO 오류 : " + e);
			return null;
		}
	}
	
	int newWork(WorkInfoVO vo) {
		String sql = "insert into workInfo(WORKCODE,CLIENTCODE,WORKFIELD,FIELDMANAGER,FIELDMANAGERPHONE,FIELDMANAGERCELL,FIELDMANAGERMAIL,FIELDADD01,FIELDADD02,WORKAMOUNT,WORKTIME,WORKREQUESTS,ST,ASSUSRN,RELATIVE,WORKDATE,RV) values(LPAD(LPAD(WORKCODE_SQ.nextVal, '8', '0'),'9','W'),?,?,?,?,?,?,?,?,?,?,?,0,?,?,?,?)";
		try {
			jdbcTemplate.update(sql,vo.getClientCode(),vo.getWorkField(),vo.getFieldManager(),vo.getFieldManagerPhone(),vo.getFieldManagerCell(),vo.getFieldManagerMail(),vo.getFieldAdd01(),vo.getFieldAdd02(),vo.getWorkAmount(),vo.getWorkTime(),vo.getWorkRequests(),vo.getAssUsRn(),vo.getRelative(),vo.getWorkDate(),vo.getRv());
			return 1;
		}catch (Exception e) {
			System.err.println("work DAO 오류 : " + e);
			return 0;
		}
	}
	
	int modifyWork(WorkInfoVO vo) {
		String sql = "update workInfo set CLIENTCODE=?,WORKFIELD=?,FIELDMANAGER=?,FIELDMANAGERPHONE=?,FIELDMANAGERCELL=?,FIELDMANAGERMAIL=?,FIELDADD01=?,FIELDADD02=?,WORKAMOUNT=?,WORKTIME=?,WORKREQUESTS=?,RELATIVE=?,WORKDATE=?,RV=? where workCode=? and assusrn=? and st=0";
		try { 
			jdbcTemplate.update(sql,vo.getClientCode(),vo.getWorkField(),vo.getFieldManager(),vo.getFieldManagerPhone(),vo.getFieldManagerCell(),vo.getFieldManagerMail(),vo.getFieldAdd01(),vo.getFieldAdd02(),vo.getWorkAmount(),vo.getWorkTime(),vo.getWorkRequests(),vo.getRelative(),vo.getWorkDate(),vo.getWorkCode(),vo.getAssUsRn(),vo.getRv());
			return 1;
		}catch (Exception e) {
			System.err.println("work DAO 오류 : " + e);
			return 0;
		}
	}
	
	int cancelWork(WorkInfoVO vo) {
		String sql = "update workInfo set ST=3 where workCode=? and assusrn=?";
		try { 
			jdbcTemplate.update(sql,vo.getWorkCode(),vo.getAssUsRn());
			return 1;
		}catch (Exception e) {
			System.err.println("work DAO 오류 : " + e);
			return 0;
		}
	}
	
	int finishWork(String workCode) {
		String sql = "update workInfo set ST=2 where workCode=?";
		try { 
			jdbcTemplate.update(sql,workCode);
			return 1;
		}catch (Exception e) {
			System.err.println("work DAO 오류 : " + e);
			return 0;
		}
	}
	
}
