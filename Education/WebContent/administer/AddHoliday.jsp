<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">    
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  


<script>
   $(function() {
      $( "#startDate" ).datepicker({dateFormat: 'yy-mm-dd'}); 
      $( "#endDate" ).datepicker({dateFormat: 'yy-mm-dd'});
   
   
        // 폼에 대한 submit 이벤트 처리 --> 입력값 여부 검사를 수행한다.
        $("#form1").bind("submit", function() {
            /** 입력여부 검사 */
            if (!$("#Name").val()) {
                alert("행사명를 입력하세요.");
                $("#Name").focus();
                return false;
            }

            if (!$("#startDate").val()) {
                alert("시작일을 입력하세요.");
                $("#startDay").focus();
                return false;
            }
            
            if (!$("#endDate").val()) {
                alert("종료일을 입력하세요.");
                $("#endDay").focus();
                return false;
            }
            
            if($("#startDate").val() > $("#endDate").val()){
            	alert("시작일은 종료일보다 클 수 없습니다.");
            	return false;
            }
            

            var url = "/Education/administer/ScheduleManagePro2.do";

            var ajax = $.post(url, $(this).serialize(), function(data) {

            }).success(function(){
            	alert("성공");
                opener.parent.location.reload();
                self.close();      
            }).fail(function() {
                alert("로그인에 실패하였습니다. 잠시후에 다시 시도해 주세요.");
            }).always(function() {
                $("#login .loader").hide();
            });
            return false;
        }); 
   });
   

   
</script>
<title>Insert title here</title>
</head>
<body>

	<c:choose>
		<c:when test="${sessionScope.memId eq 'admin'}">


   <div class="container">
     <h2>기념일 지정</h2>
     
     <p>&nbsp;&nbsp;&nbsp;*기념일을 지정하실 수 있습니다.</p>
      
        <form id="form1" class="form-inline">
        <!-- action="/administer/ScheduleManage.do" -->
          <div class="form-group">
            <label>행사명</label>
            <input type="text" class="form-control" id="Name" placeholder="행사명을 입력하세요" name="holiday_name">
          </div>          
          <div class="form-group">
            <label>시작일:</label>
            <input type="text" class="form-control" id="startDate" placeholder="Click here" name="holiday_start">
          </div>
          <div class="form-group">
            <label>종료일:</label>
            <input type="text" class="form-control" id="endDate" placeholder="Click here" name="holiday_end">
          </div><br>
          <!-- <input type="submit" class="form-control" value="제출"/> -->
          <center><input type="submit" class="btn btn-default" value="지정하기" /></center>
        </form>
   </div>
   
   
       	</c:when>
		<c:otherwise>
			잘못된 접근입니다.
		</c:otherwise>
	</c:choose>  
      
</body>
</html>