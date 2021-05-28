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

</head>
<body>
 <script type="text/javascript">
 $(document).ready(function(){       
	loadlist();
 });
	function loadlist(){
		alert("게시판을 불러옵니다.")
		var a ="";
		
 			$.ajax({
 			   url:"/board/boardlist3",
 			   type:"GET",
 			   success:function(data){
 					var blist =data;

 	 				$.each(blist, function(i){
						a +='<tr id='+blist[i].bnum+'>'
 	 	 				})
					$('.putBox').prepend(a); 



/*  						<tbody class="putBox">
 					<c:forEach var="dto" items="${blist}">
 						<tr id="${dto.bnum}">
 							<td style="font-size: 14px;">${dto.bnum}</td>
 							<td class="title"><a onclick="content(${dto.bnum})">${dto.btitle}</a></td>
 							<td style="font-size: 14px;">${dto.bname }</td>
 							<td style="font-size: 14px;">${dto.bdate}</td>
 							<td style="font-size: 14px; text-align: center;"><button onclick="Delete(${dto.bnum})">삭제</button></td>
 						</tr>
 					</c:forEach>

 				</tbody> */


	
 		 	},
 		 	error:function(){
				alert("에러");
 	 		 	}
 	});
 	}
     
 function insertBoard(){
    	   alert("성공");
    	   var html="";
    
    	   $.ajax({
			   url:"/board/ajaxWrite",
			   type:"GET",
			   data: { "btitle":$('#btitle').val(),"bcontent":$('#bcontent').val(),"bname":$('#bname').val()
				   },
			   success:function(data){
					alert("게시판 등록이 완료되었습니다.");
					
					
					
					html +='<tr id="'+data.bnum+'">';
					html +='<td style="font-size: 14px;">'+data.bnum+'</td>';
					html +='<td class="title"><a onclick="content('+data.bnum+')">'+data.btitle+'</a></td>';
					html +='<td style="font-size: 14px;">'+data.bname+'</td>';
					html +='<td style="font-size: 14px;">'+data.bdate+'</td>';
					html +='<td style="font-size: 14px; text-align: center;"><button onclick="Delete('+data.bnum+')">삭제</button></td>';
					html +='</tr>';
					 $('.putBox').prepend(html); 


					 
			   },
			   error:function(){
				   alert("에러");
			   }
		   });
       }

 function content(bnum){
	   var html="";
	
 	   $.ajax({
		   url:"/board/ajaxContent",
		   type:"GET",
		   data: { "bnum":bnum
			   },
		   success:function(data){

				html +='<div class="putIn">';
			    html +='<br>';
				html +='<table>';
				html +='<tr>';
				html +='<th>번호</th>';
				html +='<td>'+data.bnum+'</td>';
				html +='</tr>';
				html +='<tr>';
				html +='<th>제목</th>';
				html +='<td>'+data.btitle+'</td>';
				html +='</tr>';
				html +='<tr>';
				html +='<th>작성자</th>';
				html +='<td>'+data.bname+'</td>';
				html +='</tr>';
				html +='<tr>';
				html +='<th>내용</th>';
				html +='<td>'+data.bcontent+'</td>';
				html +='</tr>';
				html +='</table>';
				html +='<br>';
				html +='<button onclick="Close()">닫기</button>';
				html +='<br>';
				html +='</div>';
				$('.putBox2').empty();
				$('.putBox2').append(html); 

				
		   },
		   error:function(){
			   alert("에러");
		   }
	   }); 
 }

 function Close(){
	alert("창을닫습니다.");
	$('.putIn').remove();
	 }
 
 function Delete(bnum){
	 alert("삭제 버튼 클릭");
	 if(confirm("삭제하시겠습니까?")){
		 $.ajax({
				url:"/board/delete",
				type:"get",
				data:{
					"bnum":bnum
				},
				success:function(data){   
				     $('#'+bnum).remove();
				},
				error:function(){
					alert("에러");
				}
			 }); 
	 }else{
		 return false; 
	 }
 }
    </script>
    <section style="margin-left: 100px;">
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
	<div >
		<table>
			<colgroup>
				<col width="8%">
				<col width="*">
				<col width="12%">
				<col width="15%">
				<col width="5%">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">날짜</th>
					<th scope="col">삭제</th>
				</tr>
			</thead>
			<tbody class="putBox">
				<c:forEach var="dto" items="${blist}">
					<tr id="${dto.bnum}">
						<td style="font-size: 14px;">${dto.bnum}</td>
						<td class="title"><a onclick="content(${dto.bnum})">${dto.btitle}</a></td>
						<td style="font-size: 14px;">${dto.bname }</td>
						<td style="font-size: 14px;">${dto.bdate}</td>
						<td style="font-size: 14px; text-align: center;"><button onclick="Delete(${dto.bnum})">삭제</button></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>

<%-- href="/board/boardcontent?bnum=${dto.bnum} --%>
	<a class="btn btn-primary" data-toggle="collapse"
		href="#collapseExample" aria-expanded="false"
		aria-controls="collapseExample">글쓰기</a>
		<div class="collapse" id="collapseExample">
			<div class="well">
				<div>
			<form id="writeCheck" name="writeCheck" method="get">
					<a>제목</a> <br> <input type="text" name="btitle" id="btitle">
					<br> <a>작성자</a> <br> <input type="text" name="bname"
						id="bname"> <br> <a>내용</a> <br>
					<textarea rows="" cols="" name="bcontent" id="bcontent"></textarea>
			</form>
				</div>
				<div>
					<button type="button" class="btn btn-primary" data-toggle="collapse"
		href="#collapseExample" aria-expanded="false"
		aria-controls="collapseExample"  onclick="insertBoard()">작성</button>
					<a href="boardlist2"><input type="button" id="list" name="list" value="목록"></a>
				</div>
			</div>
		</div>
		
		
		<div class="putBox2">
		</div>
</section>

</body>
</html>