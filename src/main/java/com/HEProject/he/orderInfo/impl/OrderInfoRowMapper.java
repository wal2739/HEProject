package com.HEProject.he.orderInfo.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.HEProject.he.orderInfo.OrderInfoVO;

public class OrderInfoRowMapper implements RowMapper<OrderInfoVO>{

	@Override
	public OrderInfoVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		OrderInfoVO vo = new OrderInfoVO();
		vo.setOrderCode(rs.getString("ORDERCODE"));
		vo.setWorkCode(rs.getString("WORKCODE"));
		vo.setAppStatus(rs.getInt("APPSTATUS"));
		vo.setRelative(rs.getString("RELATIVE"));
		vo.setgUsRn(rs.getString("GUSRN"));
		vo.setsUsRn(rs.getString("SUSRN"));
		vo.setEqRn(rs.getString("EQRN"));
		return vo;
	}

}
