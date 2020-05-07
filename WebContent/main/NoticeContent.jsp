<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ include file="color.jspf"%>
<html>
<head>
<title>보육의정석</title>


<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<!-- Bootstrap core CSS -->
<link href="/Education/main/css/bootstrap.min.css" rel="stylesheet">

<style>


hr {
	margin-top: 1rem;
	margin-bottom: 1rem;
	border: 0;
	border-top: 1px solid rgba(0, 0, 0, .1);
}

	#content {
    max-width: 80%;
    margin-left: 20%;
    margin-right: 20%;
    margin-bottom: 20px;
    padding-top: 2rem;
    padding-bottom: 2rem;
	}
</style>

</head>
<body>

	<div>
		<jsp:include page="header.jsp" flush="false" />
	</div>


	<div id="content">
	
	
		<a name="top"></a>
	
		<div class="container">
			<div style="overflow-y:hidden; overflow-x:hidden">
	
			<h3>│보석소식</h3>
			<p style="padding-left: 2%;">보석의 정석에서 안내드립니다</p>
	
			<br>
			<h3>
				<b>&nbsp; ${article.n_subject}</b> <small
					style="float: right; padding-top: 20px;">(${article.n_reg_date})</small>
			</h3>
	
			<!-- ******* -->
	
			<div class="col-lg-12" 
				style="background-color:fff; border: 1px solid #ccc; font-size: medium;  border-radius:5px; margin-bottom: 40px;">
	
				<p style="margin:20px; margin-top:25; height:200px;">
				${article.n_content} 
				</p>
				<hr>
				<div style="margin:20px; line-height: 1.42857143;">
					첨부파일:<br>
					<c:forEach var="list_load" items="${list_load }">
						<a href="${list_load.no_realPath }" download><strong>* ${list_load.no_subject}</strong></a><br>
					</c:forEach>
				</div>
			</div><br><br>
			

			<div class="장난해?" align="center" style="margin-top: 20px">
				<input type="button" class="btn btn-info" value="목록"
					onclick="javascript:window.location='/Education/main/Notice.do'" />
					
				<c:if test="${sessionScope.memId eq 'admin'}">
					<span style="float: right"><small> <input
							type="button" class="btn btn-default" value="글수정"
							onclick="javascript:window.location='/Education/main/NoticeModify.do?n_num=${article.n_num}&pageNum=${pageNum}'" />
							&nbsp;&nbsp; <input type="button" class="btn btn-danger"
							value="삭제"
							onclick="javascript:window.location='/Education/main/NoticeDeletePro.do?n_num=${article.n_num}&pageNum=${pageNum}'" />
							&nbsp;&nbsp;
					</small></span>
				</c:if>

			</div>
		</div>
	</div>
	
			<!-- ******* -->
	
</div>
	
	<div class="footer">
		<jsp:include page="footer.jsp" flush="false" />
	</div>

</body>
</html>