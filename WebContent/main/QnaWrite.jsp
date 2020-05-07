<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>글 등록하기</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	function write(formName){
		url="./Qna.do";
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
	
	</style>

</head>
<body>
	
	<div>
	<jsp:include page="header.jsp" flush="false"/>
	</div>	
	
	
<div class="container">
	<div style="overflow-y:hidden; overflow-x:hidden">
  <h2>│QNA 등록</h2>
  <br>
  
  <form action="./QnaWritePro.do">
    <div class="form-group">
      <label for="text">제목:</label>
      <input type="text" class="form-control" id="text" name="i_subject">
    </div>
    
    <div class="form-group">
      <label for="comment">글 내용:</label>
      <textarea class="form-control" rows="15" id="content" name="i_content"></textarea>
    </div>    
    <br>
    <center><button type="submit" class="btn btn-info">등록</button></center>
  </form><!-- onclick="write(this.form)" -->
  </div>
</div>

<div style="position: relative;">
	<jsp:include page="footer.jsp" flush="false"/>
	</div>
	



</body>
</html>