package com.HEProject.he.workInfo;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface WorkInfoService {
	String newWork(WorkInfoVO vo,HttpSession session,HttpServletRequest request);
	
	List<WorkInfo_ST0VO> getAllWork_toSt0(WorkInfo_ST0VO vo,HttpSession session,HttpServletRequest request);
	
	WorkInfo_ST0VO getAllWorkInfo_st0(WorkInfo_ST0VO vo,HttpServletRequest request);
	
	String modifyWork(WorkInfoVO vo,HttpSession session,HttpServletRequest request);
	
	List<WorkerInfoVO> getWorkerList(WorkerInfoVO vo,HttpSession session,HttpServletRequest request);
}
