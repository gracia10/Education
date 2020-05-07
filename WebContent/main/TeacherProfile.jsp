<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
<title>보육의 정석 | 선생님 소개</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
  <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  


<style>

html,body{height:100%}
body{margin:0}
#body{min-height:75%}
#content{padding-bottom:1.9em}

 .container {
 background-color: #f3f3f3;
 overflow: scroll;
}

#out {
 width: 100%; 
 text-align: center;

 }
#in {
 vertical-align: middle;
 display: inline-block;
 margin-left:50;
 margin-right:50;

 }
 
 #in2 {
    display:inline;
    margin-left:300;
 }
 
 #foot {
      margin-top: -1.9em;
      height: 1.9em;
      }
 
 #profile{
   width:800;
   display:inline;
   text-align: center;
    float:right;
   margin-right:100; 
 }
 
 #content{
        padding-top: 2rem;
        /* padding-bottom: 2rem; */
        max-width: 80%;
        margin-left: 20%;
        margin-right: 20%; 
      padding-bottom: 1.9em;
      }
 
 #img {
    width: 1200px;
    height: 60%;
    /* background-image: url("./images/hi01.png"); */
    /* background-repeat: no-repeat;
    background-size: 800px 500px; */
 }
 #img img{
    width: 90%;
 }
  
  .name_list{
  
  padding: 3px;
  
  }
</style>

<script>
function apply(formName){
   //alert(formName.t_id.value);
   url="./ConsultApply.do?t_id="+formName.t_id.value;
   formName.eunju.value = 1;
   
   window.open(url,"post333","toolbar=no ,width=600 ,height=350,directories=no,status=yes,scrollbars=yes,menubar=no");

}

function noimg(formName){
      //alert(formName.t_id.value);
      formName.eunju.value = 1;

   }

</script>

</head>
<body>   
<!-- 헤더 -->
   <div>
      <jsp:include page="header.jsp" flush="false"/>
   </div>   
   <div id="body" style="margin-bottom: 32px;">
   <div id="content">      
   
<!-- <div class="android-content mdl-layout__content container"> -->
<a name="top"></a>




<fieldset>
<h3 style="padding-left: 5%;">│선생님 소개</h3>

<div class="name_list">

   <div style="padding-left: 6%";>
   <form name="12343141">
    <c:forEach var="p1" items="${pro1}">
       <c:set var="tname11" value="${p1.t_name}" />
       <c:set var="t_id" value="${p1.t_id}" />
       <input type="hidden" name="eunju" value="${eunju}" />
         <button class="btn btn-default" type="submit" id="aa" name="t_id" value="${t_id}" onclick="noimg(this.form)">
         ${tname11}</button>
      </c:forEach>
   </form>   
   </div>
</div>
   <%-- <form name="apply01">
   <input type="hidden" name="t_id" value="${id}" />
      <span style="float:right"> 
      <button style="text-align: right;" class="btn btn-success" type="submit" onclick="apply(this.form)" >상담신청하기</button>
   </span>   
   </form> --%>


   <br />


   <div id="text1">
   <c:forEach var="profile" items="${list1}" >
   <c:set var="id" value="${profile.t_id}" />
    <c:set var="name" value="${profile.t_name}" />
    <c:set var="img" value="${profile.t_img}" />
    <c:set var="tel" value="${profile.t_tel}" />
    <c:set var="intro" value="${profile.t_intro}" />
    <c:set var="career" value="${profile.t_career}" />
   
   <form name="apply01">
   <input type="hidden" name="t_id" value="${id}" />
    <input type="hidden" name="eunju" value="${eunju}" />
      <span style="float:right"> 
      <button style="text-align: right;" class="btn btn-success" onclick="apply(this.form)" >상담신청하기</button>
   </span>   
   </form>
   
   
   <div id="out">
   <div id="in2" class="white">
   <img src="${pageContext.request.contextPath}${fn:substring(img,85,120)}" alt="img" style="width: 330px; height: 200px;">
   </div>
   <div id="in">
   <table class="table">
    <thead>
    </thead>
    <tbody>
      <tr>
        <th>선생님 이름</th>
        <td>${name}</td>
      </tr>      
      <tr>
        <th>연락처</th>
        <td>${tel}</td>
      </tr>
      <tr>
        <th>보육경력</th>
        <td>${career}</td>
      </tr>
      
    </tbody>
  </table>

  
  
  </div>
  </div>

  
  <br />
  
   <div id="profile">
   <h5>소개말</h5>
     
     <hr />
     <p>${intro}</p>   
   </div>
   </c:forEach>
<!-- </div> -->
</fieldset>

<c:if test="${eunju == null}">
<div align="center" id="img">
   <img src="./images/hi01.png" style="border: 3px none; border-radius: 7px;" />
</div>
</c:if>


</div>
</div>


<div id="foot">
         <jsp:include page="footer.jsp" flush="false"/>
      </div>
</body>
</html>