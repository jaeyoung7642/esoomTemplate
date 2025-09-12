package com.esoom.templeate.admin.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.esoom.templeate.admin.service.BoardVO;
import com.esoom.templeate.common.PageInfo;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("AdminNewsDAO")
public class AdminNewsDAO extends EgovComAbstractDAO {

	public List<?> newsList(PageInfo pi,BoardVO boardVO) {
		int offset=(pi.getCurrentPage() -1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return selectList("AdminNewsDAO.newsList", boardVO,rowBounds);
	}

	public int getTotalNewsListCount(BoardVO boardVO) {
		return (Integer)selectOne("AdminNewsDAO.getTotalNewsListCount", boardVO);
	}
	
	public int getNewsListCount(BoardVO boardVO) {
		return (Integer)selectOne("AdminNewsDAO.getNewsListCount", boardVO);
	}
}
