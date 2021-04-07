package kw18.team.service;

import java.util.List;

import kw18.team.vo.GradeVO;
import kw18.team.vo.StudentVO;

public interface GradeService {

	public List<GradeVO> get_gradelist(StudentVO stuvo) throws Exception;
	
	public double get_avggrade(StudentVO stuvo) throws Exception;
	public double get_sumcredit(StudentVO stuvo) throws Exception;
	public double get_sumgrade(StudentVO stuvo) throws Exception;
}