<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
</head>

<style>
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
		
		table.type09 {
			border-spacing: 0;
		    border-collapse: separate;
		    text-align: left;
		    line-height: 1.5;
		    margin-left:20px;
		    margin-right:20px;
		    margin-bottom:30px;
		
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
		    border-bottom: 1px solid #ff8d8d;
		    background: #f3f6f7;
		}
		table.type09 td {
		    width: 230px;
		    padding: 10px;
		    vertical-align: top;
		    border-bottom: 1px solid #ff8d8d;
		}
		
		 a:link { color: black; text-decoration: none;}
		 a:visited { color: black; text-decoration: none;}
		 a:hover {text-decoration: none;}
		
		
		
	</style>

<body>
	<div>
		<%@include file="./Style/menubar.jsp" %>
	</div>
	<div>
	<div style="color:#2b1911; float:left; margin-left:13%; margin-top:100px; background:#f5f5f5; border-radius: 10px; height:380px; width:500px;">
	<h1 style="margin-left:30px; color:#eb7171;">내 공지사항</h1>
			<form autocomplete="off" role="form" method="post" action="/SIMS/Noticeboard/write">
			<table class="type09" >
				<tr><th style="width:35%;">과목 이름</th><th style="width:50%;">제목</th><th style="width:60px;">조회수</th></tr>
				<c:forEach items="${list}" var = "list">
					<tr>
								<td><c:out value="${list.course_name}" /></td>
								<td>
								<a href="/SIMS/Noticeboard/reading?bno=${list.bno}&course_name=${list.course_name}&course_number=${list.course_number}&university=${university}&type=${type}">							
								<c:out value="${list.title}" /></a>
								</td>

								<td style="width:60px;"><c:out value="${list.hit}" /></td>
					</tr>			
				</c:forEach>
			
				
				</table>
			</form>
		</div>
		<div style="color:#2b1911; float:right; margin-right:13%; margin-top:100px; background:#f5f5f5; height:380px; border-radius: 10px; width:500px;">
			<h1 style="margin-left:30px; color:#eb7171;">HOT 커뮤니티 게시글</h1>
				<form autocomplete="off" role="form" method="post" action="/SIMS/Board/main">
				<table class="type09">
					
				<tr><th>제목</th><th>추천수</th><th>조회수</th></tr>
					<c:forEach items="${boardList}" var = "boardList">
					<input type="hidden" id="time" name="time" value="${boardList.regdate}" />
						
						<tr>
								<td>
								
								<a href="/SIMS/Board/reading?bno=${boardList.bno}&id=${boardList.id}">
								<c:out value="${boardList.title}" /></a></td>
							
								<td style="width:60px;"><c:out value="${boardList.likes}" /></td>
								<td style="width:60px;"><c:out value="${boardList.hit}" /></td>
						</tr>
					</c:forEach>
				
					
					</table>
				</form>
			</div>
			</div>
</body>
</html>