package com.esoom.templeate.admin.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.esoom.templeate.admin.service.BoardVO;
import com.esoom.templeate.admin.service.PopupVO;
import com.esoom.templeate.admin.service.SlideVO;
import com.esoom.templeate.common.PageInfo;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("AdminEtcDAO")
public class AdminEtcDAO extends EgovComAbstractDAO {

	public List<?> popupList(PageInfo pi,PopupVO PopupVO) {
		int offset=(pi.getCurrentPage() -1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return selectList("AdminEtcDAO.popupList", PopupVO,rowBounds);
	}

	public int getPopupListCount(PopupVO PopupVO) {
		return (Integer)selectOne("AdminEtcDAO.getPopupListCount", PopupVO);
	}
	public int mainChkCount(PopupVO PopupVO) {
		return (Integer)selectOne("AdminEtcDAO.mainChkCount", PopupVO);
	}
	
	public PopupVO selectPopupDetail(PopupVO PopupVO) {
		return (PopupVO) selectOne("AdminEtcDAO.selectPopupDetail", PopupVO);
	}
	public int mergePopup(PopupVO PopupVO) {
		return update("AdminEtcDAO.mergePopup", PopupVO);
	}
	public int deletePopup(PopupVO PopupVO) {
		return delete("AdminEtcDAO.deletePopup", PopupVO);
	}
	public List<?> slideList(PageInfo pi,SlideVO SlideVO) {
		int offset=(pi.getCurrentPage() -1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return selectList("AdminEtcDAO.slideList", SlideVO,rowBounds);
	}
	public int getSlideListCount(SlideVO SlideVO) {
		return (Integer)selectOne("AdminEtcDAO.getSlideListCount", SlideVO);
	}
	public SlideVO selectSlideDetail(SlideVO SlideVO) {
		return (SlideVO) selectOne("AdminEtcDAO.selectSlideDetail", SlideVO);
	}
	public int mergeSlide(SlideVO SlideVO) {
		return update("AdminEtcDAO.mergeSlide", SlideVO);
	}
	public int useYnCount(SlideVO SlideVO) {
		return (Integer)selectOne("AdminEtcDAO.useYnCount", SlideVO);
	}
	public int deleteSlide(SlideVO SlideVO) {
		return delete("AdminEtcDAO.deleteSlide", SlideVO);
	}
}
