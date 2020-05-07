<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ include file="color.jspf"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<html>
<head><title>보육의정석</title>

	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

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
    	<div style="overflow-y:hidden; overflow-x:hidden">
    	<h2>│글 수정</h2>
    	<br>

		<!-- 본문 시작 --> 
		<form name="modify" action="/Education/main/NoticeModifyPro.do?n_num=${article.n_num}">  
			
			<input type="hidden" name="n_num" value=${article.n_num } />
			
    		<div class="form-group">
				<label for="text">작성자:</label>
				<input type="text" class="form-control" id="text" size="10" maxlength="10" value="관리자" readonly="readonly"/>
			</div>		
			
    		<div class="form-group">
				<label for="text">글제목:</label>
				<input type="text" class="form-control" size="40" name=n_subject value="${article.n_subject}" />
			</div>		
			
    		<div class="form-group">
				<label for="text">글내용:</label>
				<textarea name="n_content"  class="form-control" rows="13" cols="70">${article.n_content}</textarea>
			</div>		
			
			<div class="form-group">
				<label for="text">첨부파일:</label>
					<br><span id="aaa">
 				  		<c:forEach var="list_load" items="${list_load }">
			 				<a href="${list_load.no_realPath }" download><strong>${list_load.no_subject}</strong></a><br>
				  		</c:forEach> 
				  	</span>
			</div>
					
			<div align="center">
				<input type="submit" id="test" class="btn btn-info" value="글수정" />&nbsp;&nbsp;
				<input type="button" class="btn btn-default" value="글목록" onclick="javascript:window.location='/Education/main/Notice.do'"/>
			</div>
		</form> 
		</div>
    </div>

	<!-- ******* -->
	
	<div class="fixed-bottom">
	<jsp:include page="footer.jsp" flush="false"/>
	</div>
      
</body>
</html>