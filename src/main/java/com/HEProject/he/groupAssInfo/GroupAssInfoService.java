package com.HEProject.he.groupAssInfo;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.HEProject.he.boInfo.BOInfoVO;
import com.HEProject.he.messageInfo.MessageInfoVO;
import com.HEProject.he.usersInfo.SearchInfoVO;
import com.HEProject.he.usersInfo.UsersInfoVO;

public interface GroupAssInfoService {
	List<UsersInfoVO> getAllGrouperInfo(GroupAssInfoVO vo,HttpSession session);
	
	List<SearchInfoVO> searchGrouper(SearchInfoVO vo, HttpSession session,HttpServletRequest request);
	
	void sendOffer(GroupAssInfoVO vo, MessageInfoVO msgVO, BOInfoVO boVO, HttpSession session,HttpServletRequest request);

	List<BOInfoVO> getAllGroupInfo(GroupAssInfoVO vo, HttpSession session);
	
	List<BOInfoVO> getOffer(GroupAssInfoVO vo, HttpSession session);
	
	void modifyOffer(GroupAssInfoVO vo,BOInfoVO boVO, MessageInfoVO msgVO,HttpSession session, HttpServletRequest request);
	
	List<BOInfoVO> getAllAssInfo(GroupAssInfoVO vo, HttpSession session);

	void newAci(GroupAssInfoVO vo, MessageInfoVO msgVO, BOInfoVO boVO, HttpSession session, HttpServletRequest request);
	
	List<BOInfoVO> delGroup(GroupAssInfoVO vo, HttpSession session);
	
	void delGrouper(GroupAssInfoVO vo, HttpSession session, HttpServletRequest request);
	
	void deleteGroup(GroupAssInfoVO vo, HttpSession session, HttpServletRequest request);
	
	List<BOInfoVO> getAci(GroupAssInfoVO vo, HttpSession session);
	
	void modifyAci(GroupAssInfoVO vo, HttpSession session, HttpServletRequest request);
}
