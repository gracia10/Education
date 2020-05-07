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
			 <div id="Notice" style="margin-top: 200px;" align="center">
				<h3>글 수정</h3>
			 </div>
			 
			 <c:if test="${check==1}">
			<body bgcolor="${bodyback_c}">
			<br>
			<table border="1" align="center" cellspacing="0" cellpadding="0" width="360">
				<tr height="30">
					<td align=center  bgcolor="${value_c}">
						수정 성공
					</td>
				</tr>
					
				<tr height="30">
						<td align=center >수정했습니다.</td>
				</tr>
				<tr height="30">
					<td align=center bgcolor="${value_c}">
						<button class="btn btn-success" onclick="javascript:window.location='/Education/main/Notice.do'">목록보기</button>  
					</td>
				</tr> 
			</table>
			</body>
			</c:if>
			
			<c:if test="${check==0}">
			<body bgcolor="${bodyback_c}">
			<br>
			<table border="1" align="center" cellspacing="0" cellpadding="0" width="360">
				<tr height="30">
					<td align=center  bgcolor="${value_c}">
						수정 실패
					</td>
				</tr>
				<tr height="30">
						<td align=center >비밀번호가 다릅니다.</td>
				</tr>
				<tr height="30">
					<td align=center bgcolor="${value_c}">
						<button class="btn btn-success" onclick="javascript:history.go(-1)">글삭제 폼으로 돌아가기</button>  
					</td>
				</tr> 
			</table>
			</body>
			</c:if>
      	
	<!-- ******* -->
 </div>	
	
	<div class="fixed-bottom">
	<jsp:include page="footer.jsp" flush="false"/>
	</div>
</div>
      
</body>
</html>