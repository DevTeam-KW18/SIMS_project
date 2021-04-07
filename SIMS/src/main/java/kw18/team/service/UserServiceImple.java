package kw18.team.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kw18.team.controller.UserController;
import kw18.team.dao.UserDAO;
import kw18.team.vo.ProfessorVO;
import kw18.team.vo.StudentVO;
import kw18.team.vo.UserVO;

@Service
public class UserServiceImple implements UserService{
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	private UserDAO dao;

	@Override
	public void join(StudentVO stuVO) throws Exception{
		logger.info("stu service");
		dao.join(stuVO);
	}
	
	@Override
	public void join(ProfessorVO proVO) throws Exception{
		dao.join(proVO);
	}

	@Override
	public UserVO login(UserVO uservo) throws Exception{
		logger.info("id" + uservo.getId());
		return dao.login(uservo);
	}
	
	@Override
	public StudentVO get_stuData(UserVO uservo) throws Exception{
		logger.info("get student data service");
		return dao.get_stuData(uservo);
	}
	
	@Override
	public ProfessorVO get_proData(UserVO uservo) throws Exception{
		logger.info("get professor data service");
		return dao.get_proData(uservo);
	}

	@Override
	public int check_id(String id) throws Exception{
		return dao.check_id(id);
	}
	
	@Override
	public void update(StudentVO stuVO) throws Exception{
		dao.update(stuVO);
	}
	
	@Override
	public void update(ProfessorVO proVO) throws Exception{
		dao.update(proVO);
	}
	
	
}