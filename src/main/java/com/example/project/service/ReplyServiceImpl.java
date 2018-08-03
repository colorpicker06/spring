package com.example.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.project.model.dao.ReplyDAO;
import com.example.project.model.dto.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Inject ReplyDAO replyDao;
	
	@Override
	public List<ReplyVO> list(int bno) {
		// TODO Auto-generated method stub
		return replyDao.list(bno);
	}

	@Override
	public void create(ReplyVO vo) {
		replyDao.create(vo);
		
	}

	@Override
	public void update(ReplyVO vo) {
		replyDao.update(vo);
	}

	@Override
	public void delete(int rno) {
		replyDao.delete(rno);		
	}

	@Override
	public ReplyVO detail(int rno) {
		return replyDao.detail(rno);
	}

}
