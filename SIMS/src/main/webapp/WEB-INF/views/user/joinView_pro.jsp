<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>회원가입 : 교수</title>
	</head>
	
	<style>
	@import url(https://cdn.rawgit.com/theeluwin/NotoSansKR-Hestia/master/stylesheets/NotoSansKR-Hestia.css);
			body
			{
			    margin: 0 auto;
			    font-family:'Noto Sans Korean';
			}
			
			.container
			{
			    height: 100%;
			    display: table-cell;
			    vertical-align: middle;
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
		
		.checkid {
		  width: 70px;
		  height: 25px;
		  font-size:10px;
		  color: white;
		  text-align: center;
		  background: #ff8d8d;
		  border-radius: 20px;
		  border: solid 0px grey;
		  margin: 5px;
		}
		
		*:focus { outline:none; }
		
		.underline{
		  border-bottom: 2px solid #adadad;
		  margin-bottom: 30px;
		}
		
		.underline input{
			 border:none;
  			outline:none;
  			margin:10px;
		}
		
	</style>
	
	
	<link rel="stylesheet" href="../Style/layout.jsp">
	
	<script type="text/javascript">
		$(document).ready(function(){
			
			$("#submit").on("click", function(){
				var idChkVal = $("#checkid").val();
				if(idChkVal == "N"){
					alert("아이디 중복을 확인해주세요.");
					return false;
				}
				else if($("#id").val().trim() == "" ||
						$("#passwd").val().trim() == "" ||
						$("#student_id").val().trim() == "" ||
						$("#university").val().trim() == "" ||
						$("#name").val().trim() == "" ||
						$("#email").val().trim() == "" ||
						$("#major").val().trim() == "" ||
						$("#phone_number").val().trim() == "" ||
						$("#lab").val().trim() == ""){
					alert("모든 항목을 기입해주세요.");
					return false;
				}
				else if(idChkVal == "Y"){
					alert("가입이 완료되었습니다. 로그인 페이지로 이동합니다.");
					$("#stu_register_form").submit();
				}
			});
		})
		function fn_idChk(){
			$.ajax({
				url : "/SIMS/user/checkid",
				type : "post",
				dataType : "text",
				data : {"id" : $("#id").val()},
				success : function(data){
					if(data == 1){
						$("#checkid").attr("value", "N");
						alert("중복된 아이디입니다.");
					}else if(data == 0){
						$("#checkid").attr("value", "Y");
						alert("사용가능한 아이디입니다.");
					}
				}
			})
		}	
	</script>
	
	<body>
	
			<div style="margin-top:80px; text-align:center; font-weight: bold; color: #2b1911;">
				<h1>Professor Join</h1>
				<h3>교수 회원가입</h3>
			</div>
			<div style="width: 100%; text-align: center;">
				
				<form autocomplete="off" role="form" method="post" action="/SIMS/user/join_pro" id="pro_register_form">
					<table style="display: inline-block;">
						<tbody>
							<tr>
								<td class="underline">
									<input style="width:60%;"placeholder="아이디" type="text" class="form-control" id="id" name="id" required/>
									<button class="checkid" type="button" id="checkid" onclick="fn_idChk();" value="N">중복확인</button>
								</td>
							</tr>	
							<tr>
								<td class="underline">
									<input placeholder="비밀번호" type="password" id="passwd" name="passwd" required/>
								</td>
							</tr>
							<tr>
								<td class="underline">
									<input placeholder="학번" type="professor_id" id="professor_id" name="professor_id" required/>
								</td>
							</tr>
							<tr>
								<td class="underline">
									<input placeholder="학교명" type="university" id="university" name="university" required/>
								</td>
							</tr>
							<tr>
								<td class="underline">
									<input placeholder="이름" type="name" id="name" name="name" required/>
								</td>
							</tr>
							<tr>
								<td class="underline">
									<input placeholder="이메일" type="text" id="email" name="email" required/>
								</td>
							</tr>
							<tr>
								<td class="underline">
									<input placeholder="전공" type="major" id="major" name="major" required/>
								</td>
							</tr>
							<tr>
								<td class="underline">
									<input placeholder="핸드폰번호" type="phone_number" id="phone_number" name="phone_number" required/>
								</td>
							</tr>
							<tr>
								<td class="underline">
									<input placeholder="연구실" type="lab" id="lab" name="lab" required/>
								</td>
							</tr>
							<tr>				
								<td style="algin:center; margin-top:10px; text-align:center; font-size:3em; font-weight: bold; color: #2b1911;">
									<button style="margin-left:25px;"class="btn" type="submit" id="submit">작성</button>			
									<button style="background: #bfb5b0;" class="btn" type="button" onclick="location.href='joinSelect'">취소</button>	
								</td>	
							</tr>			
						</tbody>			
					</table>
				</form>
			</div>
	</body>
</html>