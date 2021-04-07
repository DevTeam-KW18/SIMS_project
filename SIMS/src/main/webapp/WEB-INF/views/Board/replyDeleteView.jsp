<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>게시판</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$(".delete_btn").on("click", function(){
				
				var PWChkVal = $("#passwd").val();
				
				if(PWChkVal != "${passwd_chk}"){
					alert("비밀번호가 일치하지 않습니다.");
					return false;
				}
				else{
					var formObj = $("form[name='updateForm']");
					formObj.attr("action", "/SIMS/Board/replyDelete");
					formObj.attr("method", "post");
					formObj.submit();
					//페이지 이동 
					return true;
				}
			});
			
			$(".cancel_btn").on("click", function(){
				location.href = "/SIMS/Board/readView?bno=${replyDelete.bno}"
			})
			
		})
		
	</script>
	
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
			
			#btn {
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
			<h1>댓글 삭제하기</h1>
			<h3>댓글 삭제 전, 비밀번호를 입력해주세요.</h3>
		</div>
	
		<div id="root">

				<form autocomplete="off" name="updateForm" role="form" method="post" action="/SIMS/Board/replyDelete">
					<input type="hidden" name="bno" value="${replyDelete.bno}" readonly="readonly"/>
					<input type="hidden" id="rno" name="rno" value="${replyDelete.rno}" />
						
					<div style="margin-top:120px; text-align:center; font-weight: bold; color: #2b1911;">
						<p>비밀 번호를 입력해주세요</p>
						<label for="passwd">비밀번호 </label><input class="underline" type="password" id="passwd" name="passwd" required/>
						<br>
						<button id="btn" type="button" class="delete_btn">확인</button>
						<button id="btn" type="button" class="cancel_btn">취소</button>
						<br>
					</div>
				</form>

		</div>
	</body>
</html>