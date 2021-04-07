<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<html>
<head>
	<title>교수 정보 확인 페이지</title>
</head>

<style>
	@import url(https://cdn.rawgit.com/theeluwin/NotoSansKR-Hestia/master/stylesheets/NotoSansKR-Hestia.css);
	 *:focus { outline:none; }
			html, body
			{
			    margin: 10px;
			}
			
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
			
			.main
			{
			    height: 200px;
			    width: 200px;
			    background-color: blue;     
			}
			
			.update_btn {
				  width: 100px;
				  height: 30px;
				  font-size:15px;
				  color: white;
				  text-align: center;
				  background: #ffb6b6;
				  border-radius: 20px;
				  border: solid 0px grey;
				  margin: 5px;
				  margin-top: 60px;
			}
		
		.underline{
			 border:none;
  			outline:none;
  			margin:10px;
  			border-bottom: 2px solid #adadad;
		  margin-bottom: 30px;
		  font-size:20px;
		}
		
		
		table.type09 {
		    border-collapse: collapse;
		    text-align: left;
		    line-height: 1.5;
		
		}
		table.type09 thead th {
		    padding: 10px;
		    font-weight: bold;
		    vertical-align: top;
		    color: #2b1911;
		    border-bottom: 3px solid #ff8d8d;
		}
		table.type09 tbody th {
		    width: 100px;
		    padding: 10px;
		    font-weight: bold;
		    vertical-align: top;
		    border-bottom: 1px solid #adadad;
		    background: #f3f6f7;
		}
		table.type09 td {
		    width: 230px;
		    padding: 10px;
		    vertical-align: top;
		    border-bottom: 1px solid #adadad;
		}
		
	</style>
	
	
<body>
	<div>
		<%@include file="../Style/menubar.jsp" %>
	</div>
	
	<div style="margin-top:100px; text-align:center; font-weight: bold; color: #2b1911;">
		<h1>교수 정보 확인 페이지</h1>
		<h3>신상 정보 조회 및 변경</h3>
	</div>
	<div style="margin-top:120px; margin-bottom:180px; text-align:center; font-weight: bold; color: #2b1911;">
	
		<form autocomplete="off" name="privacyForm" role="form" method="post" action="/SIMS/user/update_proval">
					<!-- table for print format -->	
						<table class="type09" style="margin-left: auto; margin-right: auto;">
							<thead style="text-align:center;">
								<tr>
							        <th>항목</th>
							        <th>정보</th>
							    </tr>
							</thead>
							
							<tbody>
								
    
								<tr>
									<td>아이디</td><td>${provo.id}</td>			
								</tr>
								<tr>
									<td>이름</td><td>${provo.name}</td>			
								</tr>
								<tr>
									<td>학번</td><td>${provo.professor_id}</td>		
								</tr>
								<tr>
									<td>학교명</td><td>${provo.university}</td>			
								</tr>
								<tr>
									<td>전공</td><td>${provo.major}</td>			
								</tr>
								<tr>
									<td>핸드폰 번호</td><td><input style="width:220px" type="text" id="phone_number" name="phone_number" value="${provo.phone_number}" required/></td>			
								</tr>
								<tr>
									<td>이메일</td><td><input style="width:220px" type="text" id="email" name="email" value="${provo.email}" required/></td>				
								</tr>
								<tr>
									<td>연구실</td><td><input style="width:220px" type="text" id="lab" name="lab" value="${provo.lab}" required/></td>				
								</tr>
								</tbody>
									
						
					</table>
					<button type="submit" class="update_btn">수정하기</button>	
									
				</form>
		</div>

</body>
</html>