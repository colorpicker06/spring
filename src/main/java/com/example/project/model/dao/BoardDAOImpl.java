package com.example.project.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.project.model.dto.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO{

	@Inject SqlSession sqlSession;
	
	@Override
	public void create(BoardVO vo) {
		sqlSession.insert("board.insert",vo);
		
	}

	@Override
	public BoardVO read(int bno) {
		return sqlSession.selectOne("board.view",bno);
	}

	@Override
	public void update(BoardVO vo) {
		sqlSession.update("board.updateArticle",vo);
		
	}

	@Override
	public void delete(int bno) {
		sqlSession.delete("board.deleteArticle",bno);
		
	}

	@Override
	public List<BoardVO> listAll(int start, int end, String searchOption, String keyword) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("board.listAll",map);
	}

	@Override
	public void increaseViewcnt(int bno) {
		sqlSession.update("board.increaseViewcnt",bno);
		
	}

	@Override
	public int countArticle(String searchOption, String keyword) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);	
		return sqlSession.selectOne("board.countArticle",map);
	}
}
