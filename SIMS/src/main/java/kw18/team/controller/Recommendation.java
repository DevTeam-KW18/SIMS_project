package kw18.team.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kw18.team.function.GradeCalculation;
import kw18.team.service.BoardService;
import kw18.team.service.GradeService;
import kw18.team.service.RegistrationService;
import kw18.team.service.TimetableService;
import kw18.team.vo.BoardVO;
import kw18.team.vo.GradeVO;
import kw18.team.vo.PageMaker;
import kw18.team.vo.ProfessorVO;
import kw18.team.vo.Search;
import kw18.team.vo.StudentVO;
import kw18.team.vo.TimetableVO;

@Controller
@RequestMapping("/recommendation/*")
public class Recommendation {	
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	TimetableService service;
	
	@RequestMapping(value = "/recommendation", method = RequestMethod.GET)
	public String list(Model model,HttpServletRequest request, HttpServletResponse response) throws Exception{
		logger.info("recommend");
		String id;
		HttpSession session=request.getSession();
		String type=(String)session.getAttribute("SESSION_TYPE");
		
		StudentVO stu = null;
		ProfessorVO pro = null;

		   if(type.equals("학생")) {
			   stu =(StudentVO) session.getAttribute("SESSION_INFO");
		   }
		   else {
			   pro=(ProfessorVO) session.getAttribute("SESSION_INFO");	   
			   response.setContentType("text/html; charset=UTF-8");
              PrintWriter out = response.getWriter();
              out.println("<script>alert('학생 전용 페이지입니다.'); history.go(-1); </script>");
              out.flush();
			
		  }
		
		id=stu.getStudent_id();
		
		List<TimetableVO> major = service.major(stu);
		model.addAttribute("major", major);
		
		List<TimetableVO> elective = service.elective(stu);
		List<Integer> star_point = service.star_point(stu);
		
		model.addAttribute("elective", elective);
		model.addAttribute("star_point", star_point);
		
		model.addAttribute("stu", stu);
		
				
		return "recommendation/recommendation";
	}		
}
