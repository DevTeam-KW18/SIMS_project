package kw18.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kw18.team.vo.Count;
import kw18.team.vo.CourseReviewVO;
import kw18.team.vo.NoticeBoardVO;
import kw18.team.vo.Search;
import kw18.team.vo.TimetableVO;
@Repository
public class RegistrationDAO {

	@Inject
	private SqlSession sql;
	
	public void write(CourseReviewVO reviewVO){
		// TODO Auto-generated method stub
		try {
			sql.insert("RegistrationMapper.insert",reviewVO);//�ۼ��� �����͸� mapper�� ����
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<TimetableVO> list(Search cri) throws Exception {
		return sql.selectList("RegistrationMapper.listPage",cri);

	}
	public int listCount(Search cri) throws Exception{
		return sql.selectOne("RegistrationMapper.listCount",cri);
	}
	public int Avg_Star_Point(String course_name,String professor) {
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("course_name", course_name);
		map.put("professor", professor);
		if(sql.selectOne("RegistrationMapper.avgStar",map)==null) {
			return 0;
		}
		return sql.selectOne("RegistrationMapper.avgStar",map);
	}
	public TimetableVO showCourseInfo(String course_number) throws Exception{
		
		return sql.selectOne("RegistrationMapper.course_get",course_number);
	}
	public boolean enroll(String course_number,String id)throws Exception {
		if(enrollvalidate(course_number,id)>0) {
			return false;
		}
		else {
			HashMap<String, Object> map=new HashMap<String, Object>();
			TimetableVO courseInfo=selectCourseInfo(course_number);
			map.put("course_number",  course_number);
			map.put("university", courseInfo.getUniversity());
			map.put("course_name", courseInfo.getCourse_name());
			map.put("student_id",id);
			sql.insert("RegistrationMapper.enroll",map);
			return true;
		}
		 
	}
	public TimetableVO selectCourseInfo(String course_number) {
		
		return sql.selectOne("RegistrationMapper.selectCourseInfo",course_number);
	}
	public int enrollvalidate(String course_number,String id)throws Exception{
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("course_number", course_number);
		map.put("id",id);
		if(sql.selectOne("RegistrationMapper.enrollValidate",map)==null) {
			return 0;
		}
		else {
			return sql.selectOne("RegistrationMapper.enrollValidate",map);
		}
		
 	}
	public List<CourseReviewVO> reviewlist(String course_name,String professor,String course_number) throws Exception {
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("course_name", course_name);
			map.put("professor", professor);
			map.put("course_number", course_number);
			return sql.selectList("RegistrationMapper.reviewlist",map);
	
	}
	
}
