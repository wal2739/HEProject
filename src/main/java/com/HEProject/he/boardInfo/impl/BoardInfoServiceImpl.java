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

	@Override
	public BoardInfoVO getBoard(BoardInfoVO vo, HttpServletRequest request, HttpSession session) {
		vo.setBoardCode(request.getParameter("boardCode"));
		int statusNum = Integer.parseInt(request.getParameter("statusNum"));
		int result = 3;
		switch (statusNum) {
		case 0:
			break;
		case 1:
			result = dao.increaseView(vo);
			switch (result) {
			case 0:
				System.err.println("조회수 증가 에러 - impl");
				break;
			default:
				break;
			}
		default:
			break;
		}
		
		return dao.getBoard(vo);
	}

	@Override
	public String checkIdForModify(BoardInfoVO vo, HttpServletRequest request, HttpSession session) {
		String boardCode = request.getParameter("boardCode");
		vo.setBoardCode(boardCode);
		String usRn = dao.getBoard(vo).getUsRn();
		String ssUsRn = (String)session.getAttribute("usRn");
		if(ssUsRn.equals(usRn)) {
			return "modifyBoard.do?boardCode=" + boardCode + "&statusNum=0";
		}else {
			request.setAttribute("MBCheck", 2);
			return "getBoard.do?boardCode=" + boardCode + "&statusNum=0";
		}
	}

	@Override
	public String modifyBoard(BoardInfoVO vo, HttpServletRequest request, HttpSession session) {
		String boardCode = request.getParameter("boardCode");
		vo.setBoardCode(boardCode);
		vo.setBoardTitle(request.getParameter("boardTitle"));
		vo.setBoardContents(request.getParameter("boardContents"));
		int result = dao.modifyBoard(vo);
		if(result==1) {
			request.setAttribute("MBCheck", 1);
		}else {
			request.setAttribute("MBCheck", 0);
		}
		return "getBoard.do?boardCode=" + boardCode + "&statusNum=0";
	}
	
	
	
}
