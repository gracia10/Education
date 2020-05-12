<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
<script>
 function deleteConsult(formName) {
	 //alert(formName.consult_num.value);
	 var check = confirm("삭제하시겠습니까?");
	 
	 if(check){
		 url="./ConsultManagePro.do?c_num="+formName.consult_num.value;
	   	 alert("삭제되었습니다.");
	   	 window.open(url, "post"); 
	 }
} 
</script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>보육의정석</title>
<% session.setAttribute("nav", 8); %>
</head>
<body>

	<c:choose>
		<c:when test="${sessionScope.memId eq 'admin'}">

			<jsp:include page="../tiles/header.jsp" />
			<jsp:include page="../tiles/aside.jsp" />


			<main class="mdl-layout__content mdl-color--grey-100">
			        
			        <div class="content">
			        	<br>
			        	<div class="container">
			  <h2>상담 신청 내역</h2><!-- 부트스트랩 Hover Rows 참조! -->
			  <p>신청 내역을 확인할 수 있습니다.</p><br><br>            
			  <table class="table table-hover">
			    <thead>
			      <tr>
			        <th> &nbsp;</th>
			        <th> 신청일자</th>
			        <th> 성  함</th>
			        <th> 연락처</th>
			        <th> 원하는 서비스</th>
			        <th>상담가능시간</th>
			        <th> &nbsp;&nbsp;삭  제</th>
			      </tr>
			    </thead>
			    <tbody>
			      
			      <c:forEach var="consult" items="${consultList}">
					<c:set var="num" value="${consult.c_num}" />
					<c:set var="date" value="${consult.c_date}" />
					<c:set var="name" value="${consult.c_name}" /> 
					<c:set var="tel" value="${consult.c_tel}" />
					<c:set var="service" value="${consult.c_service}" />
					<c:set var="consulthour" value="${consult.c_time}" />
					
					<form name="consult_form">
					<tr>
			        <td>
			        <input type="hidden" name="consult_num" value="${num}" /> 
			        </td>
			        <td>${date}</td>
			        <td>${name }</td>
			        <td>${tel}</td>
			        <td>${service }</td>
			        <td>${consulthour }</td>
			        <td>
			         <input type="button" class="btn btn-danger" value="삭제" onclick="deleteConsult(this.form);" />
			        </td>
				</tr>
				</form>
				</c:forEach>
				
			    </tbody>
			  </table>
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