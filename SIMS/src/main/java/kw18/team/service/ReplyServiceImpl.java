package kw18.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kw18.team.dao.ReplyDAO;
import kw18.team.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Inject
	private ReplyDAO dao;
	
	@Override
	public List<ReplyVO> readReply(int bno) throws Exception {
		return dao.readReply(bno);
	}
	
	@Override
	public void writeReply(ReplyVO vo) throws Exception {
		dao.writeReply(vo);
	}
	
	public void updateReply(ReplyVO vo) throws Exception {
		dao.updateReply(vo);
	}
	
	public void deleteReply(ReplyVO vo) throws Exception {
		dao.deleteReply(vo);
	}
	
	public ReplyVO selectReply(int rno) throws Exception {
		return dao.selectReply(rno);
	}
	
	public void replyLike(ReplyVO vo) throws Exception {
		System.out.println("service");
		dao.replyLike(vo);
	}
	
}
