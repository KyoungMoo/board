<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
      function delete_check(){
    	  if(confirm("삭제하시겠습니까?")){
    		  location.href="./delete?bnum=${bcontent.bnum}";
    	  }else{
    		  return false; 
    	  }
      }
      </script>
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
			<li role="presentation" ><a href="/">Home</a></li>
			<li role="presentation" class="active"><a href="/board/boardlist">게시판</a></li>
		</ul>
	</div>
	<h2>게시글 상세</h2>
	<div>
		<table>
			<tr>
				<th>번호</th>
				<td>${bcontent.bnum}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${bcontent.btitle}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${bcontent.bname}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${bcontent.bcontent}</td>
			</tr>

		</table>

		<form action="">
			<a href="boardmodifyView?bnum=${bcontent.bnum}"><button
					type="button">수정</button></a>
			<button type="button" onclick="delete_check()">삭제</button>
			<a href="boardlist"><input type="button" id="list" name="list"
				value="목록"></a>
		</form>

	</div>
</body>
</html>