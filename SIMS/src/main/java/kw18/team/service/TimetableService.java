package kw18.team.service;

import kw18.team.vo.StudentVO;
import kw18.team.vo.TimetableVO;

import java.util.List;
import java.util.Map;



public interface TimetableService {

	//to get timetable info
		public List<TimetableVO> find(Map <String,String> map) throws Exception;
		//to delete subject 
		public void deletesub(Map <String,String> map) throws Exception;
		
		public List<TimetableVO> major(StudentVO vo) throws Exception;
		
		public List<TimetableVO> elective(StudentVO vo) throws Exception;
		
		public List<Integer> star_point(StudentVO vo) throws Exception;
}
