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
	//RequestMapping 의 중복적이 부분을 통일해서 사용해보기.
	
	@Inject BoardService boardService;
	//01 게시물 목록 보기
	
	/*@RequestMapping("list.do") 검색기능 전
	public ModelAndView list() { //modelandview 라서 model과 뷰가 결합된 형태이다. sting과는 반환값이 다르다.
		List<BoardVO> list = boardService.listAll();
		ModelAndView mav=new ModelAndView();
		mav.setViewName("board/list");
		mav.addObject("list",list);
		return mav;		
	}*/
	
	@RequestMapping("list.do")
	public ModelAndView list(@RequestParam(defaultValue="title") String searchOption, @RequestParam(defaultValue="") String keyword,@RequestParam(defaultValue="1")int curPage) { //modelandview 라서 model과 뷰가 결합된 형태이다. sting과는 반환값이 다르다.
		
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
		mav.setViewName("board/list"); //뷰를 list.jsp로 설정
		return mav; // list.jsp로 list 가 전달된다.
	}
	
	//02. 게시글 화면
	@RequestMapping("write.do")
	public String write() {
		return "board/write";
	}
	
	@RequestMapping("video.do")
	public String video() {
		return "board/video";
	}
	
	//02-01. 게시글 입력
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute BoardVO vo, HttpSession session) {
		String writer = (String)session.getAttribute("userId");
		vo.setWriter(writer);
		boardService.create(vo);
		
		return "redirect:list.do";
	}
	
	//03 상세보기
	@RequestMapping("view.do")
	public ModelAndView view(@RequestParam int bno) { //게시물 앞에 있는 주 키로 구별
		boardService.increaseViewcnt(bno); //게시글 조회수 증가시키기
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/view");
		BoardVO vo=boardService.read(bno);
		mav.addObject("dto",vo);
		
		System.out.println(vo.getUserName());
			
		return mav;
	}
	
	//04 수정
	
	@RequestMapping("update.do")
	public String update(@ModelAttribute BoardVO vo) {
		boardService.update(vo);
		return "redirect:list.do";				
	}
	
	//05 게시글 삭제
	@RequestMapping("delete.do")
	public String delete(@RequestParam int bno) {
		boardService.delete(bno);
		return "redirect:list.do";
	}
	
	//

}
