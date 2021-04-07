<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<html>
<head>
	<title>패스워드 확인 페이지</title>
</head>
	<script type="text/javascript">
		$(document).ready(function(){
			
			$("#check").on("click", function(){
				
				var PWChkVal = $("#passwd").val();
				
				if(PWChkVal != "${passwd_chk}"){
					alert("비밀번호가 일치하지 않습니다.");
					return false;
				}
				else{
					if("${iden}"=="professor"){
						location.href = "/SIMS/user/show_proval"; 
						//페이지 이동 
						return true;
					}
					else{
						location.href = "/SIMS/user/show_stuval"; 
						//페이지 이동 
						return true;
					}
				}
			});
		})
	</script>
	<style>
	@import url(https://cdn.rawgit.com/theeluwin/NotoSansKR-Hestia/master/stylesheets/NotoSansKR-Hestia.css);
	
	 *:focus { outline:none; }
			html, body
			{
			    margin: 10px;
			    font-family:'Noto Sans Korean';
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
		
		.underline{
			 border:none;
  			outline:none;
  			margin:10px;
  			border-bottom: 2px solid #adadad;
		  margin-bottom: 30px;
		  font-size:20px;
		}
		
	</style>
	
<body>
	<div>
		<%@include file="../Style/menubar.jsp" %>
	</div>
	
	<div style="margin-top:100px; text-align:center; font-weight: bold; color: #2b1911;">
	<h1>패스워드 확인 페이지</h1>
	<h3>개인정보 조회 전, 비밀번호를 입력해주세요.</h3>
	</div>
	
	<div style="margin-top:120px; text-align:center; font-weight: bold; color: #2b1911;">
	<form autocomplete="off">
								
		<label for="passwd">비밀번호 </label><input class="underline" type="password" id="passwd" name="passwd" required/>
		<br>
		<button class="btn" type="button" id="check">확인</button>
		<br>
	</form>
	
	</div>

</body>
</html>