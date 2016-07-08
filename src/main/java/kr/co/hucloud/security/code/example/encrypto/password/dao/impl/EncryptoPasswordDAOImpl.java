package kr.co.hucloud.security.code.example.encrypto.password.dao.impl;

import kr.co.hucloud.security.code.example.encrypto.password.dao.EncryptoPasswordDAO;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class EncryptoPasswordDAOImpl extends SqlSessionDaoSupport implements EncryptoPasswordDAO {

	@Override
	public boolean isExistsSaltColumn() {
		int result = getSqlSession().selectOne("EncryptoPasswordDAO.isExistsSaltColumn");
		return (result > 0);
	}
	
}
