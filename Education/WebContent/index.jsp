<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="teacher.TeacherDBBean" %>

<html>
<head>
<title></title>
</head>
<body>

<c:set var="memId" value="teacherid1" scope="session"/>

<%
	String id = (String) session.getAttribute("memId");

	if(id.contains("teacher")){
		System.out.print("실행1");
		String t_name = TeacherDBBean.getInstance().getName(id);
		session.setAttribute("t_name",t_name);
		response.sendRedirect("/Education/Teacher/teacher_Mypage.do"); 
	}else if(id.equals("admin")){
		System.out.print("실행2");
		response.sendRedirect("/Education/administer/HomepageManage.do"); 
	}else{
		System.out.print("실행3");
		response.sendRedirect("/Education/Mypage/users_Mypage.do"); 
	}
%>

</body>
</html>

