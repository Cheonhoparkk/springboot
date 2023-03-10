<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="rDiv"></div>
<div id="btnDiv" style="display:none">
	<button onclick="location.href='/views/board-info/update?biNum=${param.biNum}'">수정</button>
	<button onclick="deleteBoardInfo()">삭제</button>
</div>
<script>
function deleteBoardInfo(){
	fetch('/board-infos/${param.biNum}',{
		method:'DELETE'
	})
	.then(function(res){
		return res.json();
	})
	.then(function(data){
		if(data===1){
			alert('삭제 완료');
			location.href='/views/board-info/list';
		}
	});
}
function getBoard(){
	fetch('/board-infos/${param.biNum}')
	.then(function(res){
		return res.json();
	})
	.then(function(boardInfo){
		let html = '';
		html += '번호 : ' + boardInfo.biNum + '<br>';
		html += '작성자 : ' + boardInfo.biWriter + '<br>';
		html += '제목 : ' + boardInfo.biTitle + '<br>';
		html += '내용 : ' + boardInfo.biContent + '<br>';
		document.querySelector('#rDiv').innerHTML = html;
	});
}
window.onload = function(){
	getBoard();
}
</script>

</body>
</html>