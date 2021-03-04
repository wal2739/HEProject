package com.HEProject.he.workDataInfo;

import javax.servlet.http.HttpServletRequest;

public interface WorkDataInfoService {

	int newWorkData(String workCode);
	
	void workDataUpload(String dtName, HttpServletRequest request);

	WorkDataInfoVO getDataName(HttpServletRequest request);
	
}
