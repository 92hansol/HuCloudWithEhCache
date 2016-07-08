package kr.co.hucloud.security.code.example.encrypto.password.service.impl;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;

import kr.co.hucloud.security.code.example.encrypto.password.dao.EncryptoPasswordDAO;
import kr.co.hucloud.security.code.example.encrypto.password.service.EncryptoPasswordService;
import kr.co.hucloud.security.code.example.member.dao.MemberDAO;
import kr.co.hucloud.security.code.example.member.vo.MemberVO;
import kr.co.hucloud.security.code.example.valid.table.dao.TableValidDAO;

public class EncryptoPasswordServiceImpl implements EncryptoPasswordService {

	private EncryptoPasswordDAO encryptoPasswordDAO;
	private MemberDAO memberDAO;
	private TableValidDAO tableValidDAO;
	
	public void setEncryptoPasswordDAO(EncryptoPasswordDAO encryptoPasswordDAO) {
		this.encryptoPasswordDAO = encryptoPasswordDAO;
	}

	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}
	
	public void setTableValidDAO(TableValidDAO tableValidDAO) {
		this.tableValidDAO = tableValidDAO;
	}

	@Override
	public boolean isExistsSaltColumn() {
		return encryptoPasswordDAO.isExistsSaltColumn();
	}

	@Override
	public boolean makeSaltColumn() {
		
		tableValidDAO.addSaltColumn();
		
		String salt = "";
		String bcryptPassword = "";
		
		List<MemberVO> memberList = memberDAO.getAllMemberInfo();
		
		for(MemberVO member : memberList) {
			salt = BCrypt.gensalt();
			bcryptPassword = BCrypt.hashpw(member.getPassword(), salt);
			member.setSalt(salt);
			member.setPassword(bcryptPassword);
			
			memberDAO.updateMemberPassword(member);
		}
		
		return true;
	}
	
}
