<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>
<%@page import="manage.ManageDBBean"%>
<%@page import="manage.ScheduleDataBean"%>
<%@page import="java.util.ArrayList"%>

<html>
<head>
<!-- *** -->
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- *** -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
			
	function admit(formName){
		var check = confirm("승인하시겠습니까?");
		
		if(check){
			formName.submit();
			alert("승인 했습니다.");			
		}
	}
	
 	function reject(formName){
 		var check = confirm("거절하시겠습니까?");
 		
 		if(check){
 	 		formName.what.value = "reject";
 			formName.submit();
 			alert("거절 했습니다.");	
 		}else{
 	 		return false;	
 		}
	} 
	
	function add_holiday() {
		url = "/Education/administer/AddHoliday.do";
		window.open(
					url,
					"post4",
					"toolbar=no ,width=500 ,height=400,directories=no,status=yes,scrollbars=yes,menubar=no,left=750,top=280");
	}

</script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
#calendar {
	position: relative;
	border: black 1px solid;
	left: 18%;
	width: 65%;
	padding-left: 20px;
	display: inline-block;
}

#vacation {
	position: relative;
	left: 8%;
	width: 85%;
	margin-bottom: 5%;
	width: 1000px;
	margin-left: 200px;
}

#holiday {
	float: right;
}

#calendar {font-size: 9pt;}


table th {
	text-align: center;
}
</style>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>보육의정석</title>
<%
	session.setAttribute("nav", 4);
%>
</head>
<body>

<jsp:include page="../tiles/header.jsp" />
	<jsp:include page="../tiles/aside.jsp" />


<main class="mdl-layout__content mdl-color--grey-100">

	<div class="content">
		<br>
		<div class="container">
			<h2>종합스케쥴 관리</h2>
			<!-- 부트스트랩 Hover Rows 참조! -->
			<p>선생님휴가 및 종합일정을 관리할 수 있습니다.</p>

			<button id="holiday" class="btn btn-success" onclick="add_holiday()">기념일 추가</button>

			<div id="calendar">
				<form name="calendarFrm" id="calendarFrm" action="" method="post">
					<DIV id="content" style="width: 712px;">

						<table width="98.3%" border="0" cellspacing="1" cellpadding="1">
							<tr>
								<td align="right"><input type="button"
									class="btn btn-warning"
									onclick="javascript:location.href='<c:url value='/administer/ScheduleManage.do' />'"
									value="오늘" /></td>

							</tr>
						</table>
						<!--날짜 네비게이션  -->
						<table width="98.3%" border="0" cellspacing="1" cellpadding="1"
							id="KOO" bgcolor="#F3F9D7" style="border: 1px solid #CED99C">

							<tr>
								<td height="60">

									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td height="10"></td>
										</tr>

										<tr>
											<td align="center"><a
												href="<c:url value='/administer/ScheduleManage.do' />?year=${year-1 }&amp;month=${month}"
												target="_self"> <b>&lt;&lt;</b> <!-- 이전해 -->
											</a> <c:if test="${month > 0}">
													<a
														href="<c:url value='/administer/ScheduleManage.do' />?year=${year }&amp;month=${month-1}"
														target="_self"> <b>&lt;</b> <!-- 이전달 -->
													</a>
												</c:if> <c:if test="${month <= 0}">
													<b>&lt;</b>
												</c:if> &nbsp;&nbsp; ${year }년 ${month+1 }월 &nbsp;&nbsp; <c:if
													test="${month < 11 }">
													<a
														href="<c:url value='/administer/ScheduleManage.do' />?year=${year }&amp;month=${month+1}"
														target="_self"> <!-- 다음달 --> <b>&gt;</b>
													</a>
												</c:if> <c:if test="${month >= 11 }">
													<b>&gt;</b>
												</c:if> <a
												href="<c:url value='/administer/ScheduleManage.do' />?year=${year+1 }&amp;month=${month}"
												target="_self"> <!-- 다음해 --> <b>&gt;&gt;</b>
											</a></td>
										</tr>
									</table>

								</td>
							</tr>
						</table>

						<br>
						<table border="0" cellspacing="1" cellpadding="1"
							bgcolor="#FFFFFF">
							<THEAD>
								<TR bgcolor="#CECECE">
									<TD width='100px'>
										<DIV align="center">
											<font color="red">일</font>
										</DIV>
									</TD>
									<TD width='100px'>
										<DIV align="center">월</DIV>
									</TD>
									<TD width='100px'>
										<DIV align="center">화</DIV>
									</TD>
									<TD width='100px'>
										<DIV align="center">수</DIV>
									</TD>
									<TD width='100px'>
										<DIV align="center">목</DIV>
									</TD>
									<TD width='100px'>
										<DIV align="center">금</DIV>
									</TD>
									<TD width='100px'>
										<DIV align="center">
											<font color="#529dbc">토</font>
										</DIV>
									</TD>
								</TR>
							</THEAD>
							<TBODY>
								<TR>


									<c:forEach var="index" begin="1" end="${start-1 }">
										<td>&nbsp;</td>
										<c:set var="newLine" value="${newLine + 1}" />
									</c:forEach>

									<c:forEach var="index" begin="1" end="${endDay }">
										<c:set var="color" value="" />

										<c:choose>
											<c:when test="${newLine == 0 }">
												<c:set var="color" value="RED" />
											</c:when>
											<c:when test="${newLine == 6 }">
												<c:set var="color" value="BLUE" />
											</c:when>
											<c:otherwise>
												<c:set var="color" value="BLACK" />
											</c:otherwise>
										</c:choose>

										<c:set var="backColor" value="#EFEFEF" />
										<c:if
											test="${index == today_date && year == today_year && month == today_month }">
											<c:set var="backColor" value="YELLOW" />
										</c:if>

										<TD valign="top" align="left" height="92px"
											bgcolor="${backColor }" nowrap><font color="${color }">${index }</font>
											<br> <c:forEach var="list" items="${list}">
												<c:set var="name" value="${list.name }" />
												<c:set var="date0" value="${list.sc_date }" />
												<c:set var="year1" value="${fn:substring(date0, 0, 4)}" />
												<c:set var="month1" value="${fn:substring(date0, 5, 7)}" />
												<c:set var="date1" value="${fn:substring(date0, 8, 10)}" />
												<c:if
													test="${index == date1 && month == month1-1 && year == year1}">
													${list.name }<br>
												</c:if>
											</c:forEach> 
											<c:forEach var="list2" items="${list2}">
												<c:set var="name" value="${list2.name }" />
												<c:set var="date0" value="${list2.sc_date }" />
												<c:set var="year2" value="${fn:substring(date0, 0, 4)}" />
												<c:set var="month2" value="${fn:substring(date0, 5, 7)}" />
												<c:set var="date2" value="${fn:substring(date0, 8, 10)}" />

												<c:if
													test="${index == date2 && month == month2-1 && year == year2}">
													<font color="RED">${list2.name }<br></font>
												</c:if>
											</c:forEach> <br></TD>
										<c:set var="newLine" value="${newLine+1 }" />

										<c:if test="${newLine == 7 }">
								</tr>
								<c:if test="${index <= endDay }">
									<tr>
								</c:if>
								<c:set var="newLine" value="0" />
								</c:if>
								</c:forEach>

								<c:forEach var="index" begin="1" end="6">
									<c:if test="${newLine > 0 && newLine <7}">
										<td>&nbsp;</td>
										<c:set var="newLine" value="${newLine+1 }" />
									</c:if>
								</c:forEach>
								</tr>
							</TBODY>
						</TABLE>
					</DIV>
				</form>
			</div>
		</div>
		<br> <br>
			
		<div id="vacation">
		<table class="table table-hover">
    <thead>
      <tr>
        <th colspan="6" style="font-size: 27px; text-align: left;">휴가 신청 내역</th>
      </tr>
	<tr>
	<th>번호</th>
	<th>이름</th>
	<th>신청기간</th>
	<th>사유</th>
	<th colspan="2">처리</th>
    </thead>
    <tbody>
      <c:forEach var="list3" items="${vacationSubmitList}">
					<form name="vacation" method="post" action="/Education/administer/ScheduleManagePro.do">
						<tr height="30">
							<td align="center" width="50">${vacation_number}
								<c:set var="vacation_number" value="${vacation_number + 1}" />
							</td>
							<td align="center" width="150">${list3.t_name }</td>
							<td align="center" width="300">${list3.vc_start }&nbsp;~&nbsp;${list3.vc_end }
							</td>
							<td align="center" width="250">${list3.vc_reason}
								<input type="hidden" name="vacation_name" value="${vacation_name }" />
								<input type="hidden" name="vacation_start" value="${vacation_start }" /> 
								<input type="hidden" name="vacation_end" value="${vacation_end }" />
							</td>
							<td align="center" width="150">
								<input type="hidden" name="vacation_num" value="${list3.vc_num }"/> 
								<input type="hidden" name="what" value="admit" />
								<input type ="button" class="btn btn-info" onclick="admit(this.form)" value="승 인" />
							</td>
							<td align="center" width="150">
								<input type="button" class="btn btn-danger" onclick="reject(this.form)" value="거 절" />
							</td>
						</tr>
					</form>
				</c:forEach>
    </tbody>
  </table>
		</div>

	</div>
</main>
</body>
</html>