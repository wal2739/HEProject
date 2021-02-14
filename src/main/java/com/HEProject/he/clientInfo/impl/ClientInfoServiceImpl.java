package com.HEProject.he.clientInfo.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.HEProject.he.clientInfo.ClientInfoService;
import com.HEProject.he.clientInfo.ClientInfoVO;

@Repository
public class ClientInfoServiceImpl implements ClientInfoService{

	@Autowired
	ClientInfoDAO dao;
	
	
	
	@Override
	public List<ClientInfoVO> getAllClientInfo(ClientInfoVO vo, HttpSession session) {
		vo.setUsRn((String)session.getAttribute("usRn"));
		return dao.getAllClientInfo(vo);
	}

	@Override
	public void newClient(ClientInfoVO vo, HttpServletRequest request, HttpSession session) {
		vo.setClientCode(request.getParameter("clientCode"));
		vo.setClientBoNumber(request.getParameter("clientBoNumber01") + "-" + request.getParameter("clientBoNumber02") + "-" + request.getParameter("clientBoNumber03"));
		vo.setClientCeo(request.getParameter("clientCeo"));
		vo.setClientManager(request.getParameter("clientManager"));
		vo.setClientPhone(request.getParameter("clientPhone"));
		vo.setClientAdd01(request.getParameter("clientAdd01"));
		vo.setUsRn((String)session.getAttribute("usRn"));
		vo.setClientCpName(request.getParameter("clientCpName"));
		if(request.getParameter("clientCell")=="") {
			vo.setClientCell("없음");
		}else {
			vo.setClientCell(request.getParameter("clientCell"));
		}
		if(request.getParameter("clientMail")=="") {
			vo.setClientMail("없음");
		}else {
			vo.setClientMail(request.getParameter("clientMail"));
		}
		if(request.getParameter("relative")=="") {
			vo.setRelative("없음");
		}else {
			vo.setRelative(request.getParameter("relative"));
		}if(request.getParameter("clientAdd02")=="") {
			vo.setClientAdd02("없음");
		}else {
			vo.setClientAdd02(request.getParameter("clientAdd02"));
		}
		int resultNum = dao.newClient(vo);
		if(resultNum==1) {
			request.setAttribute("newCliCheck", 1);
		}else {
			request.setAttribute("newCliCheck", 0);
		}
	}

	@Override
	public void delClient(ClientInfoVO vo, HttpServletRequest request, HttpSession session) {
		String[] codeArr = request.getParameterValues("chkDel");
		vo.setUsRn((String)session.getAttribute("usRn"));
		int resultNum = 1;
		for(int i = 0 ; i < codeArr.length; i++) {
			vo.setClientCode(codeArr[i]);
			if(dao.delClient(vo)==0) {
				resultNum = 0;
			}
		}
		if(resultNum==1) {
			request.setAttribute("delCliCheck", 1);
		}else {
			request.setAttribute("delCliCheck", 0);
		}
	}

	@Override
	public void modifyClient(ClientInfoVO vo, HttpServletRequest request, HttpSession session) {
		vo.setClientCode(request.getParameter("clientCode"));
		vo.setClientBoNumber(request.getParameter("clientBoNumber01") + "-" + request.getParameter("clientBoNumber02") + "-" + request.getParameter("clientBoNumber03"));
		vo.setClientCeo(request.getParameter("clientCeo"));
		vo.setClientManager(request.getParameter("clientManager"));
		vo.setClientPhone(request.getParameter("clientPhone"));
		vo.setClientAdd01(request.getParameter("clientAdd01"));
		vo.setUsRn((String)session.getAttribute("usRn"));
		vo.setClientCpName(request.getParameter("clientCpName"));
		if(request.getParameter("clientCell")=="") {
			vo.setClientCell("없음");
		}else {
			vo.setClientCell(request.getParameter("clientCell"));
		}
		if(request.getParameter("clientMail")=="") {
			vo.setClientMail("없음");
		}else {
			vo.setClientMail(request.getParameter("clientMail"));
		}
		if(request.getParameter("relative")=="") {
			vo.setRelative("없음");
		}else {
			vo.setRelative(request.getParameter("relative"));
		}if(request.getParameter("clientAdd02")=="") {
			vo.setClientAdd02("없음");
		}else {
			vo.setClientAdd02(request.getParameter("clientAdd02"));
		}
		System.out.println(vo);
		int resultNum = dao.modifyClient(vo);
		if(resultNum==1) {
			request.setAttribute("modCliCheck", 1);
		}else {
			request.setAttribute("modCliCheck", 0);
		}
		
	}

	@Override
	public ClientInfoVO getClientInfo(ClientInfoVO vo, HttpServletRequest request, HttpSession session) {
		vo.setUsRn((String)session.getAttribute("usRn"));
		vo.setClientCode(request.getParameter("clientCode"));
		return dao.getClientInfo(vo);
	}
	
	

}
