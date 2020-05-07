<%@ page contentType="text/html;charset=utf-8"%>
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
   
   
        $("#form1").bind("submit", function() {

            if($("#startDate").val() > $("#endDate").val()){
            	alert("시작일은 종료일보다 클 수 없습니다.");
            	return false;
            }
            
            var url = "/Education/Teacher/addvacationPro.do";
            var ajax = $.post(url, $(this).serialize(), function(data) {

            }).success(function(){
            	alert("신청되었습니다.");
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
   <div class="container">
     <h2>휴가 신청</h2>
     
     <p>&nbsp;&nbsp;&nbsp;*휴가 일정과 사유를 입력해주세요.</p>
      
        <form id="form1" class="form-inline">
	          <div class="form-group">
	            <label>시작일:</label>
	            <input type="text" class="form-control" id="startDate" placeholder="Click here" name="vc_start" required>
	          </div>
	          <div class="form-group">
	            <label>종료일:</label>
	            <input type="text" class="form-control" id="endDate" placeholder="Click here" name="vc_end" required>
	          </div>
	          <div class="form-group">
	            <label>사유:</label>
	            <input type="text" class="form-control" placeholder="사유를 입력해주세요." name="reason" required>
	          </div><br>
	          <div align="center">
	          	<input type="submit" class="btn btn-info" value="등록" />
	          </div>
        </form>
   </div>   
</body>
</html>