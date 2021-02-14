package com.HEProject.he.groupAssInfo.impl;

import java.util.ArrayList;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.HEProject.he.boInfo.BOInfoService;
import com.HEProject.he.boInfo.BOInfoVO;
import com.HEProject.he.groupAssInfo.GroupAssInfoService;
import com.HEProject.he.groupAssInfo.GroupAssInfoVO;
import com.HEProject.he.messageInfo.MessageInfoService;
import com.HEProject.he.messageInfo.MessageInfoVO;
import com.HEProject.he.usersInfo.SearchInfoVO;
import com.HEProject.he.usersInfo.UsersInfoService;
import com.HEProject.he.usersInfo.UsersInfoVO;

import oracle.net.aso.g;

@Repository
public class GroupAssInfoServiceImpl implements GroupAssInfoService{

	@Autowired
	GroupAssInfoDAO dao;
	
	@Autowired
	UsersInfoService usersInfoService;
	
	@Autowired
	MessageInfoService messageInfoService;
	
	@Autowired
	BOInfoService boInfoService;
	
	@Override
	public List<UsersInfoVO> getAllGrouperInfo(GroupAssInfoVO vo, HttpSession session) {
		System.out.println("실행됨 impl");
		vo.setAssUsRn((String)session.getAttribute("usRn"));
		List<UsersInfoVO> list = dao.getAllGrouperInfo(vo);
		if(list==null) {
			System.out.println("dao에러");
			return null;
		}
		return dao.getAllGrouperInfo(vo);
	}

	@Override
	public List<SearchInfoVO> searchGrouper(SearchInfoVO vo, HttpSession session, HttpServletRequest request) {
		String eqType = request.getParameter("eqType");
		if(eqType==null) {
			request.setAttribute("TorF", 0);
			List<SearchInfoVO> list = null;
			return list;
		}else {
			request.setAttribute("TorF", 1);
			return usersInfoService.getAllEqInfo(vo, session, eqType);
		}
	}

	@Override
	public void sendOffer(GroupAssInfoVO vo, MessageInfoVO msgVO, BOInfoVO boVO, HttpSession session, HttpServletRequest request) {
		String[] grUsRn = request.getParameterValues("chkUsRn");
		String usRn = (String)session.getAttribute("usRn");
		vo.setAssUsRn(usRn);
		boVO.setUsRn(usRn);
		msgVO.setsUsRn(usRn);
		BOInfoVO usInfo = boInfoService.getBOInfo(boVO, session);
		
		msgVO.setMessageContents(usInfo.getCpName() + " 에서 그룹 가입 제의를 보냈습니다.");
		msgVO.setRelative("-");
		msgVO.setwMsg(1);
		int resultNum = 1;
		for(int i = 0 ; i < grUsRn.length; i++) {
			msgVO.setgUsRn(grUsRn[i]);
			vo.setGrUsRn(grUsRn[i]);
			messageInfoService.sendMessage(msgVO, session);
			int successNum = dao.sendOffer(vo);
			if(successNum==0) {
				resultNum = 0;
			}
		}
		if(resultNum==1) {
			request.setAttribute("resultNum", 1);
		}else {
			request.setAttribute("resultNum", 0);
		}
	}

	@Override
	public List<BOInfoVO> getAllGroupInfo(GroupAssInfoVO vo, HttpSession session) {
		vo.setGrUsRn((String)session.getAttribute("usRn"));
		return dao.getAllGroupInfo(vo);
	}

	@Override
	public List<BOInfoVO> getOffer(GroupAssInfoVO vo, HttpSession session) {
		vo.setGrUsRn((String)session.getAttribute("usRn"));
		return dao.getOffer(vo);
	}

	@Override
	public void modifyOffer(GroupAssInfoVO vo,BOInfoVO boVO, MessageInfoVO msgVO,HttpSession session, HttpServletRequest request) {
		int stNum = Integer.parseInt(request.getParameter("state"));
		String boNum = request.getParameter("boNumber");
		String usRn = (String)session.getAttribute("usRn");
		vo.setGrUsRn(usRn);
		int successNum = dao.modifyOffer(vo, stNum, boNum);
		int delSuccessNum = dao.deleteOffer(vo, boNum);
		if(successNum==1&&delSuccessNum==1) {
			msgVO.setsUsRn(usRn);//보낸 사람 test04
			boVO.setBoNumber(boNum);//받는 사람의 사업자 정보를 가져올 사업자 번호
			msgVO.setgUsRn(boInfoService.checkBOInfo(boVO).getUsRn());//받는 사람 test05을 가져옴
			boVO.setUsRn(usRn);//보낸 사람의 사업자 정보
			msgVO.setMessageContents(boInfoService.getBOInfo(boVO, session).getBoName() + " 님이 그룹 가입 제의를 수락 하셨습니다.");//메세지 내용
			msgVO.setRelative("-");
			msgVO.setwMsg(1);
			messageInfoService.sendMessage(msgVO, session);
			request.setAttribute("MO", 1);
		}else if(successNum==0&&delSuccessNum==0){
			request.setAttribute("MO", 0);
		}else {
			request.setAttribute("MO", 2);
		}
	}

	@Override
	public List<BOInfoVO> getAllAssInfo(GroupAssInfoVO vo, HttpSession session) {
		vo.setGrUsRn((String)session.getAttribute("usRn"));
		return dao.getAllAssInfo(vo);
	}

	@Override
	public void newAci(GroupAssInfoVO vo, MessageInfoVO msgVO, BOInfoVO boVO, HttpSession session,HttpServletRequest request) {
		String[] AssUsRn = request.getParameterValues("chkUsRn");
		String usRn = (String)session.getAttribute("usRn");
		vo.setGrUsRn(usRn);//I0000000
		boVO.setUsRn(usRn);//A0000000
		msgVO.setsUsRn(usRn);//I0000000
		BOInfoVO usInfo = boInfoService.getBOInfo(boVO, session);
		
		msgVO.setMessageContents(usInfo.getBoName() + " 님이 그룹 가입 신청을 보냈습니다.");
		msgVO.setRelative("-");
		msgVO.setwMsg(1);
		int result = 1;
		for(int i = 0 ; i < AssUsRn.length; i++) {
			msgVO.setgUsRn(AssUsRn[i]);
			vo.setAssUsRn(AssUsRn[i]);
			messageInfoService.sendMessage(msgVO, session);
			if(dao.newAci(vo)==0) {
				result = 0;
			}
		}
		
		if(result==1) {
			request.setAttribute("resultNum", 1);
		}else {
			request.setAttribute("resultNum", 0);
		}
		
	}
	
	@Override
	public List<BOInfoVO> delGroup(GroupAssInfoVO vo, HttpSession session) {
		vo.setGrUsRn((String)session.getAttribute("usRn"));
		return dao.getAllGroupInfo(vo);
	}

	@Override
	public void deleteGroup(GroupAssInfoVO vo, HttpSession session, HttpServletRequest request) {
		String[] AssUsRn = request.getParameterValues("chkUsRn");
		vo.setGrUsRn((String)session.getAttribute("usRn"));
		int result = 1;
		for(int i = 0 ; i < AssUsRn.length; i++) {
			vo.setAssUsRn(AssUsRn[i]);
			if(dao.deleteGroup(vo)==0) {
				result=0;
			}
		}
		if(result==0) {
			request.setAttribute("delCheckNum", 0);
		}else if(result==1) {
			request.setAttribute("delCheckNum", 1);
		}else {
			request.setAttribute("delCheckNum", 2);
		}
	}

	@Override
	public void delGrouper(GroupAssInfoVO vo, HttpSession session, HttpServletRequest request) {
		String[] GrUsRn = request.getParameterValues("chkUsRn");
		vo.setAssUsRn((String)session.getAttribute("usRn"));
		int result = 1;
		for(int i = 0 ; i < GrUsRn.length; i++) {
			vo.setGrUsRn(GrUsRn[i]);
			if(dao.deleteGroup(vo)==0) {
				result=0;
			}
		}
		if(result==0) {
			request.setAttribute("delGrouperCheckNum", 0);
		}else if(result==1) {
			request.setAttribute("delGrouperCheckNum", 1);
		}else {
			request.setAttribute("delGrouperCheckNum", 2);
		}
	}
	
	@Override
	public List<BOInfoVO> getAci(GroupAssInfoVO vo,HttpSession session) {
		vo.setAssUsRn((String)session.getAttribute("usRn"));
		return dao.getAci(vo);
	}

	@Override
	public void modifyAci(GroupAssInfoVO vo, HttpSession session, HttpServletRequest request) {
		vo.setAssUsRn((String)session.getAttribute("usRn"));
		vo.setGrUsRn(request.getParameter("usRn"));
		int stateNum = Integer.parseInt(request.getParameter("state"));
		if(dao.modifyAci(vo, stateNum)==1) {
			request.setAttribute("modifyAciCheck", 1);
		}else {
			request.setAttribute("modifyAciCheck", 0);
		}
		
	}
	
	
	
}
