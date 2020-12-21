package com.nellem.datoReply;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.json.simple.JSONArray;

public class ReplyDAO {
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
	
	public List<ReplyDTO> selectAllList() {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		try {
			return session.selectList("com.nellem.datoReply.selectAll");
		} finally {
			session.close();
		}
	}
	
	public List<ReplyDTO> selectBoard(int no) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		try {
			return session.selectList("com.nellem.datoReply.selectPart", no);
		} finally {
			session.close();
		}
	}
	
	public ReplyDTO selectPartCount(int boardType) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		try {
			return session.selectOne("com.nellem.datoReply.selectPartCount", boardType);
		} finally {
			session.close();
		}
	}
	
	public int insertReply(ReplyDTO dto) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		
		try {
			return session.insert("com.nellem.datoReply.replyInsert", dto);
		} finally {
			session.commit();
			session.close();
		}
	}
	
	public int updateReply(ReplyDTO dto) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		
		try {
			return session.update("com.nellem.datoReply.replyUpdate", dto);
		} finally {
			session.commit();
			session.close();
		}
	}
	
	public int deleteReply(int no) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		
		try {
			return session.update("com.nellem.datoReply.replyDelete", no);
		} finally {
			session.commit();
			session.close();
		}
	}
}
