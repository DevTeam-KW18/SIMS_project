<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
				<form autocomplete="off" name="readForm" role="form" method="post" action="/SIMS/Board/readView">
				  	<input type="hidden" id="bno" name="bno" value="${read.bno}" />			
				<!-- move readView -->  	
			 	<script type="text/javascript"> 
				<!-- move readView -->  	
			 		location.href="/SIMS/Board/readView?bno=${read.bno}&id="+"${id}";
			 	</script>


			</form>	
		</section>
		</div>
	</body>
</html>