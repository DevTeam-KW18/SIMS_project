package kw18.team.dao;

import java.util.List;

import kw18.team.vo.Count;
import kw18.team.vo.BoardVO;

public interface BoardDAO {
	// writing post
		public void write(BoardVO boardVO) throws Exception;
		//list view
		public List<BoardVO> list(Count cri) throws Exception;
		//reading board
		public BoardVO read(BoardVO boardVO) throws Exception;	
		// modify
		public void update(BoardVO boardVO) throws Exception;	
		// delete
		public void delete(BoardVO boardVO) throws Exception;
		//for list counting 
		public int listCount() throws Exception;
		//comment
		public void Comment(BoardVO boardVO ) throws Exception;
		//for HIT
		public void boardhit(BoardVO boardVO) throws Exception;
		
		public void like(BoardVO boardVO) throws Exception;
		
		public List<BoardVO> hot(String university) throws Exception;
}
