package kw18.team.dao;

import javax.inject.Inject;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import kw18.team.controller.UserController;
import kw18.team.vo.ProfessorVO;
import kw18.team.vo.StudentVO;
import kw18.team.vo.UserVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service
public class UserDAOImple implements UserDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	private SqlSession sqlSession;
	
	// 회원가입 구현
	@Override
	public void join(StudentVO stuVO) throws Exception{
		logger.info("join_stu mapper");
		UserVO userVo = new UserVO(stuVO.getId(), stuVO.getPasswd(), "학생", stuVO.getUniversity());
		sqlSession.insert("userMapper.join", userVo);
		sqlSession.insert("userMapper.join_stu", stuVO);
	}
	
	@Override
	public void join(ProfessorVO proVO) throws Exception{
		logger.info("join_pro mapper");
		UserVO userVo = new UserVO(proVO.getId(), proVO.getPasswd(), "교수", proVO.getUniversity());
		sqlSession.insert("userMapper.join", userVo);
		sqlSession.insert("userMapper.join_pro", proVO);	
	}
	
	@Override
	public UserVO login(UserVO uservo) throws Exception{
		return sqlSession.selectOne("userMapper.login", uservo);
	}
	
	@Override
	public StudentVO get_stuData(UserVO uservo) throws Exception{
		return sqlSession.selectOne("userMapper.get_studata", uservo);
	}
	
	@Override
	public ProfessorVO get_proData(UserVO uservo) throws Exception{
		return sqlSession.selectOne("userMapper.get_prodata", uservo);
	}
	
	@Override
	public int check_id(String id) throws Exception{
		return sqlSession.selectOne("userMapper.idcheck", id);
	}
	
	@Override
	public void update(StudentVO stuVO) throws Exception{
		sqlSession.selectOne("userMapper.stu_update", stuVO);
	}
	
	@Override
	public void update(ProfessorVO proVO) throws Exception{
		sqlSession.selectOne("userMapper.pro_update", proVO);
	}
	
}