<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<html>
<style>
	
	body {
	   margin: 0;
	}
	  #wrap {width: 100%; margin: 0 auto;} 
	  header {width: 100%; height: 90px; background: #e6e6e6;}
	  footer {clear: both; width: 100%; background: #bfb5b0;
	   position:absolute; bottom:0;}


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

    <footer style="margin: 0;">
      <div style="color: white; margin:30px; ">제작자 : KW18 [김영은, 김현아, 문지은, 이화경]</div>
    </footer>
   
  </body>

</html>