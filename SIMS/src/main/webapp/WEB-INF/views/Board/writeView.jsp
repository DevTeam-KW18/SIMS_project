<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html> <!-- for writing page -->
	<head>
	 	<title>커뮤니티 게시판 입력하기</title>
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<!-- css for table value-->	
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
		  width: 1000px;
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
				formObj.attr("action", "/SIMS/Board/write");
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
			<h1>커뮤니티 게시판</h1>
		</div>
		
		<div id="root">

			<section id="container">
				<form autocomplete="off" name="writeForm" method="post" action="/SIMS/Board/write">
					<table>

						<tbody>    <!--print format -->
						<tr>
							 <th colspan="2" style="font-weight: bold">커뮤니티 게시판 입력하기</th>
							 </tr>
							<tr>
								<td style="background:#fff3f3;">
									<label for="writer">이름</label> 
									</td>
									<td style="text-align:left">
									<input type="text" id="writer" name="writer" class="check" title="이름을 입력하세요" style=" width:50%;"/>
									</td>	
							</tr>	
							<tr>
								<td style="background:#fff3f3;" >
									<label for="title">제목</label>
									</td>
								<td style="text-align:left"><input type="text" id="title" name="title" class="check" title="제목을 입력하세요" style=" width:50%; text-align:left"/>
								</td>
							</tr>
							<tr style="height:60%">
								<td style="background:#fff3f3;">
									<label for="content">내용</label>
									</td>
								<td style="text-align:left;">	
								<textarea style="width:100%; height:280px;"  id="content" name="content" class="check" title="내용을 입력하세요"  style="width:100%; height:100%; white-space:normal"></textarea>
							<tr style="text-align:center">
								<td colspan="3">	<!-- button-->					
									<button type="submit" class="write_btn">저장하기</button>
									<button type="reset" >다시쓰기</button>
									<button type="button" onclick="location.href='/SIMS/Board/list' ">돌아가기</button>
								</td>
							</tr>			
						</tbody>			
					</table>
				</form>
			</section>
		</div>
	</body>
</html>