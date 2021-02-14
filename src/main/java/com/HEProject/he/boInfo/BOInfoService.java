package com.HEProject.he.boInfo;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface BOInfoService {
	
	BOInfoVO getBOInfo(BOInfoVO vo,HttpSession session);
	
	List<BOInfoVO> getAllBOInfo(BOInfoVO vo,HttpSession session);
	
	String createBO(BOInfoVO vo,HttpSession session,HttpServletRequest request);

	BOInfoVO checkBOInfo(BOInfoVO vo);
	
	String modifyBO(BOInfoVO vo,HttpSession session,HttpServletRequest request);
	
	String deleteBO(BOInfoVO vo, HttpSession session, HttpServletRequest request);

	
}
