package com.esoom.templeate.admin.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.esoom.templeate.admin.service.BoardVO;
import com.esoom.templeate.common.PageInfo;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("AdminNoticeDAO")
public class AdminNoticeDAO extends EgovComAbstractDAO {

	public List<?> noticeList(PageInfo pi,BoardVO boardVO) {
		int offset=(pi.getCurrentPage() -1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return selectList("AdminNoticeDAO.noticeList", boardVO,rowBounds);
	}

	public int getTotalNoticeListCount(BoardVO boardVO) {
		return (Integer)selectOne("AdminNoticeDAO.getTotalNoticeListCount", boardVO);
	}
	
	public int getNoticeListCount(BoardVO boardVO) {
		return (Integer)selectOne("AdminNoticeDAO.getNoticeListCount", boardVO);
	}
	public BoardVO selectBoardDetail(BoardVO boardVO) {
		return (BoardVO) selectOne("AdminNoticeDAO.selectBoardDetail", boardVO);
	}
	public BoardVO lastBoard(BoardVO boardVO) {
		return (BoardVO) selectOne("AdminNoticeDAO.lastBoard", boardVO);
	}
	public int mergeBoard(BoardVO boardVO) {
		return update("AdminNoticeDAO.mergeBoard", boardVO);
	}
	public int deleteBoard(BoardVO boardVO) {
		return delete("AdminNoticeDAO.deleteBoard", boardVO);
	}
}
