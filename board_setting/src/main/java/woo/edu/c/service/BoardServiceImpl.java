package woo.edu.c.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import woo.edu.c.controller.HomeController;
import woo.edu.c.dao.BoardDao;
import woo.edu.c.vo.boardVo;
import woo.edu.c.vo.scVo;
import woo.edu.c.vo.testVo;


@Service
public class BoardServiceImpl implements BoardService{
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Resource
	private BoardDao boardDao;

	@Override
	public List<testVo> test() {
		return boardDao.test();
	}

	@Override
	public List<boardVo> boardlist() {
		
		return boardDao.boardlist();
	}


	@Override
	public boardVo boardwrite(boardVo boardVo) {
		boardDao.boardwrite(boardVo);
		int bnum=boardVo.getBnum();
		System.out.println(bnum);
		boardVo Vo = boardDao.ajaxc(bnum);
		System.out.println("임팔리먼트 bnum : "+bnum);
		System.out.println("임팔리먼트 : "+Vo);
		return Vo;
	}

	@Override
	public boardVo boardcontent(int bnum) {
		return boardDao.boardcontent(bnum);
	}

	@Override
	public void boarddelete(String bnum) {
		boardDao.boarddelete(bnum);
	}

	@Override
	public void boardupdate(boardVo boardVo) {
		boardDao.boardupdate(boardVo);
		
	}

	@Override
	public int scwrite(scVo scVo) {
		return boardDao.scwrite(scVo);
	}

	@Override
	public List<scVo> sclist(scVo scVo) {
		return boardDao.sclist(scVo);
	}

	@Override
	public List<scVo> sclistAll() {
		return boardDao.sclistAll();
	}


}
