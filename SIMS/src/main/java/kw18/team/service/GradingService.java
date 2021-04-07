package kw18.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kw18.team.dao.GradingDAO;
import kw18.team.vo.CourseReviewVO;
import kw18.team.vo.GradingVO;
import kw18.team.vo.Search;
import kw18.team.vo.TimetableVO;



@Service
public class GradingService {
	@Inject
	private GradingDAO dao;
	
	public void grading(GradingVO gradingVO){
			dao.grading(gradingVO);
	}
	
	public List<GradingVO> list(String student_id) throws Exception{
		return  dao.list(student_id);
	}
	
}
