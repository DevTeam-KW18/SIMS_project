package kw18.team.service;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import kw18.team.dao.NoticeBoardDAO;
import kw18.team.vo.NoticeBoardVO;
import kw18.team.vo.TimetableVO;
import kw18.team.vo.Count;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService {

	@Inject
	private NoticeBoardDAO Dao;
	
	//writing 
	@Override
	public void write(NoticeBoardVO boardVO) throws Exception {
		Dao.write(boardVO);
	}
	
	//see the list view
	@Override
	public List<NoticeBoardVO> list(Count cri) throws Exception {
		return  Dao.list(cri);
	}
	//reading the board list
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public NoticeBoardVO read(int bno) throws Exception {

		return Dao.read(bno);
	}
	//for HIT and read
	@Override
	public void reading(int bno) throws Exception {	
		 Dao.boardhit(bno);
	}
	//modify
	@Override
	public void update(NoticeBoardVO boardVO) throws Exception {
		Dao.update(boardVO);
	}
	//delete
	@Override
	public void delete(int bno) throws Exception {
		Dao.delete(bno);
	}
	
	//count the writing number
	@Override
	public int listCount (String course_number) throws Exception{
		return Dao.listCount(course_number);
	}

	//see the list view
		@Override
		public List<TimetableVO> current_course_list(Map <String,String> map) throws Exception {
			return  Dao.current_course_list(map);
		}
		
		//see the list view
		@Override
		public List<TimetableVO> current_course_list_pro(Map <String,String> map) throws Exception {
			return  Dao.current_course_list_pro(map);
		}	
		
	/*	@Override
		public List<TimetableVO> change_list(Map <String,String> map) throws Exception {
			return  Dao.change_list(map);
		}*/
		
		@Override
		public List<NoticeBoardVO> latest(Map <String,String> map) throws Exception {
			return Dao.latest(map);
		}
		
		@Override
		public List<NoticeBoardVO> latest_pro(Map <String,String> map) throws Exception {
			return Dao.latest_pro(map);
		}
}