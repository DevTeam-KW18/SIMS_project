package kw18.team.service;
import kw18.team.vo.ProfessorVO;
import kw18.team.vo.StudentVO;
import kw18.team.vo.UserVO;

public interface UserService {
	
	// 회원가입
	public void join(StudentVO stuVO) throws Exception;
	public void join(ProfessorVO proVO) throws Exception;
	
	public UserVO login(UserVO uservo) throws Exception;
	
	public StudentVO get_stuData(UserVO uservo) throws Exception;
	public ProfessorVO get_proData(UserVO uservo) throws Exception;
	public int check_id(String id) throws Exception;
	
	public void update(StudentVO stuVO) throws Exception;
	public void update(ProfessorVO proVO) throws Exception;
}