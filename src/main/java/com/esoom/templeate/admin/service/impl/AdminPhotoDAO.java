package com.esoom.templeate.admin.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.esoom.templeate.admin.service.BoardPhotoVO;
import com.esoom.templeate.admin.service.BoardVO;
import com.esoom.templeate.common.PageInfo;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("AdminPhotoDAO")
public class AdminPhotoDAO extends EgovComAbstractDAO {

	public List<?> photoList(PageInfo pi,BoardVO boardVO) {
		int offset=(pi.getCurrentPage() -1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return selectList("AdminPhotoDAO.photoList", boardVO,rowBounds);
	}
	public List<?> boardPhotoList(BoardVO boardVO) {
		return selectList("AdminPhotoDAO.boardPhotoList", boardVO);
	}

	public int getTotalPhotoListCount(BoardVO boardVO) {
		return (Integer)selectOne("AdminPhotoDAO.getTotalPhotoListCount", boardVO);
	}
	
	public int getPhotoListCount(BoardVO boardVO) {
		return (Integer)selectOne("AdminPhotoDAO.getPhotoListCount", boardVO);
	}
	public int boardPhotoMerge(BoardPhotoVO bpVO) {
		return update("AdminPhotoDAO.boardPhotoMerge", bpVO);
	}
	public int deleteBoardPhoto(BoardPhotoVO bpVO) {
		return delete("AdminPhotoDAO.deleteBoardPhoto", bpVO);
	}
}
