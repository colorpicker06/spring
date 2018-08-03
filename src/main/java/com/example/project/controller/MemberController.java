package com.example.project.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.project.model.dto.MemberVO;
import com.example.project.service.MemberService;
import com.example.project.service.MemberServiceImpl;

@Controller
public class MemberController {
	
	// 1. ȸ�� ��� ���� - url pattern mapping	
	//MemberService��ü�� ���������� �����Ͽ� ���Խ�����
	@Inject
	MemberService memberService;
	
	
	
	@RequestMapping("member/list.do")
	public String memberlist(Model model) {
		//controller - service -> dao ȣ��(��û)
		// �ڵ��� ���⿡
		
		List<MemberVO> list = memberService.memberList();
		model.addAttribute("list", list);
		
		
		return "member/member_list";
	}
	
	//02 ȸ�� ���(ȭ��) ������
	@RequestMapping("member/write.do")
	public String memberWrite() {
		return "member/member_write";
	}
	
	//02-01 ȸ�� ��� �� �� ó���ϴ� ���
	@RequestMapping("member/insert.do")
	public String memberInsert(@ModelAttribute MemberVO vo) { //jsp ��쿡�� request.parameter ������ spring ������ �׷��� ���� �ʾƵ� @ModelAttribute�� �ѹ��� ������ �� �ִ�.
		memberService.insertMember(vo);				
		return "redirect:/member/list.do";
	}
	
	//03. ȸ������ �� ����
	@RequestMapping("member/view.do")
	public String memberView(String userId,Model model) {
		model.addAttribute("dto",memberService.viewMember(userId));
		return "member/member_view";
	}
	
	//04 ȸ������ ����ó��
	@RequestMapping("member/update.do")
	public String memberUpdate(@ModelAttribute MemberVO vo, Model model) {
		//��й�ȣ üũ
		boolean result = memberService.checkPw(vo.getUserId(),vo.getUserPw());
		
		if(result) {
			memberService.updateMember(vo);
			return "redirect:/member/list.do";
		}else {
			
			MemberVO vo2 = memberService.viewMember(vo.getUserId());
			vo.setUserRegdate(vo2.getUserRegdate());
			vo.setUserUpdatedate(vo2.getUserUpdatedate());
			model.addAttribute("dto",vo);
			model.addAttribute("message","��й�ȣ����ġ");
			return "member/member_view";
		}
	}
	
	//05 ȸ������ ����
	@RequestMapping("member/delete.do")
	public String memberDelete( @RequestParam String userId,@RequestParam String userPw, Model model ) {
		boolean result=memberService.checkPw(userId, userPw);
		if(result) {
			memberService.deleteMember(userId);
			return "redirect:/member/list.do";
		}
		else {
			model.addAttribute("message","��й�ȣ����ġ");
			model.addAttribute("dto",memberService.viewMember(userId));
			return "member/member_view";
		}
		
			
	}
	
	
	
}


















