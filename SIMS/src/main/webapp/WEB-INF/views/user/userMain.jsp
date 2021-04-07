<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>


<html>
<head>
	<title>로그인/회원가입 페이지</title>
</head>

<style>
		
		
@import url(https://cdn.rawgit.com/theeluwin/NotoSansKR-Hestia/master/stylesheets/NotoSansKR-Hestia.css);

      body { 
      	background-image: url("/SIMS/resources/background/Artboard _1_copy.png"); 
      	background-size: 100% 100%;
      	font-family:'Noto Sans Korean';
      	}
      	
      	
      	.login_underlineForm{
			 position:absolute;
			  width:300px;
			  height:400px;
			  margin-top:3%;
			  margin-left:5%;
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
		  margin-right: 30px;
		}
		
		*:focus { outline:none; }
		
		.underline{
		  border-bottom: 2px solid #adadad;
		  margin-bottom: 30px;
		}
		
		.underline input{
			 border:none;
  			outline:none;
		}

	
</style>

<script type="text/javascript">
   $(document).ready(function(){
      $("#logoutBtn").on("click", function(){
         location.href="member/logout";
      })
      
   })
</script>
<body>

	<div style="margin-left: 5%; margin-top: 3%; font-size:3em; font-weight: bold;color: #2b1911;">
		Plan Your University Life<br>
		Using This Awesome Site<br>
	</div>
	<div style="margin-left: 5%; margin-top: 1%; font-size:4em; color: #ff8d8d; font-weight: bold;">
		SIMS<br>
	</div>
	
   <form autocomplete="off" name='userMain' method="post" action="/SIMS/user/login">
      <input type="hidden" value="${SESSION_INFO}">
      <input type="hidden" value="${SESSION_TYPE}">
      <input type="hidden" id="type" name="type" value="">
      <input type="hidden" id="university" name="university" value="">
      <div class="login_underlineForm" style="text-align:left;">
	      <div class="underline">
	         <input type="text" id="id" name="id" placeholder="ID" required/>
	      </div>
	      <div class="underline">
	         <input type="password" id="passwd" name="passwd" placeholder="PASSWORD" required/>
	      </div>
	      <div>
	         <button class="btn" type="submit">login</button>
	         <button class="btn" type="button" onclick="location.href='joinSelect'">sign up</button>
	      </div>
      </div>
   </form>
   
</body>
</html>