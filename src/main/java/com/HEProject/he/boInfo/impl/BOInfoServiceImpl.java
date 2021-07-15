package com.HEProject.he.boInfo.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.HEProject.he.boInfo.BOInfoService;
import com.HEProject.he.boInfo.BOInfoVO;

@Repository
public class BOInfoServiceImpl implements BOInfoService{

	@Autowired
	BOInfoDAO dao;
	
	@Override
	public BOInfoVO getBOInfo(BOInfoVO vo, HttpSession session) {
		vo.setUsRn((String)session.getAttribute("usRn"));
		return dao.getBOInfo(vo);
	}
	
	@Override
	public BOInfoVO checkBOInfo(BOInfoVO vo) {
		return dao.checkBOInfo(vo);
	}

	@Override
	public List<BOInfoVO> getAllBOInfo(BOInfoVO vo, HttpSession session) {

		return null;
	}

	@Override
	public String createBO(BOInfoVO vo, HttpSession session, HttpServletRequest request) {
		System.out.println("ServiceImpl 사업자 등록시도");
		String boNumber = request.getParameter("boNumber01") + "-" + request.getParameter("boNumber02") + "-" + request.getParameter("boNumber03");
		vo.setBoNumber(boNumber);
		vo.setBoName(request.getParameter("boName"));
		vo.setUsRn((String)session.getAttribute("usRn"));
		vo.setBoRrn(request.getParameter("boRrn"));
		vo.setBoPhone(request.getParameter("boPhone"));
		vo.setBoCell(request.getParameter("boCell"));
		vo.setBoMail(request.getParameter("boMail"));
		vo.setBoAdd01(request.getParameter("boAdd01"));
		vo.setTob01(request.getParameter("tob01"));
		vo.setTob02(request.getParameter("tob02"));
		vo.setCpName(request.getParameter("cpName"));

		if(request.getParameter("boAdd02")=="") {
			vo.setBoAdd02("없음");
		}else {
			vo.setBoAdd02(request.getParameter("boAdd02"));
		}
		vo.setBoAcc(Long.parseLong(request.getParameter("boAcc")));
		vo.setBoAccBack(request.getParameter("boAccBack"));
		if(checkBOInfo(vo)!=null) {
			request.setAttribute("boCheck", 2);
			return "newBO.do";
		}else {
			dao.createBO(vo);
			if(dao.getBOInfo(vo)==null) {
				System.out.println("정상적으로 처리되지 않았습니다. [사업자등록]");
				request.setAttribute("boCheck", 0);
				return "newBO.do";
			}else {
				request.setAttribute("boCheck", 1);
				return "newBO.do";
			}
		}
		
	}

	@Override
	public String modifyBO(BOInfoVO vo, HttpSession session, HttpServletRequest request) {
		System.out.println("ServiceImpl 사업자 수정시도");
		String boNumber = request.getParameter("boNumber01") + "-" + request.getParameter("boNumber02") + "-" + request.getParameter("boNumber03");
		vo.setBoNumber(boNumber);
		vo.setBoName((String) request.getParameter("boName"));
		vo.setUsRn((String)session.getAttribute("usRn"));
		vo.setBoRrn((String) request.getParameter("boRrn"));
		vo.setBoPhone((String) request.getParameter("boPhone"));
		vo.setBoCell((String) request.getParameter("boCell"));
		vo.setBoMail((String) request.getParameter("boMail"));
		vo.setBoAdd01((String) request.getParameter("boAdd01"));
		vo.setBoAdd02((String) request.getParameter("boAdd02"));
		vo.setBoAcc(Long.parseLong(request.getParameter("boAcc")));
		vo.setBoAccBack((String) request.getParameter("boAccBack"));
		vo.setTob01(request.getParameter("tob01"));
		vo.setTob02(request.getParameter("tob02"));
		vo.setCpName(request.getParameter("cpName"));
		if(checkBOInfo(vo)==null) {
			request.setAttribute("boCheck", 2);
			return "newBO.do";
		}else {
			int check = dao.modifyBO(vo);
			if(check==0) {
				System.out.println("정상적으로 처리되지 않았습니다. [사업자수정]");
				request.setAttribute("boCheck", 0);
			}else if(check==1){
				request.setAttribute("boCheck", 1);
			}else {
				System.out.println("확인되지 않은 요청 에러 - [사업자수정]");
				request.setAttribute("boCheck", 3);
			}
		}
		return "modifyBO.do";

	}

	@Override
	public String deleteBO(BOInfoVO vo, HttpSession session, HttpServletRequest request) {
		vo.setUsRn((String)session.getAttribute("usRn"));
		int check = dao.deleteBO(vo);
		if(check==0) {
			request.setAttribute("delCheck", 1);
		}else {
			request.setAttribute("delCheck", 0);
		}
		return "showBO.do";
	}


	
	
}
