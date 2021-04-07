package kw18.team.dao;

import java.util.List;

import kw18.team.vo.GradeVO;
import kw18.team.vo.ProfessorVO;
import kw18.team.vo.StudentVO;
import kw18.team.vo.UserVO;

public interface GradeDAO {

	// 해당 학생의 성적 정보 모두 가져오기
	public List<GradeVO> get_gradeData(StudentVO stuvo) throws Exception;
	
	public double get_avggrade(StudentVO stuvo) throws Exception;
	public double get_sumcredit(StudentVO stuvo) throws Exception;
	public double get_sumgrade(StudentVO stuvo) throws Exception;

}