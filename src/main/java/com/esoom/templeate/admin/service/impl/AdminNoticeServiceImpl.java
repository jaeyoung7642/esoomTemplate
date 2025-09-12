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

import com.esoom.templeate.admin.service.AdminNoticeService;
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

@Service("adminNoticeService")
public class AdminNoticeServiceImpl extends EgovAbstractServiceImpl implements AdminNoticeService {

	private static final Logger LOGGER = LoggerFactory.getLogger(AdminNoticeServiceImpl.class);
	@Resource(name = "AdminNoticeDAO")
    private AdminNoticeDAO adminNoticeDao;
	/**
	 * 글 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	@Override
	public List<?> noticeList(PageInfo pi,BoardVO boardVO) throws Exception {
		return adminNoticeDao.noticeList(pi,boardVO);
	}

	/**
	 * 글 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
	@Override
	public int getTotalNoticeListCount(BoardVO boardVO) {
		System.out.println("getTotalNoticeListCount 시작");
		return adminNoticeDao.getTotalNoticeListCount(boardVO);
	}
	/**
	 * 글 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
	@Override
	public int getNoticeListCount(BoardVO boardVO) {
		return adminNoticeDao.getNoticeListCount(boardVO);
	}
	@Override
	public BoardVO selectBoardDetail(BoardVO boardVO) {
		return adminNoticeDao.selectBoardDetail(boardVO);
	}
	@Override
	public BoardVO lastBoard(BoardVO boardVO) {
		return adminNoticeDao.lastBoard(boardVO);
	}
	@Override
	public int mergeBoard(BoardVO boardVO) throws Exception {
		return adminNoticeDao.mergeBoard(boardVO);
	}
	@Override
	public int deleteBoard(BoardVO boardVO) throws Exception {
		return adminNoticeDao.deleteBoard(boardVO);
	}
}
