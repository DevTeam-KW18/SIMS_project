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
public class CourseReviewDAO {

	@Inject
	private SqlSession sql;
	
	public void write(CourseReviewVO reviewVO){
		// TODO Auto-generated method stub
		try {
			sql.insert("CourseReviewMapper.insert",reviewVO);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<TimetableVO> list(Search cri) throws Exception {
		return sql.selectList("CourseReviewMapper.listPage",cri);

	}
	public int listCount(Search cri) throws Exception{
		return sql.selectOne("CourseReviewMapper.listCount",cri);
	}
	public int Avg_Star_Point(String course_name,String professor) {
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("course_name", course_name);
		map.put("professor", professor);
		if(sql.selectOne("CourseReviewMapper.avgStar",map)==null) {
			return 0;
		}
		return sql.selectOne("CourseReviewMapper.avgStar",map);
	}
	public TimetableVO showCourseInfo(String course_number) throws Exception{
		
		return sql.selectOne("CourseReviewMapper.course_get",course_number);
	}
	
	public String writeReviewValidate(String courseName,String studentId) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("course_name", courseName);
		map.put("professor", studentId);
		if(CheckReviewTable(courseName,studentId)==0&&CheckEnrollmentTable(courseName,studentId)>0) {
			System.out.println(sql.selectOne("CourseReviewMapper.getCourseNumber",courseName).toString());
			return sql.selectOne("CourseReviewMapper.getCourseNumber",courseName);
		}
		else{
			return "UNABLE";
		}
		
	}
	public int CheckReviewTable(String courseName,String studentId) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("course_name", courseName);
		map.put("student_id", studentId);
		return sql.selectOne("CourseReviewMapper.insertValidate",map);
	}
	public int CheckEnrollmentTable(String courseName,String studentId) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("course_name", courseName);
		map.put("student_id", studentId);
		return sql.selectOne("CourseReviewMapper.insertValidate2",map);
	}
	public List<CourseReviewVO> reviewlist(String course_name,String professor,String course_number) throws Exception {
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("course_name", course_name);
			map.put("professor", professor);
			map.put("course_number", course_number);
			return sql.selectList("CourseReviewMapper.reviewlist",map);
	
	}
	
}
