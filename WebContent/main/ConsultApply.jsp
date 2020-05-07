<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>상담 신청하기</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <script src="http://code.jquery.com/jquery-1.12.1.js"></script> 

<script>
$(function(){
   //alert($("#eunju").val());
});

/* alert(.update.value); */

function consult(formName){
   /* if(formName.t_id.value == ""){
      alert("상담을 원하는 선생님을 선택하고, 신청하기 버튼을 다시 눌러주세요");
      self.close();
      return false;      
       } */
   
    if(formName.c_name.value == ""){
       alert("이름을 입력하세요");
       return false;
    }
    
    if(formName.c_tel.value == ""){
        alert("연락처 입력하세요");
        return false;
     }
    
    if(formName.c_date.value == ""){
        alert("상담날짜를 입력하세요");
        return false;
     }
    
    if(formName.c_time.value == ""){
       alert("상담시간을 입력하세요");
       return false;
    }
        
    formName.update.value = "yes";
    //alert(formName.update.value); 
    
    $.ajax({      
       type : "get",
       success : function(){
          alert("신청되었습니다.");
          opener.parent.location.reload();
          self.close();       
       }
    });
 }

</script>

</head>
<body>
<div class="container">
  <h2>상담 신청하기</h2>
  <form name="apply_consult">
  
    <div class="form-group">
      <label for="c_name">신청자 이름:</label>
      <input type="hidden" name="c_num"<%--  value="${c_num}" --%> />
      <input type="hidden" name="t_id" value="${t_id}" />
      <input type="text" class="form-control" name="c_name" />
    </div>
    <div class="form-group">
      <label for="c_tel">연락처:</label>
      <input type="text" class="form-control" name="c_tel">
    </div>
    <div class="form-group">
      <label for="c_date">상담 날짜 :</label>
      <input type="date" class="form-control" name="c_date" />
    </div>
    <div class="form-group">
      <label for="c_time">상담가능 시간 :</label>
      <select name="c_time">
         <option value="9:00">9:00</option>
         <option value="10:00">10:00</option>
         <option value="11:00">11:00</option>
         <option value="13:00">13:00</option>
         <option value="14:00">14:00</option>
         <option value="15:00">15:00</option>
         <option value="16:00">16:00</option>
         <option value="17:00">17:00</option>
      </select>
    </div>
    <div class="form-group">
      <label for="c_service">원하는 서비스: </label>
      <input type="text" class="form-control" name="c_service" />
    </div>
    <input type="hidden" name="t_id" <%-- value="${t_id}" 이것만 입력되면 insert 된다.--%> />
    <input type="hidden" name="update" id="eunju" value="no" />
    <br /><br />
    <center><button type="submit" class="btn btn-default" onclick="consult(this.form)">상담 신청</button></center>
  </form>
</div>
</body>
</html>