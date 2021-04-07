package kw18.team.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import kw18.team.dao.BoardDAO;
import kw18.team.vo.BoardVO;
import kw18.team.vo.Count;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO Dao;
	
	//writing 
	@Override
	public void write(BoardVO boardVO) throws Exception {
		Dao.write(boardVO);
	}
	
	//see the list view
	@Override
	public List<BoardVO> list(Count cri) throws Exception {
		return  Dao.list(cri);
	}
	//reading the board list
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardVO read(BoardVO boardVO) throws Exception {

		return Dao.read(boardVO);
	}
	//for HIT and read
	@Override
	public BoardVO reading(BoardVO boardVO) throws Exception {	
		 Dao.boardhit(boardVO);
		 return Dao.read(boardVO);
	}
	//modify
	@Override
	public void update(BoardVO boardVO) throws Exception {
		Dao.update(boardVO);
	}
	//delete
	@Override
	public void delete(BoardVO boardVO) throws Exception {
		Dao.delete(boardVO);
	}
	
	//count the writing number
	@Override
	public int listCount () throws Exception{
		return Dao.listCount();
	}
	//comment
	@Override
	public void Comment(BoardVO boardVO) throws Exception {

		Dao.Comment(boardVO);
	}
	
	@Override
	public void like(BoardVO boardVO) throws Exception
	{
		Dao.like(boardVO);
	}
	
	@Override
	public List<BoardVO> hot(String university) throws Exception {
		return Dao.hot(university);
	}
 	
}