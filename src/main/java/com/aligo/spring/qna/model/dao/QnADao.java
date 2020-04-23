package com.aligo.spring.qna.model.dao;

import java.util.ArrayList;

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

	public int getListCount() {
		return sqlSession.selectOne("qnaMapper.getListCount");
	}
	
	public ArrayList<QnA> selectList(QnAPageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("qnaMapper.selectList",null,rowBounds);
	}

	public QnA selectBoard(int qId) {
		return sqlSession.selectOne("qnaMapper.selectBoard",qId);
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
		return (ArrayList)sqlSession.selectList("boardMapper.selectReplyList",qId);
	}

	
}
