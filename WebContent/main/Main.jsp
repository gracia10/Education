<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<title>보육의 정석</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
/* .item {
	width: 500px;
	heigth: 500px;
	} */

html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

#head {
	position: relative;
	height: 100px;
}

.content {
	min-height: 100%;
	margin: 10px 0 -350px 0;
}

#footer {
	height: 100px;
	background: #ddd;
}

</style>
</head>
<body>

	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
		<!-- ******* -->
		<div id="head">
			<jsp:include page="header.jsp" flush="false" />
		</div>



		<div class="android-content mdl-layout__content content">
			<a name="top"></a>

			<div class="container">

				<div id="myCarousel" class="carousel slide" data-ride="carousel">

					<ol class="carousel-indicators">
						<li data-target="#myCarousel" class="active"></li>

						<c:forEach var="list" items="${list1}">
							<c:set var="img" value="${list.main_img }" />
							<li data-target="#myCarousel"></li>
						</c:forEach>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner">
						<div class="item active" style=" text-align:center">
						
							<!-- 이거 실패했음.. 프레임 다시짜야해.. 수정하고 싶은데.. 너무 졸림.. -->
							 <div style="position: absolute; align: center; width: 800px; height: 150px; 
										background-color: black; opacity: 0.6; color: fff; 
										margin: 15%; margin-top:21%">
										<p style="padding-top:5%; padding-bottom:5%; font-size: 2em;">
										<b><span style="text-decoration:underline;">보육의 정석</span></b>은<br><br>아이의 행복과 건강한 사회를 위해 연구합니다 </p> 
							</div> 
							<img src="${pageContext.request.contextPath}/mainSave/main01.gif"
								alt="gif" style="width: 1200px; height: 610px;" />
							<!-- style="width:100%; -->
						</div>

						<c:forEach var="list" items="${list1 }">
							<c:set var="img" value="${list.main_img }" />

							<div class="item">
								<img
									src="${pageContext.request.contextPath}${fn:substring(img,85,120)}"
									alt="M_img" style="width: 1200px; height: 610px;">
							</div>
						</c:forEach>

					</div>

					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
			</div>


		</div>

		<div class="fixed-bottom">
			<jsp:include page="footer.jsp" flush="false" />
		</div>

	</div>
</body>
</html>

