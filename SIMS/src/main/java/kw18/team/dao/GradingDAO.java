package kw18.team.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import kw18.team.vo.GradingVO;

@Repository
public class GradingDAO {
	@Inject
	private SqlSession sql;
	
	
	public void grading(GradingVO gradingVO){
		if(CheckGrade(gradingVO.getCourse_number())==0) {
			sql.insert("GradingMapper.grading",gradingVO);
		}
		else {
			HashMap<String, String> map=new HashMap<String, String>();
			map.put("course_number",gradingVO.getCourse_number());
			map.put("grade", gradingVO.getGrade());
			sql.update("GradingMapper.updateGrade",map);
		}
		
	}
	
	public int CheckGrade(String courseNumber) {
		
			return sql.selectOne("GradingMapper.Check",courseNumber);
		
	}
	
	
	public List<GradingVO> list(String student_id) throws Exception {
		return sql.selectList("GradingMapper.list",student_id);

	}
}
