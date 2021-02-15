package com.HEProject.he.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.HEProject.he.boardInfo.BoardInfoService;
import com.HEProject.he.boardInfo.BoardInfoVO;
import com.HEProject.he.usersInfo.UsersInfoService;
import com.HEProject.he.usersInfo.UsersInfoVO;

@Controller
public class EtcController {

	@Autowired
	BoardInfoService boardInfoService;
	
	@Autowired
	UsersInfoService usersInfoService;
	
	@RequestMapping("etcForIndi.do")
	public ModelAndView etcForIndi(ModelAndView mav,HttpServletRequest request,HttpSession session) {
		mav.setViewName("etcForIndi.jsp");
		return mav;
	}
	
	@RequestMapping("etcForAss.do")
	public ModelAndView etcForAss(ModelAndView mav,HttpServletRequest request,HttpSession session) {
		mav.setViewName("etcForAss.jsp");
		return mav;
	}
	
//	@RequestMapping("freeBoard.do")
//	public ModelAndView freeBoard(ModelAndView mav,HttpServletRequest request,HttpSession session) {
//		mav.addObject("list",boardInfoService.getAllBoard());
//		mav.setViewName("freeBoard.jsp");
//		return mav;
//	} 사용 안함
	
	@RequestMapping("insertBoardForFree.do")
	public ModelAndView insertBoardForFree(ModelAndView mav,UsersInfoVO vo,HttpServletRequest request,HttpSession session) {
		mav.addObject("vo",boardInfoService.insertBoardForFree(vo, request, session));
		mav.setViewName("insertBoardForFree.jsp");
		return mav;
	}
	
	@RequestMapping("insertBoardForFreeAct.do")
	public String insertBoardForFreeAct(BoardInfoVO vo,HttpServletRequest request,HttpSession session) {
		boardInfoService.insertBoard(vo, request, session);
		return "insertBoardForFree.do";
	}
	
	@RequestMapping("getBoard.do")
	public ModelAndView getBoard(ModelAndView mav,BoardInfoVO vo,HttpServletRequest request,HttpSession session) {
		mav.addObject("vo", boardInfoService.getBoard(vo, request, session));
		mav.setViewName("getBoard.jsp");
		return mav;
	}
	
	@RequestMapping("checkIdForModify.do")
	public String checkIdForModify(BoardInfoVO vo,HttpServletRequest request,HttpSession session) {
		return boardInfoService.checkIdForModify(vo, request, session);
	}
	
	@RequestMapping("modifyBoard.do")
	public ModelAndView modifyBoard(ModelAndView mav,BoardInfoVO vo,HttpServletRequest request,HttpSession session) {
		mav.addObject("vo", boardInfoService.getBoard(vo, request, session));
		mav.setViewName("modifyBoard.jsp");
		return mav;
	}
	
	@RequestMapping("modifyBoardAct.do")
	public String modifyBoardAct(BoardInfoVO vo,HttpServletRequest request,HttpSession session) {		
		return boardInfoService.modifyBoard(vo, request, session);
	}
	
	@RequestMapping("eachBoard.do")
	public ModelAndView eachBoard(ModelAndView mav,HttpServletRequest request,HttpSession session) {
		mav.addObject("list",boardInfoService.getEachBoard(request,session));
		mav.setViewName("eachBoard.jsp");
		return mav;
	}
	
	
}
