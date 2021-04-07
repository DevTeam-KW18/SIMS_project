<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<html>
	<head>
	 	<title>회원가입 유형 선택</title>
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<link rel="stylesheet" href="../Style/layout.jsp">
		
	</head>
	
	<style>
	
	@import url(https://cdn.rawgit.com/theeluwin/NotoSansKR-Hestia/master/stylesheets/NotoSansKR-Hestia.css);
	
	body { 
      	font-family:'Noto Sans Korean';
      	}
      	
	 *:focus { outline:none; }
			html, body
			{
			    height: 100%;
			}
			
			body
			{
			    display: table;
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
			
			.btn {
				  width: 100px;
				  height: 30px;
				  font-size:15px;
				  color: white;
				  text-align: center;
				  background: #ffb6b6;
				  border-radius: 20px;
				  border: solid 0px grey;
				  margin: 5px;
				  margin-top: 20px;
			}
		
	</style>
	
	<body>
		
		<div id="root">
			<section id="container">
			
			<div style="margin-top:200px; text-align:center; font-size:3em; font-weight: bold;color: #2b1911;">
				Who are you
			</div>
			
			<div style="margin-top:10px; text-align:center; font-size:1.5em; font-weight: bold;color: #2b1911;">
				회원 가입 유형
			</div>
			
			<div style="algin:center; margin-top:10px; text-align:center; font-size:3em; font-weight: bold;color: #2b1911;">
				<button class="btn" type="button" onclick="location.href='joinView_stu' ">학생</button>
				<button class="btn" type="button" onclick="location.href='joinView_pro' ">교수</button>
				<br>
				<button class="btn" style="margin-top:15px; background: #bfb5b0; " type="button" onclick="location.href='userMain'">취소</button><br>
			</div>
			</section>
		</div>
	
	</body>
</html>