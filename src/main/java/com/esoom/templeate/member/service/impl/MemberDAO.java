package com.esoom.templeate.member.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.esoom.templeate.admin.service.BoardPhotoVO;
import com.esoom.templeate.admin.service.BoardTailVO;
import com.esoom.templeate.admin.service.BoardVO;
import com.esoom.templeate.admin.service.FreeTailVO;
import com.esoom.templeate.admin.service.MemberVO;
import com.esoom.templeate.common.PageInfo;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("MemberDAO")
public class MemberDAO extends EgovComAbstractDAO {

	public MemberVO getMember(MemberVO memberVO) {
		return (MemberVO) selectOne("MemberDAO.getMember", memberVO);
	}
	public MemberVO duplicateDi(MemberVO memberVO) {
		return (MemberVO) selectOne("MemberDAO.duplicateDi", memberVO);
	}
	public int loginUpdate(MemberVO memberVO) {
		return update("MemberDAO.loginUpdate", memberVO);
	}
	public int insertMember(MemberVO memberVO) {
		return insert("MemberDAO.insertMember", memberVO);
	}
	public int duplicateMember(MemberVO memberVO) {
		return (Integer)selectOne("MemberDAO.duplicateMember", memberVO);
	}
}
