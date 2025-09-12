package com.esoom.templeate.admin.service;

import java.io.Serializable;
import java.util.List;



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
public class FreeTailVO implements Serializable {
	/**
	 *  serialVersion UID
	 */
	private static final long serialVersionUID = 1L;
	/** 댓글번호 */
	private Integer num = 0;
	/** 게시물번호 */
	private Integer info_num = 0;
	/** 작성자id */
	private String id = "";
	/** 작성자이름 */
	private String writer = "";
	/** 작성자이름2 */
	private String writer2 = "";
	/** 내용 */
	private String content = "";
	/** 내용 */
	private String ip = "";
	/** 등록일 */
	private String wdate = "";
	private String formatted_date = "";
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public Integer getInfo_num() {
		return info_num;
	}
	public void setInfo_num(Integer info_num) {
		this.info_num = info_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getWriter2() {
		return writer2;
	}
	public void setWriter2(String writer2) {
		this.writer2 = writer2;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public String getFormatted_date() {
		return formatted_date;
	}
	public void setFormatted_date(String formatted_date) {
		this.formatted_date = formatted_date;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
