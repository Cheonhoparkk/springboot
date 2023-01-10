<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div>
		<div style="float:left;width:48%">
			<select id="source">
				<option value="ko">한국어</option>
				<option value="en">영어</option>
				<option value="fr">프랑스어</option>
			</select>
			<textarea cols="20" rows="10" id="text"></textarea>
		</div>
		<div style="float:right;width:48%">
			<select id="target">
				<option value="ko">한국어</option>
				<option value="en" selected>영어</option>
				<option value="fr">프랑스어</option>
			</select>
			<textarea cols="20" rows="10" id="result"></textarea>
		</div>
	</div>
	<div style="clear:both;height:10px"></div>
	<div style="display: flex;justify-content: center;">
		<button onclick="translates()">번역</button>
	</div>
<script>
function translates(){
	const param = {
        source:document.querySelector('#source').value,
        target:document.querySelector('#target').value,
        text:document.querySelector('#text').value
    }
	fetch('/translate',{
		method:'POST',
		headers : {
			'Content-Type':'application/json'
		},
		body:JSON.stringify(param)
	})
	.then(function(res){
		return res.json()
	})
	.then(function(papago){
		if(papago && papago.message && papago.message.result){
			document.querySelector('#result').value = papago.message.result.translatedText;
		}
	})
}
</script>
</body>
</html>