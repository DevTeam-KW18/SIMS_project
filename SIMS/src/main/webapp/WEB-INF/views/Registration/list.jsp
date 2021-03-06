<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	 	<title>course info</title>
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
	</head>
	<body>
	
		<div>
			<%@include file="../Style/menubar.jsp" %>
		</div>
		
		<div style="margin-top:100px; text-align:center; font-weight: bold; color: #2b1911;">
			<h1>?????? ??????</h1>
			<h3>????????? ????????? ??????????????? ???????????????.</h3>
		</div>
		
		<div id="root">
			
			<section id="container">
				<form autocomplete="off" role="form" method="get">
				
				<div style="margin-top:120px; margin-bottom:50px; text-align:center; font-weight: bold; color: #2b1911;">
				
				
				<table>
					<tr>
						<c:if test="${pageMaker.totalCount>0}">
						<th colspan="5" style="border-bottom: 1px solid #bbb; text-align: right;font-weight: normal;">${pageMaker.totalCount}(${pageMaker.currentpage}/${pageMaker.end}) </th>
						</c:if>
					</tr>
					<tr><th>?????????</th><th>????????????</th><th>?????????</th><th>??????</th><th>????????????</th></tr>

					<tr>
						<c:if test="${pageMaker.totalCount==0}">
							<th colspan="5" style="border-top-left-radius: 6px;  border-top-right-radius: 6px; text-align: right;font-weight: normal;">${pageMaker.totalCount}(0/0) </th>
						</c:if>
					</tr>
					<c:forEach items="${list}" var = "list">
						<tr>
								<td>
								<a href="/SIMS/Registration/info?course_name=${list.course_name}&professor=${list.professor}&course_number=${list.course_number}&university=${list.university}">
								<c:out value="${list.course_name}" /></a></td>
								<td><c:out value="${list.course_number}" /></td>
								<td><c:out value="${list.professor}" /></td>
								<td><c:out value="${list.credit}" /></td>
								<td><c:out value="${list.major}" /></td>
						</tr>
					</c:forEach>
					<!-- for page and button -->	
					<tr style="text-align:center">
						<td colspan="5" style="text-align:center" >
							  <ul class="ul_css" style="text-align:center">
							  <!-- start page -->	
							  	 <c:if test="${pageMaker.currentpage > 10}">
							    	<li class="li_css">
							    	<button type="button" onclick="location.href='list${pageMaker.makeSearch(1)}' ">start page</button>
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
							    	<button type="button" onclick="location.href='list${pageMaker.makeSearch(pageMaker.startPage - 1)}' ">-10 page</button>
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
							    	<button type="button" onclick="location.href='list${pageMaker.makeSearch(pageMaker.currentpage-1)}' ">-1 page</button>
							    	</li>
							    </c:if> 
							     <c:if test="${pageMaker.currentpage ==1}">
							    	<li class="li_css">
							    	<button type="button" disabled>-1 page</button>
							    	</li>
							    </c:if> 
							    		<!-- +1 page -->			
							    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
							    	<li class="li_css"><a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
							    </c:forEach>
							    
							     <c:if test="${pageMaker.currentpage+1 <= pageMaker.end}">
							    	<li class="li_css">
							    	<button type="button" onclick="location.href='list${pageMaker.makeSearch(pageMaker.currentpage+1)}' ">+1 page</button>
							    	</li>
							    </c:if> 
							     <c:if test="${pageMaker.currentpage+1>pageMaker.end}">
							    	<li class="li_css">
							    	<button type="button" disabled>+1 page</button>
							    	</li>
							    </c:if> 
						<!-- +10 page-->	
							    <c:if test="${pageMaker.checker}">
							    	<li class="li_css"><button type="button" onclick="location.href='list${pageMaker.makeSearch(pageMaker.endPage+1)}' ">+10 page</button></li>
							    </c:if> 
							      <c:if test="${!pageMaker.checker}">
							    	<li class="li_css"><button type="button" disabled>+10 page</button></li>
							    </c:if> 
							   <!-- end page-->	 
							     <c:if test="${pageMaker.checker}">
							    	<li class="li_css">
							    	<button type="button" onclick="location.href='list${pageMaker.makeSearch(pageMaker.end)}' ">end page</button>
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
					</table>
				</div>
		<div class="search" style="margin-left: 75px; margin-bottom:150px; margin-top:0px; text-align:center; font-weight: bold; color: #2b1911;">
		<select name="searchType" style="height:22px;">
			<option value="n"<c:out value="${cri.searchType == null ? 'selected' : ''}"/>>----</option>
			<option value="name"<c:out value="${cri.searchType eq 'name' ? 'selected' : ''}"/>>?????????</option>
			<option value="num"<c:out value="${cri.searchType eq 'num' ? 'selected' : ''}"/>>????????????</option>
			<option value="professor"<c:out value="${cri.searchType eq 'professor' ? 'selected' : ''}"/>>?????????</option>
			<option value="major"<c:out value="${cri.searchType eq 'major' ? 'selected' : ''}"/>>??????</option>
			<option value="uni"<c:out value="${cri.searchType eq 'uni' ? 'selected' : ''}"/>>????????????</option>
			<option value="credit"<c:out value="${cri.searchType eq 'credit' ? 'selected' : ''}"/>>??????</option>
			<option value="all"<c:out value="${cri.searchType eq 'all' ? 'selected' : ''}"/>>all</option>
		</select>
		<input placeholder="???????????? ???????????????" style="width:200px; margin-left:20px; margin-right:20px;" type="text" name="keyword" id="keywordInput" value="${cri.keyword}"/>
		<button id="searchBtn" type="button">??????</button>
		<script>
		$(function(){
			$('#searchBtn').click(function(){
				self.location="list"+'${pageMaker.makeQuery(1)}'+"&searchType="+$("select option:selected").val()+ "&keyword=" + encodeURIComponent($('#keywordInput').val());
			});
		});
		</script>
		</div>	
				</form>
			</section>
		</div>
	</body>
</html>