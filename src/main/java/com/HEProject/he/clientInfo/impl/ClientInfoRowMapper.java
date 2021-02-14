package com.HEProject.he.clientInfo.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.HEProject.he.clientInfo.ClientInfoVO;

public class ClientInfoRowMapper implements RowMapper<ClientInfoVO>{

	@Override
	public ClientInfoVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		ClientInfoVO vo = new ClientInfoVO();
		vo.setClientCode(rs.getString("CLIENTCODE"));
		vo.setClientBoNumber(rs.getString("CLIENTBONUMBER"));
		vo.setClientCeo(rs.getString("CLIENTCEO"));
		vo.setClientManager(rs.getString("CLIENTMANAGER"));
		vo.setClientPhone(rs.getString("CLIENTPHONE"));
		vo.setClientCell(rs.getString("CLIENTCELL"));
		vo.setClientMail(rs.getString("CLIENTMAIL"));
		vo.setClientAdd01(rs.getString("CLIENTADD01"));
		vo.setClientAdd02(rs.getString("CLIENTADD02"));
		vo.setSt(rs.getInt("ST"));
		vo.setUsRn(rs.getString("USRN"));
		vo.setRelative(rs.getString("RELATIVE"));
		vo.setClientCpName(rs.getString("clientCpName"));
		return vo;
	}
	

}
