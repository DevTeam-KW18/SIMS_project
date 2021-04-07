<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>커뮤니티 게시글 조회</title>
	 	<!-- for css -->	
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
			
			.backshpae{
				background-image: url("/SIMS/resources/background/shape.png"); 
      			background-size: 100px 100%;
      			background-repeat: no-repeat;
      			height:50px;
      			width:150px;
      			
				
			}
			
			
	</style>
	 		 	
	</head>
	<!-- for button function-->	
	<script type="text/javascript">   <!-- button's functions-->	
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			// modify		
			$(".update_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}				
				
				formObj.attr("action", "/SIMS/Board/update");
				formObj.attr("method", "post");
				formObj.submit();
			})
			
			//var formObj = $("form[name='readForm']");
			// delete 
			$(".delete_btn").on("click", function(){
				formObj.attr("action", "/SIMS/Board/delete");
				formObj.attr("method", "post");
				formObj.submit();
			})
			//comment
			$(".comment_btn").on("click", function(){
				formObj.attr("action", "/SIMS/Board/commentView");
				formObj.attr("method", "post");
				formObj.submit();
			})
			
			// cancel
			$(".list_btn").on("click", function(){
				
				formObj.attr("action", "/SIMS/Board/relist");
				formObj.attr("method", "post");
				formObj.submit();
			})
			
			//like
			$(".like_btn").on("click", function(){
				
				formObj.attr("action", "/SIMS/Board/like");
				formObj.attr("method", "post");
				formObj.submit();
			})
					
			
			$(".replyWriteBtn").on("click", function(){
				var formObj = $("form[name='replyForm']");
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/SIMS/Board/replyWrite");
				formObj.attr("method", "post");
				formObj.submit();
			})
			
			//update reply View
			$(".replyUpdateBtn").on("click", function(){
				location.href = "/SIMS/Board/replyUpdateView?bno=${read.bno}"
								+ "&rno="+$(this).attr("data-rno");
			});
					
		//delete reply View
			$(".replyDeleteBtn").on("click", function(){
				location.href = "/SIMS/Board/replyDeleteView?bno=${read.bno}"
					+ "&rno="+$(this).attr("data-rno");
			});
		
			
		})
		
		function fn_valiChk(){
			var updateForm = $("form[name='readForm'] .chk").length;
			for(var i = 0; i<updateForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
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
			<header>
			</header>
			<section id="container">
				<form autocomplete="off" name="readForm" role="form" method="post" action="/SIMS/Board/reading">
				  	<input type="hidden" id="bno" name="bno" value="${read.bno}" />
				<!-- table for print format -->	
					<table>
						<tbody>
							<tr><th colspan="5" style="border-top-left-radius: 6px;  border-top-right-radius: 6px; border-bottom: 1px solid #bbb; text-align: center;font-weight: bold;">게시글 보기</td></tr>
							<tr>
								<th>글번호</th><th>작성자</th><th>작성일</th><th>좋아요수</th><th>조회수</th>				
							</tr>
							<tr style="text-align:center">
								<td>${read.bno}</td>
								<td>${read.writer}</td>
								<td> 
									<fmt:formatDate value="${read.regdate}" pattern="yyyy/MM/dd(E) HH:mm" />	
								</td>
								<td>${read.likes}</td>
								<td>${read.hit}</td>
							</tr>
							<tr style="text-align:center">
								<td>
									<label for="title">제목</label>
								</td>
								<td colspan="4" style="text-align:left">	
									<input type="text" id="title" name="title" value="${read.title}" class="chk" title="제목을 입력하세요" style="width:60%;"/>			
								</td>
							<tr style="height:60%; text-align:center;">
								<td>
									<label for="content">내용</label>
								</td>
								<td colspan="4" style="vertical-align:top" >	
									<textarea id="content" name="content" class="chk" title="내용을 입력하세요" style="width:100%; height:280px;"><c:out value="${read.content}" /></textarea>
								</td>
							</tr>
							<tr style="text-align:center"><!-- buttons  -->	
								<td colspan="5">
								<c:set var="user" value="${user}"/>
								<c:if test="${id==user}">
								<button type="submit" class="update_btn">수정하기</button>
								<button type="submit" class="delete_btn">삭제하기</button>
								</c:if>								<button type="submit" class="list_btn">돌아가기</button>	
								<button style="background:#ff8d8d;"type="submit" class="like_btn">추천하기</button>	
								</td>
							</tr>
																		
					</tbody>			
				</table>
				</form>
			</section>
		</div>
		
		
<!-- 댓글 -->
<div id="reply">
  <table class="replyList" style="width: 900px; background:none;">
  <tr>
		<th  style="border-radius: 0px; border-left:none; border-right:none; background:#ffeded; padding:10px; text-align:left; border-bottom: 1px solid #bbb;" colspan="2">Comment</th>
	</tr>
	
    <c:forEach items="${replyList}" var="replyList">
    
	<tr>
        <td colspan="2" style="border-left:none; border-right:none; margin-top:20px; text-align:right; border-bottom:none;">
		  <button style="background:none; height:4px; width:40px;" type="button" class="replyUpdateBtn" data-rno="${replyList.rno}">수정</button>
		  <button style="background:none; height:4px; width:40px;" type="button" class="replyDeleteBtn" data-rno="${replyList.rno}">삭제</button>
		</td>
		<tr>
        	<td style="border-left:none; border-right:none; text-align:left; border-bottom:none; border-right:none;"> 
        		<div style="width:150px; "class="backshpae"><p style="padding-top:14px; margin-left:50px;">${replyList.writer}</p></div>
        	</td>
        	<td style="border-left:none; border-right:none; width:650px; padding-left:40px; border-bottom:none;">${replyList.content}</td>
        </tr>				
     <tr style="border-bottom:none;">
      	 
      	 <td style="border-radius: 0px; border-left:none; border-right:none;  font-size:12px; padding:15px; text-align:right;"colspan="2"><fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd" /></td>	 
      	</tr>
        
        
      
    </c:forEach>
    
    <form autocomplete="off" name="replyForm" method="post">  
	 
	  <input type="hidden" id="bno" name="bno" value="${read.bno}"/>
	  
	  <tr>
	    <td   style="border-left:none; border-right:none; border-bottom:none; padding-top:100px;" ><input style="margin-left:44px; height:25px; border: 1px solid #bbb; border-radius: 5px;" placeholder="작성자" type="text" id="writer" name="writer" /></td>
	   	<td style="text-align:right; border-left:none; border-right:none; border-bottom:none; padding-top:100px;"> <button style="margin-right:44px; "type="button" class="replyWriteBtn">작성</button> </td>
	   </tr>
	   <tr>
	   
	    <td style="border:none; text-align:center;"colspan="2" ><input style="border: 1px solid #bbb; border-radius: 10px; width:800px; height:200px;" type="text" id="content" name="content" /></td>
	  
	  </tr>
	</form>
	
    </table>
   </div>
   
	</body>
</html>