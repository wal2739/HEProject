package com.HEProject.he.boardInfo.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.HEProject.he.boardInfo.BoardInfoService;
import com.HEProject.he.boardInfo.BoardInfoVO;

@Repository
public class BoardInfoServiceImpl implements BoardInfoService{

	@Autowired
	BoardInfoDAO dao;

	@Override
	public List<BoardInfoVO> getAllBoard() {
		return dao.getAllBoard();
	}

	@Override
	public void insertBoard(BoardInfoVO vo,HttpServletRequest request,HttpSession session) {
		vo.setBoardClass(Integer.parseInt(request.getParameter("boardClass")));
		vo.setBoardTitle(request.getParameter("boardTitle"));
		vo.setBoardContents(request.getParameter("boardContents"));
		vo.setUsRn(request.getParameter("usRn"));
		vo.setUserName(request.getParameter("userName"));
		int result = dao.insertBoard(vo);
		if(result==1) {
			request.setAttribute("insertBoardSF", 1);
		}else {
			request.setAttribute("insertBoardSF", 0);
		}
	}
	
	
	
}
