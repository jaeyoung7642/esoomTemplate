package com.esoom.templeate.admin.service;

import java.util.List;

import com.esoom.templeate.common.PageInfo;

/**
 * @Class Name : EgovSampleService.java
 * @Description : EgovSampleService Class
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
public interface AdminFreeService {

	/**
	 * 글 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	List<?> freeList(PageInfo pi,FreeBoardVO FreeBoardVO) throws Exception;

	List<?> freeTailList(PageInfo pi,FreeTailVO FreeTailVO) throws Exception;

	/**
	 * 글 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
	int getFreeListCount(FreeBoardVO FreeBoardVO);
	
	int getFreeTailListCount(FreeTailVO FreeTailVO);
	
	int mergeFree(FreeBoardVO FreeBoardVO);
	
	int insertFreeTail(FreeTailVO FreeTailVO);
	
	int deleteFreeTail(FreeTailVO FreeTailVO);
	
	int deleteFree(FreeBoardVO FreeBoardVO);
	
	
	FreeBoardVO selectFreeDetail(FreeBoardVO FreeBoardVO);
	
	int changeChkDel(FreeBoardVO FreeBoardVO) throws Exception;
}
