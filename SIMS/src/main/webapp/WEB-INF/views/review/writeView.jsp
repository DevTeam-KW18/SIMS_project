<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<html>
	<head>
	 	<title>강의평 쓰기</title>
	</head>
	
	
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
			
			button {
				  width: 80px;
				  height: 25px;
				  font-size:5px;
				  color: black;
				  text-align: center;
				  background: #ffb6b6;
				  border-radius: 20px;
				  margin:5px;
				  margin-bottom:0px;
				  border: none; 
				  outline:none;
			}
			
			button:disabled{
				width: 80px;
				  height: 25px;
				  font-size:5px;
				  color: black;
				  text-align: center;
				  background: #ebebeb;
				  border-radius: 20px;
				  
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
		  width: 500px;
		  margin-left: auto; 
		  margin-right: auto;
		  margin-top:100px;
		  margin-bottom:150px;
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
		  text-align: center;
		  
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
		
		 a:link { color: black; text-decoration: none;}
		 a:visited { color: black; text-decoration: none;}
		 a:hover {text-decoration: none;}

		
		.li_css {list-style: none; float: left; padding: 4px;}
			 
		  .ul_css {
			  display: table;
			  margin-left: auto;
			  margin-right: auto;
			}
			
			
	</style>
		
	</head>
	<!-- event function -->
		<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/SIMS/Noticeboard/write");
				formObj.attr("method", "post");
				formObj.submit();
			});
		})
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .check").length;
			for(var i = 0; i<regForm; i++){
				if($(".check").eq(i).val() == "" || $(".check").eq(i).val() == null){
					alert($(".check").eq(i).attr("title"));
					return true;
				}
			}
	
		}
	</script>
	
	
	<body>
		<div>
			<%@include file="../Style/menubar.jsp" %>
		</div>
		
		<div style="margin-top:100px; text-align:center; font-weight: bold; color: #2b1911;">
			<h1>과목 수강 후기 작성</h1>
		</div>
		
		<div id="root">
		
			<section id="container">
				<form autocomplete="off" role="form" method="post" action="/SIMS/review/write">
					<input type="hidden" id="course_number" name="course_number" value="${CourseNumber}" />
							<input type="hidden" id="course_name" name="course_name" value="${CourseName}" />
							<input type="hidden" id="professor" name="professor" value="${Professor}" />
							<input type="hidden" id="university" name="university" value="${University}" />
					<table>
						<tbody>
							<tr>
								 <th colspan="2" style="font-weight: bold">후기 입력하기</th>
							 </tr>
							 
							<tr style="text-align:center">
								<td style="background:#fff3f3;">
								
									<label for="semester">수강 학기</label>
								</td>
								<td style="text-align:left">
									<select id="semester" name="semester">
									<option value="1학기">1학기</option>
									<option value="2학기">2학기</option>
									</select>
								</td>
							</tr>
							<tr style="text-align:center">
								<td style="background:#fff3f3;">
								
									<label for="star_point">별점</label>
								</td>
								<td style="text-align:left">
									<select id="star_point" name="star_point">
									<option value=1>1점</option>
									<option value=2>2점</option>
									<option value=3>3점</option>
									<option value=4>4점</option>
									<option value=5>5점</option>
									</select>
								</td>
							</tr>	
							<tr style="text-align:center">
								<td style="background:#fff3f3;">
									<label for="course_review">후기</label>
								</td>
								<td style="text-align:left">
									<textarea style="width:380px; height:200px;"id="course_review" name="course_review" ></textarea>
								</td>
							</tr>
							<tr>
								<td  colspan="2" style="text-align:center">						
									<button type="submit">작성</button>
								</td>
							</tr>			
						</tbody>			
					</table>
				</form>
			</section>
		</div>
	</body>
</html>
