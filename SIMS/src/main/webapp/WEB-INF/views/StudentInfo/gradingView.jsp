<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<html>
   <head>
       <title>학점 관리</title>
   </head>
   
   <style>
   
   @import url(https://cdn.rawgit.com/theeluwin/NotoSansKR-Hestia/master/stylesheets/NotoSansKR-Hestia.css);
   
   body { 
         font-family:'Noto Sans Korean';
         }
         
    *:focus { outline:none; }
         html, body
         {
             height: 100%;
         }
         
         body
         {
             display: table;
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
              width: 70px;
              height: 25px;
              font-size:5px;
              color: black;
              text-align: center;
              background: #ffb6b6;
              border-radius: 20px;
              margin-bottom:0px;
              border: none; 
              outline:none;
         }
      
   </style>
   
   <body>
      <div style="margin-top:50px; text-align:center; font-weight: bold; color: #2b1911;">
         <h2>학점 입력</h2>
         <h4>성적 분석을 위해 학점을 입력해주세요.</h4>
      </div>
   
   <div style="margin-top:50px; text-align:center; font-weight: bold; color: #2b1911;">
      
         <section id="container">
            <form autocomplete="off" role="form" method="post" action="/SIMS/StudentInfo/grading">
               <input type="hidden" id="course_number" name="course_number" value="${course_number}" />
               <input type="hidden" id="course_name" name="course_name" value="${course_name}" />
               <input type="hidden" id="university" name="university" value="${university}" />
            
                  
               <select id="grade" name="grade">
               <option value="A+">A+</option>
               <option value="A0">A0</option>
               <option value="B+">B+</option>
               <option value="B0">B0</option>
               <option value="C+">C+</option>
               <option value="C0">C0</option>
               <option value="D+">D+</option>
               <option value="D0">D0</option>
               <option value="F">F</option>
               <option value="P">P</option>
               <option value="NP">NP</option>
               </select>
                                          
               <button style="margin-left:10px;" type="submit">작성</button>
                           
            
            </form>
         </section>
      </div>
   </body>
</html>
