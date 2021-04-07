package kw18.team.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kw18.team.service.GradingService;
import kw18.team.vo.GradingVO;
import kw18.team.vo.StudentVO;


@Controller
@RequestMapping("/grading/*")
public class GradingController {
	private static final Logger logger = LoggerFactory.getLogger(GradingController.class);

	
}
