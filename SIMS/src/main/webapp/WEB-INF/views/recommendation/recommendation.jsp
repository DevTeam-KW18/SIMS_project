<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>recommendation</title>
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
		<%@include file="../Style/menubar.jsp" %>
	</div>
	<h1 style="margin-left:30px; color:#eb7171; text-align:center;">이런 강의는 어떠세요?</h1>
	<h3 style="margin-left:30px; color:#eb7171; text-align:center;">과목 이름을 클릭하면 해당 과목 수강신청 창으로 넘어갑니다.</h3>
	
	<div style="background:#ccc"></div>
	
	<div>
	<div style="color:#2b1911; float:left; margin-left:13%; margin-top:100px; background:#f5f5f5; border-radius: 10px; height:450px; width:500px;">
	
	<h2 style="margin-left:30px; color:#eb7171;">전공 수업을 찾으세요?</h2>
	<h3 style="margin-left:30px; color:#eb7171;">학생이 이미 들은 강의의 후수 과목입니다.</h3>
			<form autocomplete="off" role="form" method="post" action="/SIMS/Noticeboard/write">
			<table class="type09" >
				<tr><th>과목 이름</th><th>교수명</th><th style="width:60px;">학점</th></tr>
				<c:forEach items="${major}" var = "major">
					<tr>
								<td>
								<a href="/SIMS/Registration/info?course_name=${major.course_name}&professor=${major.professor}&course_number=${major.course_number}&university=${major.university}">
								<c:out value="${major.course_name}" />
								</a>
								</td>
								<td>
								<c:out value="${major.professor}" /></a>
								</td>
								<td style="width:60px;"><c:out value="${major.credit}" /></td>
					</tr>			
				</c:forEach>
				
				</table>
			</form>
		</div>
				
	<div style="color:#2b1911; float:left; margin-left:13%; margin-top:100px; background:#f5f5f5; border-radius: 10px; height:450px; width:500px; margin-bottom:180px;">
	<h2 style="margin-left:30px; color:#eb7171;">교양 수업을 찾으세요?</h2>
	<h3 style="margin-left:30px; color:#eb7171;">강의 후기 별점이 높았던 교양 과목입니다.</h3>
			<form autocomplete="off" role="form" method="post" action="/SIMS/Noticeboard/write">
			<table class="type09" >
				<tr><th style="width:50%;">과목 이름</th><th style="width:35%;">교수명</th><th>별점</th></tr>
				<c:forEach items="${elective}" var = "elective" varStatus="loop">
					<tr>
								<td>
								<a href="/SIMS/Registration/info?course_name=${elective.course_name}&professor=${elective.professor}&course_number=${elective.course_number}&university=${elective.university}">
								<c:out value="${elective.course_name}" />
								</a>
								</td>
								<td><c:out value="${elective.professor}" /></a></td>
								<td style="width:60px;"><c:out value="${star_point[loop.index]}"/></td>
					</tr>			
				</c:forEach>
				
				</table>
			</form>
		</div>
		</div>
</body>
</html>
