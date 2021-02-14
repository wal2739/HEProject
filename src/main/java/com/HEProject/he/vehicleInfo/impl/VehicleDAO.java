package com.HEProject.he.vehicleInfo.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.HEProject.he.vehicleInfo.VehicleVO;



@Repository
public class VehicleDAO {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public VehicleVO getVehicleInfo(VehicleVO vo) {
		String sql = "select * from EQUIPInfo where equipNum = ? and USRN='"+vo.getUsRn()+"' and st=0 ";
		Object[] args = {vo.getEquipNum()};
		return jdbcTemplate.queryForObject(sql, args, new VehicleRowMapper());
		
	}
	
	public List<VehicleVO> getAllVehicleInfo(VehicleVO vo) {
		String sql = "select * from EQUIPInfo where USRN = '" + vo.getUsRn() + "' and st=0";
		return jdbcTemplate.query(sql, new VehicleRowMapper());
		
	}
	
	public int newVehicle(VehicleVO vo) {
		String sql = "insert into EQUIPInfo(EQRN,EQUIPNUM,USRN,EQUIPTYPE,EQUIPCLASS,EQUIPOPTION,EQUIPRD,EQUIPID,ST) values(LPAD(LPAD(EQRn_sq.nextVal, '8', '0'),'9','E'),?,?,?,?,?,?,?,0)";
		try {
			jdbcTemplate.update(sql, vo.getEquipNum(),vo.getUsRn(),vo.getEquipType(),vo.getEquipClass(),vo.getEquipOption(),vo.getEquipRD(),vo.getEquipID());
			return 1;
		}catch(DuplicateKeyException e){
			System.out.println("차량 정보 등록 오류 "+ e);
			return 2;
		} catch (Exception e) {
			System.err.println("차량 정보 등록 오류" + e);
			return 0;
		}
		
	}

	public int modifyVehicle(VehicleVO vo,HttpSession session) {
		try {
			String sql = "update EQUIPInfo set EQUIPNUM=?,EQUIPTYPE=?,EQUIPCLASS=?,EQUIPOPTION=?,EQUIPRD=?,EQUIPID=? where USRN=? and st=0 and EQUIPNUM=?";
			jdbcTemplate.update(sql, vo.getEquipNum(),vo.getEquipType(),vo.getEquipClass(),vo.getEquipOption(),vo.getEquipRD(),vo.getEquipID(),vo.getUsRn(),session.getAttribute("EquipNumSv"));
			return 1;
		}catch(DuplicateKeyException e){
			System.out.println("차량 정보 등록 오류 "+ e);
			return 2;
		} catch (Exception e) {
			System.err.println("차량 정보 수정 오류" + e);
			return 0;
		}
		
	}
	
	public int deleteVehicle(VehicleVO vo) {
		String sql = "update EQUIPInfo set st=(select max(st) from EQUIPInfo where EQUIPNUM=? and USRN=?)+1 where EQUIPNUM=? and USRN=? and st=0";
		try {
			jdbcTemplate.update(sql,vo.getEquipNum(), vo.getUsRn(),vo.getEquipNum(), vo.getUsRn());
			return 1;
		}catch (Exception e) {
			System.err.println("차량 정보 삭제 오류");
			return 0;
		}
	}
}
