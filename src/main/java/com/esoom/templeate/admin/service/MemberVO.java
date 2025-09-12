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
public class MemberVO implements Serializable {
	private String searchKeyword = "";
	
	private String select = "";
	
	private Integer rownum = 0;
	
	private Integer num = 0;
	
	private String id = "";
	
	private String name = "";
	
	private String pwd = "";
	
	private String jumin_old = "";
	
	private String jumin = "";
	
	private String zipcode_old = "";
	
	private String add_old = "";
	
	private String daddr_old = "";
	
	private String email_old = "";
	
	private String tel_old = "";
	
	private String htel_old = "";
	
	private String zipcode = "";
	
	private String addr = "";
	
	private String daddr = "";
	
	private String email = "";
	
	private String tel = "";
	
	private String htel = "";
	
	private String chk_email = "";
	
	private String chk_sms = "";
	
	private String chk_grade = "";
	
	private String chk_state = "";
	
	private String reg_date = "";
	
	private String login_date = "";
	
	private String logindate = "";
	
	private String pwd_date = "";
	
	private String out_date = "";
	
	private String ip = "";
	
	private String sex = "";
	
	private String chk_return = "";
	
	private String chk_date = "";
	
	private String sns_fb = "";
	
	private String sns_naver = "";
	
	private String di = "";
	
	private String ticketlink = "";
	
	private String auth_type = "";
	
	private String sha_pwd = "";
	
	private String delete_reason = "";
	
	
	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getSelect() {
		return select;
	}

	public void setSelect(String select) {
		this.select = select;
	}

	public Integer getRownum() {
		return rownum;
	}

	public void setRownum(Integer rownum) {
		this.rownum = rownum;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getJumin_old() {
		return jumin_old;
	}

	public void setJumin_old(String jumin_old) {
		this.jumin_old = jumin_old;
	}

	public String getJumin() {
		return jumin;
	}

	public void setJumin(String jumin) {
		this.jumin = jumin;
	}

	public String getZipcode_old() {
		return zipcode_old;
	}

	public void setZipcode_old(String zipcode_old) {
		this.zipcode_old = zipcode_old;
	}

	public String getAdd_old() {
		return add_old;
	}

	public void setAdd_old(String add_old) {
		this.add_old = add_old;
	}

	public String getDaddr_old() {
		return daddr_old;
	}

	public void setDaddr_old(String daddr_old) {
		this.daddr_old = daddr_old;
	}

	public String getEmail_old() {
		return email_old;
	}

	public void setEmail_old(String email_old) {
		this.email_old = email_old;
	}

	public String getTel_old() {
		return tel_old;
	}

	public void setTel_old(String tel_old) {
		this.tel_old = tel_old;
	}

	public String getHtel_old() {
		return htel_old;
	}

	public void setHtel_old(String htel_old) {
		this.htel_old = htel_old;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getDaddr() {
		return daddr;
	}

	public void setDaddr(String daddr) {
		this.daddr = daddr;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getHtel() {
		return htel;
	}

	public void setHtel(String htel) {
		this.htel = htel;
	}

	public String getChk_email() {
		return chk_email;
	}

	public void setChk_email(String chk_email) {
		this.chk_email = chk_email;
	}

	public String getChk_sms() {
		return chk_sms;
	}

	public void setChk_sms(String chk_sms) {
		this.chk_sms = chk_sms;
	}

	public String getChk_grade() {
		return chk_grade;
	}

	public void setChk_grade(String chk_grade) {
		this.chk_grade = chk_grade;
	}

	public String getChk_state() {
		return chk_state;
	}

	public void setChk_state(String chk_state) {
		this.chk_state = chk_state;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getLogin_date() {
		return login_date;
	}

	public void setLogin_date(String login_date) {
		this.login_date = login_date;
	}

	public String getLogindate() {
		return logindate;
	}

	public void setLogindate(String logindate) {
		this.logindate = logindate;
	}

	public String getPwd_date() {
		return pwd_date;
	}

	public void setPwd_date(String pwd_date) {
		this.pwd_date = pwd_date;
	}

	public String getOut_date() {
		return out_date;
	}

	public void setOut_date(String out_date) {
		this.out_date = out_date;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getChk_return() {
		return chk_return;
	}

	public void setChk_return(String chk_return) {
		this.chk_return = chk_return;
	}

	public String getChk_date() {
		return chk_date;
	}

	public void setChk_date(String chk_date) {
		this.chk_date = chk_date;
	}

	public String getSns_fb() {
		return sns_fb;
	}

	public void setSns_fb(String sns_fb) {
		this.sns_fb = sns_fb;
	}

	public String getSns_naver() {
		return sns_naver;
	}

	public void setSns_naver(String sns_naver) {
		this.sns_naver = sns_naver;
	}

	public String getDi() {
		return di;
	}

	public void setDi(String di) {
		this.di = di;
	}

	public String getTicketlink() {
		return ticketlink;
	}

	public void setTicketlink(String ticketlink) {
		this.ticketlink = ticketlink;
	}

	public String getAuth_type() {
		return auth_type;
	}

	public void setAuth_type(String auth_type) {
		this.auth_type = auth_type;
	}

	public String getSha_pwd() {
		return sha_pwd;
	}

	public void setSha_pwd(String sha_pwd) {
		this.sha_pwd = sha_pwd;
	}

	public String getDelete_reason() {
		return delete_reason;
	}

	public void setDelete_reason(String delete_reason) {
		this.delete_reason = delete_reason;
	}
	
	
}
