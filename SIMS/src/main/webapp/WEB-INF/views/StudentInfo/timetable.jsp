<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Timetable</title>
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
        width: 1200px;
        margin-left: auto; 
        margin-right: auto;
      }
      table tr th,
      table tr td {
        border-right: 1px solid #bbb;
        border-bottom: none;
        margin-top:10px;
        margin-bottom:10px;
        padding: 5px;
        width:150px;
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
        border-bottom: 1px solid #bbb;
      }
      
      /* bottom-right border-radius */
      table tr:last-child td:last-child {
        border-bottom-right-radius: 6px;
        border-bottom: 1px solid #bbb;
      }
      
      a:link { color: black; text-decoration: none;}
       a:visited { color: black; text-decoration: none;}
       a:hover {text-decoration: none;}
       
   </style>

<script type="text/javascript">
 var arrtime=new Array();
 var arrname=new Array();
 
 
 function removeCheck(course_name){
    if (confirm("????????? ??????????????????????????") == true){
      $.ajax({
         url : "/SIMS/StudentInfo/deletecourse",
         type : "post",
         dataType : "text",
         data : {"course_name" : course_name},
         success : function(data){
               alert("??????????????? ?????????????????????.");
               location.reload();
            }
      })
    }else{   //??????
        return false;
    }
    
   }   
 
 
</script>
</head>


<body>
      <div>
         <%@include file="../Style/menubar.jsp" %>
      </div>
      
      <div style="margin-top:100px; text-align:center; font-weight: bold; color: #2b1911;">
         <h1>?????????</h1>
         <h3>??????????????? ?????? ???????????? ??????????????????.</h3>
      </div>

   <form autocomplete="off" name="TimetableForm" role="form" method="post" action="/SIMS/StudentInfo/timetable">
       <c:forEach items="${timetable}" var = "timetable" varStatus="status">
          <input type="hidden" id="id" name="id" value="${timetable.student_id}" />   
                    <script>
                      arrtime.push('${timetable.time1}');
                      arrtime.push('${timetable.time2}');
                      
                      var finder='${timetable.time3}';
                      if (finder!=-1)
                         {
                            arrtime.push('${timetable.time3}');
                            arrname.push({'??????':'${timetable.time3}','??????':'${timetable.course_name}'});
                         }
                      
                      arrname.push({'??????':'${timetable.time1}','??????':'${timetable.course_name}'});
                      arrname.push({'??????':'${timetable.time2}','??????':'${timetable.course_name}'});
                      
                   </script> 
           </c:forEach>
              <script type="text/javascript">
                 arrtime.sort(function(a, b)  {
                   return a - b;
                 });

                 </script>
   
      
      <div style="margin-top:120px; margin-bottom:180px; text-align:center; font-weight: bold; color: #2b1911;">

      <table style="text-align: center; margin-left: auto; margin-right: auto;" id="timetable">
          <thead>
             <tr class="text-center">
              <th scope="col"  bgcolor=#beeefb>??????</th>
              <th scope="col"  bgcolor=#bbdefb>???</th>
              <th scope="col"  bgcolor=#bbdefb>???</th>
              <th scope="col"  bgcolor=#bbdefb>???</th>
              <th scope="col"  bgcolor=#bbdefb>???</th>
              <th scope="col"  bgcolor=#bbdefb>???</th>
              <th scope="col"  bgcolor=#bbdefb>???</th>
            </tr>
          </thead>
         
          <tbody id="timetable">     
            
          </tbody>
         
      </table>
      </div>

      <script>
            function tableCreate(){            
               var html="";   
               var course="";
               check=arrtime.shift();

                  for(var i=0; i<10; i++)
                   {
                      html+='<tr>'+'<td style="padding:15px;">'+i;
                      for(var j=1; j<7; j++)
                         {
                         
                            if((i*6+j)==check)
                            {                               
                               for(var m=0; m<arrname.length ; m++)
                                  {
                                     if(check==arrname[m].??????)
                                     course=arrname[m].??????;
                                     
                                  }
                                                       
                               html+='<td bgcolor= #ffcfcf>'+'<a href="javascript:;" onclick="removeCheck(\''+course+'\');">'+course+'</td>';
                               check=arrtime.shift();    
                               course="";
                            }
                            else if(i==9)
                               html+='<td style="border-bottom: 1px solid #bbb;">'+'&nbsp;&nbsp;'+'</td>'
                            else   
                               html+='<td>'+'&nbsp;&nbsp;'+'</td>'
                         }                         
                      html+='</td>'+'</tr>';   
                   }
                      
                      $("#timetable").append(html);
                  }
            tableCreate();
             </script> 
   
      </form>
      <div id="gradeList">
         <section id="container">
            <form autocomplete="off" role="form" method="get">
               <table style="margin-bottom:180px;">
                  <tr>
                     <th>??????</th>
                     <th>?????????</th>
                     <th>????????????</th>
                     <th colspan="2">??????</th>
                  </tr>
                  <c:forEach items="${list}" var = "list">
                     <tr>
                        <td  style=" border-bottom: 1px solid #bbb;"><c:out  value="${list.university}" /></td>
                        <td  style=" border-bottom: 1px solid #bbb;"><c:out  value="${list.course_name}" /></td>
                        <td  style=" border-bottom: 1px solid #bbb;"><c:out  value="${list.course_number}" /></td>
                        <td  style="padding-left:5px; width:30px; border-right:none; border-bottom: 1px solid #bbb;">
                           <c:if test="${list.grade ==null}">
                           <c:out value="?????????"/>
                           </c:if>
                           <c:if test="${list.grade !=null}">
                           <c:out value="${list.grade}"/>
                           </c:if>
                        <td  style=" text-align:center; width:10px; border-bottom: 1px solid #bbb;">
                        <script>
                        function popup(){
                           var url="/SIMS/StudentInfo/gradingView?university=${list.university}&course_name=${list.course_name}&course_number=${list.course_number}";
                           var option="resizable=no,scrollbars=no,status=no,width=400,height=300,left = 100,top=100";
                           window.open(url,'gradingPage',option);
                        }
                     
                        </script>
                        <button style="margin-right:0px;"onclick="javascript:popup()">
                        ????????????
                        </button>
                        </td>
                     </tr>
                  </c:forEach>
               </table>
               
            </form>
         </section>
      </div>
</body>

</html>
