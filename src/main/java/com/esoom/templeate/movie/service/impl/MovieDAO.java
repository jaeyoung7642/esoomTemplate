package com.esoom.templeate.movie.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.esoom.templeate.admin.service.BoardVO;
import com.esoom.templeate.common.PageInfo;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("MovieDAO")
public class MovieDAO extends EgovComAbstractDAO {

	public List<?> mediaUHome(BoardVO boardVO) {
		return selectList("MovieDAO.mediaUHome", boardVO);
	}
	public List<?> mediaSHome(BoardVO boardVO) {
		return selectList("MovieDAO.mediaSHome", boardVO);
	}
	public List<?> movieList(PageInfo pi,BoardVO boardVO) {
		int offset=(pi.getCurrentPage() -1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return selectList("MovieDAO.movieList", boardVO,rowBounds);
	}
	public int getMovieListCount(BoardVO boardVO) {
		return (Integer)selectOne("MovieDAO.getMovieListCount", boardVO);
	}
	public BoardVO movieDetail(BoardVO boardVO) {
		return (BoardVO) selectOne("MovieDAO.movieDetail", boardVO);
	}
	public List<?> footMovieList(BoardVO boardVO) {
		return selectList("MovieDAO.footMovieList", boardVO);
	}
	public List<?> mypageMovieList(BoardVO boardVO) {
		return selectList("MovieDAO.mypageMovieList", boardVO);
	}
}
