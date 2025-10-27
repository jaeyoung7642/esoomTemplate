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
package com.esoom.templeate.notice.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.esoom.templeate.admin.service.BoardTailVO;
import com.esoom.templeate.admin.service.BoardVO;
import com.esoom.templeate.common.PageInfo;
import com.esoom.templeate.notice.service.NoticeService;
import com.esoom.templeate.photo.service.PhotoService;


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

@Service("NoticeService")
public class NoticeServiceImpl extends EgovAbstractServiceImpl implements NoticeService {

	private static final Logger LOGGER = LoggerFactory.getLogger(NoticeServiceImpl.class);
	@Resource(name = "NoticeDAO")
    private NoticeDAO noticeDao;
	/**
	 * 글 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	@Override
	public int getNoticeListCount(BoardVO boardVO) {
		return noticeDao.getNoticeListCount(boardVO);
	}
	@Override
	public List<BoardVO> noticeList(PageInfo pi, BoardVO boardVO) throws Exception {
		return (List<BoardVO>) noticeDao.noticeList(pi,boardVO);
	}
	@Override
	public BoardVO noticeDetail(BoardVO boardVO) {
		return noticeDao.noticeDetail(boardVO);
	}
	@Override
	public BoardVO nextDetail(BoardVO boardVO) {
		return noticeDao.nextDetail(boardVO);
	}
	@Override
	public BoardVO prevDetail(BoardVO boardVO) {
		return noticeDao.prevDetail(boardVO);
	}
	@Override
	public List<?> boardTailList(PageInfo pi, BoardTailVO boardTailVO) throws Exception {
		return noticeDao.boardTailList(pi,boardTailVO);
	}
	@Override
	public int getBoardTailListCount(BoardTailVO boardTailVO) {
		return noticeDao.getBoardTailListCount(boardTailVO);
	}
	@Override
	public List<?> mypageNoticeList(BoardVO boardVO) throws Exception {
		return noticeDao.mypageNoticeList(boardVO); 
	}
	@Override
	public int contentWrite(BoardTailVO boardTailVO) {
		return noticeDao.contentWrite(boardTailVO);
	}
	@Override
	public int contentDelete(BoardTailVO boardTailVO) {
		return noticeDao.contentDelete(boardTailVO);
	}

}
