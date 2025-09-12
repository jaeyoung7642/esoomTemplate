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
public class BoardVO implements Serializable {

	/**
	 *  serialVersion UID
	 */
	private static final long serialVersionUID = -858838578081269359L;
	/** 현재페이지 */
	private Integer currentPage = 1; 
	/** 게시물수 */
	private Integer limit = 10; 
	/** 검색Keyword */
	private String searchKeyword = "";
	/** 정렬순서 */
	private Integer rownum = 0;
	/** 게시물번호 */
	private Integer num = 0;
	/** 글제목 */
	private String subject = "";
	/** 글내용 */
	private String content = "";
	/** 기사내용 */
	private String summary = "";
	/** 썸네일 */
	private String img1 = "";
	/** 첨부이미지2 */
	private String img2 = "";
	/** 첨부이미지3 */
	private String img3 = "";
	/** 방문수 */
	private Integer visited = 0;
	/** 삭제여부 */
	private String flag = "";
	/** 등록일 */
	private String wdate = "";
	/** 등록일포멧 */
	private String formatted_date = "";
	/** 게시판구분값
	 	news, movie, photo, notice
	 **/
	private String part = "";
	/** 게시판 상세구분값
	 	영상 => U: 유튜브 / S: 숏츠
		공지사항 => Y: 공지 / 없음: 공지아님
	 **/
	private String wtype = "";
	/** 링크 URL **/
	private String linkurl = "";
	/** 기타
	 	영상 => H: 경기 / E: 이벤트
	 **/
	private String etc1 = "";
	private String etc2 = "";
	private String tags = "";
	private String sDay = "";
	private String sTime = "";
	private String sMinute = "";
	private String eDay = "";
	private String eTime = "";
	private String eMinute = "";
	private String sdate = "";
	private String edate = "";
	private String state = "";
	private String sdateFormat ="";
	private String edateFormat ="";
	
	private List<BoardPhotoVO> photoList; 
	
	
	public List<BoardPhotoVO> getPhotoList() {
		return photoList;
	}
	public void setPhotoList(List<BoardPhotoVO> photoList) {
		this.photoList = photoList;
	}
	public Integer getLimit() {
		return limit;
	}
	public void setLimit(Integer limit) {
		this.limit = limit;
	}
	public Integer getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	public String getSdateFormat() {
		return sdateFormat;
	}
	public void setSdateFormat(String sdateFormat) {
		this.sdateFormat = sdateFormat;
	}
	public String getEdateFormat() {
		return edateFormat;
	}
	public void setEdateFormat(String edateFormat) {
		this.edateFormat = edateFormat;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Integer getRownum() {
		return rownum;
	}
	public void setRownum(Integer rownum) {
		this.rownum = rownum;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public Integer getVisited() {
		return visited;
	}
	public void setVisited(Integer visited) {
		this.visited = visited;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	
	public String getsDay() {
		return sDay;
	}
	public void setsDay(String sDay) {
		this.sDay = sDay;
	}
	public String getsTime() {
		return sTime;
	}
	public void setsTime(String sTime) {
		this.sTime = sTime;
	}
	public String getsMinute() {
		return sMinute;
	}
	public void setsMinute(String sMinute) {
		this.sMinute = sMinute;
	}
	public String geteDay() {
		return eDay;
	}
	public void seteDay(String eDay) {
		this.eDay = eDay;
	}
	public String geteTime() {
		return eTime;
	}
	public void seteTime(String eTime) {
		this.eTime = eTime;
	}
	public String geteMinute() {
		return eMinute;
	}
	public void seteMinute(String eMinute) {
		this.eMinute = eMinute;
	}
	public String getFormatted_date() {
		return formatted_date;
	}
	public void setFormatted_date(String formatted_date) {
		this.formatted_date = formatted_date;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	public String getImg2() {
		return img2;
	}
	public void setImg2(String img2) {
		this.img2 = img2;
	}
	public String getImg3() {
		return img3;
	}
	public void setImg3(String img3) {
		this.img3 = img3;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getWtype() {
		return wtype;
	}
	public void setWtype(String wtype) {
		this.wtype = wtype;
	}
	public String getLinkurl() {
		return linkurl;
	}
	public void setLinkurl(String linkurl) {
		this.linkurl = linkurl;
	}
	public String getEtc1() {
		return etc1;
	}
	public void setEtc1(String etc1) {
		this.etc1 = etc1;
	}
	public String getEtc2() {
		return etc2;
	}
	public void setEtc2(String etc2) {
		this.etc2 = etc2;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
