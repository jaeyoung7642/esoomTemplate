package com.esoom.templeate.etc.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.esoom.templeate.admin.service.SlideVO;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("EtcDAO")
public class EtcDAO extends EgovComAbstractDAO {

	public List<?> mainSlideHome(SlideVO SlideVO) {
		return selectList("EtcDAO.mainSlideHome", SlideVO);
	}
}
