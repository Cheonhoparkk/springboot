<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<input type="text" id="uiId" value="${userInfo.uiId}"><button onclick="checkId()">중복확인</button><br>
<input type="text" id="uiName"><br>
<input type="password" id="uiPwd"><br>
<input type="password" id="uiPwdCheck"><br>
<input type="email" id="uiEmail"><br>
<input type="text" id="uiZip" disabled><button onclick="searchAddr()">주소검색</button><br>
<input type="text" id="uiAddr1" disabled><br>
<input type="text" id="uiAddr2"><br>
<input type="text" id="uiProfile"><br>

<button onclick="join()">회원수정</button>
<script>
function searchAddr(){
	const daumWin = new daum.Postcode({
		oncomplete:function(data){
	    	document.querySelector('#uiZip').value = data.zonecode;
	    	document.querySelector('#uiAddr1').value = data.address;
		}
	});
	daumWin.open();
}
function join(){
	const param = {
			uiZip : document.querySelector('#uiZip').value,
			uiName : document.querySelector('#uiName').value,
			uiAddr1 : document.querySelector('#uiAddr1').value,
			uiAddr2 : document.querySelector('#uiAddr2').value,
			uiProfile : document.querySelector('#uiProfile').value,
			uiEmail : document.querySelector('#uiEmail').value
	}
	fetch('/user-infos',{
		method : 'POST',
		headers : {
			'Content-Type' : 'application/json'
		},
		body : JSON.stringify(param)
	})
	.then(function(res){
		return res.json()
	})
	.then(function(data){
		console.log(data);
	})
}
</script>
</body>
</html>