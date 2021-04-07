package kw18.team.dao;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import kw18.team.controller.StudyResultController;
import kw18.team.controller.UserController;
import kw18.team.vo.GradeVO;
import kw18.team.vo.NoticeBoardVO;
import kw18.team.vo.ProfessorVO;
import kw18.team.vo.StudentVO;
import kw18.team.vo.UserVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service
public class GradeDAOImple implements GradeDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(StudyResultController.class);
	
	@Inject
	private SqlSession sqlSession;
	
	// 해당 학생의 성적 정보 모두 가져오기
	@Override
	public List<GradeVO> get_gradeData(StudentVO stuvo) throws Exception{
		return sqlSession.selectList("StudyResultMapper.get_gradeData", stuvo);
	}
	
	@Override
	public double get_avggrade(StudentVO stuvo) throws Exception{
		return sqlSession.selectOne("StudyResultMapper.get_avggrade", stuvo);
	}
	
	@Override
	public double get_sumcredit(StudentVO stuvo) throws Exception{
		return sqlSession.selectOne("StudyResultMapper.get_sumcredit", stuvo);
	}
	
	@Override
	public double get_sumgrade(StudentVO stuvo) throws Exception{
		return sqlSession.selectOne("StudyResultMapper.get_sumgrade", stuvo);
	}
	
}
	