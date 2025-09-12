package com.esoom.templeate.admin.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * @Class Name : SampleDefaultVO.java
 * @Description : SampleDefaultVO Class
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
@SuppressWarnings("serial")
public class BoardPhotoVO extends BoardVO implements Serializable {
	private String photofile = "";
	
	private Integer info_num = 0;

	public String getPhotofile() {
		return photofile;
	}

	public void setPhotofile(String photofile) {
		this.photofile = photofile;
	}

	public Integer getInfo_num() {
		return info_num;
	}

	public void setInfo_num(Integer info_num) {
		this.info_num = info_num;
	}
	
}
