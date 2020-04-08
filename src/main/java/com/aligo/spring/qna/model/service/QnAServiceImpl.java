package com.aligo.spring.qna.model.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.aligo.spring.qna.model.dao.QnADao;

public class QnAServiceImpl implements QnAService{

	@Autowired
	private QnADao qDao;
}
