<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%String str1=request.getParameter("course_number"); %>
<%String str2=request.getParameter("type"); %>
<%String str3=request.getParameter("university"); %>
<%String str4=request.getParameter("course_name"); %>
<%String str5=request.getParameter("idx"); %>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<style>
	@import url(https://cdn.rawgit.com/theeluwin/NotoSansKR-Hestia/master/stylesheets/NotoSansKR-Hestia.css);
	
	body{
		font-family:'Noto Sans Korean';
	}
	 		*:focus { outline:none; }
			html, body
			{
			    margin: 10px;
			}
			
			body
			{
			    margin: 0 auto;
			}
			
			.container
			{
			    height: 100%;
			    display: table-cell;
			    vertical-align: middle;
			}
			
			.main
			{
			    height: 200px;
			    width: 200px;
			    background-color: blue;     
			}
			
			button {
				  width: 80px;
				  height: 25px;
				  font-size:5px;
				  color: black;
				  text-align: center;
				  background: #ffb6b6;
				  border-radius: 20px;
				  margin:5px;
				  margin-bottom:0px;
				  border: none; 
				  outline:none;
			}
			
			button:disabled{
				width: 80px;
				  height: 25px;
				  font-size:5px;
				  color: black;
				  text-align: center;
				  background: #ebebeb;
				  border-radius: 20px;
				  
			}

		
		.underline{
			 border:none;
  			outline:none;
  			margin:10px;
  			border-bottom: 2px solid #adadad;
		  margin-bottom: 30px;
		  font-size:20px;
		  
		}
		
		table {
		background: #fcfcfc;
		  border-collapse: separate;
		  border-spacing: 0;
		  width: 1000px;
		  margin-left: auto; 
		  margin-right: auto;
		  margin-top:100px;
		  margin-bottom:150px;
		}
		table tr th,
		table tr td {
		  border-right: 1px solid #bbb;
		  border-bottom: 1px solid #bbb;
		  padding: 5px;
		}
		table tr th:first-child,
		table tr td:first-child {
		
		  border-left: 1px solid #bbb;
		}
		table tr th {
		  background: #f5f5f5;
		  border-top: 1px solid #bbb;
		  border-bottom: 5px solid #ff8b8b;
		  text-align: center;
		  
		}
		
		/* top-left border-radius */
		table tr:first-child th:first-child {
		  border-top-left-radius: 6px;
		}
		
		/* top-right border-radius */
		table tr:first-child th:last-child {
		  border-top-right-radius: 6px;
		}
		
		/* bottom-left border-radius */
		table tr:last-child td:first-child {
		  border-bottom-left-radius: 6px;
		}
		
		/* bottom-right border-radius */
		table tr:last-child td:last-child {
		  border-bottom-right-radius: 6px;
		}
		
		 a:link { color: black; text-decoration: none;}
		 a:visited { color: black; text-decoration: none;}
		 a:hover {text-decoration: none;}

		
		.li_css {list-style: none; float: left; padding: 4px;}
			 
		  .ul_css {
			  display: table;
			  margin-left: auto;
			  margin-right: auto;
			}
			
			
	</style>
	 		 	
	</head>
	<!-- for button function-->	
	<script type="text/javascript">   <!-- button's functions-->	
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			// modify		
			$(".update_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/SIMS/Noticeboard/update");
				formObj.attr("method", "post");
				formObj.submit();
			})
			
			var formObj = $("form[name='readForm']");
			// delete 
			$(".delete_btn").on("click", function(){
				formObj.attr("action", "/SIMS/Noticeboard/delete");
				formObj.attr("method", "post");
				formObj.submit();
			})


			
		})
		function fn_valiChk(){
			var updateForm = $("form[name='readForm'] .chk").length;
			for(var i = 0; i<updateForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
			}
	
	

	</script>
	
	<body>
	
		<div>
			<%@include file="../Style/menubar.jsp" %>
		</div>
		
		<div style="margin-top:100px; text-align:center; font-weight: bold; color: #2b1911;">
			<h1>과목 공지사항</h1>
		</div>
		
		<div id="root">
			<header>
		
			</header>

			<section id="container">
				<form autocomplete="off" name="readForm" role="form" method="post" action="/SIMS/Noticeboard/readView">
				  	<input type="hidden" id="bno" name="bno" value="${read.bno}" />
				    <c:set var="course_number" value="<%=str1 %>" />	
				  	<c:set var="type" value="<%=str2%>" />	
				  	<c:set var="university" value="<%=str3%>" />
				  	<c:set var="course_name" value="<%=str4%>" />
				 	 <c:set var="idx" value="<%=str5%>" />
					<input type="hidden" id="university" name="university" value="${university}" />
					<input type="hidden" id="course_number" name="course_number" value="${course_number}" />
					<input type="hidden" id="type" name="type" value="${type}" />
					<input type="hidden" id="course_name" name="course_name" value="${course_name}" />

				<!-- table for print format -->	
					<table>
						<tbody>
							<c:choose>
						
							<c:when test = "${empty idx}">
								<tr style="text-align:center">
									<th>작성자</th><th>작성일</th><th>조회수</th>				
								</tr>
								<tr style="text-align:center">
									<td>${read.professor_name}(${read.writer})</td>
									<td> 
										<fmt:formatDate value="${read.regdate}" pattern="yyyy/MM/dd(E) HH:mm" />	
									</td>
									<td>${read.hit}</td>
								</tr>
							</c:when>
							
							<c:otherwise>
								<tr style="text-align:center">
									<th>글번호</th><th>작성자</th><th>작성일</th><th>조회수</th>				
								</tr>
								<tr style="text-align:center">
									<td>${idx}</td>
									<td>${read.professor_name}(${read.writer})</td>
									<td> 
										<fmt:formatDate value="${read.regdate}" pattern="yyyy/MM/dd(E) HH:mm" />	
									</td>
									<td>${read.hit}</td>
								</tr>
							</c:otherwise>
							</c:choose>
							
							<tr style="text-align:center">
								<td style="background:#fff3f3;">
									<label for="title">제목</label>
								</td>
								<td colspan="3" style="text-align:left">	
									<input type="text" id="title" name="title" value="${read.title}" class="chk" title="제목을 입력하세요" style="width:60%;"/>	
								</td>
							<tr style="text-align:center; vertical-align: middle; height:300px;">
								<td style="background:#fff3f3;">
									<label for="content">내용</label>
								</td>
								<td colspan="3" style="text-align:left; vertical-align:top" >	
									<textarea id="content" name="content" class="chk" title="내용을 입력하세요" style="width:100%; height:280px;"><c:out value="${read.content}" /></textarea>
								</td>
							</tr>
							<tr style="text-align:center">
								<td colspan="4">
								<c:set var="prof" value="교수" />	
								<c:if test="${type==prof}">
								<button type="submit" class="update_btn">수정하기</button>
								<button type="submit" class="delete_btn">삭제하기</button>
								</c:if>
								<button type="button" onclick="location.href='/SIMS/Noticeboard/list?&course_name=${read.course_name}&course_number=${course_number}&university=${university}&type=${type}'">돌아가기</button>
								</td>
							</tr>
						
																		
					</tbody>			
				</table>
				</form>
			</section>
		</div>
	</body>
</html>