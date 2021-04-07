package kw18.team.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kw18.team.vo.StudentVO;
import kw18.team.vo.TimetableVO;

@Repository
public class TimetableDAOImpl implements TimetableDAO{

	@Inject
	private SqlSession sqlSession;
	
	
	@Override  //get timetable information
	public List <TimetableVO> find(Map <String,String> map) throws Exception {
		//System.out.println("dao: "+student_id);
		return sqlSession.selectList("TimetableMapper.course_get", map);
	}
	
	@Override //to delete subject
	public void deletesub(Map <String,String> map) throws Exception {
		System.out.println("dao: deletesub function"+map.get("student"));
		
		 sqlSession.delete("TimetableMapper.course_delete", map);
	}
	
	public List <TimetableVO> major(StudentVO vo) throws Exception {
		return sqlSession.selectList("TimetableMapper.major", vo);
	}
	
	public List <TimetableVO> elective(StudentVO vo) throws Exception{
		return sqlSession.selectList("TimetableMapper.elective", vo);
	}
	
	public List<Integer> star_point(StudentVO vo) throws Exception{
		return sqlSession.selectList("TimetableMapper.star_point", vo);
	}
}
