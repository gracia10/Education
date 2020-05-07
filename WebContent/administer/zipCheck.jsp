<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.*,manage.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./color.jspf"%>
 

<%
request.setCharacterEncoding("utf-8");

String check = request.getParameter("check");//n
String area4 = request.getParameter("area4");//동이름

%>

<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  
  
<title>우편번호검색</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
   function dongCheck(){
      if (document.zipForm.area4.value == ""){
         alert("동이름을 입력하세요");
         document.zipForm.area4.focus();
         return;
      }
      document.zipForm.submit();
   }
   
function sendAddress(zipcode,area1,area2,area3,area4){
var address =area1+ " "+area2+ " " +area3+ " " +area4;
opener.document.create_teacher.zipcode.value=zipcode;
opener.document.create_teacher.t_addr.value=address;
window.close();
   }
</script>
</head>
<body>
<br />
<center><h5><b>우편번호 찾기</b></h5></center>
<table>
<form name="zipForm" method="post" action="/Education/administer/ZipCheck.do">
      <tr>
        <td><br>
          도로명 주소 입력 : <input name="area4" type="text">
          <input type="button" value="검색" onclick= "dongCheck();">
        </td>
      </tr>
     <input type="hidden" name="check" value="n">
    </form>

<c:if test="${check eq 'n'}">
<c:if test="${empty totalList}">

   <tr><td align="center"><br>검색된 결과가 없습니다.</td></tr>
</c:if>
<c:if test="${!empty totalList}">

<tr><td align="center"><br>
    ※검색 후, 아래 우편번호를 클릭하면 자동으로 입력됩니다.${check}</td></tr> 

   <c:forEach var="zip" items="${totalList}">
      <c:set var="tempzipcode" value="${zip.zipcode}" />
      <c:set var="temparea1" value="${zip.area1}" />
      <c:set var="temparea2" value="${zip.area2}" />
      <c:set var="temparea3" value="${zip.area3}" />
      <c:set var="temparea4" value="${zip.area4}" />
      
   <tr><td>
   <a href="javascript:sendAddress('${tempzipcode}','${temparea1}','${temparea2 }',
'${temparea3 }','${temparea4 }')">
         ${tempzipcode }&nbsp;${temparea1 }&nbsp;${temparea2 }&nbsp;
${temparea3}&nbsp;${temparea4 }</a><br>

</c:forEach>
</td></tr>
</c:if>
</c:if>

<tr><td align="center"><br><a href="javascript:this.close();">닫기</a><tr></td>
</table>
</body>
</html>