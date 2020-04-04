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

--CREATE USER ALIGO IDENTIFIED BY ALIGO;
--GRANT RESOURCE, CONNECT, CREATE VIEW TO ALIGO;

DROP SEQUENCE SEQ_TNO;

CREATE SEQUENCE SEQ_TNO
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
 AGE NUMBER,
 GENDER VARCHAR2(2) CHECK (GENDER IN('M','F')),
 M_STATUS VARCHAR2(2) DEFAULT 'Y' CHECK (M_STATUS IN('Y','N')),
 RECOMMMEND VARCHAR2(3000)
);

CREATE TABLE THEME_LIST(
  TID NUMBER PRIMARY KEY, 
  TWRITER VARCHAR2(15) DEFAULT 'ADMIN',
  TTITLE VARCHAR2(300) NOT NULL,
  TCONTENT VARCHAR2(4000) NOT NULL,
  TADDRESS VARCHAR2(1000) NOT NULL,
  T_CREATE_DATE DATE DEFAULT SYSDATE,
  T_MODIFY_DATE DATE DEFAULT SYSDATE,
  T_VIEWS NUMBER DEFAULT 0,
  T_LIKES NUMBER DEFAULT 0,
  TKEYWORD VARCHAR2(3000),
  T_STATUS VARCHAR2(5) DEFAULT 'Y' CHECK (T_STATUS IN('Y','N','X')),
  TCODE VARCHAR2(4) REFERENCES THEME_CODE ON DELETE CASCADE
);

CREATE TABLE THEME_FILES(
   T_CODE_NUMBER NUMBER REFERENCES THEME_LIST ON DELETE CASCADE,
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
 KEYWROD2_CONTENT VARCHAR2(300) 
);

--THEME_LIST 테스트용 THEME_CODE 먼저 입력해야함 
INSERT INTO THEME_CODE VALUES('T1','HISTORY');
INSERT INTO THEME_CODE VALUES('T2','FOOD');
INSERT INTO THEME_CODE VALUES('T3','SHOPPING');
INSERT INTO THEME_CODE VALUES('T4','FESTIVE');
INSERT INTO THEME_CODE VALUES('T5','NIGHT VIEW SCENERY');
INSERT INTO THEME_CODE VALUES('T6','MUSEUM');
INSERT INTO THEME_CODE VALUES('T7','EXOTIC');

INSERT INTO THEME_LIST VALUES(SEQ_TNO.NEXTVAL,DEFAULT,'TEST01','테스트1입니다','강남','2020/04/04','2020/04/04',DEFAULT,DEFAULT,'쇼핑',DEFAULT,'T3');
INSERT INTO THEME_LIST VALUES(SEQ_TNO.NEXTVAL,DEFAULT,'TEST02','테스트2입니다','광장시장','2019/10/10','2019/10/10',DEFAULT,DEFAULT,'역사',DEFAULT,'T1');
INSERT INTO THEME_LIST VALUES(SEQ_TNO.NEXTVAL,DEFAULT,'TEST03','테스트3입니다','명동','2019/11/11','2019/11/11',DEFAULT,DEFAULT,'먹방 음식',DEFAULT,'T2');
INSERT INTO THEME_LIST VALUES(SEQ_TNO.NEXTVAL,DEFAULT,'TEST04','테스트4입니다','동대문','2019/12/12','2019/12/12',DEFAULT,DEFAULT,'축제 공연',DEFAULT,'T4');
INSERT INTO THEME_LIST VALUES(SEQ_TNO.NEXTVAL,DEFAULT,'TEST05','테스트5입니다','삼청동','2020/01/01','2020/01/01',DEFAULT,DEFAULT,'야경 경치',DEFAULT,'T5');
INSERT INTO THEME_LIST VALUES(SEQ_TNO.NEXTVAL,DEFAULT,'TEST06','테스트6입니다','이촌','2020/02/02','2020/02/02',DEFAULT,DEFAULT,'박물관 실내',DEFAULT,'T6');
INSERT INTO THEME_LIST VALUES(SEQ_TNO.NEXTVAL,DEFAULT,'TEST07','테스트7입니다','남산','2020/03/03','2020/03/03',DEFAULT,DEFAULT,'이국적인 매력적인',DEFAULT,'T7');

INSERT INTO THEME_FILES VALUES(1,'cat.jpg','20200404.jpg');
INSERT INTO THEME_FILES VALUES(2,'dog.jpg','20191010.jpg');
INSERT INTO THEME_FILES VALUES(3,'a.jpg','20191111.jpg');
INSERT INTO THEME_FILES VALUES(4,'b.jpg','20191212.jpg');
INSERT INTO THEME_FILES VALUES(5,'c','20200101.jpg');
INSERT INTO THEME_FILES VALUES(6,'d.jpg','20200202.jpg');
INSERT INTO THEME_FILES VALUES(7,'e.jpg','20200303.jpg');

COMMIT;

