<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>계정 생성</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  
  <script src="http://code.jquery.com/jquery-1.12.1.js"></script> 
<script> 
function check(formName){
    if(formName.t_id.value == ""){
       alert("아이디를 입력하세요");
       return false;
    }
    
    
    if(formName.t_pass.value == ""){
       alert("비밀번호를 입력하세요");
       return false;
    }
    
    if(formName.t_name.value == ""){
       alert("이름을 입력하세요");
       return false;
    }
    
    if(formName.t_tel.value == ""){
        alert("연락처를 입력하세요");
        return false;
     }
    
    if(formName.t_birth.value == ""){
        alert("생년월일을 입력하세요");
        return false;
     }
    
    $.ajax({      
       type : "get",
       success : function(){
          alert("계정이 생성되었습니다!");
          opener.parent.location.reload();
          self.close();       
       }
    });
 }

function zipCheck(){
		url="/Education/administer/ZipCheck.do";
		win =  window.open(url,"post1","_blank, toolbar=no ,width=500 ,height=300,directories=no,status=yes,scrollbars=yes,menubar=no,left=750,top=280");
	}
</script> 
</head>

<body>

	<c:choose>
		<c:when test="${sessionScope.memId eq 'admin'}">


<div class="container">
  <h2>선생님 계정 추가</h2>
  <form name="create_teacher"> <!-- action을 어디로 해야하지..????? -->
    <div class="form-group">
      <label for="id">ID:*</label>
      <input type="text" class="form-control" name="t_id" placeholder="teacherid + 숫자 조합">
    </div>
    <div class="form-group">
      <label for="pwd">Password:*</label>
      <input type="password" class="form-control" name="t_pass">
    </div>
    <div class="form-group">
      <label>이름:* </label>
      <input type="text" class="form-control" name="t_name" />
    </div>
    <div class="form-group">
    	<label>연락처:*</label>
    	<input type="text" class="form-control" name="t_tel" placeholder="-(하이픈) 없이 입력해주세요"/>
    </div>
    <div class="form-group">
    	<label>생년월일:*</label>
    	<input type="text" class="form-control" name="t_birth" placeholder="yyyy/mm/dd"/>
    </div>
    <div class="form-group"> 
       <label>우편번호</label>
       <input type="text" name="zipcode" size="7" value="${zipcode}" readonly />
       <input type="button" value="우편번호찾기" onClick="zipCheck()" />
               우편번호를 검색하세요.
    </div>
    <div class="form-group">
    	<label>주소</label>
    	<input type="text" class="form-control" value="${t_addr}" name="t_addr" />
    </div><br>
    <center><button type="submit" class="btn btn-default" onclick="check(this.form)">계정 등록하기</button></center>
  </form>
</div>


      	</c:when>
		<c:otherwise>
			잘못된 접근입니다.
		</c:otherwise>
	</c:choose>

</body>
</html>