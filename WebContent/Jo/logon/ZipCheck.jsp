<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="logon.ZipcodeBean"%>
<%@ page import="logon.LogonDBBean"%>
<%@ page import="java.util.ArrayList"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<!-- 우편번호 검색 페이지 -->

<style>
#zipcode {
	height: 100%;
	text-align: center;
	font-size: large;
	margin-left: 10%;
	margin-right: 10%;
}
</style>


<script>
	function dongCheck() {
		if (document.zipForm.area4.value == null || document.zipForm.area4.value == "") {
			alert("동이름을 입력하세요");
			document.zipForm.area4.focus();
			return;
		}
		document.zipForm.submit();
	}

	function send(zipcode, area1, area2, area3, area4) {
		var u_addr = area1 + " " + area2 + " " + area3 + " " + area4;
		opener.document.userinput.zipcode.value = zipcode;
		opener.document.userinput.u_addr.value = u_addr;
		self.close();
	}
</script>

<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta charset="utf-8">
<title>우편번호 찾기</title>
<!-- Bootstrap -->
<link href="../../LogonBoot/css/bootstrap.min.css" rel="stylesheet">
<!-- font awesome -->
<link rel="stylesheet" href="../../LogonBoot/css/font-awesome.min.css" media="screen" title="no title" charset="utf-8">
<!-- Custom style -->
<link rel="stylesheet" href="../../LogonBoot/css/style.css" media="screen" title="no title" charset="utf-8">
</head>

<body>
	<div id="zipcode">
		<h3><b>우편번호 찾기</b></h3>
		<form name="zipForm" method="post" action="/Education/Jo/logon/ZipCheck.do">
			<div class="form-group">
				<label for="area4">도로명주소 입력</label>
				<div class="input-group">
					<input type="text" class="form-control" name="area4" id="area4" size="10px" required>
					<span class="input-group-btn">
					<input type="button" class="btn btn-info"
					style="border-top-right-radius: 4px; border-bottom-right-radius: 4px;"
					value="검색" onclick="dongCheck()">
					<input type="hidden" name="check" value="n">
					</span>
				</div>
			</div>
		</form>
		
		<c:if test="${check eq 'y'}">
		주소를 검색해주세요.<br>
		</c:if>
		
		<c:if test="${check eq 'n'}">
			<c:if test="${empty zipcodeList}">
			검색된 결과가 없습니다.<br>
			</c:if>

			<c:if test="${!empty zipcodeList}">
			아래 우편번호를 클릭하면 자동으로 입력됩니다.<br>
				<br>
				<c:forEach var="zipcode" items="${zipcodeList}">
					<c:set var="tempZipcode" value="${zipcode.zipcode}" />
					<c:set var="temptArea1" value="${zipcode.area1}" />
					<c:set var="temptArea2" value="${zipcode.area2}" />
					<c:set var="temptArea3" value="${zipcode.area3}" />
					<c:set var="temptArea4" value="${zipcode.area4}" />
					<a href="javascript:send('${tempZipcode}','${temptArea1}',
					'${temptArea2}','${temptArea3}','${temptArea4}')">${tempZipcode}&nbsp;<br>${temptArea1}
						&nbsp;${temptArea2}&nbsp;${temptArea3}&nbsp;<br>${temptArea4}</a>
					<br>
			<hr size="1px" align="center">
				</c:forEach>
			</c:if>
		</c:if>

		<br><a href="javascript:this.close();">닫기</a><br>
		
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../../LogonBoot/js/bootstrap.min.js"></script>
</body>
</html>