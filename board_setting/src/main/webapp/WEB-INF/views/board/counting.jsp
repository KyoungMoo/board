<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계산기</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
   <div class="container">
   </div>
   <div class="result">
   </div>
   <script>
      $(document).ready(function(){
         var a='';
         a+='<h1>TEST2</h1>'
         a+= '<select id="selc">';
         for(var i=0; i<10; i++){
            if(i==0){
               a+= '<option value="">선택</option>';
            }else{
            a+= '<option value="'+i+'">'+i+'단</option>';
            }
         }
         a+='</select>';
         a+='<button class="Calc">계산</button>';
         $('.container').append(a);
         
      })   
      
      
      $(document).on("click",".Calc", function(e){
         
         var sel = document.getElementById("selc");
         var val = sel.options[sel.selectedIndex].value;
         var val1 = $('#selc option:selected').val();
         
         var i;
         var a='';

         for(i=1; i <10 ; i++){
            a +=val+'X'+i+'='+ (i*val)+'<br>'; 
            
            
            
         }
         $('.result').html(a);
      });

      $(document).ready(function(){
          var a='';
          a+='<h1>TEST4 - 색상변경</h1>';
          a+='<p>첫번째</p>';
          a+='<p>두번째</p>';
          a+='<p>세번째</p>';
          a+='<p>네번째</p>';
          a+='<select id="num">';
          a+='<option value="">선택</option>';
          a+='<option value="all">전체</option>';
          a+='<option value="첫번째">첫번째</option>';
          a+='<option value="두번째">두번째</option>';
          a+='<option value="세번째">세번째</option>';
          a+='<option value="네번째">네번째</option>';
          a+='</select>';
          a+='<select id="color">';
          a+='<option value="">선택</option>';
          a+='<option value="red">빨강</option>';
          a+='<option value="blue">파랑</option>';
          a+='<option value="yellow">노랑</option>';
          a+='<option value="green">초록</option>';
          a+='</select>';
          a+='<button class="go">변경</button>';
          $('.container').append(a);
       })
       $(document).on("click",".go", function(e){
          var val1 = $('#num option:selected').val();
          var val2 = $('#color option:selected').val();

          if(val1 ==""){
				alert("구역을 선택하세요.")
				return false;
              }
          if(val2 ==""){
             alert("변경할 색상을 선택해 주세요.");
          }else{
             if(val1=="all"){
                $('p').css("color",val2);   
             }else{
             $('p:contains("'+val1+'")').css("color",val2);
             }
          }
       });

      
       $(document).ready(function(){
        var a='';
        a+='<h1>TEST6</h1>';
        a+='<input type="number" >';
        a+='<button class="count">선택</button>';
        $('.container').append(a);

        $(document).on("click",".count", function(e){
            var num= $('input').val();
            var row = parseInt( (num-1) / 4);
            var a='';
            if(num==0){
               $('.result').empty();
            }else{
            a+='<TABLE border="1">';
            for(i=0;i<row+1;i++){
            a+='<tr>';
               for(j=0;j<4;j++){
                  if(num >= (j+1)+4*i){
                  a+='<td>'+((j+1)+4*i)+'</td>';
                  }
                  else{
                  a+='<td>X</td>';
                  }
               }
            a+='</tr>';
            }
            a+='</table>';
            $('.result').empty();
            $('.result').append(a);
            }
         });
           
          
          }) 
   </script>
   
</body>
</html>