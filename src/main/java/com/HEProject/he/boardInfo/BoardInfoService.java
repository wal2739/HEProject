package com.HEProject.he.boardInfo;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface BoardInfoService {

	List<BoardInfoVO> getAllBoard();
	
	void insertBoard(BoardInfoVO vo,HttpServletRequest request,HttpSession session);
	
	BoardInfoVO getBoard(BoardInfoVO vo,HttpServletRequest request,HttpSession session);
	
	String checkIdForModify(BoardInfoVO vo,HttpServletRequest request,HttpSession session);

	String modifyBoard(BoardInfoVO vo,HttpServletRequest request,HttpSession session);
	
}
