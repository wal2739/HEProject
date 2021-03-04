package com.HEProject.he.workDataInfo.impl;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.HEProject.he.workDataInfo.WorkDataInfoService;
import com.HEProject.he.workDataInfo.WorkDataInfoVO;

@Repository
public class WorkDataInfoServiceImpl implements WorkDataInfoService{

	@Autowired
	WorkDataInfoDAO dao;

	@Override
	public int newWorkData(String workCode) {
		return dao.newWorkData(workCode);
	}

	@Override
	public void workDataUpload(String dtName, HttpServletRequest request) {
		String workCode = request.getParameter("workCode");
		int rst = dao.workDataUpload(dtName, workCode);
		if(rst==1) {
			request.setAttribute("uploadChk", 1);
		}else {
			request.setAttribute("uploadChk", 0);
		}
	}
	
	@Override
	public WorkDataInfoVO getDataName(HttpServletRequest request) {
		return dao.getDataName(request.getParameter("workCode"));
	}
	
}
