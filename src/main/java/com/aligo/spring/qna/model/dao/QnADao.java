package com.aligo.spring.qna.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aligo.spring.qna.model.vo.QnA;
import com.aligo.spring.qna.model.vo.QnAPageInfo;
import com.aligo.spring.qna.model.vo.QnaReply;

@Repository("qDao")
public class QnADao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getListCount(String nickname) {
		return sqlSession.selectOne("qnaMapper.getListCount",nickname);
	}
	
	public ArrayList<QnA> selectList(String nickname, QnAPageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("qnaMapper.selectList",nickname,rowBounds);
	}

	public QnA selectBoard(QnA q) {
		return sqlSession.selectOne("qnaMapper.selectBoard",q);
	}

	public int writeBoard(QnA q) {
		return sqlSession.insert("qnaMapper.writeBoard",q);
	}

	public int updateBoard(QnA q) {
		return sqlSession.update("qnaMapper.updateBoard",q);
	}

	public int deleteBoard(int qId) {
		return sqlSession.update("qnaMapper.deleteBoard",qId);
	}

	public ArrayList<QnaReply> selectReplyList(int qId) {
		return (ArrayList)sqlSession.selectList("qnaMapper.selectReplyList",qId);
	}
	
	public int insertReply(QnaReply qr) {
		return sqlSession.insert("qnaMapper.insertReply",qr);
	}
// =============================================================
	public int getSearchQnaDataTotal(Map<String, String> map) {
		
		return sqlSession.selectOne("qnaMapper.getSearchQnaDataTotal", map);
	}

	public ArrayList<QnA> getSearchQnaData(Map<String, String> map, QnAPageInfo pi) {
		
		RowBounds rowBounds = new RowBounds(((pi.getCurrentPage() -1) * pi.getBoardLimit()), pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("qnaMapper.getSearchQnaData", map, rowBounds);
	}

	public ArrayList<QnA> getSearchQnaAdmin(Map<String, String> map, QnAPageInfo pi) {
		RowBounds rowBounds = new RowBounds(((pi.getCurrentPage() -1) * pi.getBoardLimit()), pi.getBoardLimit());
		return  (ArrayList)sqlSession.selectList("qnaMapper.getSearchQnaAdmin", map, rowBounds);
	}


	
}
