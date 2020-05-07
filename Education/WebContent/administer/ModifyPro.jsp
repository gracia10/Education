<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<title>회원정보수정</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<table align="center">
  <tr> 
    <td >
	  <b>회원정보가 수정되었습니다.</b></td>
  </tr>
  <tr>
    <td  align="center"> 
      <p>입력하신 내용대로 수정이 완료되었습니다.</p>
    </td>
  </tr>
  <tr>
    <td align="center"> 
      <form>
	    <input type="button" value="메인으로" onclick="window.close()">
      </form>
      <!-- 5초후에 메인으로 이동합니다.<meta http-equiv="Refresh" content="0;url=/mvc/logon/main.do" > -->
    </td>
  </tr>
</table>
</body>
</html>