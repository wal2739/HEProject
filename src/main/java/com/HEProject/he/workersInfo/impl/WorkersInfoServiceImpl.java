package com.HEProject.he.workersInfo.impl;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.HEProject.he.usersInfo.UsersInfoVO;
import com.HEProject.he.workersInfo.WorkersInfoService;
import com.HEProject.he.workersInfo.WorkersInfoVO;

@Repository
public class WorkersInfoServiceImpl implements WorkersInfoService{
	
	@Autowired
	private WorkersInfoDAO dao;

	@Override
	public WorkersInfoVO getWorker(WorkersInfoVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<WorkersInfoVO> getAllWorker(WorkersInfoVO vo,HttpSession session) {
		vo.setUsRn((String)session.getAttribute("usRn"));
		return dao.getAllWorker(vo,session);
	}

	@Override
	public String newWorker(WorkersInfoVO vo,HttpSession session,HttpServletRequest request) {
		vo.setUsRn((String)session.getAttribute("usRn"));
		vo.setWorkerAdd01(request.getParameter("workerAdd01"));
		if(request.getParameter("workerAdd02")=="") {
			vo.setWorkerAdd02("없음");
		}else {
			vo.setWorkerAdd02(request.getParameter("workerAdd02"));
		}
		vo.setWorkerCell(request.getParameter("workerCell"));
		vo.setWorkerName(request.getParameter("workerName"));
		vo.setWorkerPhone(request.getParameter("workerPhone"));
		vo.setWorkerPW(request.getParameter("workerPW"));
		vo.setWorkerRRN(request.getParameter("workerRRN"));
		
		
		
		//대리작업자 코드 랜덤생성
		boolean check = true;
		while(check) {
			Random rn = new Random();
			int count;
			StringBuffer workerCodeBuffer = new StringBuffer();
			for(int i=0; i<7; i++) {
				count =rn.nextInt(3);
				switch (count) {
				case 0:
					workerCodeBuffer.append((char)(rn.nextInt(26)+97));
					break;
				case 1:
					workerCodeBuffer.append((char)(rn.nextInt(26)+65));
					break;
				case 2:
					workerCodeBuffer.append(rn.nextInt(10));
					break;
				default:
					break;
				}
			}
			String workerCode = workerCodeBuffer.toString();
			vo.setWorkerCode(workerCode);
			if(dao.checkWorker(vo)==null) {
				check = false;
			}
			
		}
		System.out.println(vo);
		
		dao.newWorker(vo);
		if(dao.checkWorker(vo)==null) {
			request.setAttribute("workerCheck", 0);
			return "WorkerInfo.jsp";
		}else {
			request.setAttribute("workerCheck", 1);
			request.setAttribute("workerCode", vo.getWorkerCode());
			return "WorkerInfo.jsp";
		}
	}

	@Override
	public String deleteWorker(WorkersInfoVO vo, HttpServletRequest request) {
		vo.setWorkerCode(request.getParameter("workerCode"));
		dao.deleteWorker(vo);
		WorkersInfoVO result = dao.getWorker(vo);
		if(result==null) {
			request.setAttribute("deleteCheck", 1);
		}else {
			request.setAttribute("deleteCheck", 0);
		}
		return "WorkerInfo.jsp";
	}

	@Override
	public String loginWorker(WorkersInfoVO vo,HttpServletRequest request,HttpSession session) {
		vo.setWorkerCode(request.getParameter("workerID"));
		vo.setWorkerPW(request.getParameter("workerPW"));
		WorkersInfoVO worker = dao.loginWorker(vo);
		if(worker==null) {
			request.setAttribute("workerLoginST", 0);
			return "workerLogin.jsp";
		}
		session.setAttribute("workerCode", worker.getWorkerCode());
		session.setAttribute("workerUserID", worker.getUsRn());
		return "workerMain.jsp";
	}
	
	
}
