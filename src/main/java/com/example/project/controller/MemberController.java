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
	
	// 1. 회원 목록 보기 - url pattern mapping	
	//MemberService객체를 스프링에서 생성하여 주입시켜줌
	@Inject
	MemberService memberService;
	
	
	
	@RequestMapping("member/list.do")
	public String memberlist(Model model) {
		//controller - service -> dao 호출(요청)
		// 코딩은 여기에
		
		List<MemberVO> list = memberService.memberList();
		model.addAttribute("list", list);
		
		
		return "member/member_list";
	}
	
	//02 회원 등록(화면) 페이지
	@RequestMapping("member/write.do")
	public String memberWrite() {
		return "member/member_write";
	}
	
	//02-01 회원 등록 한 뒤 처리하는 방법
	@RequestMapping("member/insert.do")
	public String memberInsert(@ModelAttribute MemberVO vo) { //jsp 경우에는 request.parameter 했지만 spring 에서는 그렇게 하지 않아도 @ModelAttribute로 한번에 가져올 수 있다.
		memberService.insertMember(vo);				
		return "redirect:/member/list.do";
	}
	
	//03. 회원정보 상세 보기
	@RequestMapping("member/view.do")
	public String memberView(String userId,Model model) {
		model.addAttribute("dto",memberService.viewMember(userId));
		return "member/member_view";
	}
	
	//04 회원정보 수정처리
	@RequestMapping("member/update.do")
	public String memberUpdate(@ModelAttribute MemberVO vo, Model model) {
		//비밀번호 체크
		boolean result = memberService.checkPw(vo.getUserId(),vo.getUserPw());
		
		if(result) {
			memberService.updateMember(vo);
			return "redirect:/member/list.do";
		}else {
			
			MemberVO vo2 = memberService.viewMember(vo.getUserId());
			vo.setUserRegdate(vo2.getUserRegdate());
			vo.setUserUpdatedate(vo2.getUserUpdatedate());
			model.addAttribute("dto",vo);
			model.addAttribute("message","비밀번호불일치");
			return "member/member_view";
		}
	}
	
	//05 회원정보 삭제
	@RequestMapping("member/delete.do")
	public String memberDelete( @RequestParam String userId,@RequestParam String userPw, Model model ) {
		boolean result=memberService.checkPw(userId, userPw);
		if(result) {
			memberService.deleteMember(userId);
			return "redirect:/member/list.do";
		}
		else {
			model.addAttribute("message","비밀번호불일치");
			model.addAttribute("dto",memberService.viewMember(userId));
			return "member/member_view";
		}
		
			
	}
	
	
	
}


















