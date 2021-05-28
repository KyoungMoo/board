<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table, th, tr, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.js"></script>
<script type="text/javascript">
	$(document).ready(function() {	
		$('#regist_btn').click(function() {
			alert('test')
			top.location.href="./boardwriteView";
			
		});
	});	

</script>
</head>
<body>
	<div>
		<ul class="nav nav-tabs">
			<li role="presentation" class=""><a href="/">Home</a></li>
			<li role="presentation" class="dropdownm active"><a
				class="dropdown-toggle" data-toggle="dropdown" href="#"
				role="button" aria-expanded="false"> 게시판 <span
					class="caret"></span>
			</a>
				<ul class="dropdown-menu" role="menu">
					<li><a href="/board/boardlist">게시판 일반</a>
					<li><a href="/board/boardlist2">게시판 ajax</a>
				</ul></li>
		</ul>
	</div>
	<h2>게시판</h2>
	<div>
		<table>
			<colgroup>
				<col width="8%">
				<col width="*">
				<col width="12%">
				<col width="12%">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items="${blist}">
					<tr>
						<td style="font-size: 14px;">${dto.bnum}</td>
						<td class="title"><a
							href="/board/boardcontent?bnum=${dto.bnum}">${dto.btitle }</a></td>
						<td style="font-size: 14px;">${dto.bname }</td>
						<td style="font-size: 14px;">${dto.bdate}</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>
	<form action="">
		<div>
			<input class="board_write_btn" type="button" value="글쓰기"
				id="regist_btn" style="cursor: pointer; font-size: 15px;">
		</div>
	</form>

</body>
</html>