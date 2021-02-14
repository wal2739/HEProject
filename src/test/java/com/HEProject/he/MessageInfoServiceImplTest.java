package com.HEProject.he;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.HEProject.he.messageInfo.MessageInfoVO;
import com.HEProject.he.messageInfo.impl.MessageInfoDAO;

public class MessageInfoServiceImplTest {
	@Autowired
	MessageInfoDAO dao;
	
	public void getAllMessage() {
		System.out.println("안녕");
		
	}
	
}
