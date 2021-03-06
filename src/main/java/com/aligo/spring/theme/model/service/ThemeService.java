package com.aligo.spring.theme.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.aligo.spring.common.AligoException;
import com.aligo.spring.theme.controller.ThemeController;
import com.aligo.spring.theme.model.vo.PageInfo;
import com.aligo.spring.theme.model.vo.SearchCondition;
import com.aligo.spring.theme.model.vo.TFile;
import com.aligo.spring.theme.model.vo.TReply;
import com.aligo.spring.theme.model.vo.Theme;

public interface ThemeService {
	
	/** 
	 * 게시판 갯수 조회
	 * @return
	 */
	int getListCount(SearchCondition sc);
	
	/**
	 * 게시판 조회
	 * @param pi
	 * @return
	 */
	ArrayList<Theme> selectList(PageInfo pi,SearchCondition sc);

	/**
	 * 테마글 작성
	 * @param t
	 * @param tNum 
	 * @return
	 * @throws ThemeController 
	 */
	int insertTheme(Theme t, int tNum) throws AligoException;

	/**
	 * 테마글 상세보기
	 * @param tId
	 * @return
	 */
	Theme selectTheme(int tId);

	/**
	 * theme img 삽입
	 * @return
	 */
	int insertImg(TFile tf);

	/**
	 * theme 번호 조회
	 * @return
	 */
	int getTNum();

	/**
	 * 게시물 조회 수 증가
	 * @param tId
	 * @return
	 */
	int updateCount(int tId);

	/**
	 * 키워드 검색 횟수 데이터 적재
	 * @param sc
	 * @return
	 */
	int updateSearchKeywordCount(SearchCondition sc);

	/**
	 * 댓글 작성
	 * @param r
	 * @return
	 */
	int addTReply(TReply r);

	/**
	 * 댓글리스트 조회
	 * @param tId
	 * @return
	 */
	ArrayList<TReply> selectTReplyList(int tId);

	/**
	 * DB에서 recommend keyword 값 가져오기
	 * @return
	 */
	String getKeyword();

	/**
	 * 테마글 수정
	 * @param t
	 * @return
	 */
	int updateTheme(Theme t);

	/**
	 * 게시물 좋아요 횟수 증가
	 * @param tId
	 * @return
	 */
	int updateLike(HashMap<String,String> map);

	/**
	 * 좋아요 체크
	 * @param map
	 * @return
	 */
	int likeStatus(HashMap<String, String> map);

	/**
	 * 테마 포스트 삭제
	 * @param tId
	 * @return
	 */
	int deleteTheme(int tId);

	/**
	 * 댓글 삭제
	 * @param trId
	 * @return
	 */
	int deleteTReply(int trId);

	/**
	 * recommand keyword 랜덤리스트 카운트
	 * @param list
	 * @return
	 */
	int getRandomListCount(String recommend);

	/**
	 * 리스트 출력
	 * @param pi
	 * @param tKeyword
	 * @return
	 */
	ArrayList<Theme> selectTkeywordList(PageInfo pi, String recommend);

	/**
	 * 검색 리스트목록
	 * @param pi
	 * @param sc
	 * @return
	 */
	ArrayList<Theme> selectSearchList(PageInfo pi, SearchCondition sc);

	/**
	 * 검색 리스트 갯수
	 * @param sc
	 * @return
	 */
	int getSearchListCount(SearchCondition sc);
	
}