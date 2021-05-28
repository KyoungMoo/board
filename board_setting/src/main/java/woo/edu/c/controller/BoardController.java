package woo.edu.c.controller;

import java.util.List;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import woo.edu.c.service.BoardService;
import woo.edu.c.vo.boardVo;
import woo.edu.c.vo.scVo;
import woo.edu.c.vo.testVo;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private BoardService boardService;
	
	
	
	// 메인 화면
	@RequestMapping(value = "/board/home")
	public String home(Model model, HttpServletRequest req, HttpServletResponse res) throws Exception {
		return "home";
	}
	
	// test
	@RequestMapping(value = "/board/test", method = RequestMethod.GET)
	public String boardList(Model model) throws Exception {
		List<testVo> test = boardService.test();
		System.out.println("test : "+test);
		model.addAttribute("boardList", test);
		return "/board/boardhome";
	}
	
	@RequestMapping(value = "/board/boardlist", method = RequestMethod.GET)
	public String boardlist(Model model) throws Exception {
		List<boardVo> blist=boardService.boardlist();
		model.addAttribute("blist",blist);
		return "/board/boardlist";
	}
	
	@RequestMapping(value = "/board/boardwriteView", method = RequestMethod.GET)
	public String boardwriteView(Model model) throws Exception {
		return "/board/boardwrite";
	}
	
	@RequestMapping(value = "/board/boardWrite", method = RequestMethod.GET)
	public String boardwrite(Model model,boardVo boardVo
			) throws Exception {
		System.out.println("boardwirte: "+boardVo.getBname());
		System.out.println("boardwirte: "+boardVo.getBtitle());
		System.out.println("boardwirte: "+boardVo.getBcontent());
		boardService.boardwrite(boardVo);
		return "redirect:/board/boardlist";
	}
	@RequestMapping(value = "/board/boardcontent", method = RequestMethod.GET)
	public String boardcontent(Model model,@RequestParam int bnum) throws Exception {
		boardVo bcontent=boardService.boardcontent(bnum);
		model.addAttribute("bcontent",bcontent);
		return "/board/boardcontent";
	}
	
	@RequestMapping(value = "/board/delete", method = RequestMethod.GET)
	public String boarddelete(Model model,@RequestParam String bnum) throws Exception {
		boardService.boarddelete(bnum);
		return "redirect:/board/boardlist";
	}
	
	@RequestMapping(value = "/board/boardmodifyView", method = RequestMethod.GET)
	public String boardmodifyView(Model model,@RequestParam int bnum) throws Exception {
		boardVo bcontent=boardService.boardcontent(bnum);
		model.addAttribute("bcontent",bcontent);
		return "/board/boardmodify";
	}
	@RequestMapping(value = "/board/boardupdate", method = RequestMethod.GET)
	public String boardmodify(Model model,boardVo boardVo) throws Exception {
		boardService.boardupdate(boardVo);
		return "redirect:/board/boardlist";
	}
	
	@RequestMapping(value = "/board/boardlist2", method = RequestMethod.GET)
	public String boardwriteView( ) throws Exception {
		return "/board/boardlist2";
	}
	
	@RequestMapping(value = "/board/boardlist4", method = RequestMethod.GET)
	@ResponseBody
	public List<boardVo> boardlist3(Model model) throws Exception {
		List<boardVo> blist=boardService.boardlist();
		System.out.println(blist);
		return blist;
	}
	@RequestMapping(value = "/board/ajaxWrite", method = RequestMethod.GET)
	@ResponseBody
	public boardVo ajaxWrite(Model model,boardVo boardVo
			) throws Exception {
		boardVo Vo= boardService.boardwrite(boardVo);
		System.out.println("서비스단 : "+Vo);
		return Vo;
	}
	
	
	@RequestMapping(value = "/board/ajaxContent", method = RequestMethod.GET)
	@ResponseBody
	public boardVo ajaxContent(Model model,boardVo boardVo
			) throws Exception {
		int bnum = boardVo.getBnum();
		System.out.println("bnum : "+bnum);
		boardVo Vo= boardService.boardcontent(bnum);
		System.out.println("서비스단 : "+Vo);
		return Vo;
	}
	
	@RequestMapping("/board/counting")
	public String counting() {
		
		return "/board/counting";
	}
	
	@RequestMapping("/board/calculator")
	public String calculator() {
		
		return "/board/calculator";
	}
	
	@RequestMapping("/board/basic")
	public String basic() {
		
		return "/board/basic-views";
	}
	
	@RequestMapping("/board/todo")
	@ResponseBody
	public int todo(scVo scVo) {
		System.out.println("날짜 : "+scVo.getDay());
		System.out.println("일정 : "+scVo.getSc());
		int check =boardService.scwrite(scVo);
		if(check==1) {
			return check;
		}else {
			return 0;
		}
	}
	@RequestMapping("/board/sclist")
	@ResponseBody
	public List<scVo> sclist(scVo scVo) {
		System.out.println("날짜 : "+scVo.getDay());
		List<scVo> Vo =boardService.sclist(scVo);
		System.out.println(Vo);
		return Vo;
	}
	
	
	
		
		
		
}




