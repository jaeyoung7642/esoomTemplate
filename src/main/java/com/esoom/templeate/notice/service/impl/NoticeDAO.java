package com.esoom.templeate.notice.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.esoom.templeate.admin.service.BoardPhotoVO;
import com.esoom.templeate.admin.service.BoardTailVO;
import com.esoom.templeate.admin.service.BoardVO;
import com.esoom.templeate.common.PageInfo;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("NoticeDAO")
public class NoticeDAO extends EgovComAbstractDAO {

	public List<?> noticeList(PageInfo pi,BoardVO boardVO) {
		int offset=(pi.getCurrentPage() -1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return selectList("NoticeDAO.noticeList", boardVO,rowBounds);
	}
	public List<?> mypageNoticeList(BoardVO boardVO) {
		return selectList("NoticeDAO.mypageNoticeList", boardVO);
	}
	public int getNoticeListCount(BoardVO boardVO) {
		return (Integer)selectOne("NoticeDAO.getNoticeListCount", boardVO);
	}
	public BoardVO noticeDetail(BoardVO boardVO) {
		return (BoardVO) selectOne("NoticeDAO.noticeDetail", boardVO);
	}
	public BoardVO prevDetail(BoardVO boardVO) {
		return (BoardVO) selectOne("NoticeDAO.prevDetail", boardVO);
	}
	public BoardVO nextDetail(BoardVO boardVO) {
		return (BoardVO) selectOne("NoticeDAO.nextDetail", boardVO);
	}
	public List<?> boardTailList(PageInfo pi,BoardTailVO boardTailVO) {
		int offset=(pi.getCurrentPage() -1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return selectList("NoticeDAO.boardTailList", boardTailVO,rowBounds);
	}
	public int getBoardTailListCount(BoardTailVO boardTailVO) {
		return (Integer)selectOne("NoticeDAO.getBoardTailListCount", boardTailVO);
	}
	public int contentWrite(BoardTailVO boardTailVO) {
		return insert("NoticeDAO.contentWrite", boardTailVO);
	}
	public int contentDelete(BoardTailVO boardTailVO) {
		return delete("NoticeDAO.contentDelete", boardTailVO);
	}
}
