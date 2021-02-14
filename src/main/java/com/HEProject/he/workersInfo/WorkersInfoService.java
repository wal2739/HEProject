package com.HEProject.he.workersInfo;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.HEProject.he.usersInfo.UsersInfoVO;

public interface WorkersInfoService {
	
	WorkersInfoVO getWorker(WorkersInfoVO vo);
	
	List<WorkersInfoVO> getAllWorker(WorkersInfoVO vo,HttpSession session);

	String newWorker(WorkersInfoVO vo,HttpSession session,HttpServletRequest request);
		
	String loginWorker(WorkersInfoVO vo, HttpServletRequest request,HttpSession session);

	String deleteWorker(WorkersInfoVO vo, HttpServletRequest request);
}
