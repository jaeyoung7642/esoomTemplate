package com.esoom.templeate.admin.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.esoom.templeate.admin.service.BoardVO;
import com.esoom.templeate.admin.service.FreeBoardVO;
import com.esoom.templeate.admin.service.FreeTailVO;
import com.esoom.templeate.admin.service.SlideVO;
import com.esoom.templeate.common.PageInfo;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("AdminFreeDAO")
public class AdminFreeDAO extends EgovComAbstractDAO {

	public List<?> freeList(PageInfo pi,FreeBoardVO FreeBoardVO) {
		int offset=(pi.getCurrentPage() -1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return selectList("AdminFreeDAO.freeList", FreeBoardVO,rowBounds);
	}
	public List<?> freeTailList(PageInfo pi,FreeTailVO FreeTailVO) {
		int offset=(pi.getCurrentPage() -1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return selectList("AdminFreeDAO.freeTailList", FreeTailVO,rowBounds);
	}
	public int getFreeTailListCount(FreeTailVO FreeTailVO) {
		return (Integer)selectOne("AdminFreeDAO.getFreeTailListCount", FreeTailVO);
	}
	
	public int getFreeListCount(FreeBoardVO FreeBoardVO) {
		return (Integer)selectOne("AdminFreeDAO.getFreeListCount", FreeBoardVO);
	}
	public FreeBoardVO selectFreeDetail(FreeBoardVO FreeBoardVO) {
		return (FreeBoardVO) selectOne("AdminFreeDAO.selectFreeDetail", FreeBoardVO);
	}
	public int changeChkDel(FreeBoardVO FreeBoardVO) {
		return update("AdminFreeDAO.changeChkDel", FreeBoardVO);
	}
	public int insertFreeTail(FreeTailVO FreeTailVO) {
		return insert("AdminFreeDAO.insertFreeTail", FreeTailVO);
	}
	public int deleteFreeTail(FreeTailVO FreeTailVO) {
		return delete("AdminFreeDAO.deleteFreeTail", FreeTailVO);
	}
	public int deleteFree(FreeBoardVO FreeBoardVO) {
		return delete("AdminFreeDAO.deleteFree", FreeBoardVO);
	}
	public int mergeFree(FreeBoardVO FreeBoardVO) {
		return update("AdminFreeDAO.mergeFree", FreeBoardVO);
	}
}
