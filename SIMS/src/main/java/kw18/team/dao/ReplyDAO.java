package kw18.team.dao;

import java.util.List;

import kw18.team.vo.ReplyVO;

public interface ReplyDAO {
	public List<ReplyVO> readReply(int bno) throws Exception;
	
	public void writeReply(ReplyVO vo) throws Exception;
	
	public void updateReply(ReplyVO vo) throws Exception;
	
	public void deleteReply(ReplyVO vo) throws Exception;
	
	public ReplyVO selectReply(int rno) throws Exception;
	
	public void replyLike(ReplyVO vo) throws Exception;
}
