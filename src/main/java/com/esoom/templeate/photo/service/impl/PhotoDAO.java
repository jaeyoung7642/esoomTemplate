package com.esoom.templeate.photo.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.esoom.templeate.admin.service.BoardPhotoVO;
import com.esoom.templeate.admin.service.BoardVO;
import com.esoom.templeate.common.PageInfo;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("PhotoDAO")
public class PhotoDAO extends EgovComAbstractDAO {

	public List<?> photoHome(BoardVO boardVO) {
		return selectList("PhotoDAO.photoHome", boardVO);
	}
	public List<?> photoList(PageInfo pi,BoardVO boardVO) {
		int offset=(pi.getCurrentPage() -1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return selectList("PhotoDAO.photoList", boardVO,rowBounds);
	}
	public int getPhotoListCount(BoardVO boardVO) {
		return (Integer)selectOne("PhotoDAO.getPhotoListCount", boardVO);
	}
	public BoardVO photoDetail(BoardVO boardVO) {
		return (BoardVO) selectOne("PhotoDAO.photoDetail", boardVO);
	}
	public List<?> footPhotoList(BoardVO boardVO) {
		return selectList("PhotoDAO.footPhotoList", boardVO);
	}
	public List<?> photoChildList(BoardVO boardVO) {
		return selectList("PhotoDAO.photoChildList", boardVO);
	}
}
