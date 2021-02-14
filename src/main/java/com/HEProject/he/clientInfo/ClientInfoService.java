package com.HEProject.he.clientInfo;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface ClientInfoService {

	List<ClientInfoVO> getAllClientInfo(ClientInfoVO vo,HttpSession session);
	
	void newClient(ClientInfoVO vo, HttpServletRequest request, HttpSession session);
	
	void delClient(ClientInfoVO vo, HttpServletRequest request, HttpSession session);
	
	void modifyClient(ClientInfoVO vo, HttpServletRequest request, HttpSession session);
	
	ClientInfoVO getClientInfo(ClientInfoVO vo, HttpServletRequest request, HttpSession session);
}
