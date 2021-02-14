package com.HEProject.he.vehicleInfo;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface VehicleService {
	
	public VehicleVO getVehicleInfo(VehicleVO vo, HttpServletRequest request, HttpSession session);
	
	public String newVehicle(VehicleVO vo, HttpServletRequest request, HttpSession session);
	
	public String modifyVehicle(VehicleVO vo, HttpServletRequest request, HttpSession session);
	
	public String deleteVehicle(VehicleVO vo, HttpServletRequest request, HttpSession session);
	
	public List<VehicleVO> getAllVehicleInfo(VehicleVO vo, HttpSession session);
}
