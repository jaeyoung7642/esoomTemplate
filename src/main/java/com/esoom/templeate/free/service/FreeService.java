package com.esoom.templeate.free.service;

import java.util.List;

import com.esoom.templeate.admin.service.BoardTailVO;
import com.esoom.templeate.admin.service.BoardVO;
import com.esoom.templeate.admin.service.FreeBoardVO;
import com.esoom.templeate.admin.service.FreeTailVO;
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
public interface FreeService {

	/**
	 * 글 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	List<FreeBoardVO> freeList(PageInfo pi,FreeBoardVO freeBoardVO) throws Exception;
	
	int getFreeListCount(FreeBoardVO freeBoardVO);
	
	List<?> topFreeList(FreeBoardVO freeBoardVO) throws Exception;
	
	FreeBoardVO freeDetail(FreeBoardVO freeBoardVO) throws Exception; 

	int getFreeTailListCount(FreeTailVO freeTailVO);

	List<?> freeTailList(PageInfo pi,FreeTailVO freeTailVO) throws Exception;

	List<?> mypageFreeList(FreeBoardVO freeBoardVO) throws Exception;
	
	int mergeFree(FreeBoardVO freeBoardVO);
	
	int freeDelete(FreeBoardVO freeBoardVO);
	
	int contentWrite(FreeTailVO freeTailVO);
	
	int contentDelete(FreeTailVO freeTailVO);
}
