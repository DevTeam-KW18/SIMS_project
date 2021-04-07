<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%String str1=request.getParameter("course_number"); %>
<%String str2=request.getParameter("type"); %>
<%String str3=request.getParameter("university"); %>
<%String str4=request.getParameter("course_name"); %>
<%int idx=0; %>

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
	
	
<html>
	<head>
	 	<title>게시판</title>
 	
	</head>

	<body>
		<div>
			<%@include file="../Style/menubar.jsp" %>
		</div>
		
		<div style="margin-top:100px; text-align:center; font-weight: bold; color: #2b1911;">
			<h1>과목 공지사항</h1>
		</div>
<!-- for listing -->	
			<section id="container">
				<form autocomplete="off" role="form" method="post" action="/SIMS/Noticeboard/write">
				
				  <c:set var="course_number" value="<%=str1 %>" />	
				  <c:set var="type" value="<%=str2%>" />	
				  <c:set var="university" value="<%=str3%>" />
				  <c:set var="course_name" value="<%=str4%>" />
				  
				  <div style="text-align:center; font-weight: bold; color: #2b1911;">
				  	<h3>과목명 : <c:out value="${course_name}"/></h3>
				  </div>
				  
				<input type="hidden" id="university" name="university" value="${university}" />
				<input type="hidden" id="course_number" name="course_number" value="${course_number}" />
				<input type="hidden" id="type" name="type" value="${type}" />
				<input type="hidden" id="course_name" name="course_name" value="${course_name}" />
				
				
				<div style="margin-top:120px; margin-bottom:180px; text-align:center; font-weight: bold; color: #2b1911;">
				 
					<table style="margin-left: auto; margin-right: auto;">
					  <tr><c:if test="${pageMaker.totalCount>0}">
					  <th colspan="5" style="border-bottom: 1px solid #bbb; text-align: right;font-weight: normal;">${pageMaker.totalCount}(${pageMaker.currentpage}/${pageMaker.end}) </th>
					  </c:if></tr>
						<tr><c:if test="${pageMaker.totalCount==0}"><th colspan="5" style="border-top-left-radius: 6px;  border-top-right-radius: 6px; border-bottom: 1px solid #bbb; text-align: right;font-weight: normal;">${pageMaker.totalCount}(0/0) </th></c:if></tr>
						<tr><th>글번호</th><th>이름</th><th>제목</th><th>작성일</th><th>조회수</th></tr>

<!-- count whole course_number -->
				
						 <c:set var="idx" value="<%=idx%>" />
		<!-- for listing -->			 
						<c:forEach items="${list}" var = "list" varStatus="status">
						<input type="hidden" id="time" name="time" value="${list.regdate}" />
						<c:if test="${course_number==list.course_number}" >
					
					
							<tr>
								<td><c:out value="${(pageMaker.totalCount-(pageMaker.currentpage-1)*10)-idx}" /></td>
								 <c:set var="movebno" value="${(pageMaker.totalCount-(pageMaker.currentpage-1)*10)-idx}"/>
								 <c:set var="idx" value="${idx+1}" />
								
								<td>
									<c:out value="${list.professor_name}" />
								</td>

								<c:set var="now" value="<%= new java.util.Date() %>" />
								<c:set var="wday" value="${list.regdate}" />
								<fmt:formatDate  value="${now}" pattern="yyyy/MM/dd" var="now"/>
								<fmt:formatDate  value="${list.regdate}" pattern="yyyy/MM/dd" var="wday"/>
							<!-- print for title -->
								<td style="text-align:left; width:60%;" >

								<c:if test="${now==wday}"><img src= '${pageContext.request.contextPath}/resources/image/new1.png' ></c:if><a href="/SIMS/Noticeboard/reading?bno=${list.bno}&course_name=${course_name}&course_number=${course_number}&university=${university}&type=${type}&idx=${movebno}"><c:out value="${list.title}" /></a>
								<c:if test="${list.hit>10}"><img src= '${pageContext.request.contextPath}/resources/image/hot.gif' ></c:if></td>
								<c:if test="${now==wday}">
								<td><fmt:formatDate  value="${list.regdate}" pattern="a hh:mm"/></td> </c:if>
								<c:if test="${now!=wday}">
								<td><fmt:formatDate  value="${list.regdate}" pattern="yyyy.MM.dd(E)"/></td> </c:if>
								<td><c:out value="${list.hit}" /></td>
							</tr>
								
						</c:if>
						</c:forEach>
					<!-- for page and button -->	
					<tr style="text-align:center">
						<td colspan="5" style="text-align:center" >
							  <ul class="ul_css" style="text-align:center">
							  <!-- start page -->	
							  	 <c:if test="${pageMaker.currentpage > 10}">
							    	<li class="li_css">
							    	<button type="button" onclick="location.href='list${pageMaker.makeQuery(1)}&course_name=${course_name}&professor=${professor}&course_number=${course_number}&university=${university}&type=${type}'  ">start page</button>
							    	</li>
							    </c:if>
							     <c:if test="${pageMaker.currentpage <=10}">
							    	<li class="li_css">
							    	<button type="button"  disabled>start page</button>
							    	</li>
							    </c:if> 
							    <!-- -10 page-->	
							    <c:if test="${pageMaker.prev}">
							    	<li class="li_css">
							    	<button type="button" onclick="location.href='list${pageMaker.makeQuery(pageMaker.startPage - 1)}&course_name=${course_name}&professor=${professor}&course_number=${course_number}&university=${university}&type=${type}'  ">-10 page</button>
							    	</li>
							    </c:if>
							    <c:if test="${!pageMaker.prev}">
							    	<li class="li_css">
							    	<button type="button"  disabled>-10 page</button>
							    	</li>
							    </c:if> 
							    <!---1 page -->	
							     <c:if test="${pageMaker.currentpage >1}">
							    	<li class="li_css">
							    	<button type="button" onclick="location.href='list${pageMaker.makeQuery(pageMaker.currentpage-1)}&course_name=${course_name}&professor=${professor}&course_number=${course_number}&university=${university}&type=${type}'  ">-1 page</button>
							    	</li>
							    </c:if> 
							     <c:if test="${pageMaker.currentpage ==1}">
							    	<li class="li_css">
							    	<button type="button" disabled>-1 page</button>
							    	</li>
							    </c:if> 
							    		<!-- +1 page -->			
							    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
							    	<li class="li_css"><a href="list${pageMaker.makeQuery(idx)}&course_name=${course_name}&professor=${professor}&course_number=${course_number}&university=${university}&type=${type}' ">${idx}</a></li>
							    </c:forEach>
							    
							     <c:if test="${pageMaker.currentpage+1 <= pageMaker.end}">
							    	<li class="li_css">
							    	<button type="button" onclick="location.href='list${pageMaker.makeQuery(pageMaker.currentpage+1)}&course_name=${course_name}&professor=${professor}&course_number=${course_number}&university=${university}&type=${type}' ">+1 page</button>
							    	</li>
							    </c:if> 
							     <c:if test="${pageMaker.currentpage+1>pageMaker.end}">
							    	<li class="li_css">
							    	<button type="button" disabled>+1 page</button>
							    	</li>
							    </c:if> 
						<!-- +10 page-->	
							    <c:if test="${pageMaker.checker}">
							    	<li class="li_css"><button type="button" onclick="location.href='list${pageMaker.makeQuery(pageMaker.endPage+1)}&course_name=${course_name}&professor=${professor}&course_number=${course_number}&university=${university}&type=${type}' ">+10 page</button></li>
							    </c:if> 
							      <c:if test="${!pageMaker.checker}">
							    	<li class="li_css"><button type="button" disabled>+10 page</button></li>
							    </c:if> 
							   <!-- end page-->	 
							     <c:if test="${pageMaker.checker}">
							    	<li class="li_css">
							    	<button type="button" onclick="location.href='list${pageMaker.makeQuery(pageMaker.end)}&course_name=${course_name}&professor=${professor}&course_number=${course_number}&university=${university}&type=${type}' ">end page</button>
							    	</li>
							    </c:if>
							     <c:if test="${!pageMaker.checker}">
							      <li class="li_css">
							    	<button type="button"  disabled>end page</button>
							    </li>
							    </c:if>  
							    
			    
							  </ul>
						</td>	
					</tr>
					<!-- for writing -->
					<c:set var="prof" value="교수" />	
					<c:if test="${type==prof}">
					<tr >
						<th style="border-bottom-left-radius: 6px;  border-bottom-right-radius: 6px; border-bottom: 1px solid #bbb; text-align:right" colspan="5"><button type="button" onclick="location.href='/SIMS/Noticeboard/writeView?course_name=${course_name}&course_number=${course_number}&university=${university}' ">글쓰기</button></th>			
					</tr>
					</c:if>
					</table>
				</div>
				</form>
				
			</section>

	</body>
</html>