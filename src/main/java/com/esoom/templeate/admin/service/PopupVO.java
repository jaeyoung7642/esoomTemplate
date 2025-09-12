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
public class PopupVO implements Serializable {
	private Integer num = 0;
	
	private String subject = "";
	
	private String pop_img = "";
	
	private String pop_img2 = "";
	//링크사용여부 
	// 0 = 미사용
	// 1 = 사용
	private String map_chk = "0";
	//링크 타겟
	// 0 = 사이트내부
	// 1 = 외부새창
	private String map_target = "0";	
	//링크 url
	private String map_url = "";
	//출력 여부
	// Y = 출력
	// N = 미출력
	private String main_chk = "Y";
	//출력순서
	private Integer order = 1;
	//등록일
	private String wdate = "";
	
	private String sdate = "";
	
	private String edate = "";
	private String sDay = "";
	private String sTime = "";
	private String sMinute = "";
	private String eDay = "";
	private String eTime = "";
	private String eMinute = "";
	private String formatted_date = "";
	
	
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public String getFormatted_date() {
		return formatted_date;
	}
	public void setFormatted_date(String formatted_date) {
		this.formatted_date = formatted_date;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getPop_img() {
		return pop_img;
	}
	public void setPop_img(String pop_img) {
		this.pop_img = pop_img;
	}
	public String getPop_img2() {
		return pop_img2;
	}
	public void setPop_img2(String pop_img2) {
		this.pop_img2 = pop_img2;
	}
	public String getMap_chk() {
		return map_chk;
	}
	public void setMap_chk(String map_chk) {
		this.map_chk = map_chk;
	}
	public String getMap_target() {
		return map_target;
	}
	public void setMap_target(String map_target) {
		this.map_target = map_target;
	}
	public String getMap_url() {
		return map_url;
	}
	public void setMap_url(String map_url) {
		this.map_url = map_url;
	}
	public String getMain_chk() {
		return main_chk;
	}
	public void setMain_chk(String main_chk) {
		this.main_chk = main_chk;
	}
	public Integer getOrder() {
		return order;
	}
	public void setOrder(Integer order) {
		this.order = order;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
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
	
}
