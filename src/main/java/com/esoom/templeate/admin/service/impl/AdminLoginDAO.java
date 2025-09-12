package com.esoom.templeate.admin.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.esoom.templeate.admin.service.AdminVO;
import com.esoom.templeate.admin.service.BoardVO;
import com.esoom.templeate.admin.service.FreeBoardVO;
import com.esoom.templeate.admin.service.FreeTailVO;
import com.esoom.templeate.admin.service.SlideVO;
import com.esoom.templeate.common.PageInfo;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("AdminLoginDAO")
public class AdminLoginDAO extends EgovComAbstractDAO {

	public AdminVO getAdmin(AdminVO AdminVO) {
		return (AdminVO) selectOne("AdminLoginDAO.getAdmin", AdminVO);
	}
	public int insertLoginInfo(AdminVO AdminVO) {
		return insert("AdminLoginDAO.insertLoginInfo", AdminVO);
	}
}
