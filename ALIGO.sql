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
DROP TABLE QNAREPLY CASCADE CONSTRAINTS;
DROP TABLE SEARCH_AREA CASCADE CONSTRAINTS;
DROP TABLE SEARCH_THEME CASCADE CONSTRAINTS;
DROP TABLE SEARCH_GENDER_AREA CASCADE CONSTRAINTS;
DROP TABLE SEARCH_GENDER_THEME CASCADE CONSTRAINTS;
DROP PROCEDURE P_THEME_LIST;

--CREATE USER ALIGO IDENTIFIED BY ALIGO;
--GRANT RESOURCE, CONNECT, CREATE VIEW TO ALIGO;

DROP SEQUENCE SEQ_TNO;
DROP SEQUENCE SEQ_MNO;
DROP SEQUENCE SEQ_QID;
DROP SEQUENCE SEQ_RID;
DROP SEQUENCE SEQ_TRNO;
DROP SEQUENCE SEQ_REPORTS;

SET DEFINE OFF;

CREATE SEQUENCE SEQ_QID
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_RID
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

-- 신고 시퀀스
CREATE SEQUENCE SEQ_REPORTS
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
  T_CODE_NUM NUMBER UNIQUE REFERENCES THEME_LIST ON DELETE CASCADE
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
 RQCODE VARCHAR2(100) PRIMARY KEY,
 RQCONTENT VARCHAR2(500),
 RQKEYWORD1 VARCHAR2(500),
 KEYWORD1_CONTENT VARCHAR2(500),
 RQKEYWORD2 VARCHAR2(500),
 KEYWROD2_CONTENT VARCHAR2(500),
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

CREATE TABLE QNA(
   QID NUMBER PRIMARY KEY,
   QTITLE VARCHAR2(300) NOT NULL,
   QCONTENT VARCHAR2(3000) NOT NULL,
   QWRITER VARCHAR2(60), -- REFERENCES MEMBER ON DELETE CASCADE
   Q_CREATE_DATE DATE DEFAULT SYSDATE,
   Q_ANSWER_DATE DATE DEFAULT SYSDATE,
   Q_STATUS VARCHAR2(1) DEFAULT 'N' CHECK (Q_STATUS IN('Y','N','X'))
);

--QNA의 댓글 REPLY
CREATE TABLE QNAREPLY(
  RID NUMBER PRIMARY KEY,
  RCONTENT VARCHAR2(2000),
  REF_QID NUMBER,
  RWRITER VARCHAR2(500),
  R_CREATE_DATE DATE DEFAULT SYSDATE,
  R_MODIFY_DATE DATE DEFAULT SYSDATE,
  R_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (R_STATUS IN ('Y', 'N')),
  FOREIGN KEY (REF_QID) REFERENCES QNA(QID) ON DELETE CASCADE, 
  FOREIGN KEY (RWRITER) REFERENCES MEMBER(NICKNAME) ON DELETE CASCADE 
);

CREATE OR REPLACE PROCEDURE P_THEME_LIST
(
    p_TID        IN THEME_LIST.TID%TYPE,
    p_TWRITER    IN THEME_LIST.TWRITER%TYPE,
    p_TTITLE    IN THEME_LIST.TTITLE%TYPE,
    p_TCONTENT  IN THEME_LIST.TCONTENT%TYPE,
    p_TADDRESS  IN THEME_LIST.TADDRESS%TYPE,
    p_TADDRESSH  IN THEME_LIST.TADDRESSH%TYPE,
    p_T_CREATE_DATE IN THEME_LIST.T_CREATE_DATE%TYPE,
    p_T_MODIFY_DATE IN THEME_LIST.T_MODIFY_DATE%TYPE,
    p_T_VIEWS       IN THEME_LIST.T_VIEWS%TYPE,
    p_T_LIKES       IN THEME_LIST.T_LIKES%TYPE,
    p_TKEYWORD      IN THEME_LIST.TKEYWORD%TYPE,
    p_T_STATUS      IN THEME_LIST.T_STATUS%TYPE,
    p_TCODE         IN THEME_LIST.TCODE%TYPE,
    p_TTEL          IN THEME_LIST.TTEL%TYPE,
    p_TFEE          IN THEME_LIST.TFEE%TYPE,
    p_THOURS        IN THEME_LIST.THOURS%TYPE,
    p_TTRANS        IN THEME_LIST.TTRANS%TYPE
)
IS
     V_CLOB CLOB;
BEGIN
 if p_TCONTENT is not null then
  
    insert into THEME_LIST
       (TID,
       TWRITER,
        TTITLE,
        TCONTENT,
        TADDRESS,
        TADDRESSH,
        T_CREATE_DATE,
        T_MODIFY_DATE,
        T_VIEWS,
        T_LIKES,
        TKEYWORD,
        T_STATUS,
        TCODE,
        TTEL,
        TFEE,
        THOURS,
        TTRANS)
    values
       ( p_TID,
    p_TWRITER,
    p_TTITLE,
    empty_clob(),
    p_TADDRESS,
    p_TADDRESSH,
    p_T_CREATE_DATE,
    p_T_MODIFY_DATE,
    p_T_VIEWS,
    p_T_LIKES,
    p_TKEYWORD,
    p_T_STATUS,
    p_TCODE,
    p_TTEL,
    p_TFEE,
    p_THOURS,
    p_TTRANS)                   
    returning TCONTENT into v_clob;
 
    dbms_lob.write(v_clob, length(p_TCONTENT), 1, p_TCONTENT);
   
    commit;
   
  end if;
 
end ;
/

--THEME_LIST 테스트용 THEME_CODE 먼저 입력해야함 
INSERT INTO THEME_CODE VALUES('T1','NATURE',DEFAULT,DEFAULT);
INSERT INTO THEME_CODE VALUES('T2','RESTAURANT',DEFAULT,DEFAULT);
INSERT INTO THEME_CODE VALUES('T3','HISTORY',DEFAULT,DEFAULT);
INSERT INTO THEME_CODE VALUES('T4','SHOPPING',DEFAULT,DEFAULT);
INSERT INTO THEME_CODE VALUES('T5','BAR',DEFAULT,DEFAULT);
INSERT INTO THEME_CODE VALUES('T6','ACTIVITY',DEFAULT,DEFAULT);
INSERT INTO THEME_CODE VALUES('T7','EXHIBITION',DEFAULT,DEFAULT);

--THEME LIST

--UPDATE THEME_CODE SET (TCOUNT,TLIKE) =(SELECT SUM(T_VIEWS),SUM(T_LIKES) FROM THEME_LIST JOIN THEME_CODE USING(TCODE) WHERE TNAME='NATURE') WHERE TNAME='NATURE';
--UPDATE THEME_CODE SET (TCOUNT,TLIKE) =(SELECT SUM(T_VIEWS),SUM(T_LIKES) FROM THEME_LIST JOIN THEME_CODE USING(TCODE) WHERE TNAME='RESTAURANT') WHERE TNAME='RESTAURANT';
--UPDATE THEME_CODE SET (TCOUNT,TLIKE) =(SELECT SUM(T_VIEWS),SUM(T_LIKES) FROM THEME_LIST JOIN THEME_CODE USING(TCODE) WHERE TNAME='HISTORY') WHERE TNAME='HISTORY';
--UPDATE THEME_CODE SET (TCOUNT,TLIKE) =(SELECT SUM(T_VIEWS),SUM(T_LIKES) FROM THEME_LIST JOIN THEME_CODE USING(TCODE) WHERE TNAME='SHOPPING') WHERE TNAME='SHOPPING';
--UPDATE THEME_CODE SET (TCOUNT,TLIKE) =(SELECT SUM(T_VIEWS),SUM(T_LIKES) FROM THEME_LIST JOIN THEME_CODE USING(TCODE) WHERE TNAME='BAR') WHERE TNAME='BAR';
--UPDATE THEME_CODE SET (TCOUNT,TLIKE) =(SELECT SUM(T_VIEWS),SUM(T_LIKES) FROM THEME_LIST JOIN THEME_CODE USING(TCODE) WHERE TNAME='ACTIVITY') WHERE TNAME='ACTIVITY';
--UPDATE THEME_CODE SET (TCOUNT,TLIKE) =(SELECT SUM(T_VIEWS),SUM(T_LIKES) FROM THEME_LIST JOIN THEME_CODE USING(TCODE) WHERE TNAME='EXHIBITION') WHERE TNAME='EXHIBITION';

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

INSERT INTO SEARCH_THEME VALUES ('T1',10);
INSERT INTO SEARCH_THEME VALUES ('T2',50);
INSERT INTO SEARCH_THEME VALUES ('T3',40);
INSERT INTO SEARCH_THEME VALUES ('T4',30);
INSERT INTO SEARCH_THEME VALUES ('T5',11);
INSERT INTO SEARCH_THEME VALUES ('T6',45);
INSERT INTO SEARCH_THEME VALUES ('T7',60);



COMMIT;    