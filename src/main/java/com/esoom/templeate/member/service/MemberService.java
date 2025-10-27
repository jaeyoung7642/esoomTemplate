package com.esoom.templeate.member.service;

import java.util.List;

import com.esoom.templeate.admin.service.BoardTailVO;
import com.esoom.templeate.admin.service.BoardVO;
import com.esoom.templeate.admin.service.MemberVO;
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
public interface MemberService {
	
	MemberVO getMember(MemberVO memberVO);
	
	MemberVO duplicateDi(MemberVO memberVO);
	
	int loginUpdate(MemberVO memberVO);

	int insertMember(MemberVO memberVO);
	
	int duplicateMember(MemberVO memberVO); 
}
