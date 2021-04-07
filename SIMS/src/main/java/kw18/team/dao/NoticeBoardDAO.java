package kw18.team.dao;

import java.util.List;
import java.util.Map;

import kw18.team.vo.NoticeBoardVO;
import kw18.team.vo.TimetableVO;
import kw18.team.vo.Count;

public interface NoticeBoardDAO {

	// writing post
	public void write(NoticeBoardVO boardVO) throws Exception;
	//list view
	public List<NoticeBoardVO> list(Count cri) throws Exception;
	//reading board
	public NoticeBoardVO read(int bno) throws Exception;	
	// modify
	public void update(NoticeBoardVO boardVO) throws Exception;	
	// delete
	public void delete(int bno) throws Exception;
	//for list counting 
	public int listCount(String course_number) throws Exception;
	//for HIT
	public void boardhit(int bno) throws Exception;	
	//for current course list 
	public List<TimetableVO> current_course_list(Map <String,String> map) throws Exception;
	//for professor
	public List<TimetableVO> current_course_list_pro(Map <String,String> map) throws Exception;
	//to seeing student course_list
//	public List<NoticeBoardVO> change_list(Map <String,String> map) throws Exception ;
	public List<NoticeBoardVO> latest(Map <String,String> map) throws Exception;
	
	public List<NoticeBoardVO> latest_pro(Map <String,String> map) throws Exception;
	
}