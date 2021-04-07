package kw18.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kw18.team.dao.GradeDAO;
import kw18.team.vo.GradeVO;
import kw18.team.vo.StudentVO;

@Service
public class GradeServiceImple implements GradeService{

	@Inject
	private GradeDAO dao;
	
	@Override
	public List<GradeVO> get_gradelist(StudentVO stuvo) throws Exception {
		return  dao.get_gradeData(stuvo);
	}
	
	
	@Override
	public double get_avggrade(StudentVO stuvo) throws Exception{
		return  dao.get_avggrade(stuvo);
	}
	
	@Override
	public double get_sumcredit(StudentVO stuvo) throws Exception{
		return  dao.get_sumcredit(stuvo);
	}
	
	@Override
	public double get_sumgrade(StudentVO stuvo) throws Exception{
		return  dao.get_sumgrade(stuvo);
	}
	
}
