DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE THEME_LIST CASCADE CONSTRAINTS;
--DROP TABLE THEME CASCADE CONSTRAINTS;
--DROP TABLE REPLY CASCADE CONSTRAINTS;
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

--CREATE USER ALIGO IDENTIFIED BY ALIGO;
--GRANT RESOURCE, CONNECT, CREATE VIEW TO ALIGO;

DROP SEQUENCE SEQ_TNO;
DROP SEQUENCE SEQ_MNO;
DROP SEQUENCE SEQ_QID;

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

CREATE TABLE THEME_CODE(
   TCODE VARCHAR2(4) PRIMARY KEY,
   TNAME VARCHAR2(500)
);

CREATE TABLE MEMBER(
 MID VARCHAR2(10) PRIMARY KEY,
 EMAIL VARCHAR2(50),
 PASSWORD VARCHAR2(40),
 NICKNAME VARCHAR2(50),
 GENDER VARCHAR2(2) CHECK (GENDER IN('M','F')),
 AGE NUMBER,
 M_STATUS VARCHAR2(2) DEFAULT 'Y' CHECK (M_STATUS IN('Y','N')),
 RECOMMEND VARCHAR2(3000)
);

CREATE TABLE THEME_LIST(
  TID NUMBER PRIMARY KEY, 
  TWRITER VARCHAR2(15) DEFAULT 'ADMIN',
  TTITLE VARCHAR2(300) NOT NULL,
  TCONTENT VARCHAR2(4000) NOT NULL,
  TADDRESS VARCHAR2(1000) NOT NULL,
  TADDRESSH VARCHAR2(1000) NOT NULL,
  T_CREATE_DATE DATE DEFAULT SYSDATE,
  T_MODIFY_DATE DATE DEFAULT SYSDATE,
  T_VIEWS NUMBER DEFAULT 0,
  T_LIKES NUMBER DEFAULT 0,
  TKEYWORD VARCHAR2(3000),
  T_STATUS VARCHAR2(5) DEFAULT 'Y' CHECK (T_STATUS IN('Y','N','X')),
  TCODE VARCHAR2(4) REFERENCES THEME_CODE ON DELETE CASCADE
  
);

CREATE TABLE THEME_FILES(
   T_CODE_NUMBER NUMBER,
   T_ORIGINAL_FILE VARCHAR2(100),
   T_MODIFY_FILE VARCHAR2(100)
);

CREATE TABLE THEME_LIKES(
  MID VARCHAR2(50) REFERENCES MEMBER ON DELETE CASCADE,
  T_CODE_NUM NUMBER REFERENCES THEME_LIST ON DELETE CASCADE
);

CREATE TABLE THEME_REPLY(
  TRNUM NUMBER,
  T_CODE_NUMBER NUMBER,
  TR_WRITER VARCHAR2(50),
  TR_CONTENT VARCHAR2(3000),
  TR_STATUS VARCHAR2(5) DEFAULT 'Y' CHECK (TR_STATUS IN('Y','N'))
);

--CREATE TABLE REPLY(
--RID NUMBER, --PRIMARY KEY
--RCONTENT VARCHAR2(500),
--REF_BID NUMBER,
--RWRITER VARCHAR2(40),
--R_CREATE_DATE DATE DEFAULT SYSDATE,
--R_MODIFY_DATE DATE DEFAULT SYSDATE,
--R_STATUS VARCHAR2(5) DEFAULT 'Y' CHECK(R_STATUS('Y','N'))
--SPRING DB의 MODEL 참조

--);

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
  B_ORIGIN_FILE VARCHAR2(1000),
  B_MODIFY_FILE VARCHAR2(1000)  
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

--THEME_LIST 테스트용 THEME_CODE 먼저 입력해야함 
INSERT INTO THEME_CODE VALUES('T1','HISTORY');
INSERT INTO THEME_CODE VALUES('T2','FOOD');
INSERT INTO THEME_CODE VALUES('T3','SHOPPING');
INSERT INTO THEME_CODE VALUES('T4','FESTIVE');
INSERT INTO THEME_CODE VALUES('T5','NIGHT VIEW SCENERY');
INSERT INTO THEME_CODE VALUES('T6','MUSEUM');
INSERT INTO THEME_CODE VALUES('T7','EXOTIC');


INSERT INTO THEME_LIST VALUES(SEQ_TNO.NEXTVAL,DEFAULT,'TEST01','테스트1입니다','강남','서울시','2020/04/04','2020/04/04',DEFAULT,DEFAULT,'쇼핑',DEFAULT,'T3');
INSERT INTO THEME_LIST VALUES(SEQ_TNO.NEXTVAL,DEFAULT,'TEST02','테스트2입니다','광장시장','서울시','2019/10/10','2019/10/10',DEFAULT,DEFAULT,'역사',DEFAULT,'T1');
INSERT INTO THEME_LIST VALUES(SEQ_TNO.NEXTVAL,DEFAULT,'TEST03','테스트3입니다','명동','서울시','2019/11/11','2019/11/11',DEFAULT,DEFAULT,'먹방 음식',DEFAULT,'T2');
INSERT INTO THEME_LIST VALUES(SEQ_TNO.NEXTVAL,DEFAULT,'TEST04','테스트4입니다','동대문','서울시','2019/12/12','2019/12/12',DEFAULT,DEFAULT,'축제 공연',DEFAULT,'T4');
INSERT INTO THEME_LIST VALUES(SEQ_TNO.NEXTVAL,DEFAULT,'TEST05','테스트5입니다','삼청동','서울시','2020/01/01','2020/01/01',DEFAULT,DEFAULT,'야경 경치',DEFAULT,'T5');
INSERT INTO THEME_LIST VALUES(SEQ_TNO.NEXTVAL,DEFAULT,'TEST06','테스트6입니다','이촌','서울시','2020/02/02','2020/02/02',DEFAULT,DEFAULT,'박물관 실내',DEFAULT,'T6');
INSERT INTO THEME_LIST VALUES(SEQ_TNO.NEXTVAL,DEFAULT,'TEST07','테스트7입니다','남산','서울시','2020/03/03','2020/03/03',DEFAULT,DEFAULT,'이국적인 매력적인',DEFAULT,'T7');
INSERT INTO THEME_LIST VALUES(SEQ_TNO.NEXTVAL,DEFAULT,'TEST08','테스트8입니다','북한산','서울시','2019/05/05','2019/05/05',DEFAULT,DEFAULT,'경치 단풍',DEFAULT,'T7');
INSERT INTO THEME_LIST VALUES(SEQ_TNO.NEXTVAL,DEFAULT,'TEST09','테스트9입니다','부산','서울시','2019/06/06','2019/06/06',DEFAULT,DEFAULT,'야경 도시',DEFAULT,'T5');
INSERT INTO THEME_LIST VALUES(SEQ_TNO.NEXTVAL,DEFAULT,'TEST10','테스트10입니다','경희루','서울시','2019/07/07','2019/07/07',DEFAULT,DEFAULT,'경치 이국적인',DEFAULT,'T7');
INSERT INTO THEME_LIST VALUES(SEQ_TNO.NEXTVAL,DEFAULT,'TEST11','테스트11입니다','제주 천지연 폭포','서울시','2019/08/08','2019/08/08',DEFAULT,DEFAULT,'경치',DEFAULT,'T7');
INSERT INTO THEME_LIST VALUES(SEQ_TNO.NEXTVAL,DEFAULT,'TEST12','테스트12입니다','삼계탕','서울시','2019/09/09','2019/09/09',DEFAULT,DEFAULT,'음식 전통',DEFAULT,'T2');
INSERT INTO THEME_LIST VALUES(SEQ_TNO.NEXTVAL,DEFAULT,'TEST13','테스트13입니다','불꽃놀이','서울시','2019/04/04','2019/04/04',DEFAULT,DEFAULT,'축제',DEFAULT,'T4');

INSERT INTO THEME_FILES VALUES(1,'cat.jpg','20200404.jpg');
INSERT INTO THEME_FILES VALUES(2,'dog.jpg','20191010.jpg');
INSERT INTO THEME_FILES VALUES(3,'a.jpg','20191111.jpg');
INSERT INTO THEME_FILES VALUES(4,'b.jpg','20191212.jpg');
INSERT INTO THEME_FILES VALUES(5,'c.jpg','20200101.jpg');
INSERT INTO THEME_FILES VALUES(6,'d.jpg','20200202.jpg');
INSERT INTO THEME_FILES VALUES(7,'e.jpg','20200303.jpg');
INSERT INTO THEME_FILES VALUES(8,'f.jpg','20190505.jpg');
INSERT INTO THEME_FILES VALUES(9,'g.jpg','20190606.jpg');
INSERT INTO THEME_FILES VALUES(10,'h.jpg','20190707.jpg');
INSERT INTO THEME_FILES VALUES(11,'i.jpg','20190808.jpg');
INSERT INTO THEME_FILES VALUES(12,'j.jpg','20190909.jpg');
INSERT INTO THEME_FILES VALUES(13,'k.jpg','20190404.jpg');
CREATE TABLE QNA(
	QID NUMBER PRIMARY KEY,
	QTITLE VARCHAR2(300) NOT NULL,
	QCONTENT VARCHAR2(3000) NOT NULL,
	QWRITER VARCHAR2(60), -- REFERENCES MEMBER ON DELETE CASCADE
	Q_CREATE_DATE DATE DEFAULT SYSDATE,
	Q_ANSWER_DATE DATE DEFAULT SYSDATE,
	Q_STATUS VARCHAR2(1) DEFAULT 'N' CHECK (Q_STATUS IN('Y','N','X'))
);


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


COMMIT;