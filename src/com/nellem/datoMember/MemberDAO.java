package com.nellem.datoMember;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MemberDAO {
	private static SqlSessionFactory sqlMapper = null;  //static 변수로 sqlMapper객체변수 선언
	//한번 만든뒤 SqlSessionFactory는 애플리케이션을 실행하는 동안 존재해야만 함
	//SqlSessionFactory 의 가장 좋은 스코프는 애플리케이션임으로 static으로 선언
	
	public static SqlSessionFactory getInstance() {
		if(sqlMapper == null) {
			try {
				InputStream stream = Resources.getResourceAsStream("com/nellem/config/mybatis-config.xml");
				sqlMapper = new SqlSessionFactoryBuilder().build(stream);
				stream.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return sqlMapper;
	}
	
	public List<MemberDTO> memberList() {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		try {
			return session.selectList("com.nellem.datoMember.selectAll");
		} finally {
			session.close();
		}
	}
	
	public MemberDTO selectMember(String id) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		try {
			return session.selectOne("com.nellem.datoMember.selectOne", id);
		} finally {
			session.close();
		}
	} 
	
	public int insert(MemberDTO dto) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		
		try {
			return session.insert("com.nellem.datoMember.memberInsert", dto);
		} finally {
			session.commit();
			session.close();
		}
	}
}
