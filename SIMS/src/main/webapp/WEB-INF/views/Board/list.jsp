<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
	<head>
	 	<title>게시판</title>
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<!-- for css -->	
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
 	
	</head>

	<body>
		<div>
			<%@include file="../Style/menubar.jsp" %>
		</div>
		
		<div style="margin-top:100px; text-align:center; font-weight: bold; color: #2b1911;">
			<h1>커뮤니티 게시판</h1>
			<h3>학생들과 자유롭게 소통하는 공간입니다.</h3>
		</div>

<!-- for listing -->	
			<section id="container">
				<form autocomplete="off" role="form" method="post" action="/SIMS/Board/write">	

				<div style="margin-top:120px; margin-bottom:180px; text-align:center; font-weight: bold; color: #2b1911;">
				  
					<table style="margin-left: auto; margin-right: auto;">
					<tr><c:if test="${pageMaker.totalCount>0}">
					  <th colspan="6" style="border-bottom: 1px solid #bbb; text-align: right;font-weight: normal;">${pageMaker.totalCount}(${pageMaker.currentpage}/${pageMaker.end}) </th>
					  </c:if></tr>
						<tr><c:if test="${pageMaker.totalCount==0}"><th colspan="6" style="border-top-left-radius: 6px;  border-top-right-radius: 6px; border-bottom: 1px solid #bbb; text-align: right;font-weight: normal;">${pageMaker.totalCount}(0/0) </th></c:if></tr>
						<tr><th>id</th><th>글번호</th><th>이름</th><th>제목</th><th>작성일</th><th>조회수</th></tr>
						
						<c:forEach items="${list}" var = "list">
						<input type="hidden" id="time" name="time" value="${list.regdate}" />
						<input type="hidden" id="id" name="id" value="${list.id}" />
						
						
							<tr>
								<td style="width:50px;"><c:out value="${list.id}" /></td>
								<td style="width:50px;"><c:out value="${list.bno}" /></td>
								<td>
									<c:out value="${list.writer}" />
								</td>

								<c:set var="now" value="<%= new java.util.Date() %>" />
								<c:set var="wday" value="${list.regdate}" />
								<fmt:formatDate  value="${now}" pattern="yyyy/MM/dd" var="now"/>
								<fmt:formatDate  value="${list.regdate}" pattern="yyyy/MM/dd" var="wday"/>
							<!-- print for title -->
								<td style="text-align:left; width:50%;" >
								<c:forEach var="i" begin="0" end="${list.lvl}">
								<c:if test="${list.lvl>0}">&nbsp;&nbsp;</c:if> 
								</c:forEach>
								<a href="/SIMS/Board/reading?bno=${list.bno}&id=${list.id}"><c:out value="${list.title}" /></a>
								</td>
								<c:if test="${now==wday}">
								<td><fmt:formatDate  value="${list.regdate}" pattern="a hh:mm"/></td> </c:if>
								<c:if test="${now!=wday}">
								<td><fmt:formatDate  value="${list.regdate}" pattern="yyyy.MM.dd(E)"/></td> </c:if>
								<td style="width:50px;"><c:out value="${list.hit}" /></td>
							</tr>
						</c:forEach>
					<!-- for page and button -->	
					<tr style="text-align:center">
						<td colspan="6" style="text-align:center" >
							  <ul  class="ul_css" style="text-align:center">
							  <!-- start page -->	
							  	 <c:if test="${pageMaker.currentpage > 10}">
							    	<li class="li_css">
							    	<button type="button" onclick="location.href='list${pageMaker.makeQuery(1)}' ">start page</button>
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
							    	<button type="button" onclick="location.href='list${pageMaker.makeQuery(pageMaker.startPage - 1)}' ">-10 page</button>
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
							    	<button type="button" onclick="location.href='list${pageMaker.makeQuery(pageMaker.currentpage-1)}' ">-1 page</button>
							    	</li>
							    </c:if> 
							     <c:if test="${pageMaker.currentpage ==1}">
							    	<li class="li_css">
							    	<button type="button" disabled>-1 page</button>
							    	</li>
							    </c:if> 
							    		<!-- +1 page -->			
							    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
							    	<li class="li_css"><a href="list${pageMaker.makeQuery(idx)}">${idx}</a></li>
							    </c:forEach>
							    
							     <c:if test="${pageMaker.currentpage+1 <= pageMaker.end}">
							    	<li class="li_css">
							    	<button type="button" onclick="location.href='list${pageMaker.makeQuery(pageMaker.currentpage+1)}' ">+1 page</button>
							    	</li>
							    </c:if> 
							     <c:if test="${pageMaker.currentpage+1>pageMaker.end}">
							    	<li class="li_css">
							    	<button type="button" disabled>+1 page</button>
							    	</li>
							    </c:if> 
						<!-- +10 page-->	
							    <c:if test="${pageMaker.checker}">
							    	<li class="li_css"><button type="button" onclick="location.href='list${pageMaker.makeQuery(pageMaker.endPage+1)}' ">+10 page</button></li>
							    </c:if> 
							      <c:if test="${!pageMaker.checker}">
							    	<li class="li_css"><button type="button" disabled>+10 page</button></li>
							    </c:if> 
							   <!-- end page-->	 
							     <c:if test="${pageMaker.checker}">
							    	<li class="li_css">
							    	<button type="button" onclick="location.href='list${pageMaker.makeQuery(pageMaker.end)}' ">end page</button>
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
					<tr style="text-align:right">
						<td colspan="6"><button type="button" onclick="location.href='/SIMS/Board/writeView' ">글쓰기</button></td>			
					</tr>
					</table>
				</div>
						
				</form>
			</section>
	</body>
</html>