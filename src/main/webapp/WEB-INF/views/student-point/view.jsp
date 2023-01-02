<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>국어점수</th>
			<th>영어점수</th>
			<th>수학점수</th>
			<th>프로필</th>
		</tr>
		<tbody id="tBody">
		</tbody>
	</table>
	
		<button onclick="updateStudentPoint()">수정</button>
		<button onclick="deleteStudentPoint()">삭제</button>
	<script>
		function getStudentPoint() {
			fetch('/student-point/${param.spNum}')
			.then(function(res) { 
				return res.json(); 
			})
			.then(function(data){
					const studentPoint = data;
					let html = '';
					html += '<tr>';
					html += '<td>' + '<input type="number" id="spNum" readonly>' + '</td>';
					html += '<td>' + '<input type="text" id="spName">' + '</td>';
					html += '<td>' + '<input type="number" id="spKorPoint">' + '</td>';
					html += '<td>' + '<input type="number" id="spEngPoint">' + '</td>';
					html += '<td>' + '<input type="number" id="spMathPoint">' + '</td>';
					html += '<td>' + '<input type="text" id="spProfile">'	+ '</td>';
					html += '</tr>';
					document.querySelector('#tBody').innerHTML = html;

					document.querySelector('#spNum').value = studentPoint.spNum
					document.querySelector('#spName').value = studentPoint.spName
					document.querySelector('#spKorPoint').value = studentPoint.spKorPoint
					document.querySelector('#spEngPoint').value = studentPoint.spEngPoint
					document.querySelector('#spMathPoint').value = studentPoint.spMathPoint
					document.querySelector('#spProfile').value = studentPoint.spProfile
			})
		}

		function updateStudentPoint(){
			
			let param = {
					spName : document.querySelector('#spName').value,
					spKorPoint : document.querySelector('#spKorPoint').value,
					spEngPoint : document.querySelector('#spEngPoint').value,
					spMathPoint : document.querySelector('#spMathPoint').value,
					spProfile : document.querySelector('#spProfile').value
			}
			fetch('/student-point/' + document.querySelector('#spNum').value,{
				method:'PATCH',
				headers: {
					'Content-Type': 'application/json'
				},
				body: JSON.stringify(param)
			})
			.then(function(res){
				return res.json();
			})
			.then(function(data){
				if(data==1){
					alert('수정성공');
					location.href='/views/student-point/list';
				}
			});
		}
		
		function deleteStudentPoint(){
			fetch('/student-point/delete/${spNum}',{method:'DELETE'})
			.then(function(res){
				return res.json();
			})
			.then(function(data){
				if(data==1){
					alert('삭제성공');
					location.href='/views/student-point/list';
				}
			});
		}
		
		window.onload = function() {
			getStudentPoint();
		}
	</script>
</body>
</html>