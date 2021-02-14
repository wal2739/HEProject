<%@page import="com.HEProject.he.messageInfo.MsgInfoVO"%>
<%@page import="com.HEProject.he.messageInfo.MessageInfoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	List<MsgInfoVO> list = (List) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지 확인</title>
</head>
<script type="text/javascript" src="/js/main.js"></script>
<script type="text/javascript">
	var msgCode = [];
	var msgDate = [];
	var msgContent = [];
	var msgRelative = [];
	var msgGusRn = [];
	var msgSusRn = [];
	var msgWmsg = [];
	var msgUserId = [];
	var msgUserName = [];
	function msgLoad() {
		var indexNum = 0;
		var listSize = <%=list.size()%>;
		if(listSize==0){
			document.getElementById('msgLocation').innerHTML = '데이터가 없습니다.';
		}else{
			<%for (int i = 0; i < list.size(); i++) {%>
				msgCode[indexNum] = depwding('<%=list.get(i).getMessageCode()%>') ;
				msgDate[indexNum] = '<%=list.get(i).getMessageDate()%>' ;
				msgContent[indexNum] = depwding('<%=list.get(i).getMessageContents()%>') ;
				msgRelative[indexNum] = depwding('<%=list.get(i).getRelative()%>') ;
				msgGusRn[indexNum] = depwding('<%=list.get(i).getgUsRn()%>') ;
				msgSusRn[indexNum] = depwding('<%=list.get(i).getsUsRn()%>');
				msgUserId[indexNum] = depwding('<%=list.get(i).getUserId()%>') ;
				msgUserName[indexNum] = depwding('<%=list.get(i).getUserName()%>');
			msgWmsg[indexNum] = <%=list.get(i).getwMsg()%>;
			indexNum++;
			<%}%>
			
			for(var i = 0; i < msgCode.length;i++){
				console.log(msgSusRn[i]);
				document.getElementById('rwNum'+i).innerHTML=i+1;
				document.getElementById('msgDate'+i).innerHTML=msgDate[i];
				document.getElementById('msgContents'+i).innerHTML=msgContent[i];
				document.getElementById('msgRelative'+i).innerHTML=msgRelative[i];
				document.getElementById('msgUserId'+i).innerHTML=msgUserId[i];
				document.getElementById('msgUserName'+i).innerHTML=msgUserName[i];
				
				switch(msgWmsg[i]){
				case 1:
					document.getElementById('wMsg'+i).innerHTML = '그룹';
					break;
				case 2:
					document.getElementById('wMsg'+i).innerHTML = '개인';
					break;
				case 3:
					document.getElementById('wMsg'+i).innerHTML = '시스템';
					break;
				case 4:
					document.getElementById('wMsg'+i).innerHTML = '관리자';
					break;
				case 5:
					document.getElementById('wMsg'+i).innerHTML = '작업';
					break;				
				}
	
			}
		}
	}

	/* function showMsg(checkNum) {
		var codeArr = [];
		var dateArr = [];
		var contentsArr = [];
		var relativeArr = [];
		var gusRnArr = [];
		var susRnArr = [];
		var indexNum = 0;
		for(var i = 0; i < msgWmsg.length; i++){
			if(msgWmsg[i]==checkNum){
				codeArr[indexNum] = msgCode[i];
				dateArr[indexNum] = msgDate[i];
				contentsArr[indexNum] = msgContent[i];
				relativeArr[indexNum] = msgRelative[i];
				gusRnArr[indexNum] = msgGusRn[i];
				susRnArr[indexNum] = msgSusRn[i];
				indexNum++;
			}
		}
		
		for(var i = 0 ; i < codeArr.length; i++){
			document.write('<tr><td>번호</td><td id="rowNum' + i + '"></td></tr><tr><td>내용</td><td id="contents' + i + '"></td></tr><tr><td>보낸 사람</td> <td id="sUsRn' + i + '"></td> </tr><tr><td>받는 사람</td> <td id="gUsRn' + i + '"></td> </tr><tr><td>비고</td><td id="relative' + i + '"></td> </tr><tr><td>보낸 날짜</td> <td id="msgDate' + i + '"></td> </tr>');			
			
			document.getElementById('rowNum').innerHTML=i+1;
			document.getElementById('gUsRn').innerHTML=gusRnArr[i];
			document.getElementById('sUsRn').innerHTML=susRnArr[i];
			document.getElementById('msgDate').innerHTML=dateArr[i];
			document.getElementById('contents').innerHTML=contentsArr[i];
			document.getElementById('relative').innerHTML=relativeArr[i];

		}
	
	} */

	function depwding(pwCode) {
		var result01 = (pwCode.split('-$'));
		var rst01 = new Array();
		var rst02 = new Array();
		var rst03 = new Array();
		var rst04 = '';
		for (var i = 0; i < result01.length; i++) {
			rst01[i] = new Array();
			for (var j = 0; j < result01[i].split('-').length; j++)
				rst01[i] = result01[i].split('-');
		}
		for (var i = 0; i < rst01.length; i++) {
			for (var j = 0; j < rst01[i].length; j++) {
				if (j == 0) {
					rst02[i] = String.fromCharCode(rst01[i][j]);
				} else {
					rst02[i] = rst02[i] + String.fromCharCode(rst01[i][j]);
				}
			}
		}
		for (var i = 0; i < rst02.length; i++) {
			rst03[i] = parseInt(rst02[i], 16);
		}
		for (var i = 0; i < rst03.length; i++) {
			rst04 = rst04 + String.fromCharCode(rst03[i]);
		}
		return rst04;
	}
	/* function sortTest(sortNum) {
		for(var i = 0; i < msgCode.length;i++){
			document.getElementById('rwNum'+i).innerHTML=i+1;
			document.getElementById('sUsRn'+i).innerHTML=msgSusRn[i];
			document.getElementById('msgDate'+i).innerHTML=msgDate[i];
			document.getElementById('msgContents'+i).innerHTML=msgContent[i];
			document.getElementById('msgRelative'+i).innerHTML=msgRelative[i];
			
			switch(msgWmsg[i]){
			case 1:
				document.getElementById('wMsg'+i).innerHTML = '그룹';
				break;
			case 2:
				document.getElementById('wMsg'+i).innerHTML = '개인';
				break;
			case 3:
				document.getElementById('wMsg'+i).innerHTML = '시스템';
				break;
			case 4:
				document.getElementById('wMsg'+i).innerHTML = '관리자';
				break;
			case 5:
				document.getElementById('wMsg'+i).innerHTML = '작업';
				break;				
			}

		}
	} */
	function closeWin(sltNum) {
		if(sltNum==0){
			window.close();
		}else{
			//opener.location.href='#';
			window.close();
		}
	}
</script>
<style>
table {
	border: solid black 1px;
	width: 100%;
}
tr, td, th{
	border: solid black 1px;
}
</style>
<body onload="msgLoad();">
	<h1>메세지 확인</h1>
	<p>메세지 테스트</p>
	<div id="msgLocation">
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>보낸 사용자 아이디</th>														
					<th>보낸 사용자 이름</th>
					<th>내용</th>
					<th>비고</th>
					<th>보낸 날짜</th>
					<th>구분</th>
				</tr>
			</thead>
			<tbody>
				<%
					for(int i = 0 ; i < list.size(); i++){
				%>
				<tr>
					<td id="rwNum<%=i%>"></td>
					<td id="msgUserId<%=i%>"></td>
					<td id="msgUserName<%=i%>"></td>
					<td id="msgContents<%=i %>"></td>
					<td id="msgRelative<%=i %>"></td>
					<td id="msgDate<%=i %>"></td>
					<td id="wMsg<%=i %>"></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	<input type="button" value="닫기" onclick="closeWin(0);"/>
	<input type="button" value="메세지 페이지로" onclick="closeWin(1);"/>
	
</body>
</html>