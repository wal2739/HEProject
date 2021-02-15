package com.HEProject.he.usersInfo;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.dao.EmptyResultDataAccessException;

import com.HEProject.he.usersInfo.Impl.UsersInfoRowmapper;

public interface UsersInfoService {
	String getUser(UsersInfoVO vo,HttpSession session, HttpServletRequest request);
	
	List<UsersInfoVO> getAllUsers(UsersInfoVO vo,HttpSession session);
	
	void newUser(UsersInfoVO vo,HttpSession session, HttpServletRequest request);

	UsersInfoVO getUser(UsersInfoVO vo, HttpSession session);

	String IdCheck(UsersInfoVO vo, HttpServletRequest request);
	
	public List<UsersInfoVO> getAllUsersClass(UsersInfoVO vo, HttpSession session, int num01);
	
	List<UsersInfoVO> getAllUsersClass(UsersInfoVO vo,HttpSession session,int num01, int num02);
	
	public List<SearchInfoVO> getAllEqInfo(SearchInfoVO vo,HttpSession session, String eqType);
	
	public List<SearchInfoVO> getAllEqInfo(SearchInfoVO vo,HttpSession session);
	
	public UsersInfoVO getUserInfo(UsersInfoVO vo,HttpSession session);

	void pwCheck(UsersInfoVO vo, HttpSession session, HttpServletRequest request);
	
	void modifyUserInfo(UsersInfoVO vo, HttpSession session, HttpServletRequest request);
}
