<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ include file="color.jspf"%>
<html>
<head>

<link href="style.css" rel="stylesheet" type="text/css">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>보육의정석</title>
</head>
<body>
			
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header"><!-- ******* -->
	<div>
	<jsp:include page="header.jsp" flush="false"/>
	</div>
	<div class="android-content mdl-layout__content">
        <a name="top"></a>
     
    <!-- ******* -->   
			 <div id="Notice" align="center">
				<h3>글 삭제</h3>
			 </div>
				<form method="post" name="delForm" action="/Education/main/NoticeDeletePro.do?pageNum=${pageNum}">
					<table border="1" align="center" cellspacing="0" cellpadding="0" width="360">
						<tr height="30">
							<td align=center bgcolor="${value_c}"><b>비밀번호를 입력해 주세요.</b></td>
						</tr>
						
						<tr height="30">
							<td align=center >비밀번호 :  
							<input type="password" name="n_pass" size="8" maxlength="12">
							<input type="hidden" name="n_num" value="${n_num}">
							<input type="hidden" name="pageNum" value="${pageNum}">
							</td>
						</tr>
						
						<tr height="30">
						<td align=center bgcolor="${value_c}">
							<input type="submit" id="test" class="btn btn-danger" value="글삭제" >
							<input type="button" class="btn btn-success" value="글목록" onclick="javascript:window.location='/Education/main/Notice.do?pageNum=${pageNum}'">    
						</td>
						</tr> 
					</table>
				</form>		
      	
	<!-- ******* -->
 </div>	
	
	<div class="fixed-bottom">
	<jsp:include page="footer.jsp" flush="false"/>
	</div>
</div>
      
</body>
</html>