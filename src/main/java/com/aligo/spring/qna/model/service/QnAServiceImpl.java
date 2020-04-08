package com.aligo.spring.qna.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aligo.spring.qna.model.dao.QnADao;

@Service("qService")
public class QnAServiceImpl implements QnAService{

	@Autowired
	private QnADao qDao;
}
