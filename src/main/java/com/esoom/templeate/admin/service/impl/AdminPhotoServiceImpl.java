/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.esoom.templeate.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.esoom.templeate.admin.service.AdminPhotoService;
import com.esoom.templeate.admin.service.BoardPhotoVO;
import com.esoom.templeate.admin.service.BoardVO;
import com.esoom.templeate.common.PageInfo;


/**
 * @Class Name : EgovSampleServiceImpl.java
 * @Description : Sample Business Implement Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */

@Service("adminPhotoService")
public class AdminPhotoServiceImpl extends EgovAbstractServiceImpl implements AdminPhotoService {

	private static final Logger LOGGER = LoggerFactory.getLogger(AdminPhotoServiceImpl.class);
	@Resource(name = "AdminPhotoDAO")
    private AdminPhotoDAO adminPhotoDao;
	/**
	 * 글 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	@Override
	public List<?> photoList(PageInfo pi,BoardVO boardVO) throws Exception {
		return adminPhotoDao.photoList(pi,boardVO);
	}

	/**
	 * 글 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
	@Override
	public int getTotalPhotoListCount(BoardVO boardVO) {
		return adminPhotoDao.getTotalPhotoListCount(boardVO);
	}
	/**
	 * 글 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
	@Override
	public int getPhotoListCount(BoardVO boardVO) {
		return adminPhotoDao.getPhotoListCount(boardVO);
	}
	@Override
	public List<?> boardPhotoList(BoardVO boardVO) throws Exception {
		return adminPhotoDao.boardPhotoList(boardVO);
	}
	@Override
	public int boardPhotoMerge(BoardPhotoVO bpVO) throws Exception {
		return adminPhotoDao.boardPhotoMerge(bpVO);
	}
	@Override
	public int deleteBoardPhoto(BoardPhotoVO bpVO) {
		return adminPhotoDao.deleteBoardPhoto(bpVO);
	}
}
