package kw18.team.controller;


import java.io.PrintWriter;

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

import kw18.team.service.UserService;
import kw18.team.vo.ProfessorVO;
import kw18.team.vo.StudentVO;
import kw18.team.vo.UserVO;

import kw18.team.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {

   private static final Logger logger = LoggerFactory.getLogger(UserController.class);
   
   @Inject
   UserService service;
   
   
   // 회원가입 유형 선택
   @RequestMapping(value = "/user/joinSelect", method = RequestMethod.GET)
   public void joinSelect() throws Exception{
      logger.info("joinSelect");
      
   }
      
      
   // 학생 회원가입 화면
   @RequestMapping(value = "/user/joinView_stu", method = RequestMethod.GET)
   public void joinView_stu() throws Exception{
      logger.info("joinView_stu");
      
   }
   
   // 학생 회원가입 완료
   @RequestMapping(value = "/user/join_stu", method = RequestMethod.POST)
   public String join_stu(StudentVO stuVO) throws Exception{
      logger.info("join_stu");
      
      service.join(stuVO);
      
      return "/user/userMain";
   }
   
   // 교수 회원가입 화면
   @RequestMapping(value = "/user/joinView_pro", method = RequestMethod.GET)
   public void joinView_pro() throws Exception{
      logger.info("joinView_pro");
      
   }
   
   // 교수 회원가입 완료
   @RequestMapping(value = "/user/join_pro", method = RequestMethod.POST)
   public String join_pro(ProfessorVO proVO) throws Exception{
      logger.info("join_pro");
      
      service.join(proVO);
      
      return "/user/userMain";
   }
   
   // 로그인, 회원가입 선택 화면
   @RequestMapping(value = "/user/userMain", method = RequestMethod.GET)
   public String usermain() throws Exception{
      logger.info("user main, select join/login");
      
      return "/user/userMain";
   }
   
   // 로그인
   @RequestMapping(value = "/user/login", method = RequestMethod.POST)
   public String login(Model model, UserVO uservo, HttpServletRequest req, HttpServletResponse response, RedirectAttributes rttr) throws Exception{
      
      HttpSession session = req.getSession();
      UserVO login = service.login(uservo);
      
      if(login == null) {
         logger.info("login fail");
         
         response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('로그인 오류입니다. 아이디와 비밀번호를 확인하세요.');</script>");
            out.flush();
            
         return "/user/userMain";
      }else {
         logger.info("login success");
         
            rttr.addFlashAttribute("UserVO",login);
            
            if (login.getType().equals("교수")) {
               ProfessorVO provo = service.get_proData(login);
               rttr.addFlashAttribute("ProfessorVO",provo);
               logger.info("교수 이름 : "+provo.getName());
               session.setAttribute("SESSION_INFO",provo);
            }
            else {
               StudentVO stuvo = service.get_stuData(login);
               rttr.addFlashAttribute("StudentVO",stuvo);
               logger.info("학생 이름 : "+stuvo.getName());
                session.setAttribute("SESSION_INFO",stuvo);
            }
           session.setAttribute("SESSION_TYPE",login.getType());
            
         return "redirect:/main";
      }
   }
   
   // 로그 아웃
   @RequestMapping(value = "/logout", method = RequestMethod.GET)
   public String logout(HttpSession session) throws Exception{
      
      session.invalidate();
      
      return "/user/userMain";
   }
   
   // 아이디 중복 체크
   @ResponseBody
   @RequestMapping(value="/checkid", method = RequestMethod.POST)
   public String checkid(String id) throws Exception {
      logger.info("체크할 id" + id);
      int result = service.check_id(id);
      logger.info("체크할 id" + result);
      if (result == 0) return "0";
      else return "1";
   }

   @RequestMapping(value = "/show_privacyval", method = RequestMethod.GET)
   public void show_privacyval(Model model, HttpServletRequest request) throws Exception{
	   
	   HttpSession session=request.getSession();
	   String type=(String)session.getAttribute("SESSION_TYPE");
	   
	   if(type.equals("학생")) {
		   StudentVO stuvo  =(StudentVO) session.getAttribute("SESSION_INFO");
		   model.addAttribute("passwd_chk", stuvo.getPasswd());
		   model.addAttribute("iden", "student");
	   }
	   else {
		   ProfessorVO professor=(ProfessorVO) session.getAttribute("SESSION_INFO");
		   model.addAttribute("passwd_chk", professor.getPasswd());
		   model.addAttribute("iden", "professor");
	   }
	   
   }
   
   // 학생 개인정보 조회
   @RequestMapping(value = "/show_stuval", method = RequestMethod.GET)
   public void show_stuval(Model model, HttpServletRequest request) throws Exception{
	   
	   HttpSession session=request.getSession();
	   String type=(String)session.getAttribute("SESSION_TYPE");
	   StudentVO stuvo =(StudentVO) session.getAttribute("SESSION_INFO");
	   
	   logger.info(stuvo.getId());
	   
	   model.addAttribute("stuvo", stuvo);
	   
   }
   
   // 교수 개인정보 조회
   @RequestMapping(value = "/show_proval", method = RequestMethod.GET)
   public void show_proval(Model model, HttpServletRequest request) throws Exception{
	   HttpSession session=request.getSession();
	   String type=(String)session.getAttribute("SESSION_TYPE");
	   ProfessorVO provo=(ProfessorVO) session.getAttribute("SESSION_INFO");
	   
	   model.addAttribute("provo", provo);
	   
   }
   
   
   // 학생 개인정보 업데이트
   @RequestMapping(value = "/update_stuval", method = RequestMethod.POST)
   public String show_proval(Model model, HttpServletRequest request, String phone_number, String email, RedirectAttributes rttr) throws Exception{
	   HttpSession session=request.getSession();
	   String type=(String)session.getAttribute("SESSION_TYPE");
	   StudentVO stuvo =(StudentVO) session.getAttribute("SESSION_INFO");
	   stuvo.setPhone_number(phone_number);
	   stuvo.setEmail(email);
	   
	   
       rttr.addFlashAttribute("StudentVO",stuvo);
       logger.info("학생 이름 : "+stuvo.getName());
       session.setAttribute("SESSION_INFO",stuvo);
        
       service.update(stuvo);
       
	   return "redirect:/user/show_privacyval";
   }
   
   
   // 교수 개인정보 업데이트
   @RequestMapping(value = "/update_proval", method = RequestMethod.POST)
   public String show_proval(Model model, HttpServletRequest request, String phone_number, String email, String lab, RedirectAttributes rttr) throws Exception{
	   HttpSession session=request.getSession();
	   String type=(String)session.getAttribute("SESSION_TYPE");
	   ProfessorVO provo=(ProfessorVO) session.getAttribute("SESSION_INFO");
	   
	   provo.setPhone_number(phone_number);
	   provo.setEmail(email);
	   provo.setLab(lab);
	   
	   
       rttr.addFlashAttribute("ProfessorVO",provo);
       logger.info("교수 이름 : "+provo.getName());
       session.setAttribute("SESSION_INFO",provo);
       
       service.update(provo);
       
	   return "redirect:/user/show_privacyval";
	   
   }
}

