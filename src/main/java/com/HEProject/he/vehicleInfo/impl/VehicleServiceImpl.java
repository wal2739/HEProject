package com.HEProject.he.vehicleInfo.impl;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.HEProject.he.vehicleInfo.VehicleService;
import com.HEProject.he.vehicleInfo.VehicleVO;

@Repository
public class VehicleServiceImpl implements VehicleService{

	@Autowired
	VehicleDAO dao;
	
	@Override
	public VehicleVO getVehicleInfo(VehicleVO vo, HttpServletRequest request,HttpSession session) {
		vo.setEquipNum(request.getParameter("EquipNum"));
		vo.setUsRn((String)session.getAttribute("usRn"));
		session.setAttribute("EquipNumSv", request.getParameter("EquipNumSv"));
		return dao.getVehicleInfo(vo);
	}

	@Override
	public List<VehicleVO> getAllVehicleInfo(VehicleVO vo,HttpSession session) {
		vo.setUsRn((String)session.getAttribute("usRn"));		
		return dao.getAllVehicleInfo(vo);
	}
	
	@Override
	public String newVehicle(VehicleVO vo, HttpServletRequest request, HttpSession session) {
		int result;
		Date EquipRD = Date.valueOf(request.getParameter("EquipRD01"));
		Date EquipID = Date.valueOf(request.getParameter("EquipID01"));

		vo.setEquipClass(request.getParameter("EquipClass"));
		vo.setEquipID(EquipID);
		vo.setEquipNum(request.getParameter("EquipNum"));
		vo.setEquipOption(request.getParameter("EquipOption"));
		vo.setEquipRD(EquipRD);
		vo.setEquipType(request.getParameter("EquipType"));
		vo.setUsRn((String)session.getAttribute("usRn"));
		result = dao.newVehicle(vo);
		if(result==1) {
			request.setAttribute("newVehicleCheck", 1);
			return "showVehicleInfo.do";
		}else if(result==0){
			request.setAttribute("newVehicleCheck", 0);
			return "showVehicleInfo.do";
		}else {
			request.setAttribute("newVehicleCheck", 2);
			return "showVehicleInfo.do";
		}
	}

	@Override
	public String modifyVehicle(VehicleVO vo, HttpServletRequest request, HttpSession session) {
		int result;
		Date EquipRD = Date.valueOf(request.getParameter("EquipRD01"));
		Date EquipID = Date.valueOf(request.getParameter("EquipID01"));
		vo.setEquipClass(request.getParameter("EquipClass"));
		vo.setEquipID(EquipID);
		vo.setEquipNum(request.getParameter("EquipNum"));
		vo.setEquipOption(request.getParameter("EquipOption"));
		vo.setEquipRD(EquipRD);
		vo.setEquipType(request.getParameter("EquipType"));
		vo.setUsRn((String)session.getAttribute("usRn"));
		result = dao.modifyVehicle(vo,session);
		if(result==1) {
			request.setAttribute("modVehicleCheck", 1);
			return "showVehicleInfo.do";
		}else if(result==0){
			request.setAttribute("modVehicleCheck", 0);
			return "showVehicleInfo.do";
		}else {
			request.setAttribute("modVehicleCheck", 2);
			return "modifyVehicle.do";
		}
	}

	@Override
	public String deleteVehicle(VehicleVO vo, HttpServletRequest request, HttpSession session) {
		int result;
		vo.setUsRn((String)session.getAttribute("usRn"));
		vo.setEquipNum(request.getParameter("EquipNum"));
		result = dao.deleteVehicle(vo);
		if(result==1) {
			request.setAttribute("delVehicleCheck", 1);
			return "showVehicleInfo.do";
		}else {
			request.setAttribute("delVehicleCheck", 0);
			return "showVehicleInfo.do";
		}
	}

	

	

}
