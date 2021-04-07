<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<html>
<style>
	@import url(https://cdn.rawgit.com/theeluwin/NotoSansKR-Hestia/master/stylesheets/NotoSansKR-Hestia.css);
	
	body{
		font-family:'Noto Sans Korean';
	}
  
 
  body not:(.gradient) {
  	margin:10px;
    margin-top: 20px;
  }
  nav ul {
    width: 100%;
    background-color: none;
    list-style-type: none;
    /* 마진 패딩 지정하지 않으면 브라우저 기본 스타일을 따라 설정되므로 오버라이딩 필요 */
    margin: 0;
    padding: 0;
  }
  /* li 는 블록요소인데 inline-block 으로 인라인속성 부여해서 나란히 배치 */
  nav ul li {
    display: inline-block;
  }
  .home {
    width: 250px;
    text-align: center;
    font-weight: bold;
    margin-right: 50px;
    float: left;
  }
  .home a {
    display: block;
    text-decoration: none;
    color: white;
    padding: 16px 16px;
  }
  .dropdown {
    position: relative;
    z-index: 1;
  }
  .dropdown-menu {
  font-weight:bold;
    color: #2b1911;
    padding: 16px;
    font-size: 16px;
    margin-right:40px; /*메뉴간 간격 조정*/
    margin-left:40px;
    cursor: pointer;
  }
  .dropdown-content {
    display: none;
    position: absolute;
    margin-left:40px;
    background-color: #ededed;
    min-width: 160px;
  }
  .dropdown-content a {
  	font-weight:bold;
    color: #2b1911;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
  }
  /* dropdown-menu 에는 hover 적용이 안됨 */
  .dropdown:hover .dropdown-content {
  	border-bottom-right-radius: 1em;
	border-bottom-left-radius: 1em;
	border-top-right-radius: 1em;
    display: block;
  }
  
  .dropdown:hover .dropdown-menu {
  	border-top-right-radius: 1em;
	border-top-left-radius: 1em;
  font-weight:bold;
    background-color: #ff8d8d;
    color: white;
  }
  
  .dropdown-menu:hover:not(.home) {
  	border-top-right-radius: 1em;
	border-top-left-radius: 1em;
  font-weight:bold;
    background-color: #ff8d8d;
    color: white;
  }
  .login_join{ 
    text-decoration: none;
    color:darkslategrey; 
    font-weight: bolder;
    margin-left:5px;}
    
    .btn {
				  width: 100px;
				  height: 30px;
				  font-size:15px;
				  color: white;
				  text-align: center;
				  background: #ff8d8d;
				  border-radius: 20px;
				  border: solid 0px grey;
				  margin: 5px;
			}
	.gradient {
  	margin:0px;
  	padding: 0px;
  	position: absolute; 
  	top: 0px; left: 0; 
  	background-image: url("/SIMS/resources/background/Artboard_17.png"); 
  	background-size: 100% 100%;
  }
  
</style>
<html>

  <body>
    <div class="gradient" style="height:100%; width:100%; z-index:-1;"> 
    
	</div>
	
	<div>

      <header>
      <br>
      
      <div style="margin-bottom:100px;">
      <nav>
      <div>
      	<a href="/SIMS/main"><img src="/SIMS/resources/logo/logoA.png" style="width:200px; float:left; margin-left:50px;"alt=""></a>
      </div>
      <div style="margin-left:400px;">
        <ul>
          <li class="dropdown">
            <div class="dropdown-menu">마이페이지</div>
            <div class="dropdown-content">
              <a href="/SIMS/user/show_privacyval">개인정보 확인</a>
              <a href="/SIMS/StudentInfo/timetable">강의 시간표</a>
              <a href="/SIMS/StudyResult/StudyResult">학점 조회</a>

            </div>
          </li>
          <li class="dropdown">
            <div class="dropdown-menu">수강신청정보</div>
            <div class="dropdown-content">
              <a href="/SIMS/recommendation/recommendation">과목추천</a>
              <a href="/SIMS/Registration/list">수강신청</a>
            </div>
          </li>
          <li class="dropdown">
            <div class="dropdown-menu">공지사항</div>
            <div class="dropdown-content">
              <a href="/SIMS/Noticeboard/current_course_list">과목 공지사항</a>
 
            </div>
          </li>
          <li class="dropdown">
            <div class="dropdown-menu">커뮤니티</div>
            <div class="dropdown-content">
              <a href="/SIMS/review/list">강의 후기</a>
              <a href="/SIMS/Board/list">커뮤니티 게시판</a>
             </div>
          </li>
          <li style="float:right; margin-right:100px;">
          	<button class="btn" type="button" onclick="location.href='/SIMS/user/logout'">로그아웃</button>
          </li>
        </ul>
        </div>
      </nav>
      </div>
    </header>
     
  </div>
  </body>

</html>