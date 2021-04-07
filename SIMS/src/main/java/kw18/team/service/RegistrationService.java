package kw18.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kw18.team.vo.Count;
import kw18.team.vo.CourseReviewVO;
import kw18.team.vo.NoticeBoardVO;
import kw18.team.vo.Search;
import kw18.team.vo.TimetableVO;
import kw18.team.dao.RegistrationDAO;


@Service
public class RegistrationService {
	@Inject
	private RegistrationDAO review;
	
	public void write(CourseReviewVO reviewVO){
		// TODO Auto-generated method stub
		try {
			review.write(reviewVO);
		}catch(Exception e) {
			e.printStackTrace();
		}	
	}
	public boolean enroll(String course_number,String id)throws Exception{
		 return review.enroll(course_number,id);
	}
	public List<TimetableVO> list(Search cri) throws Exception{
		return  review.list(cri);
	}
	public int listCount(Search cri) throws Exception{
		return review.listCount(cri);
	}
	public TimetableVO showCourseInfo(String course_number) throws Exception{
		return review.showCourseInfo(course_number);
	}
	public List<CourseReviewVO> reviewlist(String course_name,String professor,String course_number) throws Exception{
		return  review.reviewlist(course_name, professor,course_number);
	}
	public int Avg_Star_Point(String course_name,String professor) {
		return review.Avg_Star_Point(course_name,professor);
	}
}