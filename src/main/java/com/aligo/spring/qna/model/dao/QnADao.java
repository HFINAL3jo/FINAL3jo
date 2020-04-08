package com.aligo.spring.qna.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("qDao")
public class QnADao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
}
