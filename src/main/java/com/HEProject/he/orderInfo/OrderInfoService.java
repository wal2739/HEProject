package com.HEProject.he.orderInfo;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface OrderInfoService {
	
	void newOrder(OrderInfoVO vo,HttpServletRequest request,HttpSession session);
	
	List<OrderInfo_st2VO> getOrderNWorkInfo(OrderInfo_st2VO vo,HttpSession session);

	OrderInfo_st2VO getOrderInfo(OrderInfo_st2VO vo, HttpServletRequest request, HttpSession session);
	
	void delOrder(OrderInfoVO vo, HttpServletRequest request, HttpSession session);
	
	List<OrderInfoForIndiVO> getAllOrderForIndi(OrderInfoForIndiVO vo, HttpServletRequest request, HttpSession session);
	
	OrderInfoForIndiVO getOrderForIndi(OrderInfoForIndiVO vo, HttpServletRequest request, HttpSession session);
	
	void modifyOrder(OrderInfoVO vo, HttpServletRequest request, HttpSession session);
}
