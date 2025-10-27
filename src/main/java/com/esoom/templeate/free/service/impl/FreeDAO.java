package com.esoom.templeate.free.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.esoom.templeate.admin.service.BoardPhotoVO;
import com.esoom.templeate.admin.service.BoardTailVO;
import com.esoom.templeate.admin.service.BoardVO;
import com.esoom.templeate.admin.service.FreeBoardVO;
import com.esoom.templeate.admin.service.FreeTailVO;
import com.esoom.templeate.common.PageInfo;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("FreeDAO")
public class FreeDAO extends EgovComAbstractDAO {

	public List<?> freeList(PageInfo pi,FreeBoardVO freeBoardVO) {
		int offset=(pi.getCurrentPage() -1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return selectList("FreeDAO.freeList", freeBoardVO,rowBounds);
	}
	public int getFreeListCount(FreeBoardVO freeBoardVO) {
		return (Integer)selectOne("FreeDAO.getFreeListCount", freeBoardVO);
	}
	public List<?> topFreeList(FreeBoardVO freeBoardVO) {
		return selectList("FreeDAO.topFreeList", freeBoardVO);
	}
	public FreeBoardVO freeDetail(FreeBoardVO freeBoardVO) {
		return (FreeBoardVO) selectOne("FreeDAO.freeDetail", freeBoardVO);
	}
	public List<?> freeTailList(PageInfo pi,FreeTailVO freeTailVO) {
		int offset=(pi.getCurrentPage() -1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return selectList("FreeDAO.freeTailList", freeTailVO,rowBounds);
	}
	public int getFreeTailListCount(FreeTailVO freeTailVO) {
		return (Integer)selectOne("FreeDAO.getFreeTailListCount", freeTailVO);
	}
	public List<?> mypageFreeList(FreeBoardVO freeBoardVO) {
		return selectList("FreeDAO.mypageFreeList", freeBoardVO);
	}
	public int mergeFree(FreeBoardVO freeBoardVO) {
		return update("FreeDAO.mergeFree", freeBoardVO);
	}
	public int freeDelete(FreeBoardVO freeBoardVO) {
		return update("FreeDAO.freeDelete", freeBoardVO);
	}
	public int contentWrite(FreeTailVO freeTailVO) {
		return insert("FreeDAO.contentWrite", freeTailVO);
	}
	public int contentDelete(FreeTailVO freeTailVO) {
		return delete("FreeDAO.contentDelete", freeTailVO);
	}
	
}
