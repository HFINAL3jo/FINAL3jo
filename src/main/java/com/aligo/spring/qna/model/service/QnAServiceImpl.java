package com.aligo.spring.qna.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aligo.spring.qna.model.dao.QnADao;
import com.aligo.spring.qna.model.vo.QnA;
import com.aligo.spring.qna.model.vo.QnAPageInfo;
import com.aligo.spring.qna.model.vo.QnaReply;

@Service("qService")
public class QnAServiceImpl implements QnAService{

	@Autowired
	private QnADao qDao;
	
	@Override
	public int getListCount() {
		return qDao.getListCount();
	}
	
	@Override
	public ArrayList<QnA> selectList(QnAPageInfo pi) {
		return qDao.selectList(pi);
	}

	@Override
	public QnA selectBoard(int qId) {
		
		return qDao.selectBoard(qId);
	}

	@Override
	public int writeBoard(QnA q) {
		return qDao.writeBoard(q);
	}

	@Override
	public QnA selectUpdateBoard(int qId) {
		return qDao.selectBoard(qId);
	}

	@Override
	public int updateBoard(QnA q) {
		return qDao.updateBoard(q);
	}

	@Override
	public int deleteBoard(int qId) {
		return qDao.deleteBoard(qId);
	}

	@Override
	public ArrayList<QnaReply> selectReplyList(int qId) {
		return qDao.selectReplyList(qId);
	}
	
	
}
