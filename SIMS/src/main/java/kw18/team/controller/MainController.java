package kw18.team.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
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

import kw18.team.service.BoardService;
import kw18.team.service.NoticeBoardService;
import kw18.team.vo.BoardVO;
import kw18.team.vo.NoticeBoardVO;
import kw18.team.vo.ProfessorVO;
import kw18.team.vo.ReplyVO;
import kw18.team.vo.StudentVO;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Inject
	BoardService bservice;
	
	@Inject
	NoticeBoardService nservice;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mainView(Model model, HttpServletRequest request, HttpServletResponse response, BoardVO boardVO, NoticeBoardVO vo) throws Exception {
		logger.info("main");
		
		String university;
		
		Map <String,String> map = new HashMap <>();
		
		HttpSession session=request.getSession();		 
		String type=(String)session.getAttribute("SESSION_TYPE");
		
		if(type.equals("학생")) {
			   StudentVO stuvo =(StudentVO) session.getAttribute("SESSION_INFO");
			   map.put("student_id",stuvo.getStudent_id());
			   map.put("university",stuvo.getUniversity());	
			   university = (String)stuvo.getUniversity();
			   
			   List<NoticeBoardVO> noticeList = nservice.latest(map);
			   model.addAttribute("list", noticeList);
			   
			   
			   List<BoardVO> boardList = bservice.hot(university);
			   model.addAttribute("boardList", boardList);		

			   return "main";
		   }
		   else {//교수인 경우
			   ProfessorVO provo=(ProfessorVO) session.getAttribute("SESSION_INFO");
			   map.put("name",provo.getName());
			   map.put("university",provo.getUniversity());
			   university = (String)provo.getUniversity();
			   
			   List<NoticeBoardVO> noticeList = nservice.latest_pro(map);
			   model.addAttribute("list", noticeList);
			   
			   List<BoardVO> boardList = bservice.hot(university);
			   model.addAttribute("boardList", boardList);
			   
			   return "main";
		  }
	}
	
}

