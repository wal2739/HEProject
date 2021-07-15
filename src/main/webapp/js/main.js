/**
 * 
 */
function allClear(){
		 var frm = document.getElementById('forms');
		    var em = frm.elements;
		    frm.reset();
		    for (var i = 0; i < em.length; i++) {
		        if (em[i].type == 'text') em[i].value = '';
		        if (em[i].type == 'checkbox') em[i].checked = false;
		        if (em[i].type == 'radio') em[i].checked = false;
		        if (em[i].type == 'select-one') em[i].options[0].selected = true;
		        if (em[i].type == 'textarea') em[i].value = '';
		    }
	}
function checkAll() {
	if(document.getElementById("EquipNum").value==''){
		alert('차량 번호를 입력해주세요.');
		return false;
	}
	if(document.getElementById("EquipType").value==''){
		alert('차종을 선택해주세요.');
		return false;
	}
	if(document.getElementById("EquipClass").value==''){
		alert('상세 분류를 선택해주세요.');
		return false;
	}
	if(document.getElementById("EquipRD01").value==''){
		alert('차량 등록일을 선택해주세요.');
		return false;
	}
	if(document.getElementById("EquipID01").value==''){
		alert('차량 검사일을 선택해주세요.');
		return false;
	}
	
	
}

function EquipType01() {
	window.name="parentForm";
	document.getElementById("EquipClass").value='';
	document.getElementById("EquipOption").value='';
	window.open("equipType.jsp","EquipType","width=500,height=300,resizable=no,scrollbars=no");
}
function EquipClass01() {
	if(document.getElementById("EquipType").value==''){
		alert('차종을 선택해주세요.');
	}else{
		window.name="parentForm";
		if(document.getElementById("EquipType").value=='사다리'||document.getElementById("EquipType").value=='스카이'){
			document.getElementById("EquipOption").value='';
		}
		window.open("EquipClass.jsp","EquipClass","width=500,height=300,resizable=no,scrollbars=no");
	}
}
function EquipOption01() {
	if(document.getElementById("EquipType").value==''){
		alert('차종을 선택해주세요.');
	}else if(document.getElementById("EquipClass").value==''){
		alert('상세 분류를 선택해주세요.');
	}else{
		window.name="parentForm";
		window.open("EquipOption.jsp","EquipClass","width=500,height=300,resizable=no,scrollbars=no");
	}
	
}
function checkDataAll(checkData01,checkData02,checkData03,checkData04,loginCheckData) {
	if(loginCheckData!=null){
		if(checkData01==''||checkData02==''||checkData03==''||checkData04==''){
			alert('정상적인 접근이 아닙니다. 차량 정보 페이지로 돌아갑니다.');
			location.href='showVehicleInfo.do';
		}
	}else{
		loginCheck(loginCheckData);
	}
	
}
function loginCheck(loginCheckData) {
	if(loginCheckData=='null'){
		alert('로그인 후 사용 가능한 페이지 입니다.');
		return location.href='login.jsp';
	}
}

function loginChecknBreak(loginCheckData) {
	if(loginCheckData==null){
		alert('로그인 후 사용 가능한 페이지 입니다.');
		return location.href='login.jsp';
	}
}

function boIndexCheck(boCheckData) {
	if(boCheckData=="none"){
		alert('사업자 정보 등록 후 사용 가능한 페이지 입니다.');
		return location.href='main.do';
	}
}
