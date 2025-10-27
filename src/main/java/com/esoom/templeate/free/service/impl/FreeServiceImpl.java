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
package com.esoom.templeate.free.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.esoom.templeate.admin.service.BoardTailVO;
import com.esoom.templeate.admin.service.BoardVO;
import com.esoom.templeate.admin.service.FreeBoardVO;
import com.esoom.templeate.admin.service.FreeTailVO;
import com.esoom.templeate.common.PageInfo;
import com.esoom.templeate.free.service.FreeService;
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

@Service("FreeService")
public class FreeServiceImpl extends EgovAbstractServiceImpl implements FreeService {

	private static final Logger LOGGER = LoggerFactory.getLogger(FreeServiceImpl.class);
	@Resource(name = "FreeDAO")
    private FreeDAO freeDao;
	/**
	 * 글 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	@Override
	public int getFreeListCount(FreeBoardVO freeBoardVO) {
		return freeDao.getFreeListCount(freeBoardVO);
	}
	@Override
	public List<FreeBoardVO> freeList(PageInfo pi, FreeBoardVO freeBoardVO) throws Exception {
		return (List<FreeBoardVO>) freeDao.freeList(pi,freeBoardVO);
	}
	@Override
	public List<?> topFreeList(FreeBoardVO freeBoardVO) throws Exception {
		return freeDao.topFreeList(freeBoardVO);
	}
	@Override
	public FreeBoardVO freeDetail(FreeBoardVO freeBoardVO) throws Exception {
		return freeDao.freeDetail(freeBoardVO);
	}
	@Override
	public List<?> freeTailList(PageInfo pi, FreeTailVO freeTailVO) throws Exception {
		return freeDao.freeTailList(pi,freeTailVO);
	}
	@Override
	public int getFreeTailListCount(FreeTailVO freeTailVO) {
		return freeDao.getFreeTailListCount(freeTailVO);
	}
	@Override
	public List<?> mypageFreeList(FreeBoardVO freeBoardVO) throws Exception {
		return freeDao.mypageFreeList(freeBoardVO);
	}
	@Override
	public int mergeFree(FreeBoardVO freeBoardVO) {
		return freeDao.mergeFree(freeBoardVO);
	}
	@Override
	public int freeDelete(FreeBoardVO freeBoardVO) {
		return freeDao.freeDelete(freeBoardVO);
	}
	@Override
	public int contentWrite(FreeTailVO freeTailVO) {
		return freeDao.contentWrite(freeTailVO);
	}
	@Override
	public int contentDelete(FreeTailVO freeTailVO) {
		return freeDao.contentDelete(freeTailVO);
	}
}
