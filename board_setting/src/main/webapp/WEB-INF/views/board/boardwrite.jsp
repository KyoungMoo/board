<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
		<div>
		<ul class="nav nav-tabs">
			<li role="presentation"><a href="/">Home</a></li>
			<li role="presentation" class="active"><a href="/board/boardlist">게시판</a></li>
		</ul>
	</div>
	<h2>게시글 작성</h2>
	<form action="../board/boardWrite" method="get">
		<div>
			<a>제목</a> <br> <input type="text" name="btitle" id="btitle">
			<br> <a>작성자</a> <br> <input type="text" name="bname"
				id="bname"> <br> <a>내용</a> <br>
			<textarea rows="" cols="" name="bcontent" id="bcontent"></textarea>
		</div>
		<div>
			<input type="submit" value="작성"> <a href="boardlist"><input
				type="button" id="list" name="list" value="목록"></a>
		</div>
	</form>
</body>
</html>