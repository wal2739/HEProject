package com.HEProject.he.vehicleInfo.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.HEProject.he.vehicleInfo.VehicleVO;

public class VehicleRowMapper implements RowMapper<VehicleVO>{

	@Override
	public VehicleVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		VehicleVO vo = new VehicleVO();
		vo.setEquipNum(rs.getString("EQUIPNUM"));
		vo.setUsRn(rs.getString("USRN"));
		vo.setEqRn(rs.getString("EQRN"));
		vo.setEquipType(rs.getString("EQUIPTYPE"));
		vo.setEquipClass(rs.getString("EQUIPCLASS"));
		vo.setEquipOption(rs.getString("EQUIPOPTION"));
		vo.setEquipRD(rs.getDate("EQUIPRD"));
		vo.setEquipID(rs.getDate("EQUIPID"));
		vo.setSt(rs.getInt("ST"));
		return vo;
	}

}
