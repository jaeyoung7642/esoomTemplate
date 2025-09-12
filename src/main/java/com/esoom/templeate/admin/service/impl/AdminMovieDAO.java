package com.esoom.templeate.admin.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.esoom.templeate.admin.service.BoardVO;
import com.esoom.templeate.common.PageInfo;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("AdminMovieDAO")
public class AdminMovieDAO extends EgovComAbstractDAO {

	public List<?> movieList(PageInfo pi,BoardVO boardVO) {
		int offset=(pi.getCurrentPage() -1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return selectList("AdminMovieDAO.movieList", boardVO,rowBounds);
	}

	public int getTotalMovieListCount(BoardVO boardVO) {
		return (Integer)selectOne("AdminMovieDAO.getTotalMovieListCount", boardVO);
	}
	
	public int getMovieListCount(BoardVO boardVO) {
		return (Integer)selectOne("AdminMovieDAO.getMovieListCount", boardVO);
	}
}
