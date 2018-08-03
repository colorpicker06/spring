package com.example.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.project.model.dao.MemberDAOimpl;
import com.example.project.model.dto.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{

	@Inject
	MemberDAOimpl memberDao;
	
	@Override
	public List<MemberVO> memberList() {
		return memberDao.memberList();
	}

	@Override
	public void insertMember(MemberVO vo) {
		memberDao.insertMember(vo);
	}

	@Override
	public MemberVO viewMember(String userId) {
		// TODO Auto-generated method stub
		return memberDao.viewMember(userId);
	}

	@Override
	public void deleteMember(String userId) {
		memberDao.deleteMember(userId);
		
	}

	@Override
	public void updateMember(MemberVO vo) {
		memberDao.updateMember(vo);		
	}
	
	public boolean checkPw(String userId, String userPw) {
		return memberDao.checkPw(userId, userPw);
	}

}
