package com.example.project.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.project.model.dao.LoginDAO;
import com.example.project.model.dto.MemberVO;

@Service
public class LoginServiceImpl implements LoginService{

	@Inject LoginDAO loginDao;
	@Override
	public boolean loginCheck(MemberVO vo, HttpSession session) {
		//boolean result=false;
		boolean result = loginDao.loginCheck(vo);
		System.out.println(result);
		if(result==true) {
			//세션 변수 등록
			MemberVO vo2 = viewMember(vo);
			session.setAttribute("userId", vo2.getUserId());
			session.setAttribute("userName", vo2.getUserName());
		}
		return result;
	}
	
	public MemberVO viewMember(MemberVO vo) {
		return loginDao.viewMember(vo);
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

}
