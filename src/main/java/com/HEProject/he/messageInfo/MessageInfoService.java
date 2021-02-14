package com.HEProject.he.messageInfo;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface MessageInfoService {
	MessageInfoVO getMessageInfo(MessageInfoVO vo,HttpSession session);
	
	List<MsgInfoVO> getAllMessage(MsgInfoVO vo, HttpSession session, HttpServletRequest request);
	
	int checkMessage(MessageInfoVO vo, HttpSession session);
	
	void sendMessage(MessageInfoVO vo, HttpSession session);

	int deleteBO(MessageInfoVO vo, HttpSession session);
}
