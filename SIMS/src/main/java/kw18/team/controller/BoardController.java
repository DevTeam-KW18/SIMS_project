package kw18.team.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kw18.team.service.BoardService;
import kw18.team.service.ReplyService;
import kw18.team.service.UserService;
import kw18.team.vo.BoardVO;
import kw18.team.vo.Count;
import kw18.team.vo.PageMaker;
import kw18.team.vo.ProfessorVO;
import kw18.team.vo.ReplyVO;
import kw18.team.vo.StudentVO;
import kw18.team.vo.UserVO;


@Controller
@RequestMapping("/Board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService service;
	
	@Inject
	ReplyService replyService;
	
	@Inject
	UserService userService;
	
	
	// writing view
	@RequestMapping(value = "/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception{
		logger.info("hi");
	}
	
	
	// writing 
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(BoardVO boardVO, HttpServletRequest request, Model model) throws Exception{
		HttpSession session = request.getSession();
		String type = (String)session.getAttribute("SESSION_TYPE");
		logger.info(type);
		
		
		if (type.equals("학생")) {
			StudentVO stuvo = (StudentVO)session.getAttribute("SESSION_INFO");
			boardVO.setUniversity(stuvo.getUniversity());
			boardVO.setId(stuvo.getId());			
		}
		else {
			ProfessorVO provo = (ProfessorVO)session.getAttribute("SESSION_INFO");
			boardVO.setUniversity(provo.getUniversity());
			boardVO.setId(provo.getId());
		}

		service.write(boardVO);
			
		return "redirect:/Board/list";
	}
	
	// list seeing  
		@RequestMapping(value = "/relist", method = RequestMethod.POST)
		public String relist(BoardVO boardVO) throws Exception{
			return "redirect:/Board/list";
		}
		
		
		  //see the list view and for counting 
		@RequestMapping(value = "/list", method = RequestMethod.GET)
		public String list(Model model, Count cnt) throws Exception{
			logger.info("list");
			
			model.addAttribute("list", service.list(cnt));			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCnt(cnt);
			pageMaker.setTotalCount(service.listCount());			
			model.addAttribute("pageMaker", pageMaker);			
			return "Board/list";
			
		}
		
		//see the list reading 
		@RequestMapping(value = "/readView", method = RequestMethod.GET)
		public String read(BoardVO boardVO, Model model, HttpServletRequest request, ReplyVO replyVO) throws Exception{
			logger.info("read");
			
			
			HttpSession session = request.getSession();
			String type = (String)session.getAttribute("SESSION_TYPE");
			logger.info(type);
			
			if (type.equals("학생")) {
				StudentVO stuvo = (StudentVO)session.getAttribute("SESSION_INFO");
				boardVO.setUniversity(stuvo.getUniversity());
				model.addAttribute("user", stuvo.getId());
			}
			else {
				ProfessorVO provo = (ProfessorVO)session.getAttribute("SESSION_INFO");
				boardVO.setUniversity(provo.getUniversity());
				model.addAttribute("user", provo.getId());
			}
				
			model.addAttribute("read", service.read(boardVO));
			
			model.addAttribute("id", boardVO.getId());
			model.addAttribute("rid", replyVO.getId());			
			
			List<ReplyVO> replyList = replyService.readReply(boardVO.getBno());
			model.addAttribute("replyList", replyList);		
			
			return "Board/readView";
		}
		
		//see the list reading but for HIT
				@RequestMapping(value = "/reading", method = RequestMethod.GET)
				public String reading(BoardVO boardVO, Model model, HttpServletRequest request,ReplyVO replyVO) throws Exception{
					logger.info("reading");
					
					HttpSession session = request.getSession();
					String type = (String)session.getAttribute("SESSION_TYPE");
					logger.info(type);
					
					if (type.equals("학생")) {
						StudentVO stuvo = (StudentVO)session.getAttribute("SESSION_INFO");
						boardVO.setUniversity(stuvo.getUniversity());		
					}
					else {
						ProfessorVO provo = (ProfessorVO)session.getAttribute("SESSION_INFO");
						boardVO.setUniversity(provo.getUniversity());
					}
					
					model.addAttribute("read", service.reading(boardVO));
					System.out.println("bno : "+boardVO.getBno());
					System.out.println("id : "+boardVO.getId());
					
					model.addAttribute("id", boardVO.getId());
					
					model.addAttribute("rid", replyVO.getId());
					
					return "Board/reading";
				}
		

		//modify
		@RequestMapping(value = "/update", method = RequestMethod.POST)
		public String update(BoardVO boardVO,Model model, HttpServletRequest request) throws Exception{
			logger.info("update");
			
			HttpSession session = request.getSession();
			String type = (String)session.getAttribute("SESSION_TYPE");
			logger.info(type);
			
			if (type.equals("학생")) {
				StudentVO stuvo = (StudentVO)session.getAttribute("SESSION_INFO");
				boardVO.setUniversity(stuvo.getUniversity());		
			}
			else {
				ProfessorVO provo = (ProfessorVO)session.getAttribute("SESSION_INFO");
				boardVO.setUniversity(provo.getUniversity());
			}
			
			service.update(boardVO);
			
					
			return "redirect:/Board/list";
		}

		//delete
		@RequestMapping(value = "/delete", method = RequestMethod.POST)
		public String delete(BoardVO boardVO, HttpServletRequest request) throws Exception{
			logger.info("delete");
			
			HttpSession session = request.getSession();
			String type = (String)session.getAttribute("SESSION_TYPE");
			logger.info(type);
			
			if (type.equals("학생")) {
				StudentVO stuvo = (StudentVO)session.getAttribute("SESSION_INFO");
				boardVO.setUniversity(stuvo.getUniversity());		
			}
			else {
				ProfessorVO provo = (ProfessorVO)session.getAttribute("SESSION_INFO");
				boardVO.setUniversity(provo.getUniversity());
			}
			
			service.delete(boardVO);
			return "redirect:/Board/list";
		}
		
		//like
		@RequestMapping(value = "/like", method = RequestMethod.POST)
		public String like(BoardVO boardVO, HttpServletRequest request) throws Exception{
			logger.info("delete");
			
			HttpSession session = request.getSession();
			String type = (String)session.getAttribute("SESSION_TYPE");
			logger.info(type);
			String id;
			
			if (type.equals("학생")) {
				StudentVO stuvo = (StudentVO)session.getAttribute("SESSION_INFO");
				boardVO.setUniversity(stuvo.getUniversity());	
			}
			else {
				ProfessorVO provo = (ProfessorVO)session.getAttribute("SESSION_INFO");
				boardVO.setUniversity(provo.getUniversity());
			}
			id = service.read(boardVO).getId();
			
			service.like(boardVO);
			return "redirect:/Board/readView"+"?bno="+boardVO.getBno()+"&id="+id;
		}
				
		// comment writing view
		@RequestMapping(value = "/commentView", method = {RequestMethod.GET, RequestMethod.POST})
		public void commentView(BoardVO boardVO,Model model, HttpServletRequest request) throws Exception{
			logger.info("commentView");
			
			HttpSession session = request.getSession();
			String type = (String)session.getAttribute("SESSION_TYPE");
			logger.info(type);
			
			if (type.equals("학생")) {
				StudentVO stuvo = (StudentVO)session.getAttribute("SESSION_INFO");
				boardVO.setUniversity(stuvo.getUniversity());		
			}
			else {
				ProfessorVO provo = (ProfessorVO)session.getAttribute("SESSION_INFO");
				boardVO.setUniversity(provo.getUniversity());
			}
			
			model.addAttribute("read", service.read(boardVO));
		}
		//comment write
		@RequestMapping(value = "/comment", method = RequestMethod.POST)
		public String commentwrite(BoardVO boardVO,Model model, HttpServletRequest request) throws Exception{
			logger.info("commentwrite");
			
			HttpSession session = request.getSession();
			String type = (String)session.getAttribute("SESSION_TYPE");
			logger.info(type);
			
			
			if (type.equals("학생")) {
				StudentVO stuvo = (StudentVO)session.getAttribute("SESSION_INFO");
				boardVO.setUniversity(stuvo.getUniversity());
				boardVO.setId(stuvo.getId());			
			}
			else {
				ProfessorVO provo = (ProfessorVO)session.getAttribute("SESSION_INFO");
				boardVO.setUniversity(provo.getUniversity());
				boardVO.setId(provo.getId());
			}
		
			service.Comment(boardVO);
			return "redirect:/Board/list"; 
		}	
		
		@RequestMapping(value = "/typecheck", method = {RequestMethod.GET, RequestMethod.POST})
		public void typecheck(BoardVO boardVO) throws Exception{
			logger.info("typecheck");
		}
		
		//write reply
		@RequestMapping(value="/replyWrite", method = RequestMethod.POST)
		public String replyWrite(ReplyVO vo ,RedirectAttributes rttr) throws Exception {
			logger.info("reply Write");
			
			replyService.writeReply(vo);
			
			rttr.addAttribute("bno", vo.getBno());
			
			return "redirect:/Board/readView";
		}
		
		//update view
		@RequestMapping(value="/replyUpdateView", method = RequestMethod.GET)
		public String replyUpdateView(ReplyVO vo, Model model, HttpServletRequest request) throws Exception {
			logger.info("reply Write");
			
			model.addAttribute("replyDelete", replyService.selectReply(vo.getRno()));

			HttpSession session=request.getSession();
			String type=(String)session.getAttribute("SESSION_TYPE");
			   
			   if(type.equals("학생")) {
				   StudentVO stuvo  =(StudentVO) session.getAttribute("SESSION_INFO");
				   model.addAttribute("passwd_chk", stuvo.getPasswd());
			   }
			   else {
				   ProfessorVO professor=(ProfessorVO) session.getAttribute("SESSION_INFO");
				   model.addAttribute("passwd_chk", professor.getPasswd());
			   }
			
			
			model.addAttribute("replyUpdate", replyService.selectReply(vo.getRno()));
			
			return "Board/replyUpdateView";
		}
		
		//update
		@RequestMapping(value="/replyUpdate", method = RequestMethod.POST)
		public String replyUpdate(ReplyVO vo, RedirectAttributes rttr) throws Exception {
			logger.info("reply Write");
			
			replyService.updateReply(vo);
			
			rttr.addAttribute("bno", vo.getBno());
			
			return "redirect:/Board/readView";
		}
		

		//delete GET
			@RequestMapping(value="/replyDeleteView", method = RequestMethod.GET)
			public String replyDeleteView(ReplyVO vo, Model model, HttpServletRequest request) throws Exception {
				logger.info("reply Write");
				
				model.addAttribute("replyDelete", replyService.selectReply(vo.getRno()));

				HttpSession session=request.getSession();
				String type=(String)session.getAttribute("SESSION_TYPE");
				   
				   if(type.equals("학생")) {
					   StudentVO stuvo  =(StudentVO) session.getAttribute("SESSION_INFO");
					   model.addAttribute("passwd_chk", stuvo.getPasswd());
				   }
				   else {
					   ProfessorVO professor=(ProfessorVO) session.getAttribute("SESSION_INFO");
					   model.addAttribute("passwd_chk", professor.getPasswd());
				   }
				
				
				return "Board/replyDeleteView";
			}
			
			//delete
			@RequestMapping(value="/replyDelete", method = RequestMethod.POST)
			public String replyDelete(ReplyVO vo, RedirectAttributes rttr) throws Exception {
				logger.info("reply Write");
				
				replyService.deleteReply(vo);
				
				rttr.addAttribute("bno", vo.getBno());
				
				return "redirect:/Board/readView";
			}

}