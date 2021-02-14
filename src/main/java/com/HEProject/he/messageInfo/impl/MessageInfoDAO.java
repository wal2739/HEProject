package com.HEProject.he.messageInfo.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.HEProject.he.boInfo.BOInfoVO;
import com.HEProject.he.boInfo.impl.BOInfoRowMapper;
import com.HEProject.he.messageInfo.MessageInfoVO;
import com.HEProject.he.messageInfo.MsgInfoVO;

@Repository
public class MessageInfoDAO {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public MessageInfoVO getMessageInfo(MessageInfoVO vo) {
		String sql = "select * from messageInfo where GUSRN = ? and st=0 and MESSAGECODE='"+ vo.getMessageCode() +"'";
		Object[] args = {vo.getgUsRn()};
		try {
			return jdbcTemplate.queryForObject(sql, args, new MessageInfoRowMapper());
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
	
	public List<MsgInfoVO> getAllMessage(MsgInfoVO vo){
		String sql ="select * from msgInfo where GUSRN = '"+ vo.getgUsRn() + "' and st=0 order by messagecode DESC";
		return jdbcTemplate.query(sql, new MsgInfoRowMapper());
	}
	
	public List<MsgInfoVO> getAllMessage(MsgInfoVO vo, int wMsg){
		String sql ="select * from msgInfo where GUSRN = '"+ vo.getgUsRn() + "' and st=0 and WMSG=" + wMsg + " order by messagecode DESC";
		return jdbcTemplate.query(sql, new MsgInfoRowMapper());
	}
	
	public int checkMessage(MessageInfoVO vo) {
		String sql = "update messageInfo set st=1 where WMSG=? and GUSRN=?";
		try {
			jdbcTemplate.update(sql, vo.getwMsg(), vo.getgUsRn());
			return 1;
		}catch (Exception e) {
			System.err.println(e);
			System.out.println("메세지 체크 실패");
			return 0;
		}
	}
	
	public void sendMessage(MessageInfoVO vo) {
		String sql = "insert into messageinfo(MESSAGECODE,MESSAGEDATE,MESSAGECONTENTS,RELATIVE,ST,GUSRN,SUSRN,WMSG) values(LPAD(LPAD(auserrn_sq.nextVal, '8', '0'),'9','M'),sysdate,?,?,0,?,?,?)";
		jdbcTemplate.update(sql, vo.getMessageContents(),vo.getRelative(),vo.getgUsRn(),vo.getsUsRn(),vo.getwMsg());
	}
	
	public int deleteBO(MessageInfoVO vo) {
		String sql = "delete from messageinfo where MESSAGECODE=?";
		try {
			jdbcTemplate.update(sql, vo.getMessageCode());
			return 1;
		}catch (Exception e) {
			System.err.println("메세지 삭제 오류 [dao]" + e);
			return 0;
		}
	}
	
	public String pwding(String contents) {
		String contentsRST = "";
		int[] numArr = null;
		String[] strArrHex = null;
		ArrayList<String> strArr = new ArrayList<String>(contents.length());
		for(int j = 0; j < contents.length(); j++) {
			strArr.add(contents.substring(j,j+1));
			numArr = new int[strArr.size()];
			numArr[j] = (int)((strArr.get(j)).charAt(0));
			strArrHex = new String[numArr.length];
			strArrHex[j] = Integer.toHexString(numArr[j]);
			for(int p = 0; p<strArrHex[j].length(); p++) {
				contentsRST = contentsRST + (int)((strArrHex[j].substring(p,p+1).charAt(0))) + "-";
			}
			if(!(j==contents.length()-1)) {
				contentsRST = contentsRST + "$";
			}
		}
		if(contentsRST.substring(contentsRST.length()-1,contentsRST.length()).equals("-")) {
			contentsRST = contentsRST.substring(0,contentsRST.length()-1);
		}
		return contentsRST;
	}
		
}
