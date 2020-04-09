package com.aligo.spring.qna.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aligo.spring.qna.model.dao.QnADao;
import com.aligo.spring.qna.model.vo.QnA;
import com.aligo.spring.qna.model.vo.QnAPageInfo;

@Service("qService")
public class QnAServiceImpl implements QnAService{

	@Autowired
	private QnADao qDao;

	@Override
	public ArrayList<QnA> selectList(QnAPageInfo pi) {
		return qDao.selectList(pi);
	}
	
	@Override
		public int getListCount() {
			return 0;
		}
}
