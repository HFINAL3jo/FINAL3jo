DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE THEME_LIST CASCADE CONSTRAINTS;
DROP TABLE THEME_FILES CASCADE CONSTRAINTS;
DROP TABLE THEME_LIKES CASCADE CONSTRAINTS;
DROP TABLE THEME_REPLY CASCADE CONSTRAINTS;
DROP TABLE THEME_CODE CASCADE CONSTRAINTS;
DROP TABLE BLOG_LIST CASCADE CONSTRAINTS;
DROP TABLE BLOG_FILES CASCADE CONSTRAINTS;
DROP TABLE BLOG_REPLY CASCADE CONSTRAINTS;
DROP TABLE REPORTS CASCADE CONSTRAINTS;
DROP TABLE RECOMMEND_Q CASCADE CONSTRAINTS;
DROP TABLE QNA CASCADE CONSTRAINTS;
DROP TABLE SEARCH_AREA CASCADE CONSTRAINTS;
DROP TABLE SEARCH_THEME CASCADE CONSTRAINTS;
DROP TABLE SEARCH_GENDER_AREA CASCADE CONSTRAINTS;
DROP TABLE SEARCH_GENDER_THEME CASCADE CONSTRAINTS;

--CREATE USER ALIGO IDENTIFIED BY ALIGO;
--GRANT RESOURCE, CONNECT, CREATE VIEW TO ALIGO;

DROP SEQUENCE SEQ_TNO;
DROP SEQUENCE SEQ_MNO;
DROP SEQUENCE SEQ_QID;
DROP SEQUENCE SEQ_TRNO;

CREATE SEQUENCE SEQ_QID
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;


CREATE SEQUENCE SEQ_TNO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_MNO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_TRNO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

CREATE TABLE THEME_CODE(
   TCODE VARCHAR2(4) PRIMARY KEY,
   TNAME VARCHAR2(500),
   TCOUNT NUMBER DEFAULT 0,
   TLIKE NUMBER DEFAULT 0
);

CREATE TABLE MEMBER(
 MID VARCHAR2(1000) PRIMARY KEY,
 EMAIL VARCHAR2(50),
 PASSWORD VARCHAR2(2000),
 NICKNAME VARCHAR2(50) UNIQUE,
 GENDER VARCHAR2(2) CHECK (GENDER IN('M','F')),
 AGE NUMBER,
 M_STATUS VARCHAR2(2) DEFAULT 'Y' CHECK (M_STATUS IN('Y','N')),
 RECOMMEND VARCHAR2(3000)
);

INSERT INTO MEMBER VALUES(SEQ_MNO.NEXTVAL,'ADMIN','$2a$10$k9pLcB34MEqPsCYYSWSlbur7I7aeTZgH19.jPaB4gYCFm5jVl0TZy','ADMIN','M',34,'Y',NULL);

CREATE TABLE THEME_LIST(
  TID NUMBER PRIMARY KEY, 
  TWRITER VARCHAR2(15) DEFAULT 'ADMIN',
  TTITLE VARCHAR2(300) NOT NULL,
  TCONTENT LONG NOT NULL,
  TADDRESS VARCHAR2(1000) NOT NULL,
  TADDRESSH VARCHAR2(1000) NOT NULL,
  T_CREATE_DATE DATE DEFAULT SYSDATE,
  T_MODIFY_DATE DATE DEFAULT SYSDATE,
  T_VIEWS NUMBER DEFAULT 0,
  T_LIKES NUMBER DEFAULT 0,
  TKEYWORD VARCHAR2(4000),
  T_STATUS VARCHAR2(5) DEFAULT 'Y' CHECK (T_STATUS IN('Y','N','X')),
  TCODE VARCHAR2(4) REFERENCES THEME_CODE ON DELETE CASCADE,
  TTEL VARCHAR2(50),
  TFEE VARCHAR2(100),
  THOURS VARCHAR2(100),
  TTRANS VARCHAR2(1000)
);

ALTER TABLE THEME_LIST MODIFY(TCONTENT CLOB);

CREATE TABLE THEME_FILES(
   T_CODE_NUMBER NUMBER,
   T_ORIGINAL_FILE VARCHAR2(4000),
   T_MODIFY_FILE VARCHAR2(4000)
);

CREATE TABLE THEME_LIKES(
  MID VARCHAR2(50) REFERENCES MEMBER ON DELETE CASCADE,
  T_CODE_NUM NUMBER REFERENCES THEME_LIST ON DELETE CASCADE
);

CREATE TABLE THEME_REPLY(
  TRID NUMBER PRIMARY KEY,
  TRCONTENT VARCHAR2(4000),
  REF_TID NUMBER REFERENCES THEME_LIST ON DELETE CASCADE,
  TRWIRTER VARCHAR2(1000),
  TR_CREATE_DATE DATE DEFAULT SYSDATE,
  TR_MODIFY_DATE DATE DEFAULT SYSDATE,
  TR_STATUS VARCHAR2(2) DEFAULT 'Y' CHECK (TR_STATUS IN('Y','N')) 
);

CREATE TABLE BLOG_LIST(
 BID NUMBER PRIMARY KEY,
 BWRITER VARCHAR2(15) DEFAULT 'ADMIN',
 BTITLE VARCHAR2(300) NOT NULL,
 BCONTENT VARCHAR2(3000) NOT NULL,
 BADDRESS VARCHAR2(1000) NOT NULL,
  B_CREATE_DATE DATE DEFAULT SYSDATE,
  B_MODIFY_DATE DATE DEFAULT SYSDATE,
  BCOUNT NUMBER DEFAULT 0,
  BLIKED NUMBER DEFAULT 0,
  BTAG VARCHAR2(3000),
  BSTATUS VARCHAR2(5) DEFAULT 'Y' CHECK(BSTATUS IN('Y','N'))
);   

CREATE TABLE BLOG_FILES(
  BCODE_NUMBER NUMBER REFERENCES BLOG_LIST ON DELETE CASCADE,
  B_ORIGIN_FILE VARCHAR2(4000),
  B_MODIFY_FILE VARCHAR2(4000)  
);

CREATE TABLE BLOG_REPLY(
  BRNUM NUMBER,
  BCODE_NUMBER NUMBER,
  BR_WRITER VARCHAR2(50),
  BR_CONTENT VARCHAR2(3000),
  BR_STATUS VARCHAR2(5) DEFAULT 'Y' CHECK(BR_STATUS IN('Y','N'))
);

CREATE TABLE REPORTS(
  RCODE VARCHAR2(5),
  DCODE_NUMBER NUMBER,
  REPORTER VARCHAR2(50),
  REPORT_CONTENT VARCHAR2(1000),
  REPORT_SDATE DATE,
  REPORT_EDATE DATE,
  R_STATUS VARCHAR2(5) DEFAULT 'Y' CHECK(R_STATUS IN('Y','N','X'))
);

CREATE TABLE RECOMMEND_Q(
 RQCODE VARCHAR2(300),
 RQCONTENT VARCHAR2(3000),
 RQKEYWORD1 VARCHAR2(500),
 KEYWORD1_CONTENT VARCHAR2(300),
 RQKEYWORD2 VARCHAR2(500),
 KEYWROD2_CONTENT VARCHAR2(300),
 R_STATUS VARCHAR2(5) DEFAULT 'Y' CHECK(R_STATUS IN('Y', 'N'))
);

CREATE TABLE SEARCH_AREA(
  AREA VARCHAR2(1000),
  SA_COUNT NUMBER DEFAULT 0
);

CREATE TABLE SEARCH_THEME(
  TCODE VARCHAR(4) REFERENCES THEME_CODE ON DELETE CASCADE,
  ST_COUNT NUMBER DEFAULT 0
);

CREATE TABLE SEARCH_GENDER_THEME(
   TCODE VARCHAR(4) REFERENCES THEME_CODE ON DELETE CASCADE,
   GENDER VARCHAR2(2) CHECK(GENDER IN('M','F')) NOT NULL,
   SGT_COUNT NUMBER DEFAULT 0
);

CREATE TABLE SEARCH_GENDER_AREA(
   GAREA VARCHAR2(1000),
   GENDER VARCHAR2(2) CHECK(GENDER IN('M','F')) NOT NULL,
   SGA_COUNT NUMBER DEFAULT 0
);

CREATE TABLE QNA(
	QID NUMBER PRIMARY KEY,
	QTITLE VARCHAR2(300) NOT NULL,
	QCONTENT VARCHAR2(3000) NOT NULL,
	QWRITER VARCHAR2(60), -- REFERENCES MEMBER ON DELETE CASCADE
	Q_CREATE_DATE DATE DEFAULT SYSDATE,
	Q_ANSWER_DATE DATE DEFAULT SYSDATE,
	Q_STATUS VARCHAR2(1) DEFAULT 'N' CHECK (Q_STATUS IN('Y','N','X'))
);

--THEME_LIST 테스트용 THEME_CODE 먼저 입력해야함 
INSERT INTO THEME_CODE VALUES('T1','NATURE',DEFAULT,DEFAULT);
INSERT INTO THEME_CODE VALUES('T2','RESTAURANT',DEFAULT,DEFAULT);
INSERT INTO THEME_CODE VALUES('T3','HISTORY',DEFAULT,DEFAULT);
INSERT INTO THEME_CODE VALUES('T4','SHOPPING',DEFAULT,DEFAULT);
INSERT INTO THEME_CODE VALUES('T5','BAR',DEFAULT,DEFAULT);
INSERT INTO THEME_CODE VALUES('T6','ACTIVITY',DEFAULT,DEFAULT);
INSERT INTO THEME_CODE VALUES('T7','EXHIBITION',DEFAULT,DEFAULT);

--THEME LIST


UPDATE THEME_CODE SET (TCOUNT,TLIKE) =(SELECT SUM(T_VIEWS),SUM(T_LIKES) FROM THEME_LIST JOIN THEME_CODE USING(TCODE) WHERE TNAME='NATURE') WHERE TNAME='NATURE';
UPDATE THEME_CODE SET (TCOUNT,TLIKE) =(SELECT SUM(T_VIEWS),SUM(T_LIKES) FROM THEME_LIST JOIN THEME_CODE USING(TCODE) WHERE TNAME='RESTAURANT') WHERE TNAME='RESTAURANT';
UPDATE THEME_CODE SET (TCOUNT,TLIKE) =(SELECT SUM(T_VIEWS),SUM(T_LIKES) FROM THEME_LIST JOIN THEME_CODE USING(TCODE) WHERE TNAME='HISTORY') WHERE TNAME='HISTORY';
UPDATE THEME_CODE SET (TCOUNT,TLIKE) =(SELECT SUM(T_VIEWS),SUM(T_LIKES) FROM THEME_LIST JOIN THEME_CODE USING(TCODE) WHERE TNAME='SHOPPING') WHERE TNAME='SHOPPING';
UPDATE THEME_CODE SET (TCOUNT,TLIKE) =(SELECT SUM(T_VIEWS),SUM(T_LIKES) FROM THEME_LIST JOIN THEME_CODE USING(TCODE) WHERE TNAME='BAR') WHERE TNAME='BAR';
UPDATE THEME_CODE SET (TCOUNT,TLIKE) =(SELECT SUM(T_VIEWS),SUM(T_LIKES) FROM THEME_LIST JOIN THEME_CODE USING(TCODE) WHERE TNAME='ACTIVITY') WHERE TNAME='ACTIVITY';
UPDATE THEME_CODE SET (TCOUNT,TLIKE) =(SELECT SUM(T_VIEWS),SUM(T_LIKES) FROM THEME_LIST JOIN THEME_CODE USING(TCODE) WHERE TNAME='EXHIBITION') WHERE TNAME='EXHIBITION';

--THEME FILES


--QNA
INSERT INTO QNA VALUES(SEQ_QID.NEXTVAL,'식사하셨어요?','식사 하셨는지 궁금합니다.','hyhihi',DEFAULT,NULL,DEFAULT);
INSERT INTO QNA VALUES(SEQ_QID.NEXTVAL,'한강 좋아하세요?','한강 이쁘지 않아요?ㅎㅎㅎ.','hooni',DEFAULT,NULL,DEFAULT);
INSERT INTO QNA VALUES(SEQ_QID.NEXTVAL,'서울에서 어딜 제일 좋아하세요?','저는 한강이 제일 좋아요','mama',DEFAULT,NULL,DEFAULT);
INSERT INTO QNA VALUES(SEQ_QID.NEXTVAL,'식사하셨어요?','식사 하셨는지 궁금합니다.','hyhihi',DEFAULT,NULL,DEFAULT);
INSERT INTO QNA VALUES(SEQ_QID.NEXTVAL,'한강 좋아하세요?','한강 이쁘지 않아요?ㅎㅎㅎ.','hooni',DEFAULT,NULL,DEFAULT);
INSERT INTO QNA VALUES(SEQ_QID.NEXTVAL,'안녕하세요?','저는 한강이 제일 좋아요','ma8ma',DEFAULT,NULL,DEFAULT);
INSERT INTO QNA VALUES(SEQ_QID.NEXTVAL,'감사함을 느낍니다','감사합시다!^^','ma7ma',DEFAULT,NULL,DEFAULT);
INSERT INTO QNA VALUES(SEQ_QID.NEXTVAL,'마라향궈 마라탕 드셔보셨어요?','좋더라구요~^^','ma6ma',DEFAULT,NULL,DEFAULT);
INSERT INTO QNA VALUES(SEQ_QID.NEXTVAL,'어디 치킨이 제일 좋아요?','저는 처갓집이 제일 좋아요','ma5ma',DEFAULT,NULL,DEFAULT);
INSERT INTO QNA VALUES(SEQ_QID.NEXTVAL,'아따맘마 보셨어요?','조금 봤어요~^^','mama',DEFAULT,NULL,DEFAULT);
INSERT INTO QNA VALUES(SEQ_QID.NEXTVAL,'어느 공원이 제일 좋은가요?','저는 한강이 제일 좋아요','ma4ma',DEFAULT,NULL,DEFAULT);
INSERT INTO QNA VALUES(SEQ_QID.NEXTVAL,'배고프지 않아요?','배고파요','mama',DEFAULT,NULL,DEFAULT);
INSERT INTO QNA VALUES(SEQ_QID.NEXTVAL,'정말 감사하지 않아요?','저는 감사함을 느낍니다.^^','ma2ma',DEFAULT,NULL,DEFAULT);
INSERT INTO QNA VALUES(SEQ_QID.NEXTVAL,'무슨 꿈 꾸셨어요?','딸기 케익 위의 딸기가 시들었어요.','ma3ma',DEFAULT,NULL,DEFAULT);
INSERT INTO QNA VALUES(SEQ_QID.NEXTVAL,'몇 살로 돌아가고 싶으세요?','저는 16살이요','ma1ma',DEFAULT,NULL,DEFAULT);

--RECOMMEND
INSERT INTO RECOMMEND_Q VALUES('RQ001', 'Choose your travel inclination', 'Something familiar', 
                'Seek something familiar.', 'Something new', 'Seeking something new.', DEFAULT);
                
INSERT INTO RECOMMEND_Q VALUES('RQ002', 'Choose your travel inclination 2', 'Famous', 
                'Pursue famous places.', 'Not Famous', 'Pursue a place that is not famous.', DEFAULT);
                
INSERT INTO RECOMMEND_Q VALUES('RQ003', 'Choose your travel purpose', 'Vacation', 
                'For vacation', 'Tourism', 'For tourism', DEFAULT);
                
INSERT INTO RECOMMEND_Q VALUES('RQ004', 'Choose your personality', 'Calm', 
                'It is a calm character.', 'Active', 'It is an active personality.', DEFAULT);
            
INSERT INTO RECOMMEND_Q VALUES('RQ005', 'Choose the destination you want to go', 'Urban', 
                'An urban destination', 'Natural', 'Natural destination', DEFAULT);

--SEARCH 관련
INSERT INTO SEARCH_AREA VALUES ('DOBONG-GU',1);
INSERT INTO SEARCH_AREA VALUES ('NOWON-GU',2);
INSERT INTO SEARCH_AREA VALUES ('GANGBUK-GU',3);
INSERT INTO SEARCH_AREA VALUES ('SEONGBUK-GU',4);
INSERT INTO SEARCH_AREA VALUES ('DONGDAEMUN-GU',10);
INSERT INTO SEARCH_AREA VALUES ('JUNGNANG-GU',21);
INSERT INTO SEARCH_AREA VALUES ('GWANGJIN-GU',31);
INSERT INTO SEARCH_AREA VALUES ('SEONGDONG-GU',41);
INSERT INTO SEARCH_AREA VALUES ('JUNG-GU',52);
INSERT INTO SEARCH_AREA VALUES ('YONGSAN-GU',62);
INSERT INTO SEARCH_AREA VALUES ('JONGNO-GU',73);
INSERT INTO SEARCH_AREA VALUES ('EUNPYEONG-GU',55);
INSERT INTO SEARCH_AREA VALUES ('MAPO-GU',22);
INSERT INTO SEARCH_AREA VALUES ('SEODAEMUN-GU',33);
INSERT INTO SEARCH_AREA VALUES ('GANGDONG-GU',44);
INSERT INTO SEARCH_AREA VALUES ('SONGPA-GU',55);
INSERT INTO SEARCH_AREA VALUES ('GANGNAM-GU',66);
INSERT INTO SEARCH_AREA VALUES ('SEOCHO-GU',77);
INSERT INTO SEARCH_AREA VALUES ('DONGJAK-GU',88);
INSERT INTO SEARCH_AREA VALUES ('GWANAK-GU',99);
INSERT INTO SEARCH_AREA VALUES ('YEONGDEUNGPO-GU',111);
INSERT INTO SEARCH_AREA VALUES ('GEUMCHEON-GU',222);
INSERT INTO SEARCH_AREA VALUES ('GURO-GU',333);
INSERT INTO SEARCH_AREA VALUES ('YANGCHEON-GU',119);
INSERT INTO SEARCH_AREA VALUES ('GANGSEO-GU',911);

INSERT INTO SEARCH_GENDER_AREA VALUES ('DOBONG-GU','M',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('NOWON-GU','M',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('GANGBUK-GU','M',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('SEONGBUK-GU','M',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('DONGDAEMUN-GU','M',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('JUNGNANG-GU','M',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('GWANGJIN-GU','M',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('SEONGDONG-GU','M',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('JUNG-GU','M',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('YONGSAN-GU','M',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('JONGNO-GU','M',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('EUNPYEONG-GU','M',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('MAPO-GU','M',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('SEODAEMUN-GU','M',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('GANGDONG-GU','M',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('SONGPA-GU','M',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('GANGNAM-GU','M',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('SEOCHO-GU','M',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('DONGJAK-GU','M',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('GWANAK-GU','M',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('YEONGDEUNGPO-GU','M',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('GEUMCHEON-GU','M',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('GURO-GU','M',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('YANGCHEON-GU','M',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('GANGSEO-GU','M',DEFAULT);

INSERT INTO SEARCH_GENDER_AREA VALUES ('DOBONG-GU','F',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('NOWON-GU','F',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('GANGBUK-GU','F',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('SEONGBUK-GU','F',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('DONGDAEMUN-GU','F',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('JUNGNANG-GU','F',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('GWANGJIN-GU','F',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('SEONGDONG-GU','F',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('JUNG-GU','F',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('YONGSAN-GU','F',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('JONGNO-GU','F',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('EUNPYEONG-GU','F',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('MAPO-GU','F',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('SEODAEMUN-GU','F',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('GANGDONG-GU','F',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('SONGPA-GU','F',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('GANGNAM-GU','F',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('SEOCHO-GU','F',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('DONGJAK-GU','F',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('GWANAK-GU','F',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('YEONGDEUNGPO-GU','F',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('GEUMCHEON-GU','F',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('GURO-GU','F',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('YANGCHEON-GU','F',DEFAULT);
INSERT INTO SEARCH_GENDER_AREA VALUES ('GANGSEO-GU','F',DEFAULT);

INSERT INTO SEARCH_GENDER_THEME VALUES ('T1','M',DEFAULT);
INSERT INTO SEARCH_GENDER_THEME VALUES ('T2','M',DEFAULT);
INSERT INTO SEARCH_GENDER_THEME VALUES ('T3','M',DEFAULT);
INSERT INTO SEARCH_GENDER_THEME VALUES ('T4','M',DEFAULT);
INSERT INTO SEARCH_GENDER_THEME VALUES ('T5','M',DEFAULT);
INSERT INTO SEARCH_GENDER_THEME VALUES ('T6','M',DEFAULT);
INSERT INTO SEARCH_GENDER_THEME VALUES ('T7','M',DEFAULT);

INSERT INTO SEARCH_GENDER_THEME VALUES ('T1','F',DEFAULT);
INSERT INTO SEARCH_GENDER_THEME VALUES ('T2','F',DEFAULT);
INSERT INTO SEARCH_GENDER_THEME VALUES ('T3','F',DEFAULT);
INSERT INTO SEARCH_GENDER_THEME VALUES ('T4','F',DEFAULT);
INSERT INTO SEARCH_GENDER_THEME VALUES ('T5','F',DEFAULT);
INSERT INTO SEARCH_GENDER_THEME VALUES ('T6','F',DEFAULT);
INSERT INTO SEARCH_GENDER_THEME VALUES ('T7','F',DEFAULT);

INSERT INTO SEARCH_THEME VALUES ('T1',10);
INSERT INTO SEARCH_THEME VALUES ('T2',50);
INSERT INTO SEARCH_THEME VALUES ('T3',40);
INSERT INTO SEARCH_THEME VALUES ('T4',30);
INSERT INTO SEARCH_THEME VALUES ('T5',11);
INSERT INTO SEARCH_THEME VALUES ('T6',45);
INSERT INTO SEARCH_THEME VALUES ('T7',60);



COMMIT;	