<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/board-infos">
<input type="text" name="biNum" placeholder="번호">
<input type="text" name="biTitle" placeholder="제목">
<input type="text" name="biWriter" placeholder="글쓴이">
<button>조회</button>
</form>
<table border="1">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>내용</th>
		<th>글쓴이</th>
		<th>작성일</th>
		<th>수정일</th>
		<th>조회수</th>
	</tr>
<c:forEach items="${boardList}" var="board">
	<tr>
		<td>${board.biNum}</td>
		<td>${board.biTitle}</td>
		<td>${board.biContent}</td>
		<td>${board.biWriter}</td>
		<td>${board.credat}</td>
		<td>${board.moddat}</td>
		<td>${board.biCnt}</td>
	</tr>
</c:forEach>
</table>
</body>
</html>