<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%String str1=request.getParameter("course_number"); %>
<%String str2=request.getParameter("course_name"); %>
<%String str3=request.getParameter("university"); %>
<html> <!-- for writing page -->
	<head>
	 	<title>답변형 게시판 입력하기</title>
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<!-- css for table value-->	
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
	<!-- event function -->
		<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/SIMS/Noticeboard/write");
				formObj.attr("method", "post");
				formObj.submit();
			});
		})
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .check").length;
			for(var i = 0; i<regForm; i++){
				if($(".check").eq(i).val() == "" || $(".check").eq(i).val() == null){
					alert($(".check").eq(i).attr("title"));
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
			<h1>과목 공지사항 글쓰기</h1>
		</div>
		
		<div id="root">

			<section id="container">
				<form autocomplete="off" name="writeForm" method="post" action="/SIMS/Noticeboard/write">
				<c:set var="professor_id" value="${Professor_ID}" />
				<c:set var="professor" value="${Professor}" />
				<c:set var="course_number" value="<%=str1 %>" />
				<c:set var="course_name" value="<%=str2%>" />	
				<c:set var="university" value="<%=str3%>" />
				<input type="hidden" id="university" name="university" value="${university}" />
				<input type="hidden" id="course_number" name="course_number" value="${course_number}" />
				<input type="hidden" id="writer" name="writer" value="${Professor_ID}" />
				<input type="hidden" id="course_name" name="course_name" value="${course_name}" />
				<input type="hidden" id="professor_name" name="professor_name" value="${Professor}" />
					<table>

						<tbody>    <!--print format -->
						<tr>
							 <th colspan="2" style="font-weight: bold">게시판 입력하기</th>
							 </tr>
							<tr style="text-align:center;">
								<td style="background:#fff3f3;">
									<label for="writer">이름</label> 
									</td>
									<td style="text-align:left">
									<c:out value="${Professor}" />
									(<c:out value="${Professor_ID}" />)
									</td>	
							</tr>	
							<tr style="text-align:center">
								<td style="background:#fff3f3;">
									<label for="title">제목</label>
									</td>
								<td style="text-align:left"><input type="text" id="title" name="title" class="check" title="제목을 입력하세요" style=" width:50%; text-align:left"/>
								</td>
							</tr>
							<tr style="height:60%; text-align:center;">
								<td style="background:#fff3f3;">
									<label for="content">내용</label>
									</td>
								<td style="text-align:left;">	
								<textarea style="width:100%; height:280px;" id="content" name="content" class="check" title="내용을 입력하세요"  style="width:100%; height:100%; white-space:normal"></textarea>
							<tr style="text-align:center">
								<td colspan="3">	<!-- button-->					
									<button type="submit" class="write_btn">저장하기</button>
									<button type="reset" >다시쓰기</button>
									<button type="button" onclick="location.href='/SIMS/Noticeboard/list?course_name=${course_name}&professor=${professor}&course_number=${course_number}&university=${university}&type=교수' ">돌아가기</button>
								</td>
							</tr>			
						</tbody>			
					</table>
				</form>
			</section>
		</div>
	</body>
</html>