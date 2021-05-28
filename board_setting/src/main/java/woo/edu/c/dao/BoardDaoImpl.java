package woo.edu.c.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import woo.edu.c.controller.HomeController;
import woo.edu.c.vo.boardVo;
import woo.edu.c.vo.scVo;
import woo.edu.c.vo.testVo;

@Repository
public class BoardDaoImpl implements BoardDao {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	// mybatis
	@Inject
	private SqlSession sql;
	
	private static String namespace = "boardMapper";

	@Override
	public List<testVo> test() {
		return sql.selectList(namespace + ".test");
	}

	@Override
	public List<boardVo> boardlist() {
		
		return sql.selectList(namespace+ ".boardlist");
	}

	@Override
	public int boardwrite(boardVo boardVo) {
		return sql.insert(namespace+".boardwrite",boardVo);
	}

	@Override
	public boardVo boardcontent(int bnum) {
		
		return sql.selectOne(namespace+".boardcontent",bnum);
	}

	@Override
	public void boarddelete(String bnum) {
		sql.delete(namespace+".boarddelete",bnum);
	}

	@Override
	public void boardupdate(boardVo boardVo) {
		sql.update(namespace+".boardupdate",boardVo);
		
	}

	@Override
	public boardVo ajaxc(int bnum) {
		
		return sql.selectOne(namespace+".ajaxc", bnum);
	}

	@Override
	public int scwrite(scVo scVo) {
		
		return sql.insert(namespace+".scwrite",scVo);
	}

	@Override
	public List<scVo> sclist(scVo scVo) {
		
		return sql.selectList(namespace+".sclist",scVo);
	}

	@Override
	public List<scVo> sclistAll() {
		// TODO Auto-generated method stub
		return sql.selectList(namespace+".sclistAll");
	}


	
	
}
