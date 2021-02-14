package com.HEProject.he.orderInfo.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.HEProject.he.orderInfo.OrderInfoForIndiVO;
import com.HEProject.he.orderInfo.OrderInfoVO;
import com.HEProject.he.orderInfo.OrderInfo_st2VO;

@Repository
public class OrderInfoDAO {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	OrderInfoVO getOrder(OrderInfoVO vo) {
		String sql = "select * from orderInfo where ORDERCODE = ?";
		Object[] args = {vo.getOrderCode()};
		try {
			return jdbcTemplate.queryForObject(sql, args, new OrderInfoRowMapper());
		} catch (EmptyResultDataAccessException e) {
			System.err.println(e);
			return null;
		}
	}
	
	List<OrderInfoVO> getAllOrderG(OrderInfoVO vo){
		String sql = "select * from orderInfo where APPSTATUS=2 and GUSRN='" + vo.getgUsRn() + "'";
		try {
			return jdbcTemplate.query(sql, new OrderInfoRowMapper());
		} catch (EmptyResultDataAccessException e) {
			System.err.println(e);
			return null;
		}
	}
	
	List<OrderInfoVO> getAllOrderS(OrderInfoVO vo){
		String sql = "select * from orderInfo where APPSTATUS=2 and SUSRN='" + vo.getgUsRn() + "'";
		try {
			return jdbcTemplate.query(sql, new OrderInfoRowMapper());
		} catch (EmptyResultDataAccessException e) {
			System.err.println(e);
			return null;
		}
	}
	
	List<OrderInfo_st2VO> getOrderNWorkInfo(OrderInfo_st2VO vo){
		String sql = "select * from ORDERINFO_STATUS2 where APPSTATUS=2 and ASSUSRN='" + vo.getAssUsRn() + "'";
		try {
			return jdbcTemplate.query(sql, new OrderInfo_st2RowMapper());
		} catch (EmptyResultDataAccessException e) {
			System.err.println(e);
			return null;
		}
	}
	OrderInfo_st2VO getOrderNWorkInfo(OrderInfo_st2VO vo,String orderCode){
		String sql = "select * from ORDERINFO_STATUS2 where APPSTATUS=2 and orderCode='" + orderCode + "' and ASSUSRN=?";
		Object[] args = {vo.getAssUsRn()};
		try {
			return jdbcTemplate.queryForObject(sql,args ,new OrderInfo_st2RowMapper());
		} catch (EmptyResultDataAccessException e) {
			System.err.println(e);
			return null;
		}
	}
	
	List<OrderInfoForIndiVO> getAllOrderForIndi(OrderInfoForIndiVO vo){
		String sql = "select * from ORDERINFOFORINDI where gusrn='" + vo.getgUsRn() + "'";
		try {
			return jdbcTemplate.query(sql, new OrderInfoForIndiRowMapper());
		} catch (EmptyResultDataAccessException e) {
			System.err.println(e);
			return null;
		}
	}
	
	OrderInfoForIndiVO getOrderForIndi(OrderInfoForIndiVO vo){
		String sql = "select * from ORDERINFOFORINDI where orderCode=?";
		Object[] args = {vo.getOrderCode()};
		try {
			return jdbcTemplate.queryForObject(sql,args ,new OrderInfoForIndiRowMapper());
		} catch (EmptyResultDataAccessException e) {
			System.err.println(e);
			return null;
		}
	}
	
	int newOrder(OrderInfoVO vo) {
		String sql = "insert into orderInfo(ORDERCODE,WORKCODE,APPSTATUS,RELATIVE,GUSRN,SUSRN,EQRN) values(LPAD(LPAD(orderCode_sq.nextVal, '9', '0'),'10','O'),?,2,?,?,?,?)";
		try {
			jdbcTemplate.update(sql,vo.getWorkCode(),vo.getRelative(),vo.getgUsRn(),vo.getsUsRn(),vo.getEqRn());
			return 1;
		} catch (Exception e) {
			System.err.println(e);
			return 0;
		}
	}
	
	int modifyOrder(OrderInfoVO vo,int appStatus) {
		String sql = "update orderInfo set APPSTATUS=" + appStatus + " where ORDERCODE=?";
		try {
			jdbcTemplate.update(sql, vo.getOrderCode());
			return 1;
		} catch (Exception e) {
			System.err.println(e);
			return 0;
		}
	}
	
	
	
	int submitOrder(OrderInfoVO vo) {
		String sql = "update workInfo set st=1,INDIUSRN=?,WORKERSDATA=1,EQRN=? where WORKCODE=?";
		try {
			jdbcTemplate.update(sql, vo.getgUsRn(),vo.getEqRn(),vo.getWorkCode());
			return 1;
		} catch (Exception e) {
			System.err.println(e);
			return 0;
		}
	}
	
	int otherCancel(OrderInfoVO vo) {
		String sql ="update orderInfo set appstatus=3 where gusrn in (select gusrn from orderInfo where gusrn<>?)";
		try {
			jdbcTemplate.update(sql,vo.getgUsRn());
			return 1;
		} catch (Exception e) {
			System.err.println(e);
			return 0;
		}
	}
}
