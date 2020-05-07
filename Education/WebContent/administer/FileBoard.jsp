<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
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
			 	<h4>글목록(전체 글:${count})</h4>
				<table width="800">
				  <tr>
				    <td align="right">
<!-- 				       <a href="/mvc/MVC/writeForm.do">글쓰기</a> -->
				       <button class="btn btn-primary" OnClick="window.location='/Education/administer/FileBoardWrite.do'" >글쓰기</button>
				    </td>
				  </tr>
				</table>
				<br>
				
				<c:if test="${count == 0}">
				<table width="700" border="1" cellpadding="0" cellspacing="0">
				  <tr>
				    <td align="center">
				      게시판에 저장된 글이 없습니다.
				    </td>
				  </tr>
				</table>
				</c:if>
				
				<c:if test="${count > 0}">
				<table border="1" width="800" cellpadding="0" cellspacing="0" align="center">
				    <tr height="35" bgcolor="#ccffcc">
				      <td align="center"  width="50"  >번   호</td>
				      <td align="center"  width="250" >제   목</td>
				      <td align="center"  width="100" >작성자</td>
				      <td align="center"  width="150" >작성일</td>
				    </tr>
				
				   <c:forEach var="article" items="${articleList}">
				   <tr height="35">
				    <td align="center"  width="50" >${number}
				  	<c:set var="number" value="${number - 1}"/>
				  	</td>
				    <td  width="250" >
				        <a href="/Education/administer/FileBoardContent.do?f_num=${article.f_num}&pageNum=${currentPage}">
				          &nbsp;${article.f_subject}</a>
					</td>
				    <td align="center"  width="100">${article.t_name}</td>
				    <td align="center"  width="150">${article.f_date}</td>
				  </tr>
				  </c:forEach>
				</table>
				</c:if>
				<br>
				<c:if test="${count > 0}">
				   <c:set var="pageCount" value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}"/>
				   <!-- pageCount:11 -->
				   <c:set var="pageBlock" value="${10}"/>
				   <!-- pageBlock:10 -->
				   <fmt:parseNumber var="result" value="${currentPage / 10}" integerOnly="true" />
				   <!-- result:0 -->
				   <c:set var="startPage" value="${result * 10 + 1}" />
				   <!-- startPage:1 -->
				   <c:set var="endPage" value="${startPage + pageBlock-1}"/>
				   <!-- endPage:10 -->
				   <c:if test="${endPage > pageCount}">
				        <c:set var="endPage" value="${pageCount}"/>
				        <!-- endPage:10 -->
				   </c:if>
				         
				   <c:if test="${startPage > 10}">
				       <c:if test="${search1 != 1 }">
				   	   		<a href="/Education/administer/FileBoard.do?pageNum=${startPage - 10 }">[이전]</a>
				   	   </c:if>
				   	   <c:if test="${search1 == 1 }">
				   	   		<a href="/Education/administer/FileBoard.do?pageNum=${startPage - 10 }&search=${search}&string=${string}">[이전]</a>
				   	   </c:if>	
				   </c:if>
				
				   <c:forEach var="i" begin="${startPage}" end="${endPage}">
				   	   <c:if test="${search1 != 1 }">
				   	   		<a href="/Education/administer/FileBoard.do?pageNum=${i}">[${i}]</a>
				   	   </c:if>
				   	   <c:if test="${search1 == 1 }">
				   	   		<a href="/Education/administer/FileBoard.do?pageNum=${i}&search=${search}&string=${string}">[${i}]</a>
				   	   </c:if>				   	   
				   </c:forEach>
				
				   <c:if test="${endPage < pageCount}">
				   	   <c:if test="${search1 != 1 }">
				   	   		<a href="/Education/administer/FileBoard.do?pageNum=${startPage + 10}">[다음]</a>
				   	   </c:if>
				   	   <c:if test="${search1 == 1 }">
				   	   		<a href="/Education/administer/FileBoard.do?pageNum=${startPage + 10 }&search=${search}&string=${string}">[이후]</a>
				   	   </c:if>
				   </c:if>
				</c:if>
			 </div>
			 <br>
			<div align="center">
				<form style="display: inline" action="/Education/administer/FileBoard.do">
				<select name="search">
					<option selected="selected">작성자</option>
					<option>제목</option>
					<option>내용</option>
				</select>
				<input type="text" size="20" name="string">
				<input type="submit" class="btn btn-info" value="검색">
				</form>
				<button class="btn btn-success" OnClick="window.location='/Education/administer/FileBoard.do'">목록보기</button>
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