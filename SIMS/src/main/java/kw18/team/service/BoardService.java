package kw18.team.service;

import java.util.List;

import kw18.team.vo.Count;
import kw18.team.vo.BoardVO;

public interface BoardService {	
	// writing board
		public void write(BoardVO boardVO) throws Exception;
		//list for board
		public List<BoardVO> list(Count cri) throws Exception;
		//reading board
		public BoardVO read(BoardVO boardVO) throws Exception;
		//modify
		public void update(BoardVO boardVO) throws Exception;
		//delete
		public void delete(BoardVO boardVO) throws Exception;
		//for counting list 
		public int listCount() throws Exception;	
		// writing comment
		public void Comment(BoardVO boardVO) throws Exception;
		//reading for hit
		public BoardVO reading(BoardVO boardVO) throws Exception;
		
		public void like(BoardVO boardVO) throws Exception;
		
		public List<BoardVO> hot(String university) throws Exception;
}
