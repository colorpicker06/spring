package com.example.project.service;

import java.util.List;

import com.example.project.model.dto.MemberVO;

public interface MemberService {
	// 회원목록
		public abstract List<MemberVO> memberList();
	// 회원입력
		public void insertMember(MemberVO vo);
	//회원상세보기
		public MemberVO viewMember(String userId);
	//회원삭제
		public void deleteMember(String userId);
	//회원수정
		public void updateMember(MemberVO vo);
		
		public boolean checkPw(String userId, String userPw);
}	
