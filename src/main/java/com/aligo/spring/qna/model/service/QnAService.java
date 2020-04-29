package com.aligo.spring.qna.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.aligo.spring.qna.model.vo.QnA;
import com.aligo.spring.qna.model.vo.QnAPageInfo;
import com.aligo.spring.qna.model.vo.QnaReply;

public interface QnAService {

	/**1_1.게시글 수 조회
	 * @param nickname 
	 * @return
	 */
	int getListCount(String nickname);
	
	
	/**
	 * 1_2.게시판 리스트 조회
	 * @param nickname 
	 * @param pi
	 * @return
	 */
	ArrayList<QnA> selectList(String nickname, QnAPageInfo pi);


	/**
	 * 게시판 상세조회
	 * @param q
	 * @return
	 */
	QnA selectBoard(QnA q);


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


	/**
	 * 문의글 댓글 불러오기 
	 * @param qId
	 * @return
	 */
	ArrayList<QnaReply> selectReplyList(int qId);

	/**
	 * 댓글 작성
	 * @param r
	 * @return
	 */
	int insertReply(QnaReply qr);
	
	/**
	 * 검색 조건에 따른 페이징 처리를 위한 개수를 구한다.
	 * @param map : 검색 조건를 저장
	 * @return
	 */
	int getSearchQnaDataTotal(Map<String, String> map);


	/**
	 * 검색 조건에 따른 페이징 처리한 데이터를 ArrayList 에 담는다.
	 * @param map : 검색 조건를 저장
	 * @param pi : RowBounds 객체에서 처리 하기 위해 필요
	 * @return
	 */
	ArrayList<QnA> getSearchQnaData(Map<String, String> map, QnAPageInfo pi);


	ArrayList<QnA> getSearchQnaAdmin(Map<String, String> map, QnAPageInfo pi);

}
