<%@ page contentType="text/html;charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">    
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  


<script>
   $(function() {
     
        // 폼에 대한 submit 이벤트 처리 --> 입력값 여부 검사를 수행한다.
        $("#test").bind("click", function() {
            if (!$("#item_name").val()) {
                alert("비품명를 입력하세요.");
                $("#item_name").focus();
                return false;
            }

            if (!$("#item_count").val()) {
                alert("개수를 입력하세요.");
                $("#item_count").focus();
                return false;
            }
        }); 
   });
     
   
</script>
<title>Insert title here</title>
</head>
<body>
   <div class="container">
     <h2>비품 수정</h2>
     
     <p>&nbsp;&nbsp;&nbsp;*비품을 수정할 수 있습니다.</p>
      
        <form id="form1" class="form-inline" action="/Education/administer/ItemModifyPro.do" method="post" enctype="multipart/form-data">
          <input type="hidden" name="check" value="no"/>
        <!-- action="/administer/ScheduleManage.do" -->
          <div class="form-group">
	            <div class="form-group">
	            	<label>비품명</label>
	            	<input type="text" class="form-control" id="item_name" placeholder="비품명을 입력하세요" name="item_name">
	            </div>
	            <div class="form-group">    
	            	<label>수량</label>
	            	<input type="number" style="width:200" class="form-control" id="item_count" placeholder="개수를 입력하세요"  name="item_count">
	            </div>
	            <div class="form-group">
		            <label>이미지(미등록시 디폴트 이미지)</label>
		            <input type="file" class="form-control" id="item_img" name="item_img">
		     	</div>
          </div><br>
          <center><input type="submit" id="test" class="btn btn-default" value="등록하기" /></center>
        </form>
   </div>   
</body>
</html>