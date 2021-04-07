package kw18.team.controller;

import java.net.URLEncoder;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kw18.team.service.RegistrationService;
import kw18.team.vo.Count;
import kw18.team.vo.CourseReviewVO;
import kw18.team.vo.NoticeBoardVO;
import kw18.team.vo.PageMaker;
import kw18.team.vo.ProfessorVO;
import kw18.team.vo.Search;
import kw18.team.vo.StudentVO;

@Controller
@RequestMapping("/Registration/*")
public class RegistrationController {
	private static final Logger logger = LoggerFactory.getLogger(RegistrationController.class);

	@Inject
	RegistrationService service;
	
	
	@RequestMapping(value = "/Registration/list", method = RequestMethod.GET)
	public String list(Model model,@ModelAttribute("cri")Search cri,HttpServletRequest request) throws Exception{
		logger.info("list");
		String id;
		HttpSession session=request.getSession();
		String type=(String)session.getAttribute("SESSION_TYPE");
		if(type.equals("학생")) {
			StudentVO stu=(StudentVO) session.getAttribute("SESSION_INFO");
			id=stu.getStudent_id();
		}
		else {
			ProfessorVO professor=(ProfessorVO) session.getAttribute("SESSION_INFO");
			id=professor.getProfessor_id();
		}
		
		
		model.addAttribute("list",service.list(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCnt(cri);
		pageMaker.setTotalCount(service.listCount(cri));			
		model.addAttribute("pageMaker", pageMaker);	
		return "Registration/list";
		
		
		
	}		
	@RequestMapping(value = "/Registration/enroll", method = RequestMethod.GET)
	public void enrollment(HttpServletRequest request,Model model) throws Exception{
		logger.info("enroll");
		HttpSession session=request.getSession();
		String type=(String)session.getAttribute("SESSION_TYPE");
		StudentVO stu=(StudentVO) session.getAttribute("SESSION_INFO");
		String id=stu.getStudent_id();
		request.setCharacterEncoding("UTF-8");
		boolean enrollment=service.enroll(request.getParameter("course_number"),id);
		logger.info(String.valueOf(enrollment));
		model.addAttribute("validate",enrollment);
		
	}		
	
	@RequestMapping(value = "/Registration/info", method = RequestMethod.GET)
	public String reviewlist(CourseReviewVO coursereviewVO,Model model,HttpServletRequest request) throws Exception{
		
		model.addAttribute("University",request.getParameter("university"));
		model.addAttribute("CourseName",coursereviewVO.getCourse_name());
		model.addAttribute("Professor",coursereviewVO.getProfessor());
		model.addAttribute("CourseNumber",coursereviewVO.getCourse_number());
		model.addAttribute("CourseInfo",service.showCourseInfo(coursereviewVO.getCourse_number()));
		model.addAttribute("AvgStar",service.Avg_Star_Point(coursereviewVO.getCourse_name(),coursereviewVO.getProfessor()));
		model.addAttribute("reviewlist",service.reviewlist(coursereviewVO.getCourse_name(),coursereviewVO.getProfessor(),coursereviewVO.getCourse_number()));
		return "Registration/info";
		
	}		
	
}