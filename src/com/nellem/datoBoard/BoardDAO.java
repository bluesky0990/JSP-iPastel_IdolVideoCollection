package com.nellem.datoBoard;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.nellem.datoMember.MemberDTO;

public class BoardDAO {
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

	public List<BoardDTO> boardList() {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		try {
			return session.selectList("com.nellem.datoBoard.selectAll");
		} finally {
			session.close();
		}
	}

	public List<BoardDTO> boardMainPageList() {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		try {
			return session.selectList("com.nellem.datoBoard.selectMainPage");
		} finally {
			session.close();
		}
	}
	
	public List<BoardDTO> boardList(int boardType) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		try {
			return session.selectList("com.nellem.datoBoard.selectPart", boardType);
		} finally {
			session.close();
		}
	}
	
	public BoardDTO selectView(int no) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		try {
			return session.selectOne("com.nellem.datoBoard.selectOne", no);
		} finally {
			session.close();
		}
	} 
	
	public int boardInsert(BoardDTO dto) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		
		try {
			return session.insert("com.nellem.datoBoard.boardInsert", dto);
		} finally {
			session.commit();
			session.close();
		}
	}
	
	public List<BoardDTO> boardListInnerJoin(int boardType) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		try {
			return session.selectList("com.nellem.datoBoard.selectJoin", boardType);
		} finally {
			session.close();
		}
	}
	
	public int updateBoard(BoardDTO dto) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		
		try {
			return session.update("com.nellem.datoBoard.boardUpdate", dto);
		} finally {
			session.commit();
			session.close();
		}
	}
	
	public int updateHitsBoard(int no) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		
		try {
			return session.update("com.nellem.datoBoard.boardHitsUpdate", no);
		} finally {
			session.commit();
			session.close();
		}
	}
	
	public BoardDTO selectBoardCount(int boardType) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		try {
			return session.selectOne("com.nellem.datoBoard.selectPartTotalCount", boardType);
		} finally {
			session.close();
		}
	} 
	
	public List<BoardDTO> selectSearchAllBoard(String keyword) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		try {
			return session.selectList("com.nellem.datoBoard.selectSearchAllBoard", keyword);
		} finally {
			session.close();
		}
	}
}
