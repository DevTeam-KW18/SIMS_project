package kw18.team.service;

import java.util.List;
import java.util.Map;

import kw18.team.vo.NoticeBoardVO;
import kw18.team.vo.TimetableVO;
import kw18.team.vo.Count;

public interface NoticeBoardService {

	// writing board
	public void write(NoticeBoardVO boardVO) throws Exception;
	//list for board
	public List<NoticeBoardVO> list(Count cri) throws Exception;
	//reading board
	public NoticeBoardVO read(int bno) throws Exception;
	//modify
	public void reading(int bno) throws Exception ;
	
	public void update(NoticeBoardVO boardVO) throws Exception;
	//delete
	public void delete(int bno) throws Exception;
	//for counting list 
	public int listCount(String course_number) throws Exception;	

	//for seeing current course list 
	public List<TimetableVO> current_course_list(Map <String,String> map) throws Exception;
	//for professor
	public List<TimetableVO> current_course_list_pro(Map <String,String> map) throws Exception;
	
	/*//for seeing course_list_student
	public List<TimetableVO> change_list(Map <String,String> map) throws Exception;*/
	public List<NoticeBoardVO> latest(Map <String,String> map) throws Exception;
	
	public List<NoticeBoardVO> latest_pro(Map <String,String> map) throws Exception;
	
	
	
	
}
