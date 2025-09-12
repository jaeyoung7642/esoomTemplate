package com.esoom.templeate.admin.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.esoom.templeate.admin.service.MemberVO;
import com.esoom.templeate.common.PageInfo;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("AdminMemberDAO")
public class AdminMemberDAO extends EgovComAbstractDAO {

	public List<?> memberList(PageInfo pi,MemberVO MemberVO) {
		int offset=(pi.getCurrentPage() -1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return selectList("AdminMemberDAO.memberList", MemberVO,rowBounds);
	}
	
	public int getMemberListCount(MemberVO MemberVO) {
		return (Integer)selectOne("AdminMemberDAO.getMemberListCount", MemberVO);
	}
	
	public MemberVO selectMemberDetail(MemberVO MemberVO) {
		return (MemberVO) selectOne("AdminMemberDAO.selectMemberDetail", MemberVO);
	}
	
	public int changePwd(MemberVO MemberVO) {
		return update("AdminMemberDAO.changePwd", MemberVO);
	}
	
	public int updateState(MemberVO MemberVO) {
		return update("AdminMemberDAO.updateState", MemberVO);
	}
}
