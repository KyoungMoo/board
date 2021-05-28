package woo.edu.c.dao;

import java.util.List;

import woo.edu.c.vo.boardVo;
import woo.edu.c.vo.scVo;
import woo.edu.c.vo.testVo;

public interface BoardDao {


	List<testVo> test();

	List<boardVo> boardlist();

	int boardwrite(boardVo boardVo);

	boardVo boardcontent(int bnum);

	void boarddelete(String bnum);

	void boardupdate(boardVo boardVo);

	boardVo ajaxc(int ajaxNo);

	int scwrite(scVo scVo);

	List<scVo> sclist(scVo scVo);

	List<scVo> sclistAll();


	

}
