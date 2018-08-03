package com.example.project.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.project.model.dto.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{

	@Inject SqlSession sqlSession;
	@Override
	public List<ReplyVO> list(int bno) {
		
		return sqlSession.selectList("reply.listReply",bno);
	}

	@Override
	public void create(ReplyVO vo) {
		sqlSession.insert("reply.insertReply" ,vo);
		
	}

	@Override
	public void update(ReplyVO vo) {
		sqlSession.update("reply.updateReply",vo);
		
	}

	@Override
	public void delete(int rno) {
		sqlSession.delete("reply.deleteReply",rno);	
	}

	@Override
	public ReplyVO detail(int rno) {
		return sqlSession.selectOne("reply.detailReply",rno);
	}

}
