package com.aligo.spring.qna.model.service;

import java.util.ArrayList;

import com.aligo.spring.qna.model.vo.QnA;
import com.aligo.spring.qna.model.vo.QnAPageInfo;

public interface QnAService {

	/**1_1.게시글 수 조회
	 * @return
	 */
	int getListCount();
	
	
	/**
	 * 1_2.게시판 리스트 조회
	 * @param pi
	 * @return
	 */
	ArrayList<QnA> selectList(QnAPageInfo pi);


	/**
	 * 게시판 상세조회
	 * @param qId
	 * @return
	 */
	QnA selectBoard(int qId);


	/**
	 * 문의글 작성
	 * @param q
	 * @return
	 */
	int writeBoard(QnA q);


	/**
	 * 문의글 수정
	 * @param qId
	 * @return
	 */
	QnA selectUpdateBoard(int qId);
	int updateBoard(QnA q);


	/**
	 * 문의글 삭제
	 * @param qId
	 * @return
	 */
	int deleteBoard(int qId);


}
