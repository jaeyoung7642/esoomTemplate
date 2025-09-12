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

import com.esoom.templeate.admin.service.AdminMemberService;
import com.esoom.templeate.admin.service.MemberVO;
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

@Service("adminMemeberService")
public class AdminMemberServiceImpl extends EgovAbstractServiceImpl implements AdminMemberService {

	private static final Logger LOGGER = LoggerFactory.getLogger(AdminMemberServiceImpl.class);
	@Resource(name = "AdminMemberDAO")
    private AdminMemberDAO adminMemberDao;
	/**
	 * 글 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	@Override
	public List<?> memberList(PageInfo pi,MemberVO MemberVO) throws Exception {
		return adminMemberDao.memberList(pi,MemberVO);
	}

	/**
	 * 글 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
	@Override
	public int getMemberListCount(MemberVO MemberVO) {
		return adminMemberDao.getMemberListCount(MemberVO);
	}
	@Override
	public MemberVO selectMemberDetail(MemberVO MemberVO) {
		return adminMemberDao.selectMemberDetail(MemberVO);
	}
	@Override
	public int changePwd(MemberVO MemberVO) {
		return adminMemberDao.changePwd(MemberVO);
	}
	@Override
	public int updateState(MemberVO MemberVO) {
		return adminMemberDao.updateState(MemberVO);
	}
}
