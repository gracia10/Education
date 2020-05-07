<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<%@ include file="color.jspf"%>
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>   -->

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<html>
<head>
<style>

@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
* {font-family: 'Nanum Gothic', sans-serif;}

.item_img {
	height: 100px;
	width: 130px;
	margin-left: 32px;
	margin-top: 15px;
}

.item {
	padding-bottom: 10px;
}

.item_count {
	padding-left: 20px;
	padding-top: 10px;
}

.text {
	padding-bottom: 10px;
	font-size: 20px;
}

.table th {
	text-align: center;
}

.table td {
	text-align: center;
}

#req {
	width: 1000px;
	margin-left: 80px;
}

#my_req {
	width: 1000px;
	margin-left: 80px;
}
</style>
<script>
	function item_add() {

		$(function() {
			if ($("#memId").val() == "admin") {
				url = "/Education/administer/ItemAdd.do";
				window
						.open(
								url,
								"post",
								"toolbar=no ,width=500 ,height=400,directories=no,status=yes,scrollbars=yes,menubar=no,left=750,top=280");

			} else {
				alert("권한이 없습니다.");
				return false;
			}
		});
	}

	function item_modify() {

		$(function() {
			if ($("#memId").val() == "admin") {
				url = "/Education/administer/ItemModify.do";
				window
						.open(
								url,
								"post",
								"toolbar=no ,width=500 ,height=400,directories=no,status=yes,scrollbars=yes,menubar=no,left=750,top=280");

			} else {
				alert("권한이 없습니다.");
				return false;
			}
		});
	}

	function item_delete() {

		$(function() {
			if ($("#memId").val() == "admin") {
				url = "/Education/administer/ItemDelete.do";
				window
						.open(
								url,
								"post",
								"toolbar=no ,width=500 ,height=270,directories=no,status=yes,scrollbars=yes,menubar=no,left=750,top=280");
			} else {
				alert("권한이 없습니다.");
				return false;
			}
		});
	}

	function abc(formName) {
		if (formName.item_count.value == "") {
			alert("개수를 입력해주세요.");
			return false;
		}
		
		var con_test = confirm(formName.item_name.value + " "
				+ formName.item_count.value + "개 대여 하시겠습니까?");

		if (con_test) {

			alert("대여했습니다.");
			formName.action = "/Education/administer/ItemPro.do";
			formName.submit();

		} else {
			return false;
		}
	}

	function return1(formName) {
		var con_test = confirm(formName.item_name3.value + " "
				+ formName.item_count3.value + "개 반납 하시겠습니까?");

		if (con_test) {
			alert("반납했습니다.");
			formName.action = "/Education/administer/ItemPro2.do";
			formName.submit();

		} else {
			return false;
		}
	}
</script>

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
			<h2>비품현황</h2>
			<!-- 부트스트랩 Hover Rows 참조! -->
			<p>비품현황 확인, 추가 및 삭제할 수 있습니다.</p>

			<div class="container">
				<div id="item" align="center">
					<DIV id="content" style="width: 800px;">
						<table width="100%" border="0" cellspacing="1" cellpadding="1">
						

        					
						
		<c:if test="${sessionScope.memId eq 'admin'}">        					
							<tr>
								<td align="right">
									<button class="btn btn-primary" onclick="item_add()">비품등록</button>&nbsp;
									<button class="btn btn-info" onclick="item_modify()">비품수정</button>&nbsp;
									<button class="btn btn-danger" onclick="item_delete()">비품삭제</button>
									<input type="hidden" id="memId" value="${sessionScope.memId}" />
								</td>
		</c:if>																		
								
							</tr>
							<tr bgcolor="#CECECE" style="height:20px;">
								<td align="center" style="padding-bottom: 5px; padding-top: 5px;"><span style="font-size:20px; font-weight:bold;">비품현황</span></td>
							</tr>
						</table>
						<form name="itemform" action="/Education/administer/ItemPro.do">
							<table width="100%" border="1" cellspacing="1" cellpadding="1"
								bgcolor="#F3F9D7" style="border: 1px solid #CED99C">
								<tbody>
									<c:set var="count1" value="1" />

									<tr>
										<c:forEach var="i" begin="0" end="${a }" items="${list }">
											<form method="post">
												<c:set var="img1" value="${fn:substring(i.item_img,85,120)}" />
												<c:set var="img2" value="\itemSave\null" />
												<c:if test="${img1 eq img2 }">
													<c:set var="img1" value="/itemSave/다운로드.jpg" />
												</c:if>
												<td width='25%' class="item">
													<div align="center"
														style="border-bottom: 1px solid #CED99C;">${i.item_name }</div>
													<input type="hidden" id="item_name" name="item_name"
													value=${i.item_name } />
													<div class="item_img">
														<img style="width: 100%; height: 100%;"
															src="${pageContext.request.contextPath}${img1}" />
													</div>
													<div class="item_count">
														수량:${i.item_count } <input type="number" name="item_count"
															id="item_count" min="1" max="${i.item_count }"
															style="width: 45px" />&nbsp;
														<button onclick="abc(this.form)">대여</button>
													</div>
												</td>
												<c:set var="count1" value="${count1+1 }" />
												<c:if test="${count1 == 5 }">
									</tr>

									<c:set var="count1" value="1" />
									</c:if>
									</form>
									</c:forEach>

									</tr>
								</tbody>
							</table>
						</form>
					</DIV>
				</div>
				<br>
				<br>
				<br>


				<div id="my_req">
					<table class="table table-hover">
						<c:set var="count1" value="1" />
						<thead>
							<tr>
								<th colspan="5" style="font-size: 27px; text-align: left;">나의
									예약 내역</th>
							</tr>
							<tr>
								<th>번 호</th>
								<th>예약기간</th>
								<th>비품명</th>
								<th>수 량</th>
								<th>반 납</th>
							</tr>
						</thead>

						<c:forEach var="list3" items="${list3}">
							<form name="vacation" method="post"
								action="/Education/administer/ItemPro.do">
								<tbody>
									<tr>
										<th>${req_number2}<c:set var="req_number2" value="${req_number2 + 1}" /></th>
										<td>${list3.item_start }&nbsp;~&nbsp;${list3.item_end }</td>
										<td>${list3.item_name}
											<input type="hidden" name="item_num3" value="${list3.item_num }" />
											<input type="hidden" name="item_name3" value="${list3.item_name }" /> 
											<input type="hidden" name="item_count3" value="${list3.item_req_count }" />
										</td>
										<td>${list3.item_req_count }</td>
										<td><button class="btn btn-warning"
												onclick="return1(this.form)">&nbsp;&nbsp;반
												납&nbsp;&nbsp;</button></td>
									</tr>
							</form>
						</c:forEach>
						</tbody>
					</table>
				</div>

			</div>
			<br>
			<br>



			<div id="req">
				<table class="table table-hover">
					<c:set var="count1" value="1" />
					<thead>
						<tr>
							<th colspan="5" style="font-size: 27px; text-align: left;">전체
								예약 내역</th>
						</tr>
						<tr>
							<th>번 호</th>
							<th>대여자</th>
							<th>예약기간</th>
							<th>비품명</th>
							<th>수량</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="list2" items="${list2}">
							<form name="vacation1" method="post"
								action="/Education/administer/ItemPro.do">
								<tr>
									<th>${req_number}<c:set var="req_number"
											value="${req_number + 1}" />
									</th>
									<td>${list2.t_name }</td>
									<td>${list2.item_start }&nbsp;~&nbsp;${list2.item_end }</td>
									<td>${list2.item_name}</td>
									<td>${list2.item_req_count }</td>
								</tr>
							</form>
						</c:forEach>
					</tbody>
				</table>
			</div>

		</div>
		<br>
		<br>


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