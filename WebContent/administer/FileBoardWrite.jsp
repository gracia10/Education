<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ include file="color.jspf"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  

<html>
<head>
<style>

</style>
<script>

	$(function() {

	  	$("#test").click(function() {
	  		/** 입력여부 검사 */
			if(document.writeform.t_name.value==""){
			  alert("작성자를 입력하십시요.");
			  document.writeform.t_name.focus();
			  return false;
			}
			if(document.writeform.f_subject.value==""){
			  alert("제목을 입력하십시요.");
			  document.writeform.f_subject.focus();
			  return false;
			}
			
			if(document.writeform.f_content.value==""){
			  alert("내용을 입력하십시요.");
			  document.writeform.f_content.focus();
			  return false;
			}
			       
			if(document.writeform.f_pass.value==""){
			  alert(" 비밀번호를 입력하십시요.");
			  document.writeform.f_pass.focus();
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
			 	<h3>글 작성</h3>
			<form method="post" name="writeform" action="/Education/administer/FileBoardWritePro.do" method="post" enctype="multipart/form-data">
				
					
					<table width="800" border="1" cellspacing="0" cellpadding="0" align="center">
						<tr>
							<td align="right" colspan="2" bgcolor="${value_c}">&nbsp;</td>
						</tr>
						<tr>
							<td width="200" bgcolor="${value_c}" align="center">이름</td>
							<td width="600"><input type="text" size="10" maxlength="10" name="t_name" value="${t_name}" readonly="readonly"></td>
						</tr>
						<tr>
							<td width="200" bgcolor="${value_c}" align="center">제목</td>
							<td width="600"><input type="text" size="40" maxlength="50" name="f_subject" /></td>
						</tr>
						<tr>
							<td width="200" bgcolor="${value_c}" align="center">내용</td>
							<td width="600"><textarea name="f_content" rows="13" cols="83"></textarea></td>
						</tr>
 						<tr>
							<td width="200" bgcolor="${value_c}" align="center">파일첨부</td>
								<td id="aaa">
									<input type="text" id="filecount" name="filecount" size="14" placeholder="개수를 입력하세요."/>&nbsp;
									<button id="filebutton">설정</button>
								<td>
								
						</tr>						
						<tr>
							<td width="200" bgcolor="${value_c}" align="center">비밀번호</td>
							<td width="600"><input type="password" size="8" maxlength="12" name="f_pass"></td>
						</tr>
						<tr>
							<td align="right" height="40" colspan="2" bgcolor="${value_c}">
								<input type="submit" id="test" class="btn btn-primary" value="글쓰기" /> 
								<input type="reset" class="btn btn-warning" value="재작성" />
								<button class="btn btn-success" OnClick="javascript:window.location='/Education/administer/FileBoard.do'">목록보기</button>	
							</td>
						</tr>		
					</table>
				</form>
			 </div> 
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