<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="color.jspf"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<html>
<head>
<script>

	$(function() {
	
	  	$("#test").click(function() {
	  		/** 입력여부 검사 */
			if(document.modify.f_pass.value==""){
			  alert("비밀번호를 입력하십시오.");
			  document.modify.f_pass.focus();
			  return false;
			}		
	  }); 
	});

</script>
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
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="style.css" rel="stylesheet" type="text/css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>보육의정석</title>
</head>
<body>

<c:choose>
	<c:when test="${fn:contains(memId,'teacher')}">
		<tiles:insertDefinition name="header"/>
		<tiles:insertDefinition name="aside1"/>
		
    </c:when> 
	<c:otherwise>     
		<tiles:insertDefinition name="header"/>
		<tiles:insertDefinition name="aside"/>
	</c:otherwise>
</c:choose>


<main class="mdl-layout__content mdl-color--grey-100">
        
	<div class="content">
 		<br>
	    <div class="container">
			 <h2>자료게시판</h2><!-- 부트스트랩 Hover Rows 참조! -->
			 <p>자료를 업로드 및 다운로드할 수 있습니다.</p><br>  
			 
			 <div id="fileBoard" align="center">
				<h4>글 수정</h4>
			 </div>
 			 <form name="modify" action="/Education/administer/FileBoardModifyPro.do?f_num=${article.f_num}" onsubmit="abc()">
				<table width="800" border="1" cellspacing="0" cellpadding="0" align="center"> 
				  <tr height="30">
				    <td align="center" width="125" bgcolor="${value_c}">글번호</td>
				    <td align="center" width="170" align="left">${article.f_num}</td>
				    <td align="center" width="500" rowspan="3"><input type="hidden" name="f_num" value=${article.f_num } /></td>
				  </tr>
				  <tr height="30">
				  	<td align="center" width="125" bgcolor="${value_c}">작성자</td>
				    <td align="center" width="175" align="left">${article.t_name}</td>
				  </tr>
				  <tr height="30">
				    <td align="center" width="125" bgcolor="${value_c}" >작성일</td>
				    <td align="center" width="175" align="left">${article.f_date}</td>			  
				  </tr>
				  <tr height="30">
				  	<td align="center" width="125" height="30" bgcolor="${value_c}" colspan="6">&nbsp;</td>
				  </tr>
				  <tr height="30">
				    <td align="center" width="125" bgcolor="${value_c}">글제목</td>
				    <td width="375" align="left" colspan="3" style="padding:5px"><input type="text" size="40" name=f_subject value="${article.f_subject}" /></td>
				  </tr>
				  <tr>
				    <td align="center" width="125" bgcolor="${value_c}">글내용</td>
				    <td align="left" height="250" width="375" colspan="3" style="padding:5px"><textarea name="f_content" rows="13" cols="80">${article.f_content}</textarea></td>
				  </tr>
				  <tr height="40">
				  	<td align="center" width="125" bgcolor="${value_c}">첨부파일</td>
				  	<td align="left" width="375" colspan="3" id="aaa" style="padding:3px">
 				  		<c:forEach var="list_load" items="${list_load }">
			 				<a href="${list_load.fl_realPath }" download><strong>${list_load.fl_subject}</strong></a><br>
				  		</c:forEach> 
				  	</td>
				  </tr>
				  <tr height="40">     
				    <td align="center" width="125" bgcolor="${value_c}">비밀번호</td>
				    <td width="375" align="left" colspan="3" style="padding:5px"><input type="text" size="20" name="f_pass" /></td>
				  </tr>
				  <tr>
				  	<td colspan="4" bgcolor="${value_c}" align="right" >
				   	<input type="submit" id="test" class="btn btn-info" value="글수정" />
				   &nbsp;&nbsp;
				    <input type="button" class="btn btn-success" value="글목록" onclick="javascript:window.location='/Education/administer/FileBoard.do'"/>
				  </tr>
				</table>   
			</form>
		</div>
	</div> 
	</main> 
</body>
</html>