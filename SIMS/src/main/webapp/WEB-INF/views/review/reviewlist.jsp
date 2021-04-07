<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<html>
	<head>
	 	<title>강의평</title>
	</head>
	
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
				  width: 100px;
				  height: 30px;
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
		  width: 700px;
		  margin-left: auto; 
		  margin-right: auto;
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
		  text-align: left;
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
	
	<body>
		<div>
			<%@include file="../Style/menubar.jsp" %>
		</div>
		
		<div style="margin-top:100px; text-align:center; font-weight: bold; color: #2b1911;">
			<h1>강의 후기</h1>
			<h3>수강생들의 후기를 확인하세요.</h3>
		</div>
		<div>
			<section id="container">
				<form autocomplete="off" role="form" method="post" action="/SIMS/review/reviewlist">
				
				<div style="margin-top:120px; margin-bottom:50px; text-align:center; font-weight: bold; color: #2b1911;">
				
				<input type="hidden" name="course_number" value="${Course_Number}" readonly="readonly"/>
				<c:if test="${Writable !='UNABLE'}">			
					<button style="float:right; margin-right:400px;" type="button" onclick="location.href='/SIMS/review/writeView?course_name=${CourseName}&professor=${Professor}&course_number=${Writable}&university=${University}' ">강의평쓰기</button>			
				</c:if>
				<br>
				<br>
				<br>
				
				<table style="margin-bottom:50px;">
					<tr>
						<th colspan="2">${CourseName}</th>
					</tr> 
					<tr>
						<td style="background:#fafafa;">교수명 </td>
						<td>${Professor}</td>
					</tr>
					<tr>
						<td style="background:#fafafa;">전공 </td>
						<td>${CourseInfo.major}</td>
					</tr>
					<tr>
						<td style="background:#fafafa;">학점</td>
						<td>${CourseInfo.credit}</td>
					</tr>
					<tr>
						<td style="background:#fafafa;">수강평</td>
						<td>
							<script>
			
									for(var j=0;j<${AvgStar};j++){
										document.write("★");
									}
									for(var j=0;j<5-${AvgStar};j++){
										document.write("☆");
									}
								
							</script>
						</td>
					</tr>
					<tr>
						<td style="background:#fafafa;">시간 </td>
						<td>${CourseInfo.ctime}</td>
					</tr>
				</table>
				
				
					
				
				<table style="margin-bottom:150px;">
				
					<tr>
						<th colspan="2">수강평</th>
					</tr>
					
					<c:forEach items="${reviewlist}" var = "reviewlist">
						<tr>
							<td style="width:100px;"><c:out value="${reviewlist.semester}" /> &nbsp;&nbsp;</td>
							<td>
							<script>
							for(var j=0;j<${reviewlist.star_point};j++){
								document.write("★");
							}
							for(var j=0;j<5-${reviewlist.star_point};j++){
								document.write("☆");
							}
							</script>
							</td>	
						</tr>
						<tr>
							<td>강의평</td>
							<td><c:out value="${reviewlist.course_review}" /></td>
						</tr>
						<tr>
						<td style="background:#f4f4f4;" colspan="2">
						</td>
						</tr>
					</c:forEach>	
				</table>
				</div>
				</form>
			</section>
		</div>
	</body>
</html>