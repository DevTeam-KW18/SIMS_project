<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%String str=request.getParameter("type"); %>
<html>
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
		
		
		table {
		background: #fcfcfc;
		  border-collapse: separate;
		  border-spacing: 0;
		  width: 1000px;
		  margin-left: auto; 
		  margin-right: auto;
		}
		table tr th,
		table tr td {
		  border-right: 1px solid #bbb;
		  border-bottom: 1px solid #bbb;
		  padding: 5px;
		}
		table tr th:first-child,
		table tr td:first-child {
		
		  border-left: 1px solid #bbb;
		}
		table tr th {
		  background: #f5f5f5;
		  border-top: 1px solid #bbb;
		  border-bottom: 5px solid #ff8b8b;
		  text-align: left;
		}
		
		/* top-left border-radius */
		table tr:first-child th:first-child {
		  border-top-left-radius: 6px;
		}
		
		/* top-right border-radius */
		table tr:first-child th:last-child {
		  border-top-right-radius: 6px;
		}
		
		/* bottom-left border-radius */
		table tr:last-child td:first-child {
		  border-bottom-left-radius: 6px;
		}
		
		/* bottom-right border-radius */
		table tr:last-child td:last-child {
		  border-bottom-right-radius: 6px;
		}
		
		
	</style>
	
	<head>
	
	 	<title>학습 결과</title>
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 	
 		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	    <script type="text/javascript">
	      google.charts.load('current', {'packages':['bar']});
	      google.charts.setOnLoadCallback(drawChart);
	
	      // preference : https://stackoverflow.com/questions/30690136/google-chart-api-arraytodatatable
	      
	      var dataArr = [
	          ['학년-학기', '전공', '비전공', '총합'],
	          ['1-1', 0.0, 0.0, 0.0],
	          ['1-2', 0.0, 0.0, 0.0],
	          ['2-1', 0.0, 0.0, 0.0],
	          ['2-2', 0.0, 0.0, 0.0],
	          ['3-1', 0.0, 0.0, 0.0],
	          ['3-2', 0.0, 0.0, 0.0],
	          ['4-1', 0.0, 0.0, 0.0],
	          ['4-2', 0.0, 0.0, 0.0]
	        ];
	      
	      
	      	dataArr[1][1] = ${grade_1_1[0]}; dataArr[1][2] = ${grade_1_1[1]}; dataArr[1][3] = ${grade_1_1[2]};
	      	dataArr[2][1] = ${grade_1_2[0]}; dataArr[2][2] = ${grade_1_2[1]}; dataArr[2][3] = ${grade_1_2[2]};
	      	
	      	dataArr[3][1] = ${grade_2_1[0]}; dataArr[3][2] = ${grade_2_1[1]}; dataArr[3][3] = ${grade_2_1[2]};
	      	dataArr[4][1] = ${grade_2_2[0]}; dataArr[4][2] = ${grade_2_2[1]}; dataArr[4][3] = ${grade_2_2[2]};
	      	
	      	dataArr[5][1] = ${grade_3_1[0]}; dataArr[5][2] = ${grade_3_1[1]}; dataArr[5][3] = ${grade_3_1[2]};
	      	dataArr[6][1] = ${grade_3_2[0]}; dataArr[6][2] = ${grade_3_2[1]}; dataArr[6][3] = ${grade_3_2[2]};
	      
	      	dataArr[7][1] = ${grade_4_1[0]}; dataArr[7][2] = ${grade_4_1[1]}; dataArr[7][3] = ${grade_3_1[2]};
	      	dataArr[8][1] = ${grade_4_2[0]}; dataArr[8][2] = ${grade_4_2[1]}; dataArr[8][3] = ${grade_3_2[2]};
	      
	      
	      
	      
	      function drawChart() {
	        var data = google.visualization.arrayToDataTable(dataArr);
	
	        var options = {
	          chart: {
	            title: '학습 결과 그래프',
	            subtitle: '전공, 비전공, 전체 학점 그래프입니다.',
	          }
	        };
	
	        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));
	
	        chart.draw(data, google.charts.Bar.convertOptions(options));
	      }
	    </script>
    
    
	</head>

	<body>	
		<div>
			<%@include file="../Style/menubar.jsp" %>
		</div>
		
    	<div style="margin-top:100px; text-align:center; font-weight: bold; color: #2b1911;">
			<h1>학습 결과</h1>
			<h3>학점 그래프와 정보를 확인합니다.</h3>
		</div>
		
		<div id="columnchart_material" style=" font-weight: bold; color: #2b1911; margin:0 auto; margin-top:100px; width: 800px; height: 500px;"></div>

		<div style="margin-top:120px; margin-bottom:180px; text-align:center; font-weight: bold; color: #2b1911;">
				
					<h3 style="margin-bottom:50px;">수강/성적 결과</h3>
					
					<table style="margin-bottom:50px; margin-left: auto; margin-right: auto;">
					
						<tr>
							<th style="background:#fff3f3;">전체 이수 학점</th>
							<th style="background:#fff3f3;">전공 이수 학점</th>
							<th style="background:#fff3f3;">전체 성적</th>
							<th style="background:#fff3f3;">전공 성적</th>
							<th style="background:#fff3f3;">비전공 성적</th>
						</tr>
						<tr>
							<td>${credit_list[2]}</td>
							<td>${credit_list[0]}</td>
							<td>${grpah_list[2]}</td>
							<td>${grpah_list[0]}</td>
							<td>${grpah_list[1]}</td>
						</tr>
						
					</table>
					<table style="margin-left: auto; margin-right: auto;">
						<tr>
							<th>학정번호</th>
							<th>과목명</th>
							<th>이수학기</th>
							<th>이수구분</th>
							<th>학점</th>
							<th>성적</th>
						</tr>
						<c:forEach items="${grade_list}" var = "list">
							
								<tr>
									<td>
										<c:out value="${list.course_number}" />
									</td>
									<td>
										<c:out value="${list.course_name}" />
									</td>
									<td>
										<c:out value="${list.semester}" />
									</td>
									<td>
										<c:out value="${list.course_info}" />
									</td>
									<td>
										<c:out value="${list.credit}" />
									</td>
									<td>
										<c:out value="${list.grade}" />
									</td>
									
								</tr>
							</c:forEach>
							
						</table>
					</div>
	</body>
</html>						