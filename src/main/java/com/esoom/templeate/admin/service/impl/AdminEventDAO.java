package com.esoom.templeate.admin.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.esoom.templeate.admin.service.BoardVO;
import com.esoom.templeate.common.PageInfo;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("AdminEventDAO")
public class AdminEventDAO extends EgovComAbstractDAO {

	public List<?> eventList(PageInfo pi,BoardVO boardVO) {
		int offset=(pi.getCurrentPage() -1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return selectList("AdminEventDAO.eventList", boardVO,rowBounds);
	}
	public List<?> eventTailList(PageInfo pi,BoardVO boardVO) {
		int offset=(pi.getCurrentPage() -1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return selectList("AdminEventDAO.eventTailList", boardVO,rowBounds);
	}

	public int getTotalEventListCount(BoardVO boardVO) {
		return (Integer)selectOne("AdminEventDAO.getTotalEventListCount", boardVO);
	}
	public int getEventTailListCount(BoardVO boardVO) {
		return (Integer)selectOne("AdminEventDAO.getEventTailListCount", boardVO);
	}
	
	public int getEventListCount(BoardVO boardVO) {
		return (Integer)selectOne("AdminEventDAO.getEventListCount", boardVO);
	}
	public BoardVO selectBoardDetail(BoardVO boardVO) {
		return (BoardVO) selectOne("AdminEventDAO.selectBoardDetail", boardVO);
	}
	public int mergeBoard(BoardVO boardVO) {
		return update("AdminEventDAO.mergeBoard", boardVO);
	}
	public int deleteBoard(BoardVO boardVO) {
		return delete("AdminEventDAO.deleteBoard", boardVO);
	}
}
