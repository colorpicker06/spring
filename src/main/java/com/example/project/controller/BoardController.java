package com.example.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.dto.BoardVO;
import com.example.project.service.BoardPager;
import com.example.project.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	//RequestMapping �� �ߺ����� �κ��� �����ؼ� ����غ���.
	
	@Inject BoardService boardService;
	//01 �Խù� ��� ����
	
	/*@RequestMapping("list.do") �˻���� ��
	public ModelAndView list() { //modelandview �� model�� �䰡 ���յ� �����̴�. sting���� ��ȯ���� �ٸ���.
		List<BoardVO> list = boardService.listAll();
		ModelAndView mav=new ModelAndView();
		mav.setViewName("board/list");
		mav.addObject("list",list);
		return mav;		
	}*/
	
	@RequestMapping("list.do")
	public ModelAndView list(@RequestParam(defaultValue="title") String searchOption, @RequestParam(defaultValue="") String keyword,@RequestParam(defaultValue="1")int curPage) { //modelandview �� model�� �䰡 ���յ� �����̴�. sting���� ��ȯ���� �ٸ���.
		
		int count=boardService.countArticle(searchOption,keyword);
		
		BoardPager boardPager = new BoardPager(count,curPage);
		
		int start = boardPager.getPageBegin();		
		int end = boardPager.getPageEnd();
		
		List<BoardVO> list = boardService.listAll(start, end, searchOption,keyword);	
		
		ModelAndView mav=new ModelAndView();
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("list",list);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("boardPager", boardPager);
		
		mav.addObject("map",map);
		mav.setViewName("board/list"); //�並 list.jsp�� ����
		return mav; // list.jsp�� list �� ���޵ȴ�.
	}
	
	//02. �Խñ� ȭ��
	@RequestMapping("write.do")
	public String write() {
		return "board/write";
	}
	
	@RequestMapping("video.do")
	public String video() {
		return "board/video";
	}
	
	//02-01. �Խñ� �Է�
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute BoardVO vo, HttpSession session) {
		String writer = (String)session.getAttribute("userId");
		vo.setWriter(writer);
		boardService.create(vo);
		
		return "redirect:list.do";
	}
	
	//03 �󼼺���
	@RequestMapping("view.do")
	public ModelAndView view(@RequestParam int bno) { //�Խù� �տ� �ִ� �� Ű�� ����
		boardService.increaseViewcnt(bno); //�Խñ� ��ȸ�� ������Ű��
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/view");
		BoardVO vo=boardService.read(bno);
		mav.addObject("dto",vo);
		
		System.out.println(vo.getUserName());
			
		return mav;
	}
	
	//04 ����
	
	@RequestMapping("update.do")
	public String update(@ModelAttribute BoardVO vo) {
		boardService.update(vo);
		return "redirect:list.do";				
	}
	
	//05 �Խñ� ����
	@RequestMapping("delete.do")
	public String delete(@RequestParam int bno) {
		boardService.delete(bno);
		return "redirect:list.do";
	}
	
	//

}
