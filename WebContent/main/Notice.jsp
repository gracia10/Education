<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ include file="color.jspf"%>
<html>
<head>

	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
	<!-- FontAwesome JS-->
	<script defer
		src="https://use.fontawesome.com/releases/v5.1.1/js/all.js"
		integrity="sha384-BtvRZcyfv4r0x/phJt9Y9HhnN5ur1Z+kZbKVgzVBAlQZX4jvAuImlIz+bG7TS00a"
		crossorigin="anonymous"></script>

<title>보육의정석</title>

	<style>
	
	#content {
		max-width: 80%;
		margin-left: 20%;
		margin-right: 20%;
		margin-bottom: 10%;
		padding-top: 2rem;
	    padding-bottom: 2rem;
	}
	
	.android-content {
		margin-left: 5%;
		margin-right: 5%;
	}
	
	#Notice{
		margin-top: 8%;
		margin-bottom: 5%;
		
	
	}
	
	.table_total{
		padding-left: 2rem;
		padding-right: 1rem;
	}
	</style>

</head>
<body>

	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
		<!-- ******* -->
		<div>
			<jsp:include page="header.jsp" flush="false" />
		</div>

		<div id="content" style="margin-bottom: 50px;">

			<h3 style="padding-left: 5%;">│보석소식</h3>
			<p style="padding-left: 6%;"> 보석의 정석에서 안내드립니다 </p>

			<div class="table_total" >

				<div class="android-content">
					<a name="top"></a>


					<div id="Notice">

						<h6 style="display: inline">&ensp;글목록(전체 글:${count})</h6>					
						<div style="float:right">
							<c:if test="${sessionScope.memId eq 'admin'}">
								<a href="javascript:window.location='/Education/main/NoticeWrite.do'"> 
									<i class="far fa-plus-square"></i> 글쓰기
								</a>
							</c:if>
						</div>
						<br><br>
						
						<c:if test="${count == 0}">
							<table class="table table-hover" cellpadding="0" cellspacing="0">
								<tr>
									<td align="center">게시판에 저장된 글이 없습니다.</td>
								</tr>
							</table>
						</c:if>
						<c:if test="${count > 0}">
							<table class="table table-hover" cellpadding="0" cellspacing="0">
								<thead>
								<tr height="35" >
									<th  width="50">번 호</th>
									<th  width="230">제 목</th>
									<th  width="70">작성자</th>
									<th  width="50">조회수</th>
									<th align="center" width="150">작성일</th>
								</tr>
								</thead>
								<tbody style="padding-left:10px">
								<c:forEach var="article" items="${articleList}">
									<tr height="35">
										<th width="50">${number}<c:set
												var="number" value="${number - 1}" />
										</th>
										<td width="230"><a
											href="/Education/main/NoticeContent.do?n_num=${article.n_num}&pageNum=${currentPage}">
												&nbsp;${article.n_subject}</a></td>
										<td width="70">관리자</td>
										<td width="50">${article.n_readcount }</td>
										<td width="150">${article.n_reg_date}</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</c:if>
						<br>
						
						<!--  번호친구 -->
						
						<div align="center">
							<c:if test="${count > 0}">
								<c:set var="pageCount"
									value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}" />
								<!-- pageCount:11 -->
								<c:set var="pageBlock" value="${10}" />
								<!-- pageBlock:10 -->
								<fmt:parseNumber var="result" value="${currentPage / 10}"
									integerOnly="true" />
								<!-- result:0 -->
								<c:set var="startPage" value="${result * 10 + 1}" />
								<!-- startPage:1 -->
								<c:set var="endPage" value="${startPage + pageBlock-1}" />
								<!-- endPage:10 -->
								<c:if test="${endPage > pageCount}">
									<c:set var="endPage" value="${pageCount}" />
									<!-- endPage:10 -->
								</c:if>
	
								<c:if test="${startPage > 10}">
									<c:if test="${search1 != 1 }">
										<a href="/Education/main/Notice.do?pageNum=${startPage - 10 }">[이전]</a>
									</c:if>
									<c:if test="${search1 == 1 }">
										<a
											href="/Education/main/Notice.do?pageNum=${startPage - 10 }&search=${search}&string=${string}">[이전]</a>
									</c:if>
								</c:if>
	
								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<c:if test="${search1 != 1 }">
										<a href="/Education/main/Notice.do?pageNum=${i}">[${i}]</a>
									</c:if>
									<c:if test="${search1 == 1 }">
										<a
											href="/Education/main/Notice.do?pageNum=${i}&search=${search}&string=${string}">[${i}]</a>
									</c:if>
								</c:forEach>
	
								<c:if test="${endPage < pageCount}">
									<c:if test="${search1 != 1 }">
										<a href="/Education/main/Notice.do?pageNum=${startPage + 10}">[다음]</a>
									</c:if>
									<c:if test="${search1 == 1 }">
										<a
											href="/Education/main/Notice.do?pageNum=${startPage + 10 }&search=${search}&string=${string}">[이후]</a>
									</c:if>
								</c:if>
							</c:if>
						</div>
					</div>
					<br>
					<div align="center">
						<form style="display: inline" action="/Education/main/Notice.do">
							<select name="search">
								<option selected="selected">제목</option>
								<option>내용</option>
							</select> <input type="text" size="20" name="string"> <input
								type="submit" class="btn btn-info" value="검색">
						</form>
						<button class="btn btn-default"
							OnClick="window.location='/Education/main/Notice.do'">목록보기</button>
					</div>

					<!-- ******* -->
				</div>
			</div>

		</div>

		<div class="fixed-bottom">
			<jsp:include page="footer.jsp" flush="false" />
		</div>
	</div>

</body>
</html>