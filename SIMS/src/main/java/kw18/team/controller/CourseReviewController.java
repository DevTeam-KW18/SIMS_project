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

import kw18.team.service.CourseReviewService;
import kw18.team.vo.Count;
import kw18.team.vo.CourseReviewVO;
import kw18.team.vo.NoticeBoardVO;
import kw18.team.vo.PageMaker;
import kw18.team.vo.ProfessorVO;
import kw18.team.vo.Search;
import kw18.team.vo.StudentVO;

@Controller
@RequestMapping("/review/*")
public class CourseReviewController {
	private static final Logger logger = LoggerFactory.getLogger(CourseReviewController.class);

	@Inject
	CourseReviewService service;
	
	@RequestMapping(value = "/review/writeView", method = RequestMethod.GET)// �Խ��� �� ���� ��
	public void writeView(HttpServletRequest request,Model model) throws Exception{
		
		logger.info("writeView");
		HttpSession session=request.getSession();
		String type=(String)session.getAttribute("SESSION_TYPE");
		if(type.equals("학생")) {
			StudentVO stu=(StudentVO) session.getAttribute("SESSION_INFO");
			logger.info(stu.getStudent_id());
		}
		else {
			ProfessorVO professor=(ProfessorVO) session.getAttribute("SESSION_INFO");
			//id=professor.getProfessor_id();
		}
		model.addAttribute("CourseNumber",request.getParameter("course_number"));
		model.addAttribute("CourseName",request.getParameter("course_name"));
		model.addAttribute("Professor",request.getParameter("professor"));
		model.addAttribute("University",request.getParameter("university"));
	}
		
	@RequestMapping(value = "/review/write", method = RequestMethod.POST)
	public String write(CourseReviewVO review,HttpServletRequest request) throws Exception{
		logger.info("write");
		service.write(review);
		request.setCharacterEncoding("UTF-8");
		String address="redirect: /SIMS/review/reviewlist?course_name="
				+URLEncoder.encode(request.getParameter("course_name"),"UTF-8")
				+"&professor="+URLEncoder.encode(request.getParameter("professor"),"UTF-8")
				+"&course_number="+review.getCourse_number()
				+"&university="+URLEncoder.encode(request.getParameter("university"),"UTF-8");
		
		return address;
			
	}
	
	@RequestMapping(value = "/review/list", method = RequestMethod.GET)
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
		return "review/list";
		
	}		
	
	@RequestMapping(value = "/review/reviewlist", method = RequestMethod.GET)
	public String reviewlist(CourseReviewVO coursereviewVO,Model model,HttpServletRequest request) throws Exception{
		HttpSession session=request.getSession();
		StudentVO stu=(StudentVO) session.getAttribute("SESSION_INFO");
		
		model.addAttribute("University",request.getParameter("university"));
		model.addAttribute("CourseName",coursereviewVO.getCourse_name());
		model.addAttribute("Professor",coursereviewVO.getProfessor());
		model.addAttribute("Writable",service.writeReviewValidate(coursereviewVO.getCourse_name(),stu.getStudent_id()));
		model.addAttribute("CourseInfo",service.showCourseInfo(coursereviewVO.getCourse_number()));
		model.addAttribute("AvgStar",service.Avg_Star_Point(coursereviewVO.getCourse_name(),coursereviewVO.getProfessor()));
		model.addAttribute("reviewlist",service.reviewlist(coursereviewVO.getCourse_name(),coursereviewVO.getProfessor(),coursereviewVO.getCourse_number()));
		return "review/reviewlist";
		
	}		
	
}
