package com.example.project.model.dao;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.example.project.model.dto.MemberVO;

public interface LoginDAO {
	
	public boolean loginCheck(MemberVO vo);
	public MemberVO viewMember(MemberVO vo);

}
