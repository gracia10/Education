<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ include file="color.jspf"%>

<html>
<head>

 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>보육의정석</title>
<script>

	$(function() {

	  	$("#test").click(function() {
	  		/** 입력여부 검사 */

			if(document.writeform.n_subject.value==""){
			  alert("제목을 입력하십시요.");
			  document.writeform.f_subject.focus();
			  return false;
			}
			
			if(document.writeform.n_content.value==""){
			  alert("내용을 입력하십시요.");
			  document.writeform.f_content.focus();
			  return false;
			}
     	}); 	  	
	 });
	
	
 	$(function() {
	  	$("#filebutton").click(function(){
	  		var count = document.writeform.filecount.value;
	  		$("#filecount").remove();
	  		$("#filebutton").remove();
	  		for(var i=1; i<=count; i++){
	  			$("#aaa").append("<input type='File' name='selectFile"+i+"' />");	
	  		}
			return false;
	  	});
	}); 

	
</script>

	<style>
		.container{
			padding-top: 2rem;
		  	padding-bottom: 2rem;
		  	width: 65%;
		  	margin-left: 20%;
		  	margin-right: 20%;
		}
	</style>

</head>
<body>
	<div>
		<jsp:include page="header.jsp" flush="false"/>
	</div>
	
	<a name="top"></a>
	
	
    <!-- ******* -->
    <div class="container"> 
		<h2>│공지 등록</h2>
		<br>
			 	
			 	<!-- 본문 시작 -->
				<form method="post" name="writeform" action="/Education/main/NoticeWritePro.do" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label for="text">작성자:</label>
						<input type="text" class="form-control" id="text" size="10" maxlength="10" value="관리자" readonly="readonly"/>
					</div>
					
					<div class="form-group">
						<label for="text">제목:</label>
						<input type="text" class="form-control" size="40" maxlength="50" name="n_subject" />
					</div>

					<div class="form-group">
						<label for="text">내용:</label>
						<textarea name="n_content" class="form-control" rows="13" cols="73"></textarea>
					</div>

					<div class="form-group">
						<label for="text">파일첨부:</label>
						<span id="aaa">
						<input type="text" class="form-control" id="filecount" name="filecount" size="14" placeholder="개수를 입력하세요."
							style="width: 20%; display: inline;"/>&nbsp;
						<button id="filebutton">설정</button>
						</span>
					</div>
					
					<div align="center">
						<input type="submit" id="test" class="btn btn-info" value=" 등록 " />
						<input type="reset" class="btn btn-default" value="다시작성" />
						<button class="btn btn-default" OnClick="javascript:window.location='/Education/main/Notice.do'">목록으로</button>
					</div>
					
					
					
				</form>
    </div><!-- 컨테이너끝! -->
	<!-- ******* -->
 
	
	<div class="fixed-bottom">
	<jsp:include page="footer.jsp" flush="false"/>
	</div>
      
</body>
</html>