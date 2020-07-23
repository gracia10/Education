<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<title>일지페이지</title>


    <!-- FontAwesome JS-->
    <script defer src="https://use.fontawesome.com/releases/v5.1.1/js/all.js" integrity="sha384-BtvRZcyfv4r0x/phJt9Y9HhnN5ur1Z+kZbKVgzVBAlQZX4jvAuImlIz+bG7TS00a" crossorigin="anonymous"></script>

    <!-- Theme CSS --> 
	<link id="theme-style" rel="stylesheet" href="/Education/Sunghee/plugins/layout/pillar-3.css">
	
	<!-- jquery -->
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	
	<style>
		.btn-primary:hover {
		    color: #fff;
		    background-color: #1b814f;
		    border-color: #197748;
		}
		
		.btn-primary {
		    color: #fff;
		    background-color: #22A162;
		    border-color: #22A162;
		}
		
		a {color: #22A162;}
		
		
	</style>
	

</head>
<body>

	<article class="resume-wrapper text-center position-relative">
		<div class="resume-wrapper-inner mx-auto text-left bg-white shadow-lg">
			<div class="resume-body p-5">
				<!-- 뒤로가기 -->
				<a href="/Education/Diary/diary_list.do?s_no=${article.s_no}&d_yy=${article.d_yy}&d_mm=${article.d_mm}">
					<i class="fas fa-arrow-alt-circle-left fa-3x"></i>
				</a>
				
				<!-- 제목 -->
				<div class="d-flex flex-column text-center">
					<h1 class="font-weight-bold" >${article.d_subject}</h1>
				</div>
				
				<!-- 글 삭제, 수정 -->
				<div class="resume-company-name ml-auto text-right " style="font-size:medium">	
					<c:if test="${fn:contains(sessionScope.memId,'teacher')}">
					<a href="/Education/Diary/dairy_update.do?d_num=${d_num}">수정</a>&nbsp;
					<a href="/Education/Diary/dairy_delete.do?d_num=${d_num}" onclick="return del_article()">삭제</a>
					</c:if>
				</div>
				<hr>
				
				<!-- 본문 -->
				<div class="dia_content">${article.d_content}</div>
				<hr>
				
				<!-- 댓글 -->
				<div class="dia_comment">
				
					<!-- 댓글 등록 -->
			  		<div class="card my-4">
			        	<h5 class="card-header">댓글</h5>
			          	<div class="card-body" >
							<form id="commentForm">
								<input type="hidden" value="${d_num}" id="d_num" name="d_num"> 
								<div class="form-group">
									<textarea class="form-control" id="dc_content" name="dc_content" rows="3" placeholder="의견을 남겨주세요." required></textarea>
								</div>
								<div align="right"><input type="button" value="등록" class="btn btn-primary" onClick="replace_com()"></div>
						    </form>
			          	</div><!-- card-body -->
			        </div><!-- card -->
					
    				<!-- 댓글 목록 -->
					<div class="media mb-4">
						<div class="container" class="media-body">
							<div id="commentList">
						    <!-- 댓글 들어오는 곳 -->
						    </div>
						</div>
					</div>
										
				</div><!-- dia_comment -->
				
		 	</div><!-- resume-body -->
		</div><!-- resume-wrapper-inner -->
	</article>
	
	<script>
	/*페이지 로딩시 댓글 가져옴*/
	$(function(){
	    getCommentList();
	});
	
	/* 댓글 불러오기 */
	function getCommentList(){
	    $.ajax({
	        type:'GET',
	        url : "<c:url value='/Diary/getcomments.do'/>",
	        data:{	"d_num": $("#d_num").val() },
	        dataType: "json",
	        success : function(data){
	       
	            var html = "";
	            var name = "";
	            
	            if(data.length > 0){
	                for(i=0; i<data.length; i++){
	                	
	                	if(data[i].commenter.indexOf('teacher') > -1){ 
	          				name = '담당선생님';
	                	}else{ 
	                		name = '학부모님'; 
	                	}
	                	
	                    html += "<h6 class='mt-0 font-weight-bold'><strong>"+name+"</strong></h6>";
	                    html += "<div id='update_com_"+data[i].dc_num+"'>";									
	                    html += "<span id='output_com_"+data[i].dc_num+"'>"+data[i].dc_content+"</span><br>";
	                    html += "<small>("+data[i].dc_reg_date+")";
	                    if('${sessionScope.memId}'== data[i].commenter){ 
		                    html += "&nbsp;&nbsp;<a href='javascript:;' id='comment_Edit_"+data[i].dc_num
		                    html += "' onclick='update_form("+data[i].dc_num+")'>수정</a>";
		                    html += "&nbsp;<a href='javascript:;' onclick='return del("+data[i].dc_num+")'>삭제</a>";
	                	}
	                    html += "</small>";
	                    html += "</div>";
	                    html += "<hr>";
	                }
	                
	            } else {
	                html += "<h5 class='mt-0'>Commenter Name</h5>";
	                html += "등록된 댓글이 없습니다.";
	                html += "<hr/>";
	            }
	            $("#commentList").html(html);
	        },
	        error:function(request,status,error){
	        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       	}
	    });
	}
	
	/* 새댓글에 태그 추가 */
	function replace_com(){
		var txtBox = document.getElementById("dc_content");
		var lines = txtBox.value.split("\n");
		
		var resultString  = "<p>";
		for (var i = 0; i < lines.length; i++) {
		  	if(i == lines.length-1){
		  		resultString += lines[i];
		  	}else{
		  		resultString += lines[i] + "<br>";			  		
		  	}
		}
		 resultString +="</p>";
		 txtBox.value = resultString;
		comment_write();
	}
	
	
	/*글 삭제 의사*/
	function del_article(){
		return (confirm("삭제하시겠습니까")? true : false);
	}
	
	</script>
	<script>

	/*댓글 디비 추가*/
	function comment_write(){
	    $.ajax({
	        type:'POST',
	        url : "<c:url value='/Diary/dairy_commentwrite.do'/>",
	        data:{	"d_num": $("#d_num").val(),
					"dc_content": $("#dc_content").val()},
	        success : function(data){
		        	if(data === "success"){
			            getCommentList(); 
		                $("#dc_content").val("");
				    }else{
						alert("정상적으로 처리되지 못했습니다. 잠시 후 이용해주세요.");
					}
	        },
	        error:function(request,status,error){
	        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       }
	        
	    });
	}
	
	/*댓글 삭제 의사*/
	function del(dc_num){
		if(confirm("삭제하시겠습니까")){
			comment_delete(dc_num);
		}else{
			return false;
		}
	}
	
	/*댓글 디비 삭제*/
	function comment_delete(dc_num){
	    $.ajax({
	        type:'POST',
	        url : "<c:url value='/Diary/dairy_commentdelete.do'/>",
	        data:{	"dc_num": dc_num },
	        success : function(data){
	        	if(data === "success"){
		            getCommentList(); 
			    }else{
					alert("정상적으로 처리되지 못했습니다. 잠시 후 이용해주세요.");
				}
	        },
	        error:function(request,status,error){
	        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       }
	        
	    });
	}

	/*댓글 수정 에이젝스*/
	function comment_update(dc_num){
	    $.ajax({
	        type:'POST',
	        url : "<c:url value='/Diary/dairy_commentupdate.do'/>",
	        data:{	"dc_num": dc_num,
					"dc_content": $("#dc_content_"+dc_num).val()},
	        success : function(data){
	        	if(data === "success"){
		            getCommentList(); 
			    }else{
					alert("정상적으로 처리되지 못했습니다. 잠시 후 이용해주세요.");
				}
	        },
	        error:function(request,status,error){
	        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       }
	    });
	}
		
	/*댓글 수정 폼*/
	function update_form(dc_num){
		var inner_html = document.getElementById('output_com_'+dc_num).innerHTML;		
		var txt_id = "dc_content_"+dc_num;
		var inner_txt = remove_tag(inner_html);
		
		var html = '<form id="updateForm">';
			html += '<textarea class="form-control" name="dc_content" rows="3" id="'+txt_id+'">';
			html += inner_txt+'</textarea><br><input type="hidden" name="dc_num" value='+dc_num+'>';
			html += '<div align="right"><input type="button" value="등록" class="btn btn-primary"'
			html += ' onclick="return replace_com2('+dc_num+')"></div></form>';
			document.getElementById('update_com_'+dc_num).innerHTML = html;
	}
	
	/* 댓글수정시 <p>태그 제거 */
	function remove_tag(com){
		var re_com = com.replace(/<br>/gi,"\n");
		re_com = re_com.replace("<p>","");
		re_com = re_com.replace("</p>","");
		return re_com;
	}
	
	/* 댓글수정 등록시 태그추가 */
	function replace_com2(dc_num){
		var txtBox = document.getElementById('dc_content_'+dc_num);
		var lines = txtBox.value.split("\n");
		var resultString  = "<p>";
		
		for (var i = 0; i < lines.length; i++) {
			if(i == lines.length-1){
		  		resultString += lines[i];
		  	}else{
		  		resultString += lines[i] + "<br>";			  		
		  	}
		}
		 resultString +="</p>";
		 txtBox.value = resultString;
		 comment_update(dc_num);
	}
	
	
	</script>
</body>
</html>