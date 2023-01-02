<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="number" id="spKorPoint1" value="0">~<input type="number" id="spKorPoint2" value="0"><br>
<input type="number" id="spEngPoint1" value="0">~<input type="number" id="spEngPoint2" value="0"><br>
<input type="number" id="spMathPoint1" value="0">~<input type="number" id="spMathPoint2" value="0"><br>
<input type="text" id="spName" placeholder="이름"><button onclick="getStudentPoints()">검색</button>

<table border="1">
	<tr>
		<th><input type="checkbox" name="allCheck" onclick="toggleCheck(this)"></th>
		<th>번호</th>
		<th>이름</th>
		<th>국어점수</th>
		<th>영어점수</th>
		<th>수학점수</th>
	</tr>
	<tbody id="tBody">
	</tbody>
</table>

<button  onclick="location.href='/views/student-point/insert'">등록</button>
<button  onclick="deleteStudentPoint()">삭제</button>
<script>

function deleteStudentPoint() {
	const spNumObjs = document.querySelectorAll('input[name="spNums"]:checked');
	const spNums = [];
	for(const spNumObj of spNumObjs){
		spNums.push(spNumsObj.value);
	}
	console.log(spNums);
	if(spNums.length===0){
		alert('선택좀해라');
		return;
	}
}
function toggleCheck(obj){
	const spNums = document.querySelectorAll('input[name="spNums"]')
	for(const spNum of spNums) {
		spNum.checked = obj.checked;
	}	

}
function insertStudentPoint(){
	const sp = {
			spName:'하주영',
			spKorPoint:100,
			spEngPoint:100,
			spMathPoint:100
	}
	fetch('/student-points',{
		method:'POST',
		headers: {
			 'Content-Type': 'application/json'
		},
		body: JSON.stringify(sp)
	})
	.then(function(res){
		return res.json();
	})
	.then(function(data){
		if(data==1){
			alert('성공!');
		}
	})
}
function getStudentPoints(){
	let param = '?spName=' + document.querySelector('#spName').value;
	param += '&spKorPoint1=' + document.querySelector('#spKorPoint1').value;
	param += '&spKorPoint2=' + document.querySelector('#spKorPoint2').value;
	param += '&spEngPoint1=' + document.querySelector('#spEngPoint1').value;
	param += '&spEngPoint2=' + document.querySelector('#spEngPoint2').value;
	param += '&spMathPoint1=' + document.querySelector('#spMathPoint1').value;
	param += '&spMathPoint2=' + document.querySelector('#spMathPoint2').value;
	fetch('/student-points?spName='+document.querySelector('#spName').value)
	.then(function(res){		
		return res.json();
	})
	.then(function(data){
		let html = '';
		for(let i=0;i<data.length;i++){
			const studentPoint = data[i];
			html += '<tr>';
			html += '<td><input type="checkbox" name="spNums" value="' + studentPoint.spNum + '"></td>'
			html += '<td>' + studentPoint.spNum + '</td>';
			html += '<td><a href ="/views/student-point/view?spNum=' + studentPoint.spNum + '">' + studentPoint.spName + '</a></td>';
			html += '<td>' + studentPoint.spKorPoint + '</td>';
			html += '<td>' + studentPoint.spEngPoint + '</td>';
			html += '<td>' + studentPoint.spMathPoint + '</td>';
			html += '</tr>';
		}
		document.querySelector('#tBody').innerHTML = html;
	});
}

window.onload = function(){
	getStudentPoints();

}
</script>
</body>
</html>