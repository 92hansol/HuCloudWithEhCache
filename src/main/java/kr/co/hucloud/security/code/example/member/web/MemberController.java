package kr.co.hucloud.security.code.example.member.web;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.hucloud.security.code.example.common.util.SendMessage;
import kr.co.hucloud.security.code.example.member.service.MemberService;
import kr.co.hucloud.security.code.example.member.vo.LoginVO;
import kr.co.hucloud.security.code.example.member.vo.MemberRegistryVO;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {

	private MemberService memberService;

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	@RequestMapping(value=("/member/login"), method=RequestMethod.POST )
	public void login(LoginVO loginVO, HttpSession session, HttpServletResponse response) {
		boolean isLoginSuccess = memberService.login(session, loginVO);
		// 로그인 횟수 제한 방어코드 부재.
		SendMessage.send(response, isLoginSuccess ? "OK" : "NO");
	}
	
	@RequestMapping(value=("/member/logout"), method=RequestMethod.POST )
	public void logout(HttpSession session, HttpServletResponse response) {
		session.invalidate();
		SendMessage.send(response, "OK");
	}
	
	@RequestMapping("/member/registry" )
	public void registryMember(MemberRegistryVO memberVO, HttpServletResponse response) {
		memberService.addMember(memberVO);
		SendMessage.send(response, "OK");
	}
	
}
