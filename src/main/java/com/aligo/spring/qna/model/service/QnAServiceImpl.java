package com.aligo.spring.qna.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
	public int getListCount(String nickname) {
		return qDao.getListCount(nickname);
	}
	
	@Override
	public ArrayList<QnA> selectList(String nickname,QnAPageInfo pi) {
		return qDao.selectList(nickname,pi);
	}

	@Override
	public QnA selectBoard(QnA q) {
		
		return qDao.selectBoard(q);
	}

	@Override
	public int writeBoard(QnA q) {
		return qDao.writeBoard(q);
	}

	@Override
	public QnA selectUpdateBoard(int qId) {
		//return qDao.selectBoard(qId);
		return null;
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


	@Override
	public int insertReply(QnaReply qr) {
		return qDao.insertReply(qr);
	}
// =========================== ============================
	@Override
	public int getSearchQnaDataTotal(Map<String, String> map) {
		
		return qDao.getSearchQnaDataTotal(map);
	}

	@Override
	public ArrayList<QnA> getSearchQnaData(Map<String, String> map, QnAPageInfo pi) {
		
		return qDao.getSearchQnaData(map, pi);
	}

	@Override
	public ArrayList<QnA> getSearchQnaAdmin(Map<String, String> map, QnAPageInfo pi) {
		return qDao.getSearchQnaAdmin(map,pi);
	}

	
	
}
