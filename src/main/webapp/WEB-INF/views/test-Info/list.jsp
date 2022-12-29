<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="text" id="tiname" placeholder="이름"><button onclick="getTestInfos()">검색</button>
<table border="1">
	<tr>
		<th>번호</th>
		<th>이름</th>
		<th>나이</th>
		<th>주소</th>
	</tr>
	<tbody id="tBody">
	</tbody>
</table>
<script>
function getTestInfos(){
	fetch('/test-infos?tiName=' + document.querySelector('#tiName').value)
	.then(function(res){
		return res.json();
	})
	.then(function(list){
		let html = ''
		for(let i=0;i<data.length;i++{
			const testInfo = list[i];
			html += '<tr>';
			html += '<td>' + testInfo.tiNum + '</td>';
			html += '<td>' + testInfo.tiName + '</td>';
			html += '<td>' + testInfo.tiAge + '</td>';
			html += '<td>' + testInfo.tiAddress + '</td>';
			html += '</tr>';
		}
		document.querySelector('#tBody').innerHTML = html;
	})
}
window.onload = function(){
	getTestInfos();
}
</script>
</body>
</html>