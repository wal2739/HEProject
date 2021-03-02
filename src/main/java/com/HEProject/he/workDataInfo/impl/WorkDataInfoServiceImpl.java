package com.HEProject.he.workDataInfo.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.HEProject.he.workDataInfo.WorkDataInfoService;

@Repository
public class WorkDataInfoServiceImpl implements WorkDataInfoService{

	@Autowired
	WorkDataInfoDAO dao;

	@Override
	public int newWorkData(String workCode) {
		return dao.newWorkData(workCode);
	}
	
}
