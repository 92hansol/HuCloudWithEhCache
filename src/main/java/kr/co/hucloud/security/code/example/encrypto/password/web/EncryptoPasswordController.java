package kr.co.hucloud.security.code.example.encrypto.password.web;

import javax.servlet.http.HttpServletResponse;

import kr.co.hucloud.security.code.example.common.util.SendMessage;
import kr.co.hucloud.security.code.example.encrypto.password.service.EncryptoPasswordService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EncryptoPasswordController {

	private EncryptoPasswordService encryptoPasswordService;
	
	public void setEncryptoPasswordService(
			EncryptoPasswordService encryptoPasswordService) {
		this.encryptoPasswordService = encryptoPasswordService;
	}

	@RequestMapping("/encrypto/password")
	public String encryptoPassword() {
		return "encrypto/password/encryptoPassword";
	}
	
	@RequestMapping("/encrypto/password/checksalt")
	public void isExistsSaltColumn(HttpServletResponse response) {
		boolean isExistsSaltColumn = encryptoPasswordService.isExistsSaltColumn();
		SendMessage.send(response, String.valueOf(isExistsSaltColumn));
	}
	
	@RequestMapping("/encrypto/password/makesalt")
	public void makeSalt(HttpServletResponse response) {
		boolean makeSaltColumnResult = encryptoPasswordService.makeSaltColumn();
		SendMessage.send(response, String.valueOf(makeSaltColumnResult));
	}
	
}
