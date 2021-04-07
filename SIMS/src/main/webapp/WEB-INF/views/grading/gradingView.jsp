<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<html>
	<head>
	 	<title>학점 관리</title>
	</head>
	<body>
	
		<div id="root">
		
			<section id="container">
				<form autocomplete="off" role="form" method="post" action="/SIMS/grading/grading">
					<input type="hidden" id="course_number" name="course_number" value="${course_number}" />
					<input type="hidden" id="course_name" name="course_name" value="${course_name}" />
					<input type="hidden" id="university" name="university" value="${university}" />
				
						
					<select id="grade" name="grade">
					<option value="A+">A+</option>
					<option value="A">A</option>
					<option value="B+">B+</option>
					<option value="C+">C+</option>
					<option value="C">C</option>
					<option value="D+">D+</option>
					<option value="D">D</option>
					<option value="F">F</option>
					</select>
														
					<button type="submit">작성</button>
									
				
				</form>
			</section>
		</div>
	</body>
</html>
