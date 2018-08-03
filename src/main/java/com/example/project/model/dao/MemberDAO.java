package com.example.project.model.dao;

import java.util.List;

import com.example.project.model.dto.MemberVO;

public interface MemberDAO {
	//회원 목록 조회
	public List<MemberVO> memberList();
	
	//회원 입력
	public void insertMember(MemberVO vo);
	
	//회원 삭제
	public void deleteMember(String userId);
	
	//회원 수정
	public void updateMember(MemberVO vo);
	
	//회원 상세보기
	public MemberVO viewMember(String userId);
}
