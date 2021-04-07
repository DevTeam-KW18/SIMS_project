package kw18.team.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import kw18.team.service.GradingService;
import kw18.team.service.NoticeBoardService;
import kw18.team.service.TimetableService;
import kw18.team.vo.GradeVO;
import kw18.team.vo.GradingVO;
import kw18.team.vo.ProfessorVO;
import kw18.team.vo.StudentVO;
import kw18.team.vo.TimetableVO;
import kw18.team.vo.UserVO;


@Controller
@RequestMapping("/StudentInfo/*")	
public class TimetableController {

private static final Logger logger = LoggerFactory.getLogger(TimetableController.class);
	@Inject
	GradingService gradingservice;
	@Inject
	TimetableService service;
	
	//for posting student_id view
	@RequestMapping(value = "/timetable", method = {RequestMethod.GET, RequestMethod.POST})
	public String studentid( HttpServletRequest request,HttpServletResponse response, Model model, RedirectAttributes rttr)  throws Exception{
		logger.info("studentidcheck");
		
		UserVO uservo = null;
		ProfessorVO provo;
		StudentVO stuvo = null;

		
		//사용자 정보를 위한 코드
		 HttpSession session=request.getSession();		 
		 String type=(String)session.getAttribute("SESSION_TYPE");
		 

		   if(type.equals("학생")) {
			   stuvo =(StudentVO) session.getAttribute("SESSION_INFO");
			  
				model.addAttribute("list",gradingservice.list(stuvo.getStudent_id()));
				
		   }
		   else {
			   provo=(ProfessorVO) session.getAttribute("SESSION_INFO");
			   
			 response.setContentType("text/html; charset=UTF-8");
             PrintWriter out = response.getWriter();
             out.println("<script>alert('학생 전용 페이지입니다.'); history.go(-1); </script>");
             out.flush();
             
             return "/user/show_privacyval";        //수정 필요  
		  }
		    
		//찾을 변수 입력  
		Map <String,String> map = new HashMap <>();
		map.put("student_id",stuvo.getStudent_id());
		map.put("university",stuvo.getUniversity());	
		
		model.addAttribute("timetable",service.find(map));
		return "StudentInfo/timetable";
		
	}
	
	/*
	@RequestMapping(value = "/deletesub", method = {RequestMethod.GET, RequestMethod.POST})
	public String deleteSub(HttpServletRequest request, HttpServletResponse response)  throws Exception{
		logger.info("delete subject");
		
		UserVO uservo = null;
		ProfessorVO provo;
		StudentVO stuvo = null;

		
		//사용자 정보를 위한 코드
		 HttpSession session=request.getSession();		 
		 String type=(String)session.getAttribute("SESSION_TYPE");
		 

		   if(type.equals("학생")) {
			   stuvo =(StudentVO) session.getAttribute("SESSION_INFO");
		   }
		   else {
			   provo=(ProfessorVO) session.getAttribute("SESSION_INFO");	   
			   response.setContentType("text/html; charset=UTF-8");
               PrintWriter out = response.getWriter();
               out.println("<script>alert('학생 전용 페이지입니다.'); history.go(-1); </script>");
               out.flush();
			
		  }
		    
		//찾을 변수 입력  
		Map <String,String> map = new HashMap <>();
		map.put("student_id",stuvo.getStudent_id());
		map.put("university",stuvo.getUniversity());	


		service.deletesub(map);
		return "redirect:/StudentInfo/timetable";

	}*/
	
	
	
	// 아이디 중복 체크
   @ResponseBody
   @RequestMapping(value="/deletecourse", method = RequestMethod.POST)
   public void checkid(String course_name, HttpServletRequest request, HttpServletResponse response)  throws Exception{
	   
	   
	   UserVO uservo = null;
		ProfessorVO provo;
		StudentVO stuvo = null;

		
		//사용자 정보를 위한 코드
		 HttpSession session=request.getSession();		 
		 String type=(String)session.getAttribute("SESSION_TYPE");
		 

		   if(type.equals("학생")) {
			   stuvo =(StudentVO) session.getAttribute("SESSION_INFO");
		   }
		   else {
			   provo=(ProfessorVO) session.getAttribute("SESSION_INFO");	   
			   response.setContentType("text/html; charset=UTF-8");
              PrintWriter out = response.getWriter();
              out.println("<script>alert('학생 전용 페이지입니다.'); history.go(-1); </script>");
              out.flush();
			
		  }
		   
		    
      logger.info(course_name);
      
      Map <String, String> map = new HashMap <>();
      
      map.put("student_id",stuvo.getStudent_id());
		map.put("course_name",course_name);	
		
		service.deletesub(map);
   }
	   
  

	@RequestMapping(value = "/gradingView", method = RequestMethod.GET)
	public void gradingView(GradingVO gradingVO,HttpServletRequest request,Model model) throws Exception{
		logger.info("gradingView");
		model.addAttribute("university",request.getParameter("university"));
		model.addAttribute("course_name",request.getParameter("course_name"));
		model.addAttribute("course_number",request.getParameter("course_number"));
	
	}	
	@RequestMapping(value = "/grading", method = RequestMethod.POST)
	public String grading(GradingVO gradingVO,HttpServletRequest request,Model model) throws Exception{
		logger.info("grading");
		 HttpSession session=request.getSession();		 
		StudentVO stuvo =(StudentVO) session.getAttribute("SESSION_INFO");
		gradingVO.setStudent_id(stuvo.getStudent_id());
		gradingservice.grading(gradingVO);
		return "redirect:/StudentInfo/success";
	}	
	@RequestMapping(value = "/success", method = RequestMethod.GET)
	public String success() throws Exception{
		
		return "/StudentInfo/success";
	}	
	
}
