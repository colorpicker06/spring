package com.example.project.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.project.model.dto.MemberVO;

@Repository
public class MemberDAOimpl implements MemberDAO{
   @Inject
	SqlSession sqlSession;
	
	@Override
	public List<MemberVO> memberList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("member.memberList");
	}

	@Override
	public void insertMember(MemberVO vo) {
		sqlSession.insert("member.insertMember",vo);//vo 안에 form 값이 다 들어있는 건가? Modelattribute에서 vo 로 넘어가고 그게 여기로 쓰이는 건가?
		
	}

	@Override
	public void deleteMember(String userId) {
		sqlSession.delete("member.deleteMember",userId);
		
	}

	@Override
	public void updateMember(MemberVO vo) {
		sqlSession.update("member.updateMember",vo);
	}

	@Override
	public MemberVO viewMember(String userId) {
		return sqlSession.selectOne("member.viewMember",userId); //하나만 가져오기;
	}
	
	public boolean checkPw(String userId,String userPw) {
		boolean result=false;
		Map<String,String> map = new HashMap<String,String>();
		map.put("userId", userId);
		map.put("userPw", userPw);
		int count =sqlSession.selectOne("member.checkPw",map);
		if(count==1) result=true;
		return result; //위에 초기값이 false여서 else는 안해줘도 된다.		
	}

}
