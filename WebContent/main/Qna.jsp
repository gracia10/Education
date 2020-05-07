<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head><title>FQA</title>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

   <!-- 부트스트랩 -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">   
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   
   <!-- FontAwesome JS-->
    <script defer src="https://use.fontawesome.com/releases/v5.1.1/js/all.js" integrity="sha384-BtvRZcyfv4r0x/phJt9Y9HhnN5ur1Z+kZbKVgzVBAlQZX4jvAuImlIz+bG7TS00a" crossorigin="anonymous"></script>


   <script>
         $(document).ready(function() {
              $(".content").hide();
              //content 클래스를 가진 div를 표시/숨김(토글)
              $(".heading").click(function()
            {
                $(this).next(".content").slideToggle(500);
            });
         });
          
      function modify(i_num) {
         url="./QnaModify.do?i_num="+i_num;   
         document.location.href = url;
      }
      
      function del(i_num) {
         url="./QnaDelete.do?i_num="+i_num;
         document.location.href = url;
      }
      
   </script>

   <style>
   
   html, body {
      height: 100%;
   }
   
   body {
   margin: 0;
   }
   
   h1 {
   
   }
   
      #content{
        padding-top: 2rem;
        /* padding-bottom: 2rem; */
        max-width: 80%;
        margin-left: 20%;
        margin-right: 20%; 
      padding-bottom: 1.9em;
      }
      
      .head{
         margin:20px;
         padding-right:30px;
         text-align:right;
      }
      
      #h1{
      min-height: 80%;
      }
      
      .plusbt{
         margin-top: 10px;
         margin-right: 20px;
         float:right;
         font-size: 15px;
      }
      
      .qnaList{
      
         background-color: #fff;
         margin: 5%;
         margin-top: 2%;
         border: 1px solid #ccc;
          border-radius: 5px;
          
          padding-bottom: 4.7%;
          padding-top: 4.3%;

      }
      
      .qna{
         margin-left: 5%;
         margin-right: 5%;
      }
      
      #foot {
      margin-top: -1.9em;
      height: 1.9em;
      }
   </style>

</head>

<body>
   <!-- 헤더 -->
   <div>
      <jsp:include page="header.jsp" flush="false"/>
   </div>   
   <div id="h1">
   <div id="content">   

      <h3 style="padding-left: 5%;">│QNA</h3>
      <p style="padding-left: 6%;"> 고객센터 1588-0000 평일 09:00~18:00(공휴일 제외) </p>
         
      <div class="head">
          <c:if test="${sessionScope.memId eq 'admin'}">
            <a href="./QnaWrite.do"><i class="far fa-plus-square"></i> 글쓰기</a>
         </c:if>   
      </div>   
   
      <!-- 질문리스트 -->
      <div class="panel-group qnaList" id="accordion" role="tablist" aria-multiselectable="false">
    
         <c:forEach var="qna" items="${list}">       
   
               <!-- 질문 하나 -->
            <div class="panel panel-default qna" style="margin-top: 5px;">
                 <!-- 제목 -->
                 <div class="panel-heading" role="tab" style="background-color:#e2eae9">
                     <h4 class="panel-title ">
                         <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#i_num_${qna.i_num}" aria-expanded="false">
                            Q. ${qna.i_subject}
                         </a>
                       <c:if test="${sessionScope.memId eq 'admin'}"> 
                        <!-- 수정 삭제 -->
                        <span style="float:right; font-size:small">
                           <a href="javascript:modify(${qna.i_num})">수정</a>&ensp;
                           <a href="javascript:del(${qna.i_num})" >삭제</a>
                        </span>
                     </c:if>       
                     </h4>
                 </div>
                 <!--내용 -->
               <div id="i_num_${qna.i_num}" class="panel-collapse collapse" role="tabpanel">
                     <div class="panel-body" style="background-color:#fefdfda1"> A. ${qna.i_content}</div>
               </div>
            </div><!-- 질문한개 끝  -->
         </c:forEach>
      </div><!-- 질문리스트끝 -->
   </div>
</div>
    <div id="foot">
         <jsp:include page="footer.jsp" flush="false"/>
      </div>
</body>
</html>