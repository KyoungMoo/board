package woo.edu.c.service;

import java.util.List;

import woo.edu.c.vo.boardVo;
import woo.edu.c.vo.scVo;
import woo.edu.c.vo.testVo;

public interface BoardService {

	List<testVo> test();

	List<boardVo> boardlist();

	boardVo boardwrite(boardVo boardVo);

	boardVo boardcontent(int bnum);

	void boarddelete(String bnum);

	void boardupdate(boardVo boardVo);

	int scwrite(scVo scVo);

	List<scVo> sclist(scVo scVo);

	List<scVo> sclistAll();




}
