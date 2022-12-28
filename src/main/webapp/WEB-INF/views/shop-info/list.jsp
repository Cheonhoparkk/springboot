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
<form action="/shop-infos">
<input type="text" name="siName" placeholder="상품명">
<input type="text" name="siCategory" placeholder="카테고리">
<input type="text" name="siSupplier" placeholder="공급자">
<button>조회</button>
</form>
<table border="1">
	<tr>
		<th>코드</th>
		<th>상품명</th>
		<th>카테고리</th>
		<th>재고</th>
		<th>공급자</th>
		<th>가격</th>
		<th>기타</th>
	</tr>
<c:forEach items="${shopList}" var = "shop">
	<tr onclick="location.href=/shop-info?siNum=${user.siNum}" style="cursor:pointer">
		<td>${shop.siCode}</td>
		<td>${shop.siName}</td>
		<td>${shop.siCategory}</td>
		<td>${shop.siStock}</td>
		<td>${shop.siSupplier}</td>
		<td>${shop.siPrice}</td>
		<td>${shop.siEtc}</td>
	</tr>
</c:forEach>
</table>
<button onclick="location.href='/views/shop-info/insert'">등록</button>
</body>
</html>