package com.HEProject.he.workInfo.Impl;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.HEProject.he.orderInfo.OrderInfoService;
import com.HEProject.he.workInfo.WorkInfoService;
import com.HEProject.he.workInfo.WorkInfoVO;
import com.HEProject.he.workInfo.WorkInfo_ST0VO;
import com.HEProject.he.workInfo.WorkInfo_ST1VO;
import com.HEProject.he.workInfo.WorkerInfoVO;

@Repository
public class WorkInfoServiceImpl implements WorkInfoService {

	@Autowired
	WorkInfoDAO dao;
	
	@Autowired
	OrderInfoService orderInfoService;
	
	@Override
	public String newWork(WorkInfoVO vo, HttpSession session, HttpServletRequest request) {
		String fieldManagerMail = request.getParameter("fieldManagerMail");
		String workRequests = request.getParameter("workRequests");
		String relative = request.getParameter("relative");
		String fieldAdd02 = request.getParameter("fieldAdd02");
		String rv = request.getParameter("rv");
		Date workDate = Date.valueOf(request.getParameter("dateWork"));
		vo.setAssUsRn((String)session.getAttribute("usRn"));
		vo.setClientCode(request.getParameter("clientCode"));
		vo.setWorkField(request.getParameter("workField"));
		vo.setFieldManager(request.getParameter("fieldManager"));
		vo.setFieldManagerPhone(request.getParameter("fieldManagerPhone"));
		vo.setFieldManagerCell(request.getParameter("fieldManagerCell"));
		vo.setFieldAdd01(request.getParameter("fieldAdd01"));
		vo.setWorkAmount(request.getParameter("workAmount"));
		vo.setWorkTime(request.getParameter("workTime"));
		if(rv.equals("직접입력")) {
			vo.setRv(request.getParameter("rvDirect"));
		}else {
			vo.setRv(rv);
		}
		vo.setWorkDate(workDate);
		if(fieldManagerMail=="") {
			vo.setFieldManagerMail("없음");
		}else {
			vo.setFieldManagerMail(fieldManagerMail);
		}
		
		if(workRequests=="") {
			vo.setWorkRequests("없음");
		}else {
			vo.setWorkRequests(workRequests);
		}
		
		if(relative=="") {
			vo.setRelative("없음");
		}else {
			vo.setRelative(relative);
		}
		
		if(fieldAdd02=="") {
			vo.setFieldAdd02("없음");
		}else {
			vo.setFieldAdd02(fieldAdd02);
		}
		System.out.println(vo);
		int result = dao.newWork(vo);
		if(result==1) {
			request.setAttribute("newWorkSuccess", 1);
		}else {
			request.setAttribute("newWorkSuccess", 0);
		}
		return "workInfo.do";
	}

	@Override
	public List<WorkInfo_ST0VO> getAllWork_toSt0(WorkInfo_ST0VO vo, HttpSession session, HttpServletRequest request) {
		vo.setAssUsRn((String)session.getAttribute("usRn"));
		return dao.getAllWork_toSt0(vo);
	}

	@Override
	public WorkInfo_ST0VO getAllWorkInfo_st0(WorkInfo_ST0VO vo, HttpServletRequest request) {
		System.out.println(request.getParameter("wCode"));
		vo.setWorkCode(request.getParameter("wCode"));
		return dao.getAllWorkInfo_st0(vo);
	}

	@Override
	public String modifyWork(WorkInfoVO vo, HttpSession session, HttpServletRequest request) {
		String fieldManagerMail = request.getParameter("fieldManagerMail");
		String workRequests = request.getParameter("workRequests");
		String relative = request.getParameter("relative");
		String fieldAdd02 = request.getParameter("fieldAdd02");
		String rv = request.getParameter("rv");
		Date workDate = Date.valueOf(request.getParameter("dateWork"));
		vo.setAssUsRn((String)session.getAttribute("usRn"));
		vo.setClientCode(request.getParameter("clientCode"));
		vo.setWorkField(request.getParameter("workField"));
		vo.setFieldManager(request.getParameter("fieldManager"));
		vo.setFieldManagerPhone(request.getParameter("fieldManagerPhone"));
		vo.setFieldManagerCell(request.getParameter("fieldManagerCell"));
		vo.setFieldAdd01(request.getParameter("fieldAdd01"));
		vo.setWorkAmount(request.getParameter("workAmount"));
		vo.setWorkTime(request.getParameter("workTime"));
		if(rv.equals("직접입력")) {
			vo.setRv(request.getParameter("rvDirect"));
		}else {
			vo.setRv(rv);
		}
		vo.setWorkDate(workDate);
		if(fieldManagerMail=="") {
			vo.setFieldManagerMail("없음");
		}else {
			vo.setFieldManagerMail(fieldManagerMail);
		}
		
		if(workRequests=="") {
			vo.setWorkRequests("없음");
		}else {
			vo.setWorkRequests(workRequests);
		}
		
		if(relative=="") {
			vo.setRelative("없음");
		}else {
			vo.setRelative(relative);
		}
		
		if(fieldAdd02=="") {
			vo.setFieldAdd02("없음");
		}else {
			vo.setFieldAdd02(fieldAdd02);
		}
		int result = dao.modifyWork(vo);
		if(result==1) {
			request.setAttribute("modWorkSuccess", 1);
		}else {
			request.setAttribute("modWorkSuccess", 0);
		}
		return "workInfo.do";
	}

	@Override
	public List<WorkerInfoVO> getWorkerList(WorkerInfoVO vo, HttpSession session, HttpServletRequest request) {
		vo.setAssUsRn((String)session.getAttribute("usRn"));
		vo.setEquipType(request.getParameter("equipType"));
		return dao.getWorkerList(vo);
	}

	@Override
	public List<WorkInfo_ST1VO> getAllWork_toSt1(HttpSession session, HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public void cancelWork(WorkInfoVO vo, HttpSession session, HttpServletRequest request) {
		vo.setAssUsRn((String)session.getAttribute("usRn"));
		String workCode = request.getParameter("workCode");
		vo.setWorkCode(workCode);
		int result = dao.cancelWork(vo);
		if(result==1) {
			int oResult = orderInfoService.workCancel(workCode);
			if(oResult==1) {
				request.setAttribute("cancelTF", 1);
			}else {
				request.setAttribute("cancelTF", 0);
			}
		}else {
			request.setAttribute("cancelTF", 0);
		}
	}

	@Override
	public List<WorkInfoVO> getAllWork(WorkInfoVO vo, HttpSession session) {
		vo.setAssUsRn((String)session.getAttribute("usRn"));
		return dao.getAllWork(vo);
	}

	@Override
	public WorkInfo_ST1VO getAllWork_toSt1(WorkInfo_ST1VO vo,HttpServletRequest request) {
		String workCode = request.getParameter("workCode");
		vo.setWorkCode(workCode);
		return dao.getAllWorkInfo_st1(vo);
	}

	@Override
	public WorkInfo_ST0VO getAllWork_toSt0(WorkInfo_ST0VO vo,HttpServletRequest request) {
		String workCode = request.getParameter("workCode");
		vo.setWorkCode(workCode);
		return dao.getAllWorkInfo_st0(vo);
	}

	@Override
	public List<WorkInfo_ST0VO> getAllWork_toSt3(WorkInfo_ST0VO vo, HttpSession session, HttpServletRequest request) {
		vo.setAssUsRn((String)session.getAttribute("usRn"));
		return dao.getAllWork_toSt3(vo);
	}

	@Override
	public WorkInfo_ST0VO getAllWorkInfo_st3(WorkInfo_ST0VO vo, HttpServletRequest request) {
		String workCode = request.getParameter("workCode");
		vo.setWorkCode(workCode);
		return dao.getAllWorkInfo_st3(vo);
	}
	
	
}
