package com.HEProject.he.messageInfo.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.HEProject.he.messageInfo.MessageInfoService;
import com.HEProject.he.messageInfo.MessageInfoVO;
import com.HEProject.he.messageInfo.MsgInfoVO;
import com.HEProject.he.usersInfo.UsersInfoService;

@Repository
public class MessageInfoServiceImpl implements MessageInfoService{

	@Autowired
	MessageInfoDAO dao;

	@Autowired
	UsersInfoService usersInfoService;
	
	@Override
	public MessageInfoVO getMessageInfo(MessageInfoVO vo, HttpSession session) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MsgInfoVO> getAllMessage(MsgInfoVO vo, HttpSession session, HttpServletRequest request) {
		vo.setgUsRn((String)session.getAttribute("usRn"));
		int wMsg = Integer.parseInt(request.getParameter("wMsg"));
		List<MsgInfoVO> pwList = dao.getAllMessage(vo, wMsg);
		for(int i = 0 ; i < pwList.size(); i++) {
			pwList.get(i).setMessageCode(dao.pwding(pwList.get(i).getMessageCode()));
			pwList.get(i).setgUsRn(dao.pwding(pwList.get(i).getgUsRn()));
			pwList.get(i).setMessageContents(dao.pwding(pwList.get(i).getMessageContents()));
			pwList.get(i).setRelative(dao.pwding(pwList.get(i).getRelative()));
			pwList.get(i).setsUsRn(dao.pwding(pwList.get(i).getsUsRn()));
			pwList.get(i).setUserId(dao.pwding(pwList.get(i).getUserId()));
			pwList.get(i).setUserName(dao.pwding(pwList.get(i).getUserName()));
		}
		return pwList;
	}

	@Override
	public int checkMessage(MessageInfoVO vo, HttpSession session) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void sendMessage(MessageInfoVO vo, HttpSession session) {
		dao.sendMessage(vo);	
	}

	@Override
	public int deleteBO(MessageInfoVO vo, HttpSession session) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
