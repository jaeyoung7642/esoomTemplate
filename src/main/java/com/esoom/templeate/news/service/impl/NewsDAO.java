package com.esoom.templeate.news.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.esoom.templeate.admin.service.BoardVO;
import com.esoom.templeate.common.PageInfo;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("NewsDAO")
public class NewsDAO extends EgovComAbstractDAO {

	public List<?> newsHome(BoardVO boardVO) {
		return selectList("NewsDAO.newsHome", boardVO);
	}
	public List<?> newsList(PageInfo pi,BoardVO boardVO) {
		int offset=(pi.getCurrentPage() -1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return selectList("NewsDAO.newsList", boardVO,rowBounds);
	}
	public int getNewsListCount(BoardVO boardVO) {
		return (Integer)selectOne("NewsDAO.getNewsListCount", boardVO);
	}
}
