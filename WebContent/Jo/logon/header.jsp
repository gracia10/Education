<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Introducing Lollipop, a sweet new take on Android.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>Android</title>

    <!-- Page styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.min.css">
    <link rel="stylesheet" href="/Education/main/styles.css">


  </head>
  <body>
  <!-- <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header"> ddddddddd(선생님 프로필)-->
    <div class="android-header mdl-layout__header mdl-layout__header--waterfall">
        <div class="mdl-layout__header-row" style="height:110px;margin-left: 12%; margin-right: 13%; padding:0;">
          <span class="android-title mdl-layout-title">
            <a href="/Education/main/Main.do">
            <!-- <img class="android-logo-image" style="height:100px;"src="images/jewel_logo.png"> -->
            <img class="android-logo-image" src="/Education/main/images/main_logo.png" style="height:80px; padding:0 10px"></a>
          </span>
          <!-- Add spacer, to align navigation to the right in desktop -->
          <div class="android-header-spacer mdl-layout-spacer"></div>
           <div class="android-search-box mdl-textfield mdl-js-textfield mdl-textfield--expandable mdl-textfield--floating-label mdl-textfield--align-right mdl-textfield--full-width">
            <!-- 우리는 검색없어!
            <label class="mdl-button mdl-js-button mdl-button--icon" for="search-field">
              <i class="material-icons">search</i>
            </label> -->
            <div class="mdl-textfield__expandable-holder">
              <input class="mdl-textfield__input" type="text" id="search-field">
            </div>
          </div> 
          <!-- Navigation -->
          <div class="android-navigation-container">
            <nav class="android-navigation mdl-navigation" style="color:#34cbd6;">
            	<c:choose>
            		<c:when test="${sessionScope.memId == null }">
            		</c:when>
            		<c:otherwise>
            			 <span class="mdl-navigation__link mdl-typography--text-uppercase" style="padding-right:10px;">${sessionScope.memId }님 환영합니다.</span>
            		</c:otherwise>
            	</c:choose>
              <a class="mdl-navigation__link mdl-typography--text-uppercase" href="/Education/main/Intro.do">보석 소개</a>
              <a class="mdl-navigation__link mdl-typography--text-uppercase" href="/Education/main/Service.do">서비스 안내</a>
              <a class="mdl-navigation__link mdl-typography--text-uppercase" href="/Education/main/TeacherProfile.do">선생님 소개</a>
              <a class="mdl-navigation__link mdl-typography--text-uppercase" href="/Education/main/Notice.do">보석 소식</a>
              <a class="mdl-navigation__link mdl-typography--text-uppercase" href="/Education/main/Qna.do">문의게시판</a>
<!--          <a class="mdl-navigation__link mdl-typography--text-uppercase" href="">One</a>
              <a class="mdl-navigation__link mdl-typography--text-uppercase" href="">Play</a> -->
            </nav>
          </div>
           <button class="android-more-button mdl-button mdl-js-button mdl-button--icon mdl-js-ripple-effect" id="more-button">
            <i class="material-icons">more_vert</i>
          </button>
          <c:choose>
          	<c:when test="${sessionScope.memId == null }">
          <ul class="mdl-menu mdl-js-menu mdl-menu--bottom-right mdl-js-ripple-effect" for="more-button">
            <li class="mdl-menu__item" onclick="document.location.href='/Education/Jo/logon/login.do'">로그인</li>
            <li class="mdl-menu__item" onclick="document.location.href='/Education/Jo/logon/inputForm.do'">회원가입</li>
          </ul>          	
          	</c:when>
          	<c:otherwise>
          <ul class="mdl-menu mdl-js-menu mdl-menu--bottom-right mdl-js-ripple-effect" for="more-button">
			<c:choose>
				<c:when test="${sessionScope.memId eq 'admin' }">
            		<li class="mdl-menu__item" onclick="document.location.href='/Education/administer/HomepageManage.do'">마이페이지</li>
            	</c:when>
            	<c:when test="${fn:substring(sessionScope.memId, 0, 7) eq 'teacher'}">
            		<li class="mdl-menu__item" onclick="document.location.href='/Education/Teacher/teacher_Mypage.do'">마이페이지</li>
            	</c:when>
            	<c:otherwise>
            		<li class="mdl-menu__item" onclick="document.location.href='/Education/User/user_Mypage.do'">마이페이지</li>
            		<li class="mdl-menu__item" onclick="document.location.href='/Education/Jo/logon/passCheckForm.do'">회원정보수정</li>
            	</c:otherwise>
            </c:choose>
            		<li class="mdl-menu__item" onclick="document.location.href='/Education/Jo/logon/logout.do'">로그아웃</li>
          </ul>
          </c:otherwise>
          </c:choose> 
        </div>
      </div>
      
   
    <script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
  </body>
</html>
