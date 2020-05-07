<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="color.jspf"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<html>
<head>
<style>

.content pre{
	background-color: white;
	border: none;
} 


#container table{
	font-style: normal;
	font-size:medium;
	font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
}
</style>
<script>

	$(function() {

	  	$("#test").click(function() {
	  		/** 입력여부 검사 */
			if(document.delForm.f_pass.value==""){
			  alert("비밀번호를 입력하십시오.");
			  document.delForm.f_pass.focus();
			  return false;
			}
      	}); 
 	});

</script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="style.css" rel="stylesheet" type="text/css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>보육의정석</title>
</head>
<body>

	<c:choose>
		<c:when test="${sessionScope.memId eq 'admin' || fn:contains(memId,'teacher')}">
			<c:if test="${sessionScope.memId eq 'admin'}">
				<tiles:insertDefinition name="header" />
				<tiles:insertDefinition name="aside" />
			</c:if>
			<c:if test="${fn:contains(memId,'teacher')}">
				<tiles:insertDefinition name="header" />
				<tiles:insertDefinition name="aside1" />
			</c:if>


<main class="mdl-layout__content mdl-color--grey-100">
        
	<div class="content">
 		<br>
	    <div class="container">
			 <h2>자료게시판</h2><!-- 부트스트랩 Hover Rows 참조! -->
			 <p>자료를 업로드 및 다운로드할 수 있습니다.</p><br>  
			 
			 <div id="fileBoard" align="center">
				<h3>글 삭제</h3>
			 </div>
				<form method="post" name="delForm" action="/Education/administer/FileBoardDeletePro.do?pageNum=${pageNum}">
					<table border="1" align="center" cellspacing="0" cellpadding="0" width="360">
						<tr height="30">
							<td align=center bgcolor="${value_c}"><b>비밀번호를 입력해 주세요.</b></td>
						</tr>
						
						<tr height="30">
							<td align=center >비밀번호 :  
							<input type="password" name="f_pass" size="8" maxlength="12">
							<input type="hidden" name="f_num" value="${f_num}">
							<input type="hidden" name="pageNum" value="${pageNum}">
							</td>
						</tr>
						
						<tr height="30">
						<td align=center bgcolor="${value_c}">
							<input type="submit" id="test" class="btn btn-danger" value="글삭제" >
							<input type="button" class="btn btn-success" value="글목록" onclick="javascript:window.location='/Education/administer/FileBoard.do?pageNum=${pageNum}'">    
						</td>
						</tr> 
					</table>
				</form>			
		</div>
	</div>
  </main>  
  
  
  
  	</c:when>
		<c:otherwise>
			잘못된 접근입니다.
		</c:otherwise>
	</c:choose>	
  
      
</body>
</html>