package kw18.team.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kw18.team.vo.NoticeBoardVO;
import kw18.team.vo.TimetableVO;
import kw18.team.vo.Count;

@Repository
public class NoticeBoardDAOImpl implements NoticeBoardDAO {

	@Inject
	private SqlSession sqlSession;
	
	// writing post
	@Override
	public void write(NoticeBoardVO boardVO) throws Exception {
				
		sqlSession.insert("NoticeBoardMapper.insert", boardVO);
		
	}
	
	//see the listView
	@Override
	public List<NoticeBoardVO> list(Count cri) throws Exception {
	
		return sqlSession.selectList("NoticeBoardMapper.listPage",cri);

	}
	
	//reading board
	@Override
	public NoticeBoardVO read(int bno) throws Exception {
		return sqlSession.selectOne("NoticeBoardMapper.read", bno);
	}
	
	// modify
		@Override
		public void update(NoticeBoardVO boardVO) throws Exception {
 
			sqlSession.update("NoticeBoardMapper.update", boardVO);
		}

		// delete
		@Override
		public void delete(int bno) throws Exception {

			sqlSession.delete("NoticeBoardMapper.delete", bno);
		}
	//for list counting 
		public int listCount(String course_number) throws Exception{
			return sqlSession.selectOne("NoticeBoardMapper.listCount",course_number);
		}
		
		//for HIT
		@Override
		public void boardhit(int bno) throws Exception {
			sqlSession.update("NoticeBoardMapper.boardHit", bno);
		}
		
		//for seeing current course list
		@Override
		public List<TimetableVO> current_course_list(Map <String,String> map) throws Exception {	
			return sqlSession.selectList("NoticeBoardMapper.current_course_listPage",map);

		}
		//for professor
		@Override
		public List<TimetableVO> current_course_list_pro(Map <String,String> map) throws Exception {	
			return sqlSession.selectList("NoticeBoardMapper.current_course_listPage_pro",map);

		}
		
	/*	@Override
		public List<NoticeBoardVO> change_list(Map <String,String> map) throws Exception {	
			return sqlSession.selectList("NoticeBoardMapper.current_course_listPage",map);

		}*/
		@Override
		public List<NoticeBoardVO> latest(Map <String,String> map) throws Exception{
			return sqlSession.selectList("NoticeBoardMapper.latest", map);
		}
		
		public List<NoticeBoardVO> latest_pro(Map <String,String> map) throws Exception{
			return sqlSession.selectList("NoticeBoardMapper.latest_pro", map);
		}
		
}