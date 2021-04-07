<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>답글</title>
	 	<!-- for css -->	
	 	<style> 
	@import url(https://cdn.rawgit.com/theeluwin/NotoSansKR-Hestia/master/stylesheets/NotoSansKR-Hestia.css);
	
	body{
		font-family:'Noto Sans Korean';
	}
		  table {
		    width: 50%;
		    height: 55%;
		    border: 1px solid #444444;
		    border-collapse: collapse;
		    text-align: center;
		  }
		    th, td {
		    border: 1px solid #444444;
		    padding: 10px;
		  }

		</style>
	 		 	
	</head>
	<!-- for button function-->	
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='writeForm']");
			// modify		
			$(".wcomment_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/SIMS/Board/comment");
				formObj.attr("method", "post");
				formObj.submit();
			})			
			// cancel
			$(".list_btn").on("click", function(){
				
				formObj.attr("action", "/SIMS/Board/relist");
				formObj.attr("method", "post");
				formObj.submit();
			})
			//re see
			$(".original_btn").on("click", function(){
				
				formObj.attr("action", "/SIMS/Board/reread");
				formObj.attr("method", "post");
				formObj.submit();
			})
		})
		// cancel
			
		function fn_valiChk(){
			var updateForm = $("form[name='writeForm'] .check").length;
			for(var i = 0; i<updateForm; i++){
				if($(".check").eq(i).val() == "" || $(".check").eq(i).val() == null){
					alert($(".check").eq(i).attr("title"));
					return true;
				}
			}
			}
			


	</script>
	
	<body>
	
		<div id="root">
			<header>
		
			</header>

			<section id="container"><!-- make need value -->	
				<form autocomplete="off" name="writeForm" role="form" method="post" action="/SIMS/Board/comment">
				  	<input type="hidden" id="bno" name="bno" value="${read.bno}" />
				  	<input type="hidden" id="obno" name="obno" value="${read.obno}" />
				  	<input type="hidden" id="lvl" name="lvl" value="${read.lvl}" />
				  	<input type="hidden" id="groupseq" name="groupseq" value="${read.groupseq}" />
				  	<input type="hidden" id="hit" name="hit" value="${read.hit}" />
				  	<input type="hidden" id="likes" name="likes" value="${read.likes}" />
					<!-- table for original writing -->	
					<table>
						<tbody>
							<tr><td colspan="4" style="font-weight: bold">질문글 보기</td></tr>
							<tr>
								<td>글번호</td><td>작성자</td><td>작성일</td><td>좋아요수</td><td>조회수</td>				
							</tr><!-- table for comment print value format-->	
							<tr>
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
								<td colspan="3" style="text-align:left">	
									${read.title} 		
								</td>
							<tr style="height:60%">
								<td>
									<label for="content">내용</label>
								</td>
								<td colspan="3" style="vertical-align:top; text-align:left" >	
									<c:out value="${read.content}" />
								</td>
							</tr>
						 </tbody>
					</table>
						<p></p>
						<p></p>
						<p></p>
						<!-- table for comment -->	
					<table border="1">
						<tbody>
						<tr>
							 <td colspan="2" style="font-weight: bold">답글 쓰기</td>
						</tr>
						<tr>
								<td>
									<label for="writer">이름</label> 
									</td><!-- table for comment print value for format-->	
									<td style="text-align:left">
									<input type="text" id="writer" name="writer" class="check" title="이름을 입력하세요" style=" width:50%;"/>
								</td>	
						</tr>	
							<tr>
								<td>
									<label for="title">제목</label>
									</td>
								<td style="text-align:left"><input type="text" id="title" name="title" class="check" title="제목을 입력하세요" style=" width:50%;"/>
								</td>
							</tr>
							<tr style="height:60%">
								<td>
									<label for="content">내용</label>
									</td>
								<td>	
									<textarea id="content" name="content" class="check" title="내용을 입력하세요"  style="width:100%; height:100%; white-space:normal"></textarea>
								</td>
							</tr>			
							<tr><!-- for button  -->	
								<td colspan="4">
								<button type="submit" class="wcomment_btn">답글저장</button>
								<button type="reset" >다시쓰기</button>
								<button type="button" onclick="location.href='readView?bno=${read.bno}' ">돌아가기</button>
								<button type="submit" class="list_btn">목록보기</button>	
								</td>
							</tr>										
						</tbody>			
					</table>
				</form>
			</section>
		</div>
	</body>
</html>