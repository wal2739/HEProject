package com.HEProject.he.aWorkInfo.impl;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.HEProject.he.aWorkInfo.AWorkInfoService;
import com.HEProject.he.aWorkInfo.AWorkInfoVO;
import com.HEProject.he.workDataInfo.WorkDataInfoService;
import com.HEProject.he.workInfo.WorkInfoService;

@Repository
public class AWorkInfoServiceImpl implements AWorkInfoService{

	@Autowired
	AWorkInfoDAO dao;

	
	@Autowired
	WorkInfoService workInfoService;
	
	@Autowired
	WorkDataInfoService workDataInfoService;
	
	@Override
	public String newAworkInfo(HttpServletRequest request, AWorkInfoVO vo) {
		String workCode = request.getParameter("workCode");
		vo.setWorkCode(workCode);
		vo.setEs(Integer.parseInt(request.getParameter("es")));
		vo.setEt(Integer.parseInt(request.getParameter("et")));
		vo.setAa(Integer.parseInt(request.getParameter("aa")));
		int rst1 = dao.newAworkInfo(vo);
		int rst2 = workInfoService.finishWork(workCode);
		int rst3 = workDataInfoService.newWorkData(workCode);
		if(rst1+rst2+rst3==3) {
			request.setAttribute("newAworkRst", 1);
		}else {
			request.setAttribute("newAworkRst", 0);
		}
		
		return "workESCheck.do?wCode=" + workCode;
	}
	
}
