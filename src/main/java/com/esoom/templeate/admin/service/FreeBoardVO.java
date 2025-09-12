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
public class FreeBoardVO implements Serializable {
	/**
	 *  serialVersion UID
	 */
	private static final long serialVersionUID = 1L;
	/** 검색Keyword */
	private String searchKeyword = "";
	/** 정렬순서 */
	private Integer rownum = 0;
	/** 게시물번호 */
	private Integer num = 0;
	/** 작성자id */
	private String id = "";
	/** 글제목 */
	private String subject = "";
	/** 공지여부 */
	private String flag = "";
	/** 작성자 이름 */
	private String writer = "";
	/** 글내용 */
	private String content = "";
	/** 작성자 ip */
	private String ip = "";
	/** 정렬순서 */
	private Integer visited = 0;
	/** 등록일 */
	private String wdate = "";
	/** 삭제여부 */
	private String chk_del = "";
	
	private String etc1 = "";
	private String chk_m = "";
	
	private Integer ref = 0;
	private Integer step = 0;
	private Integer ansnum = 0;
	private Integer tn = 0;
	private Integer pn = 0;
	private Integer recommend = 0;
	
	/** 작성자 이름 */
	private String writer2 = "";
	private String formatted_date = "";
	private Integer tail_count = 0;
	
	
	private String searchTitle = "N";
	private String searchChk_del = "N";
	private String searchContent = "N";
	private String searchWriter = "N";
	private String searchTail = "N";
	private String searchTailWriter = "N";
	
	private Integer listpage = 1;
	
	
	public Integer getListpage() {
		return listpage;
	}
	public void setListpage(Integer listpage) {
		this.listpage = listpage;
	}
	public String getWriter2() {
		return writer2;
	}
	public void setWriter2(String writer2) {
		this.writer2 = writer2;
	}
	public String getFormatted_date() {
		return formatted_date;
	}
	public void setFormatted_date(String formatted_date) {
		this.formatted_date = formatted_date;
	}
	public Integer getTail_count() {
		return tail_count;
	}
	public void setTail_count(Integer tail_count) {
		this.tail_count = tail_count;
	}
	public String getSearchTitle() {
		return searchTitle;
	}
	public void setSearchTitle(String searchTitle) {
		this.searchTitle = searchTitle;
	}
	public String getSearchChk_del() {
		return searchChk_del;
	}
	public void setSearchChk_del(String searchChk_del) {
		this.searchChk_del = searchChk_del;
	}
	public String getSearchContent() {
		return searchContent;
	}
	public void setSearchContent(String searchContent) {
		this.searchContent = searchContent;
	}
	public String getSearchWriter() {
		return searchWriter;
	}
	public void setSearchWriter(String searchWriter) {
		this.searchWriter = searchWriter;
	}
	public String getSearchTail() {
		return searchTail;
	}
	public void setSearchTail(String searchTail) {
		this.searchTail = searchTail;
	}
	public String getSearchTailWriter() {
		return searchTailWriter;
	}
	public void setSearchTailWriter(String searchTailWriter) {
		this.searchTailWriter = searchTailWriter;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	public Integer getVisited() {
		return visited;
	}
	public void setVisited(Integer visited) {
		this.visited = visited;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public String getChk_del() {
		return chk_del;
	}
	public void setChk_del(String chk_del) {
		this.chk_del = chk_del;
	}
	public String getEtc1() {
		return etc1;
	}
	public void setEtc1(String etc1) {
		this.etc1 = etc1;
	}
	public String getChk_m() {
		return chk_m;
	}
	public void setChk_m(String chk_m) {
		this.chk_m = chk_m;
	}
	public Integer getRef() {
		return ref;
	}
	public void setRef(Integer ref) {
		this.ref = ref;
	}
	public Integer getStep() {
		return step;
	}
	public void setStep(Integer step) {
		this.step = step;
	}
	public Integer getAnsnum() {
		return ansnum;
	}
	public void setAnsnum(Integer ansnum) {
		this.ansnum = ansnum;
	}
	public Integer getTn() {
		return tn;
	}
	public void setTn(Integer tn) {
		this.tn = tn;
	}
	public Integer getPn() {
		return pn;
	}
	public void setPn(Integer pn) {
		this.pn = pn;
	}
	public Integer getRecommend() {
		return recommend;
	}
	public void setRecommend(Integer recommend) {
		this.recommend = recommend;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
