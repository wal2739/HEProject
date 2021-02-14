<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%
		String loginCheckData="";
    	String checkData="";
		try{
			loginCheckData= (String)session.getAttribute("userId");
			if(loginCheckData==null){
				checkData="실패";
			}else{
				checkData="성공";
			}
			System.out.println(checkData);
		}catch(NullPointerException e){
			System.err.println("비회원 아이디 에러 : "+e);
		}
		%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 분류</title>
</head>
<script type="text/javascript" src="/js/main.js" ></script>
<script type="text/javascript">
	function onLoad() {
		var checkData = '<%=checkData%>';
		console.log(checkData);
		if(checkData=='성공'){
			var loginCheckData = '<%=loginCheckData%>';
		}else if(checkData=='실패'){
			var loginCheckData = null;
		}
		console.log(loginCheckData);
		var checkNum=loginChecknBreak(loginCheckData)*1;
		if(checkNum==0){
			return location.href='login.jsp';
		}
		
		document.write('<h1>상세 분류</h1><br />');
		document.write('<p>원하는 분류를 클릭해 주세요</p><br />');
		if(opener.document.getElementById("EquipType").value=='지게차'){
			document.write('<input type="image" src="/image/1.5t.jpg" id="j1.5t" value="1.5t" onclick="closeOnClick(this)"/>');
			document.write('<input type="image" src="/image/3t.jpg" id="j3t" value="3t" onclick="closeOnClick(this)"/>');
			document.write('<input type="image" src="/image/5t.jpg" id="j5t" value="5t" onclick="closeOnClick(this)"/><br />');
			document.write('<input type="image" src="/image/7t.jpg" id="j7t" value="7t" onclick="closeOnClick(this)"/>');
			document.write('<input type="image" src="/image/10t.jpg" id="j10t" value="10t" onclick="closeOnClick(this)"/>');
			document.write('<input type="image" src="/image/16t.jpg" id="j16t" value="16t" onclick="closeOnClick(this)"/>');
		}
		if(opener.document.getElementById("EquipType").value=='사다리'){
			document.write('<input type="image" src="/image/1~1.4t.jpg" id="s1~1.4t" value="1~1.4t" onclick="closeOnClick(this)"/>');
			document.write('<input type="image" src="/image/2.5t.jpg" id="s2.5t" value="2.5t" onclick="closeOnClick(this)"/>');
			document.write('<input type="image" src="/image/3.5t.jpg" id="s3.5t" value="3.5t" onclick="closeOnClick(this)"/><br />');
			document.write('<input type="image" src="/image/5t.jpg" id="s5t" value="5t" onclick="closeOnClick(this)"/>');
			document.write('<input type="image" src="/image/6t.jpg" id="s6t" value="6t" onclick="closeOnClick(this)"/>');
			document.write('<input type="image" src="/image/7.5t.jpg" id="s7.5t" value="7.5t" onclick="closeOnClick(this)"/><br />');	
			document.write('<input type="image" src="/image/10t.jpg" id="s10t" value="10t" onclick="closeOnClick(this)"/>');	
		}
		if(opener.document.getElementById("EquipType").value=='스카이'){
			document.write('<input type="image" src="/image/1t.jpg" id="sky1t" value="1t" onclick="closeOnClick(this)"/>');
			document.write('<input type="image" src="/image/2t.jpg" id="sky2t" value="2t" onclick="closeOnClick(this)"/>');
			document.write('<input type="image" src="/image/3.5t.jpg" id="sky3.5t" value="3.5t" onclick="closeOnClick(this)"/><br />');
			document.write('<input type="image" src="/image/5t.jpg" id="sky5t" value="5t" onclick="closeOnClick(this)"/>');
			document.write('<input type="image" src="/image/11t.jpg" id="sky11t" value="11t" onclick="closeOnClick(this)"/>');
			document.write('<input type="image" src="/image/17t.jpg" id="sky17t" value="17t" onclick="closeOnClick(this)"/><br />');	
			document.write('<input type="image" src="/image/19t.jpg" id="sky19t" value="19t" onclick="closeOnClick(this)"/>');
			document.write('<input type="image" src="/image/25t.jpg" id="sky25t" value="25t" onclick="closeOnClick(this)"/>');

		}
		if(opener.document.getElementById("EquipType").value=='크레인'){
			document.write('<input type="image" src="/image/10t.jpg" id="c10t" value="10t" onclick="closeOnClick(this)"/>');
			document.write('<input type="image" src="/image/25t.jpg" id="c25t" value="25t" onclick="closeOnClick(this)"/>');
			document.write('<input type="image" src="/image/50t.jpg" id="c50t" value="50t" onclick="closeOnClick(this)"/><br />');
			document.write('<input type="image" src="/image/60t.jpg" id="c60t" value="60t" onclick="closeOnClick(this)"/>');
			document.write('<input type="image" src="/image/80t.jpg" id="c80t" value="80t" onclick="closeOnClick(this)"/>');
			document.write('<input type="image" src="/image/100t.jpg" id="c100t" value="100t이상" onclick="closeOnClick(this)"/>');
		}
		if(opener.document.getElementById("EquipType").value=='카고'){
			document.write('<input type="image" src="/image/5t.jpg" id="k5t" value="5t" onclick="closeOnClick(this)"/>');
			document.write('<input type="image" src="/image/11t.jpg" id="k11t" value="11t" onclick="closeOnClick(this)"/>');
			document.write('<input type="image" src="/image/15t.jpg" id="k15t" value="15t" onclick="closeOnClick(this)"/><br />');
			document.write('<input type="image" src="/image/25t.jpg" id="k25t" value="25t" onclick="closeOnClick(this)"/>');
			document.write('<input type="image" src="/image/25tUp.jpg" id="k25tUp" value="25t이상" onclick="closeOnClick(this)"/>');
		}
		if(opener.document.getElementById("EquipType").value=='굴삭기'){
			document.write('<input type="image" src="/image/mini008.jpg" id="g008" value="미니008" onclick="closeOnClick(this)"/>');
			document.write('<input type="image" src="/image/mini010.jpg" id="g010" value="미니010" onclick="closeOnClick(this)"/>');
			document.write('<input type="image" src="/image/mini017.jpg" id="g017" value="미니017" onclick="closeOnClick(this)"/><br />');
			document.write('<input type="image" src="/image/mini020.jpg" id="g020" value="미니020" onclick="closeOnClick(this)"/>');
			document.write('<input type="image" src="/image/02.jpg" id="g02" value="02" onclick="closeOnClick(this)"/>');
			document.write('<input type="image" src="/image/2w.jpg" id="g2w" value="2w" onclick="closeOnClick(this)"/><br />');
			document.write('<input type="image" src="/image/03.jpg" id="g03" value="03" onclick="closeOnClick(this)"/>');
			document.write('<input type="image" src="/image/3w.jpg" id="g3w" value="3w" onclick="closeOnClick(this)"/>');
			document.write('<input type="image" src="/image/06.jpg" id="g06" value="06" onclick="closeOnClick(this)"/><br />')
			document.write('<input type="image" src="/image/6w.jpg" id="g6w" value="6w" onclick="closeOnClick(this)"/>');
			document.write('<input type="image" src="/image/08.jpg" id="g08" value="08" onclick="closeOnClick(this)"/>');
			document.write('<input type="image" src="/image/8w.jpg" id="g8w" value="8w" onclick="closeOnClick(this)"/><br />');
			document.write('<input type="image" src="/image/10.jpg" id="g10" value="10" onclick="closeOnClick(this)"/>');

		}
		if(opener.document.getElementById("EquipType").value=='화물차'){
			document.write('<input type="image" src="/image/5t.jpg" id="h5t" value="5t" onclick="closeOnClick(this)"/>');
			document.write('<input type="image" src="/image/15t.jpg" id="h15t" value="15t" onclick="closeOnClick(this)"/>');
			document.write('<input type="image" src="/image/25t.jpg" id="h25t" value="25t" onclick="closeOnClick(this)"/><br />');
		}
		
		
		//////////////////////////
	}
	function closeOnClick(idValue) {
		var idValue = document.getElementById(idValue.getAttribute('id')).getAttribute('id');
		opener.document.getElementById("EquipClass").value= document.getElementById(idValue).value;
		window.close();
		
	} 
</script>
<body onload="onLoad();">
	<h1 onload=""></h1>
</body>
</html>