package com.HEProject.he.orderInfo.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.HEProject.he.orderInfo.OrderInfoForIndiVO;
import com.HEProject.he.orderInfo.OrderInfoService;
import com.HEProject.he.orderInfo.OrderInfoVO;
import com.HEProject.he.orderInfo.OrderInfo_st2VO;

@Repository
public class OrderInfoServiceImpl implements OrderInfoService{

	@Autowired
	OrderInfoDAO dao;

	@Override
	public void newOrder(OrderInfoVO vo, HttpServletRequest request, HttpSession session) {
		vo.setsUsRn((String)session.getAttribute("usRn"));
		vo.setgUsRn(request.getParameter("usRn"));
		vo.setWorkCode(request.getParameter("workCode"));
		vo.setEqRn(request.getParameter("eqRn"));
		String relative = request.getParameter("relative");
		if(relative=="") {
			vo.setRelative("없음");
		}else {
			vo.setRelative(relative);
		}
		int result = dao.newOrder(vo);
		if(result==1) {
			request.setAttribute("newOrderSuccess", 1);
		}else {
			request.setAttribute("newOrderSuccess", 0);
		}
	}

	@Override
	public List<OrderInfo_st2VO> getOrderNWorkInfo(OrderInfo_st2VO vo, HttpSession session) {
		vo.setAssUsRn((String)session.getAttribute("usRn"));
		return dao.getOrderNWorkInfo(vo);
	}
	
	@Override
	public OrderInfo_st2VO getOrderInfo(OrderInfo_st2VO vo,HttpServletRequest request, HttpSession session) {
		vo.setAssUsRn((String)session.getAttribute("usRn"));
		String orderCode = request.getParameter("orderCode");
		return dao.getOrderNWorkInfo(vo,orderCode);
	}

	@Override
	public void delOrder(OrderInfoVO vo, HttpServletRequest request, HttpSession session) {
		vo.setsUsRn((String)session.getAttribute("usRn"));
		vo.setOrderCode(request.getParameter("orderCode"));
		int appStatus = 3;
		int result = dao.modifyOrder(vo, appStatus);
		if(result==1) {
			request.setAttribute("delOrderSuccess", 1);
		}else {
			request.setAttribute("delOrderSuccess", 0);
		}
	}

	@Override
	public List<OrderInfoForIndiVO> getAllOrderForIndi(OrderInfoForIndiVO vo, HttpServletRequest request, HttpSession session) {
		vo.setgUsRn((String)session.getAttribute("usRn"));
		return dao.getAllOrderForIndi(vo);
	}

	@Override
	public OrderInfoForIndiVO getOrderForIndi(OrderInfoForIndiVO vo, HttpServletRequest request, HttpSession session) {
		vo.setOrderCode(request.getParameter("orderCode"));
		return dao.getOrderForIndi(vo);
	}

	@Override
	public void modifyOrder(OrderInfoVO vo, HttpServletRequest request, HttpSession session) {
		String orderCode = request.getParameter("orderCode");
		int appStatus = Integer.parseInt(request.getParameter("appStatus"));
		vo.setOrderCode(orderCode);
//		추후 workInfo - indiUsrn 정보를 가져와 이미 다른 사용자가 수락 했는지에 대한 여부를 체크함
		if(appStatus==1) {
			if(dao.modifyOrder(vo, appStatus)==1) {
				OrderInfoVO changeData = dao.getOrder(vo);
				if(dao.submitOrder(changeData)==1) {
					if(dao.otherCancel(changeData)==1) {
						request.setAttribute("orderMDF", 1);
					}else {
						//다른 발주 정보들 취소 변경 작업이 이루어지지 않음
						request.setAttribute("orderMDF", 2);
					}
				}else {
					//workInfo 변경이 정상적으로 이루어지 지지 않음
					request.setAttribute("orderMDF", 2);
				}
			}else {
				//기존 발주 데이터를 수락으로 변경 하는 작업이 이루어지지 않음
				request.setAttribute("orderMDF", 2);
			}
		}else {
			if(dao.modifyOrder(vo, appStatus)==1) {
				request.setAttribute("orderMDF", 0);
			}else {
				request.setAttribute("orderMDF", 2);
			}
		}
		
	}
	
}
