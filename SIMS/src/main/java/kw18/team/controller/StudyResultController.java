package kw18.team.controller;

import java.io.PrintWriter;
import java.util.Map;
import java.util.ArrayList;
import java.util.List;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import kw18.team.function.GradeCalculation;
import kw18.team.service.GradeService;
import kw18.team.service.UserService;
import kw18.team.vo.GradeVO;
import kw18.team.vo.ProfessorVO;
import kw18.team.vo.StudentVO;
import kw18.team.vo.UserVO;

@Controller
@RequestMapping("/StudyResult/*")
public class StudyResultController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	GradeService service;
	
	
	// 스터디 결과 그래프, 표 출력
	@RequestMapping(value = "/StudyResult/StudyResult", method = RequestMethod.GET)
	public String StudyResult(Model model, HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr) throws Exception{
		
		UserVO uservo = null;
		ProfessorVO provo;
		StudentVO stuvo = null;
		List<GradeVO> grade_list = null;
		
		HttpSession session=request.getSession();
		   String type=(String)session.getAttribute("SESSION_TYPE");
		   
		   if(type.equals("학생")) {
			   stuvo  =(StudentVO) session.getAttribute("SESSION_INFO");
		   }
		   else {
			   provo=(ProfessorVO) session.getAttribute("SESSION_INFO");
			   
			   response.setContentType("text/html; charset=UTF-8");
               PrintWriter out = response.getWriter();
               out.println("<script>alert('학생 전용 페이지입니다.'); history.go(-1); </script>");
               out.flush();
               
               return "/user/show_privacyval";
               
		   }
		
        grade_list = service.get_gradelist(stuvo);
        if(grade_list.size() == 0){
        	
        	response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('수강 내역이 없습니다.'); history.go(-1); </script>");
            out.flush();
            
            return "/user/userMain";
        }
        	
        
        GradeCalculation gradecal = new GradeCalculation(grade_list);
        
        model.addAttribute("grade_list", grade_list);
        model.addAttribute("grade_1_1", gradecal.getGrade_1_1());
        model.addAttribute("grade_1_2", gradecal.getGrade_1_2());
        model.addAttribute("grade_2_1", gradecal.getGrade_2_1());
        model.addAttribute("grade_2_2", gradecal.getGrade_2_2());
        model.addAttribute("grade_3_1", gradecal.getGrade_3_1());
        model.addAttribute("grade_3_2", gradecal.getGrade_3_2());
        model.addAttribute("grade_4_1", gradecal.getGrade_4_1());
        model.addAttribute("grade_4_2", gradecal.getGrade_4_2());
        
        List<Integer> credit_list = new ArrayList();
        
        credit_list.add(gradecal.getTotal_major_credit());
        credit_list.add(gradecal.getTotal_nonmajor_credit());
        credit_list.add(gradecal.getTotal_credit());
        
        model.addAttribute("credit_list", credit_list);
        
        List<Double> grpah_list = new ArrayList();
        
        grpah_list.add(gradecal.getTotal_major_grade());
        grpah_list.add(gradecal.getTotal_nonmajor_grade());
        grpah_list.add(gradecal.getTotal_grade());
        
        model.addAttribute("grpah_list", grpah_list);
        
        
		return "/StudyResult/StudyResult";
		
	}
	
	
}
