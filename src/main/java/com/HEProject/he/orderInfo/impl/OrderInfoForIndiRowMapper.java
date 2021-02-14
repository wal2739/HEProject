package com.HEProject.he.orderInfo.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.HEProject.he.orderInfo.OrderInfoForIndiVO;

public class OrderInfoForIndiRowMapper implements RowMapper<OrderInfoForIndiVO> {

	@Override
	public OrderInfoForIndiVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		OrderInfoForIndiVO vo = new OrderInfoForIndiVO();
		vo.setUserName(rs.getString("USERNAME"));
		vo.setWorkCode(rs.getString("WORKCODE"));
		vo.setClientCode(rs.getString("CLIENTCODE"));
		vo.setWorkField(rs.getString("WORKFIELD"));
		vo.setFieldManager(rs.getString("FIELDMANAGER"));
		vo.setFieldManagerPhone(rs.getString("FIELDMANAGERPHONE"));
		vo.setFieldManagerCell(rs.getString("FIELDMANAGERCELL"));
		vo.setFieldManagerMail(rs.getString("FIELDMANAGERMAIL"));
		vo.setFieldAdd01(rs.getString("FIELDADD01"));
		vo.setFieldAdd02(rs.getString("FIELDADD02"));
		vo.setWorkAmount(rs.getString("WORKAMOUNT"));
		vo.setWorkTime(rs.getString("WORKTIME"));
		vo.setWorkRequests(rs.getString("WORKREQUESTS"));
		vo.setSt(rs.getInt("ST"));
		vo.setAssUsRn(rs.getString("ASSUSRN"));
		vo.setWorkDate(rs.getDate("WORKDATE"));
		vo.setRV(rs.getString("RV"));
		vo.setEqRn(rs.getString("EQRN"));
		vo.setgUsRn(rs.getString("GUSRN"));
		vo.setAppStatus(rs.getInt("APPSTATUS"));
		vo.setUserCell(rs.getString("USERCELL"));
		vo.setClientCpName(rs.getString("CLIENTCPNAME"));
		vo.setClientManager(rs.getString("CLIENTMANAGER"));
		vo.setClientPhone(rs.getString("CLIENTPHONE"));
		vo.setEquipOption(rs.getString("EQUIPOPTION"));
		vo.setUserId(rs.getString("USERID"));
		vo.setEquipType(rs.getString("EQUIPTYPE"));
		vo.setEquipClass(rs.getString("EQUIPCLASS"));
		vo.setRelative(rs.getString("RELATIVE"));
		vo.setOrderCode(rs.getString("ordercode"));
		vo.setEquipNum(rs.getString("EQUIPNUM"));
		vo.setBoPhone(rs.getString("BOPHONE"));
		vo.setCpName(rs.getString("CPNAME"));
		return vo;
	}

}
