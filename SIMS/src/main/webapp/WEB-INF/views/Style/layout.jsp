 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<html>
<style>
  body {background: #000000;}
  #wrap {width: 100%; margin: 0 auto;} 
  header {width: 100%; height: 90px; background: #e6e6e6;}
  section {float: left; width: 100%; height: auto; background: #d3d3d3;}
  footer {clear: both; width: 100%; height: 50px; background: #3d3d3d;}
  body {
    margin-top: 30px;
  }
  nav ul {
    width: 100%;
    background-color: rgba(44, 42, 39, 0.983);
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
    background-color: rgb(17, 116, 155);
    width: 100px;
    text-align: center;
    font-weight: bold;
    float: right;
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
    /*background-color: darkorange; */
    color: white;
    padding: 16px;
    font-size: 16px;
    cursor: pointer;
  }
  .dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
  }
  .dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
  }
  /* dropdown-menu 에는 hover 적용이 안됨 */
  .dropdown:hover .dropdown-content {
    display: block;
  }
  .dropdown-content a:hover {
    background-color: #f1f1f1
  }
  .dropdown-menu:hover:not(.home) {
    background-color: darkorange;
    color: white;
  }
  .login_join{ 
    text-decoration: none;
    color:darkslategrey; 
    font-weight: bolder;
    margin-left:5px;}
</style>
<html>

  <body>
    <div id="wrap"> 


      <header>
      <div style="float:right;">
        <a class="login_join" href="/SIMS/user/logout">로그아웃</a>
      </div>
      <br>
      <nav>
        <ul>
          <li style='color:white; padding:16px; font-weight:bolder'>SIMS [학생정보관리시스템]</li>
          <li class="dropdown">
            <div class="dropdown-menu">마이페이지</div>
            <div class="dropdown-content">
              <a href="/SIMS/StudentInfo/timetable">강의 시간표</a>
              <a href="/SIMS/StudyResult/StudyResult">학점 조회</a>

            </div>
          </li>
          <li class="dropdown">
            <div class="dropdown-menu">내 정보 조회</div>
            <div class="dropdown-content">
              <a href="/SIMS/user/show_privacyval">개인정보 확인</a>
              <a href="/SIMS/Registration/list">수강신청</a>
            </div>
          </li>
          <li class="dropdown">
            <div class="dropdown-menu">공지사항</div>
            <div class="dropdown-content">
              <a href="/SIMS/Noticeboard/list">과목 공지사항</a>
 
            </div>
          </li>
          <li class="dropdown">
            <div class="dropdown-menu">커뮤니티</div>
            <div class="dropdown-content">
              <a href="/SIMS/review/list">강의 후기</a>
              <a href="/SIMS/Board/list">커뮤니티 게시판</a>
             </div>
          </li>
          <li class="home"><a href="#">Home</a></li>
        </ul>
      </nav>
    </header>
     
  </div>
  </body>

</html>

