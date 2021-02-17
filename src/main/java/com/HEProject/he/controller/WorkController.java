package com.HEProject.he.controller;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.HEProject.he.clientInfo.ClientInfoService;
import com.HEProject.he.clientInfo.ClientInfoVO;
import com.HEProject.he.orderInfo.OrderInfoForIndiVO;
import com.HEProject.he.orderInfo.OrderInfoService;
import com.HEProject.he.orderInfo.OrderInfoVO;
import com.HEProject.he.orderInfo.OrderInfo_st2VO;
import com.HEProject.he.workInfo.WorkInfoService;
import com.HEProject.he.workInfo.WorkInfoVO;
import com.HEProject.he.workInfo.WorkInfo_ST0VO;
import com.HEProject.he.workInfo.WorkInfo_ST1VO;
import com.HEProject.he.workInfo.WorkerInfoVO;

@Controller
public class WorkController {

	
	@Autowired
	WorkInfoService workInfoService;
	
	@Autowired
	ClientInfoService clientInfoService;

	@Autowired
	OrderInfoService orderInfoService;
	
	@RequestMapping("workMain.do")
	public ModelAndView workMain(ModelAndView mav, HttpSession session) {
		mav.setViewName("workMain.jsp");
		return mav;
	}
	
	@RequestMapping("newWork.do")
	public ModelAndView newWork(ModelAndView mav,ClientInfoVO clientVO, HttpSession session) {
		mav.addObject("cInfo",clientInfoService.getAllClientInfo(clientVO, session));
		mav.setViewName("newWork.jsp");
		return mav;
	}
	@RequestMapping("newWorkACT.do")
	public ModelAndView newWorkACT(ModelAndView mav,WorkInfoVO vo, HttpSession session,HttpServletRequest request) {
		mav.setViewName(workInfoService.newWork(vo, session, request));
		return mav;
	}
	@RequestMapping("workInfo.do")
	public ModelAndView workInfo(ModelAndView mav,WorkInfoVO vo, HttpSession session,HttpServletRequest request) {
		mav.addObject("list",workInfoService.getAllWork(vo, session));
		mav.setViewName("workInfo.jsp");
		return mav;
	}
	@RequestMapping("getAllWorkInfo.do")
	public ModelAndView getAllWorkInfo(ModelAndView mav,WorkInfo_ST0VO vo, HttpSession session,HttpServletRequest request) {
		mav.addObject("vo",workInfoService.getAllWorkInfo_st0(vo, request));
		mav.setViewName("getAllWorkInfo.jsp");
		return mav;
	}
	
	@RequestMapping("modifyWork.do")
	public ModelAndView modifyWork(ModelAndView mav,WorkInfo_ST0VO vo,ClientInfoVO clientVO, HttpSession session,HttpServletRequest request) {
		mav.addObject("cInfo",clientInfoService.getAllClientInfo(clientVO, session));
		mav.addObject("vo",workInfoService.getAllWorkInfo_st0(vo, request));
		mav.setViewName("modifyWork.jsp");
		return mav;
	}
	@RequestMapping("modifyWorkAct.do")
	public ModelAndView modifyWorkAct(ModelAndView mav,WorkInfoVO vo,HttpSession session,HttpServletRequest request) {
		mav.setViewName(workInfoService.modifyWork(vo, session, request));
		return mav;
	}
	@RequestMapping("workOrderInfo.do")
	public ModelAndView workOrderinfo(ModelAndView mav,OrderInfo_st2VO vo,HttpSession session,HttpServletRequest request) {
		mav.addObject("list",orderInfoService.getOrderNWorkInfo(vo, session));
		mav.setViewName("workOrderInfo.jsp");
		return mav;
	}
	@RequestMapping("newOrder.do")
	public ModelAndView newOrder(ModelAndView mav, WorkInfo_ST0VO vo,HttpSession session,HttpServletRequest request) {
		mav.addObject("list",workInfoService.getAllWork_toSt0(vo, session, request));
		mav.setViewName("newOrder.jsp");
		return mav;
	}
	@RequestMapping("newOrderAct.do")
	public ModelAndView newOrderAct(ModelAndView mav, OrderInfoVO vo,HttpSession session,HttpServletRequest request) {
		orderInfoService.newOrder(vo, request, session);
		mav.setViewName("newOrder.do");
		return mav;
	}
	@RequestMapping("getWorker.do")
	public ModelAndView getWorker(ModelAndView mav, WorkerInfoVO vo,HttpSession session,HttpServletRequest request) {
		mav.addObject("list",workInfoService.getWorkerList(vo, session, request));
		mav.setViewName("getWorker.jsp");
		return mav;
	}
	@RequestMapping("delOrder.do")
	public ModelAndView delOrder(ModelAndView mav, OrderInfo_st2VO vo,HttpSession session,HttpServletRequest request) {
		mav.addObject("list",orderInfoService.getOrderNWorkInfo(vo, session));
		mav.setViewName("delOrder.jsp");
		return mav;
	}
	@RequestMapping("delAct.do")
	public ModelAndView delAct(ModelAndView mav, OrderInfoVO vo,HttpSession session,HttpServletRequest request) {
		orderInfoService.delOrder(vo, request, session);
		mav.setViewName("delOrder.do");
		return mav;
	}
	@RequestMapping("getOrderInfo.do")
	public ModelAndView getOrderInfo(ModelAndView mav,OrderInfo_st2VO vo,HttpSession session,HttpServletRequest request) {
		mav.addObject("vo",orderInfoService.getOrderInfo(vo,request , session));
		mav.setViewName("getOrderInfo.jsp");
		return mav;
	}
	@RequestMapping("workMainForIndi.do")
	public ModelAndView workMainForIndi(ModelAndView mav,HttpSession session,HttpServletRequest request) {
		mav.setViewName("workMainForIndi.jsp");
		return mav;
	}
	@RequestMapping("workInfoForIndi.do")
	public ModelAndView workInfoForIndi(ModelAndView mav,HttpSession session,HttpServletRequest request) {
		
		mav.setViewName("workInfoForIndi.jsp");
		return mav;
	}
	@RequestMapping("orderInfoForIndi.do")
	public ModelAndView orderInfoForIndi(ModelAndView mav,OrderInfoForIndiVO vo,HttpSession session,HttpServletRequest request) {
		mav.addObject("list",orderInfoService.getAllOrderForIndi(vo, request, session));
		mav.setViewName("orderInfoForIndi.jsp");
		return mav;
	}@RequestMapping("orderInfo.do")
	public ModelAndView orderInfo(ModelAndView mav,OrderInfoForIndiVO vo,HttpSession session,HttpServletRequest request) {
		mav.addObject("vo",orderInfoService.getOrderForIndi(vo, request, session));
		mav.setViewName("orderInfo.jsp");
		return mav;
	}
	@RequestMapping("modifyOrder.do")
	public ModelAndView modifyOrder(ModelAndView mav,OrderInfoVO vo,HttpSession session,HttpServletRequest request) {
		orderInfoService.modifyOrder(vo, request, session);
		mav.setViewName("orderInfoForIndi.do");
		return mav;
	}
	@RequestMapping("cancelWork.do")
	public ModelAndView cancelWork(ModelAndView mav,WorkInfoVO vo,HttpSession session,HttpServletRequest request) {
		mav.addObject("list",workInfoService.getAllWork(vo, session));
		mav.setViewName("cancelWork.jsp");
		return mav;
	}
	
	@RequestMapping("cancelWorkList.do")
	public ModelAndView cancelWorkList(ModelAndView mav,WorkInfo_ST0VO vo,HttpSession session,HttpServletRequest request) {
		mav.addObject("list",workInfoService.getAllWork_toSt3(vo, session, request));
		mav.setViewName("cancelWorkList.jsp");
		return mav;
	}
	
	@RequestMapping("getAllWorkInfo_ST3.do")
	public ModelAndView getAllWorkInfo_ST3(ModelAndView mav,WorkInfo_ST0VO vo, HttpSession session,HttpServletRequest request) {
		mav.addObject("vo",workInfoService.getAllWorkInfo_st3(vo, request));
		mav.setViewName("getAllWorkInfo.jsp");
		return mav;
	}
	
	@RequestMapping("cancelWorkAct.do")
	public ModelAndView cancelWorkAct(ModelAndView mav,WorkInfoVO vo,HttpSession session,HttpServletRequest request) {
		workInfoService.cancelWork(vo, session, request);
		mav.setViewName("cancelWork.do");
		return mav;
	}
	
	@RequestMapping("showWorkInfo_st0.do")
	public ModelAndView showWorkInfo_st0(ModelAndView mav,WorkInfo_ST0VO vo,HttpSession session,HttpServletRequest request) {
		mav.addObject("vo",workInfoService.getAllWork_toSt0(vo, request));
		mav.setViewName("showWorkInfo_st0.jsp");
		return mav;
	}
	
	@RequestMapping("showWorkInfo_st1.do")
	public ModelAndView showWorkInfo_st1(ModelAndView mav,WorkInfo_ST1VO vo,HttpSession session,HttpServletRequest request) {
		mav.addObject("vo",workInfoService.getAllWork_toSt1(vo, request));
		mav.setViewName("showWorkInfo_st1.jsp");
		return mav;
	}
}
