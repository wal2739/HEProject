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
	
	List<WorkInfoVO> getAllWork(WorkInfoVO vo,HttpSession session);
	
	List<WorkInfo_ST1VO> getAllWork_toSt1(HttpSession session,HttpServletRequest request);
	
	void cancelWork(WorkInfoVO vo,HttpSession session,HttpServletRequest request);
	
	WorkInfo_ST1VO getAllWork_toSt1(WorkInfo_ST1VO vo,HttpServletRequest request);
	
	WorkInfo_ST0VO getAllWork_toSt0(WorkInfo_ST0VO vo,HttpServletRequest request);

	List<WorkInfo_ST0VO> getAllWork_toSt3(WorkInfo_ST0VO vo,HttpSession session,HttpServletRequest request);
	
	WorkInfo_ST0VO getAllWorkInfo_st3(WorkInfo_ST0VO vo,HttpServletRequest request);
	
	List<WorkInfo_ST0VO> getAllWork_toSt3ForIndi(WorkInfo_ST0VO vo, HttpSession session,HttpServletRequest request);
	
	List<WorkInfo_ST0VO> getAllWork_toSt2ForIndi(WorkInfo_ST0VO vo, HttpSession session,HttpServletRequest request);
	
	List<WorkInfo_ST0VO> getAllWork_toSt2ForIndiNoData(WorkInfo_ST0VO vo, HttpSession session,
			HttpServletRequest request);
	
	int finishWork(String workCode);

	List<WorkInfo_ST0VO> getAllWork_toSt2ForIndiData(WorkInfo_ST0VO vo, HttpSession session,
			HttpServletRequest request);

}
