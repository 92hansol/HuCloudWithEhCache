package kr.co.hucloud.security.code.example.member.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import kr.co.hucloud.security.code.example.common.Session;
import kr.co.hucloud.security.code.example.encrypto.password.dao.EncryptoPasswordDAO;
import kr.co.hucloud.security.code.example.member.dao.MemberDAO;
import kr.co.hucloud.security.code.example.member.service.MemberService;
import kr.co.hucloud.security.code.example.member.vo.LoginVO;
import kr.co.hucloud.security.code.example.member.vo.MemberRegistryVO;
import kr.co.hucloud.security.code.example.member.vo.MemberVO;

public class MemberServiceImpl implements MemberService {

	private MemberDAO memberDAO;
	private EncryptoPasswordDAO encryptoPasswordDAO;
	
	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}
	
	public void setEncryptoPasswordDAO(EncryptoPasswordDAO encryptoPasswordDAO) {
		this.encryptoPasswordDAO = encryptoPasswordDAO;
	}

	@Override
	public void addMember(MemberRegistryVO memberVO) {
		memberDAO.addMember(memberVO);
	}
	
	@Override
	public boolean login(HttpSession session, LoginVO loginVO) {
		
		MemberVO memberVO = null;
		
		if(encryptoPasswordDAO.isExistsSaltColumn()) {
			String salt = memberDAO.getSaltById(loginVO.getId());
			String hashedPassword = BCrypt.hashpw(loginVO.getPassword(), salt);
			loginVO.setPassword(hashedPassword);
		}
		
		memberVO = memberDAO.login(loginVO);
		
		if(memberVO != null) {
			session.setAttribute(Session.MEMBER, memberVO);
		}
		
		return memberVO != null;
	}
	
	@Override
	public List<MemberVO> getUserInfo(String parameter) {
		return memberDAO.getUserInfo(parameter);
	}
}
