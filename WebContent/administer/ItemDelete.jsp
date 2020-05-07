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
            /** 입력여부 검사 */
            if (!$("#item_name").val()) {
                alert("비품명를 입력하세요.");
                $("#item_name").focus();
                return false;
            }
			var check = confirm("삭제하시겠습니까?");
			
			if(check){
				alert("삭제 되었습니다.");
			} else{
				return false;
			}
        }); 
   });
     
   
</script>
<title>Insert title here</title>
</head>
<body>
   <div class="container">
     <h2>비품 삭제</h2>
     
     <p>&nbsp;&nbsp;&nbsp;*비품을 삭제할 수 있습니다.</p>
      
        <form id="form1" class="form-inline" action="/Education/administer/ItemDeletePro.do">
          <input type="hidden" name="check" value="no"/>
        <!-- action="/administer/ScheduleManage.do" -->
          <div class="form-group">
	            <div class="form-group">
	            	<label>비품명</label>
	            	<input type="text" class="form-control" id="item_name" placeholder="비품명을 입력하세요" name="item_name">
	            </div>
          </div><br>
          <center><input type="submit" id="test" class="btn btn-default" value="등록하기" /></center>
        </form>
   </div>   
</body>
</html>