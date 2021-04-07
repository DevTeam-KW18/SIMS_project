package kw18.team.service;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import kw18.team.dao.NoticeBoardDAO;
import kw18.team.dao.TimetableDAO;
import kw18.team.vo.TimetableVO;
import kw18.team.vo.NoticeBoardVO;
import kw18.team.vo.StudentVO;


@Service
public class TimetableServiceImpl implements TimetableService{
	
	@Inject
	private TimetableDAO Dao;

	@Override
	public List<TimetableVO> find(Map <String,String> map) throws Exception {
		//System.out.println("service function "+id);
		return Dao.find(map);
	}
	
	//to delete subject
	@Override
	public void deletesub(Map <String,String> map) throws Exception {
		System.out.println("service function ");
		 Dao.deletesub(map);
	}
	
	public List<TimetableVO> major(StudentVO vo) throws Exception{
		return Dao.major(vo);
	}
	
	public List<TimetableVO> elective(StudentVO vo) throws Exception{
		return Dao.elective(vo);
	}
	
	public List<Integer> star_point(StudentVO vo) throws Exception{
		return Dao.star_point(vo);
	}
	
}
