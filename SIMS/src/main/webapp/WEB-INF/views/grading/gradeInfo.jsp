<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	 	<title>학점 관리</title>
	</head>
	<body>
		<div id="root">
			<section id="container">
				<form autocomplete="off" role="form" method="get">
					<table>
						<tr>
							<td>학교</td>
							<td>과목명</td>
							<td>과목번호</td>
							<td>학점</td>
							<td></td>
						</tr>
						<c:forEach items="${list}" var = "list">
							<tr>
								<td><c:out  value="${list.university}" /></td>
								<td><c:out  value="${list.course_name}" /></td>
								<td><c:out  value="${list.course_number}" /></td>
								<td>
									<c:if test="${list.grade ==null}">
									<c:out value="미입력"/>
									</c:if>
									<c:if test="${list.grade !=null}">
									<c:out value="${list.grade}"/>
									</c:if>
								<td>
								<a href="/SIMS/grading/gradingView?university=${list.university}&course_name=${list.course_name}&course_number=${list.course_number}">
								학점입력
								</a>
								</td>
							</tr>
						</c:forEach>
					</table>
					
				</form>
			</section>
		</div>
	</body>
</html>
