package com.esoom.templeate.movie.service;

import java.util.List;

import com.esoom.templeate.admin.service.BoardVO;
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
public interface MovieService {

	/**
	 * 글 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	List<?> mypageMovieList(BoardVO boardVO) throws Exception;

	List<?> mediaUHome(BoardVO boardVO) throws Exception;

	List<?> mediaSHome(BoardVO boardVO) throws Exception;
	
	List<?> movieList(PageInfo pi,BoardVO boardVO) throws Exception;
	
	int getMovieListCount(BoardVO boardVO);
	
	BoardVO movieDetail(BoardVO boardVO);
	
	List<?> footMovieList(BoardVO boardVO) throws Exception;
	
	
}
