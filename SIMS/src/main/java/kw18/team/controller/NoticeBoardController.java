package kw18.team.controller;



import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.HashMap;
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

import kw18.team.service.NoticeBoardService;
import kw18.team.vo.NoticeBoardVO;
import kw18.team.vo.Count;
import kw18.team.vo.PageMaker;
import kw18.team.vo.ProfessorVO;
import kw18.team.vo.StudentVO;
import kw18.team.vo.TimetableVO;
import kw18.team.vo.UserVO;


@Controller
@RequestMapping("/Noticeboard/*")
public class NoticeBoardController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeBoardController.class);
	
	@Inject
	NoticeBoardService service;
	
	
	// writing view
	@RequestMapping(value = "/writeView", method = RequestMethod.GET)
	public void writeView(HttpServletRequest request ,Model model) throws Exception{
		
		UserVO uservo = null;
		ProfessorVO provo;
		StudentVO stuvo = null;
		
		logger.info("writeView");

		Map <String,String> map = new HashMap <>();
		HttpSession session=request.getSession();
		
		String type=(String)session.getAttribute("SESSION_TYPE");
		if(type.equals("학생")) {
			StudentVO stu=(StudentVO) session.getAttribute("SESSION_INFO");
		}
		else {
			   provo=(ProfessorVO) session.getAttribute("SESSION_INFO");
			   model.addAttribute("Professor_ID",provo.getId());
			   model.addAttribute("Professor",provo.getName());
		}

	}
	
	
	// writing 
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(NoticeBoardVO boardVO,HttpServletRequest request) throws Exception{
		logger.info("write");
		
		service.write(boardVO);			
		String address="redirect:/Noticeboard/list?course_number="
				+boardVO.getCourse_number()
				+"&course_name="+URLEncoder.encode(boardVO.getCourse_name(),"UTF-8")
				+"&university="+URLEncoder.encode(boardVO.getUniversity(),"UTF-8")
				+"&type="+URLEncoder.encode("교수","UTF-8");
		return address;
				
	}
	
	// list seeing 
		@RequestMapping(value = "/relist", method = RequestMethod.POST)
		public String relist(HttpServletRequest request,NoticeBoardVO boardVO) throws Exception{
			
			HttpSession session=request.getSession();
			String address; 
			String type=(String)session.getAttribute("SESSION_TYPE");
			if(type.equals("학생")) {
				StudentVO stu=(StudentVO) session.getAttribute("SESSION_INFO");
				 address="redirect:/Noticeboard/list?course_number="
						+boardVO.getCourse_number()
						+"&university="+URLEncoder.encode(boardVO.getUniversity(),"UTF-8")
						+"&type="+URLEncoder.encode("학생","UTF-8");
			}
			else {
				  ProfessorVO provo=(ProfessorVO) session.getAttribute("SESSION_INFO");
				   address="redirect:/Noticeboard/list?course_number="
							+boardVO.getCourse_number()
							+"&university="+URLEncoder.encode(boardVO.getUniversity(),"UTF-8")
							+"&type="+URLEncoder.encode("교수","UTF-8");
			}

			
			return address;
		}
		
		
		  //see the list view and for counting 
		@RequestMapping(value = "/list", method = RequestMethod.GET)
		public String list(Model model, Count cnt,HttpServletRequest request) throws Exception{
			logger.info("list");
			
			UserVO uservo = null;
			ProfessorVO provo;
			StudentVO stuvo = null;
			
			Map <String,String> map = new HashMap <>();
			
			HttpSession session=request.getSession();
			String type=(String)session.getAttribute("SESSION_TYPE");
			
			if(type.equals("학생")) {
				StudentVO stu=(StudentVO) session.getAttribute("SESSION_INFO");
			}
			else {
				ProfessorVO professor=(ProfessorVO) session.getAttribute("SESSION_INFO");
			}
			
			String course_number=request.getParameter("course_number");
			
			model.addAttribute("list", service.list(cnt));			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCnt(cnt);
			pageMaker.setTotalCount(service.listCount(course_number));			
			model.addAttribute("pageMaker", pageMaker);			
			return "Noticeboard/list";
			
		}
		
		//see the list reading 
		@RequestMapping(value = "/readView", method = RequestMethod.GET)
		public void read(HttpServletRequest request, NoticeBoardVO boardVO, Model model) throws Exception{
			logger.info("read");
	
			String bno=request.getParameter("bno");
			boardVO=service.read(Integer.parseInt(bno));
			model.addAttribute("read", boardVO);
		}
		
		//see the list reading but for HIT
				@RequestMapping(value = "/reading", method = RequestMethod.GET)
				public void reading(HttpServletRequest request, NoticeBoardVO boardVO, Model model) throws Exception{
					logger.info("reading");
					 service.reading(boardVO.getBno());
					
				}
		

		//modify
		@RequestMapping(value = "/update", method = RequestMethod.POST)
		public String update(NoticeBoardVO boardVO,Model model) throws Exception{
			logger.info("update");
			service.update(boardVO);
			
			String address="redirect:/Noticeboard/list?course_number="
					+boardVO.getCourse_number()
					+"&course_name="+URLEncoder.encode(boardVO.getCourse_name(),"UTF-8")
					+"&university="+URLEncoder.encode(boardVO.getUniversity(),"UTF-8")
					+"&type="+URLEncoder.encode("교수","UTF-8");
			return address;
					
		
		}

		//delete
		@RequestMapping(value = "/delete", method = RequestMethod.POST)
		public String delete(NoticeBoardVO boardVO) throws Exception{
			logger.info("delete");
			service.delete(boardVO.getBno());
			String address="redirect:/Noticeboard/list?course_number="
					+boardVO.getCourse_number()
					+"&course_name="+URLEncoder.encode(boardVO.getCourse_name(),"UTF-8")
					+"&university="+URLEncoder.encode(boardVO.getUniversity(),"UTF-8")
					+"&type="+URLEncoder.encode("교수","UTF-8");
			return address;
					
		}
		

		//현재 수강중인 과목 보여주기
		@RequestMapping(value = "/current_course_list", method = RequestMethod.GET)
		public String current_course_list(HttpServletRequest request, HttpServletResponse response, Model model, TimetableVO timetableVO) throws Exception{
				logger.info("cnrrent_course_list");
			
				UserVO uservo = null;
				ProfessorVO provo;
				StudentVO stuvo = null;

				Map <String,String> map = new HashMap <>();
					//사용자 정보를 위한 코드
				 HttpSession session=request.getSession();		 
				String type=(String)session.getAttribute("SESSION_TYPE");
				
					if(type.equals("학생")) {
						   stuvo =(StudentVO) session.getAttribute("SESSION_INFO");
						   map.put("student_id",stuvo.getStudent_id());
						   map.put("university",stuvo.getUniversity());	
						   model.addAttribute("list", service.current_course_list(map));
						   return "Noticeboard/current_course_list";
					   }
					   else {//교수인 경우
						   provo=(ProfessorVO) session.getAttribute("SESSION_INFO");
						   map.put("name",provo.getName());
						   map.put("university",provo.getUniversity());
						   model.addAttribute("list", service.current_course_list_pro(map));	
						   return "Noticeboard/current_course_list_pro";
					  }
			
		}
	
}