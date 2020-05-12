<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<title>보육의 정석</title>

<!-- <style>
.android-be-together-section {
  position: relative;
  height: 800px;
  width: auto;
  background-color: #f3f3f3;
  background: url('${pageContext.request.contextPath}/imgSave/main_top.jpg') center 30% no-repeat;
  background-size: cover;
}
</style> -->

<style>
#out {
 width: 100%;
 text-align: center;
 }
 
  #ad{
 overflow-x:visible;
 overflow-y:visible;
 }
</style>

</head>
<body>

<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header"><!-- ******* -->
	<div>
	<jsp:include page="header.jsp" flush="false"/>
	</div>
	<div class="android-content mdl-layout__content" id="ad">
        <a name="top"></a>
     
    <!-- ******* -->   
    <div id="out">
        <c:forEach var="list" items="${list1 }">
		<c:set var="img" value="${list.main_img }" />
		
		<div class="android-wear-section">
       	<img src="${pageContext.request.contextPath}${fn:substring(img,85,120)}" alt="M_img" style="width: 100%; height: 750px;">
          <div class="android-wear-band">
            <div class="android-wear-band-text">
              <div class="mdl-typography--display-2 mdl-typography--font-thin">${list.main_subject }</div>
              <p class="mdl-typography--headline mdl-typography--font-thin">${list.main_content }</p>
              <c:if test="${list_size == 1 }">
              <p>
                <a class="mdl-typography--font-regular mdl-typography--text-uppercase android-alt-link" href="/Education/main/TeacherProfile.do">
                  Go to teacher Page!&nbsp;<i class="material-icons">chevron_right</i>
                </a>
              </p>
              </c:if>
            </div>
          </div>
        </div> 
		<c:set var="list_size" value="${list_size-1 }" />
		</c:forEach>
    </div>    
      	
	<!-- ******* -->
</div>	
	
	<div class="fixed-bottom">
	<jsp:include page="footer.jsp" flush="false"/>
	</div>
	
</div>
</body>
</html>

