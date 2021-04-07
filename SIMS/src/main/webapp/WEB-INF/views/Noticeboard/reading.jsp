<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%String str1=request.getParameter("course_number"); %>
<%String str2=request.getParameter("type"); %>
<%String str3=request.getParameter("university"); %>
<%String str4=request.getParameter("bno"); %>
<%String str5=request.getParameter("course_name"); %>
<%String str6=request.getParameter("idx"); %>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>게시글 조회</title>
	</head>
<!-- for hitting -->
	<body>

		<div id="root">
			<header>
		
			</header>

			<section id="container">
				<form autocomplete="off" name="readForm" role="form" method="post" action="/SIMS/Noticeboard/readView">
				  <c:set var="course_number" value="<%=str1 %>" />	
				  <c:set var="type" value="<%=str2%>" />	
				  <c:set var="university" value="<%=str3%>" />
				  <c:set var="bno" value="<%=str4%>" />
				  <c:set var="course_name" value="<%=str5%>" />
				  <c:set var="idx" value="<%=str6%>" />
				<input type="hidden" id="university" name="university" value="${university}" />
				<input type="hidden" id="course_number" name="course_number" value="${course_number}" />
				<input type="hidden" id="type" name="type" value="${type}" />
				<input type="hidden" id="bno" name="bno" value="${bno}" />
				<input type="hidden" id="course_name" name="course_name" value="${course_name}" />
				<!-- move readView -->  	
			 	<script type="text/javascript"> location.href="/SIMS/Noticeboard/readView?bno=${bno}&course_name=${course_name}&course_number=${course_number}&university=${university}&type=${type}&idx=${idx}";</script>


			</form>	
		</section>
		</div>
	</body>
</html>