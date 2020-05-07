<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>글 수정하기</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
   <script>
   
      function check(formName) {
             formName.update.value = "yes" 
      
                $.ajax({
                  type : "get",
                  success : function() {
                     alert("수정되었습니다");
                  }
               }); 
                
                /* alert(formName.update.value);
               alert(formName.i_num.value);
               alert(formName.i_subject.value);
               alert(formName.i_content.value); */
             
             url="./QnaModifyPro.do?i_num"+formName.i_num.value+"?i_subject"+formName.i_subject.value+"?i_content="+formName.i_content.value;
      }
         
   </script>
   <style>
      .container{
         padding-top: 2rem;
           padding-bottom: 2rem;
           width: 65%;
           margin-left: 20%;
           margin-right: 20%;
           margin-bottom: 20px;
      }
   
   		.btn{
   		 margin-top: 20px;
   		
   		}
   </style>
</head>
<body>
   <div>
      <jsp:include page="header.jsp" flush="false"/>
   </div>   
   
   <a name="top"></a>
   
<div class="container">
	<div style="overflow-y:hidden; overflow-x:hidden">
  <h2>│QNA 수정</h2><br>
  <form name="qna" action="./QnaModifyPro.do">
  
    <div class="form-group">
      <label for="text">제목:</label>
      <input type="hidden" name="i_num" value="${i_num}" />
      <input type="text" class="form-control" id="text" name="i_subject" value="${i_subject}">
    </div>
        
    <div class="form-group">
      <label for="comment">글 내용:</label>
      <textarea class="form-control" rows="15" id="content" name="i_content">${i_content}</textarea>
    </div>
    
    <input type="hidden" name="update" id="eunju" value="no" />
    <center><button type="submit" class="btn btn-danger" onclick="check(this.form)" >수정완료</button></center>
  </form>
</div>
</div>


<div style="position: relative;">
   <jsp:include page="footer.jsp" flush="false"/>
   </div>

</body>
</html>