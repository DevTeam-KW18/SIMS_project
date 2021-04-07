package kw18.team.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kw18.team.vo.BoardVO;
import kw18.team.vo.Count;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sqlSession;
	
	// writing post
	@Override
	public void write(BoardVO boardVO) throws Exception {
		
		sqlSession.insert("BoardMapper.insert", boardVO);
	}
	
	//see the listView
	@Override
	public List<BoardVO> list(Count cri) throws Exception {
	
		return sqlSession.selectList("BoardMapper.listPage",cri);

	}
	
	//reading board
	@Override
	public BoardVO read(BoardVO boardVO) throws Exception {
		return sqlSession.selectOne("BoardMapper.read", boardVO);
	}
	
	// modify
		@Override
		public void update(BoardVO boardVO) throws Exception {
 
			sqlSession.update("BoardMapper.update", boardVO);
		}

		// delete
		@Override
		public void delete(BoardVO boardVO) throws Exception {

			sqlSession.delete("BoardMapper.delete", boardVO);
		}
	//for list counting 
		public int listCount() throws Exception{
			return sqlSession.selectOne("BoardMapper.listCount");
		}
		
		//for comment
		@Override
		public void Comment(BoardVO boardVO) throws Exception {

			sqlSession.update("BoardMapper.Commentupdate1", boardVO);
			sqlSession.insert("BoardMapper.Comment", boardVO);
		}

		//for HIT
		@Override
		public void boardhit(BoardVO boardVO) throws Exception {
			sqlSession.update("BoardMapper.boardHit", boardVO);
		}
		
		//for like
		public void like(BoardVO boardVO) throws Exception {
			sqlSession.update("BoardMapper.like", boardVO);
		}
		
		public List<BoardVO> hot(String university) throws Exception {
			return sqlSession.selectList("BoardMapper.hot", university);
		}
	 	
		
}