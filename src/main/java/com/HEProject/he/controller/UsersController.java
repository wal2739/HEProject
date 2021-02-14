package com.HEProject.he.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.HEProject.he.usersInfo.UsersInfoService;
import com.HEProject.he.usersInfo.UsersInfoVO;
import com.HEProject.he.workersInfo.WorkersInfoService;
import com.HEProject.he.workersInfo.WorkersInfoVO;

@Controller
public class UsersController {
	
	@Autowired
	UsersInfoService usersInfoService;
	
	@Autowired
	WorkersInfoService workersInfoService;
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login_Get(HttpSession session,UsersInfoVO vo,HttpServletRequest request) {
		return "login.jsp";
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login_Post(HttpSession session,UsersInfoVO vo,HttpServletRequest request) {
		System.out.println("로그인 시도");
		return usersInfoService.getUser(vo, session, request);
	}
	

	
	@RequestMapping("newUser.do")
	public String newUser(HttpSession session,UsersInfoVO vo,HttpServletRequest request) {
		System.out.println("회원가입 시도");
		usersInfoService.newUser(vo, session, request);
		return "login.jsp";
	}
	
	@RequestMapping("IdCheck.do")
	public String IdCheck(HttpSession session,UsersInfoVO vo,HttpServletRequest request) {
		System.out.println("중복확인 시도");
		System.out.println(request.getParameter("userId"));
		return usersInfoService.IdCheck(vo, request);
	}
	
	@RequestMapping("workerLogin.do")
	public String workerLogin(WorkersInfoVO vo,HttpServletRequest request,HttpSession session) {
		return workersInfoService.loginWorker(vo, request,session);
	}
	
}
