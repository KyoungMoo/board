<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P> 게시판홈 </P>

	<table>
	<c:forEach var="list" items="${boardList}">
		<tr>
			<td>${list.deptno}</td>
			<td>${list.dname}</td>
			<td>${list.loc}</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>