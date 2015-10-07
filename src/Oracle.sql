--------------------------------------------------------
--  File created - 星期三-十月-07-2015   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence ADMIN_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ADMIN_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 8040 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence COST_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "COST_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 87 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence ROLE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ROLE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1020 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SERVICE_BAK_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SERVICE_BAK_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SERVICE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SERVICE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 3020 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table ACCOUNT
--------------------------------------------------------

  CREATE TABLE "ACCOUNT" 
   (	"ACCOUNT_ID" NUMBER(9,0), 
	"RECOMMENDER_ID" NUMBER(9,0), 
	"LOGIN_NAME" VARCHAR2(30), 
	"LOGIN_PASSWD" VARCHAR2(30), 
	"STATUS" CHAR(1), 
	"CREATE_DATE" DATE DEFAULT sysdate, 
	"PAUSE_DATE" DATE, 
	"CLOSE_DATE" DATE, 
	"REAL_NAME" VARCHAR2(20), 
	"IDCARD_NO" CHAR(18), 
	"BIRTHDATE" DATE, 
	"GENDER" CHAR(1), 
	"OCCUPATION" VARCHAR2(50), 
	"TELEPHONE" VARCHAR2(15), 
	"EMAIL" VARCHAR2(50), 
	"MAILADDRESS" VARCHAR2(200), 
	"ZIPCODE" CHAR(6), 
	"QQ" VARCHAR2(15), 
	"LAST_LOGIN_TIME" DATE, 
	"LAST_LOGIN_IP" VARCHAR2(15)
   ) ;
--------------------------------------------------------
--  DDL for Table ADMIN_INFO
--------------------------------------------------------

  CREATE TABLE "ADMIN_INFO" 
   (	"ADMIN_ID" NUMBER(4,0), 
	"ADMIN_CODE" VARCHAR2(30), 
	"PASSWORD" VARCHAR2(30), 
	"NAME" VARCHAR2(30), 
	"TELEPHONE" VARCHAR2(15), 
	"EMAIL" VARCHAR2(50), 
	"ENROLLDATE" DATE DEFAULT sysdate
   ) ;
--------------------------------------------------------
--  DDL for Table ADMIN_ROLE
--------------------------------------------------------

  CREATE TABLE "ADMIN_ROLE" 
   (	"ADMIN_ID" NUMBER(8,0), 
	"ROLE_ID" NUMBER(4,0)
   ) ;
--------------------------------------------------------
--  DDL for Table BILL
--------------------------------------------------------

  CREATE TABLE "BILL" 
   (	"BILL_ID" NUMBER(11,0), 
	"ACCOUNT_ID" NUMBER(9,0), 
	"BILL_MONTH" CHAR(6), 
	"COST" NUMBER(13,2), 
	"PAYMENT_MODE" CHAR(1), 
	"PAY_STATE" CHAR(10) DEFAULT 0
   ) ;
--------------------------------------------------------
--  DDL for Table BILL_ITEM
--------------------------------------------------------

  CREATE TABLE "BILL_ITEM" 
   (	"ITEM_ID" NUMBER(11,0), 
	"BILL_ID" NUMBER(11,0), 
	"SERVICE_ID" NUMBER(10,0), 
	"COST" NUMBER(13,2)
   ) ;
--------------------------------------------------------
--  DDL for Table COST
--------------------------------------------------------

  CREATE TABLE "COST" 
   (	"COST_ID" NUMBER(4,0), 
	"NAME" VARCHAR2(50), 
	"BASE_DURATION" NUMBER(11,0), 
	"BASE_COST" NUMBER(7,2), 
	"UNIT_COST" NUMBER(7,4), 
	"STATUS" CHAR(1), 
	"DESCR" VARCHAR2(100), 
	"CREATIME" DATE DEFAULT sysdate, 
	"STARTIME" DATE, 
	"COST_TYPE" CHAR(1)
   ) ;
--------------------------------------------------------
--  DDL for Table FUNCTION_INFO
--------------------------------------------------------

  CREATE TABLE "FUNCTION_INFO" 
   (	"FUNCTION_ID" NUMBER(8,0), 
	"FUNCTION_CODE" VARCHAR2(50), 
	"MODULE_ID" NUMBER(4,0), 
	"NAME" VARCHAR2(50), 
	"URL" VARCHAR2(100)
   ) ;
--------------------------------------------------------
--  DDL for Table HOST
--------------------------------------------------------

  CREATE TABLE "HOST" 
   (	"HOST_ID" VARCHAR2(15), 
	"NAME" VARCHAR2(50), 
	"LOCATION" VARCHAR2(100)
   ) ;
--------------------------------------------------------
--  DDL for Table MODULE_INFO
--------------------------------------------------------

  CREATE TABLE "MODULE_INFO" 
   (	"MODULE_ID" NUMBER(4,0), 
	"NAME" VARCHAR2(50)
   ) ;
--------------------------------------------------------
--  DDL for Table ROLE_INFO
--------------------------------------------------------

  CREATE TABLE "ROLE_INFO" 
   (	"ROLE_ID" NUMBER(4,0), 
	"NAME" VARCHAR2(50)
   ) ;
--------------------------------------------------------
--  DDL for Table ROLE_MODULE
--------------------------------------------------------

  CREATE TABLE "ROLE_MODULE" 
   (	"ROLE_ID" NUMBER(4,0), 
	"MODULE_ID" NUMBER(4,0)
   ) ;
--------------------------------------------------------
--  DDL for Table SERVICE
--------------------------------------------------------

  CREATE TABLE "SERVICE" 
   (	"SERVICE_ID" NUMBER(10,0), 
	"ACCOUNT_ID" NUMBER(9,0), 
	"UNIX_HOST" VARCHAR2(15), 
	"OS_USERNAME" VARCHAR2(8), 
	"LOGIN_PASSWD" VARCHAR2(30), 
	"STATUS" CHAR(1), 
	"CREATE_DATE" DATE DEFAULT sysdate, 
	"PAUSE_DATE" DATE, 
	"CLOSE_DATE" DATE, 
	"COST_ID" NUMBER(4,0)
   ) ;
--------------------------------------------------------
--  DDL for Table SERVICE_DETAIL
--------------------------------------------------------

  CREATE TABLE "SERVICE_DETAIL" 
   (	"DETAIL_ID" NUMBER(11,0), 
	"SERVICE_ID" NUMBER(10,0), 
	"CLIENT_HOST" VARCHAR2(15), 
	"OS_USERNAME" VARCHAR2(8), 
	"PID" NUMBER(11,0), 
	"LOGIN_TIME" DATE, 
	"LOGOUT_TIME" DATE, 
	"DURATION" NUMBER(20,9), 
	"COST" NUMBER(20,6)
   ) ;
--------------------------------------------------------
--  DDL for Table SERVICE_UPDATE_BAK
--------------------------------------------------------

  CREATE TABLE "SERVICE_UPDATE_BAK" 
   (	"ID" NUMBER(10,0), 
	"SERVICE_ID" NUMBER(9,0), 
	"COST_ID" NUMBER(4,0)
   ) ;

---------------------------------------------------
--   DATA FOR TABLE SERVICE_DETAIL
--   FILTER = none used
---------------------------------------------------
REM INSERTING into SERVICE_DETAIL
Insert into SERVICE_DETAIL (DETAIL_ID,SERVICE_ID,CLIENT_HOST,OS_USERNAME,PID,LOGIN_TIME,LOGOUT_TIME,DURATION,COST) values (1,2001,'192.168.172.4','guojing',null,null,to_timestamp('06-10月-15 11.16.40.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),3610,null);
Insert into SERVICE_DETAIL (DETAIL_ID,SERVICE_ID,CLIENT_HOST,OS_USERNAME,PID,LOGIN_TIME,LOGOUT_TIME,DURATION,COST) values (2,2001,'192.168.172.4','guojing',null,null,to_timestamp('13-6月 -13 08.30.00.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),10800,null);
Insert into SERVICE_DETAIL (DETAIL_ID,SERVICE_ID,CLIENT_HOST,OS_USERNAME,PID,LOGIN_TIME,LOGOUT_TIME,DURATION,COST) values (3,2001,'192.168.172.4','guojing',null,null,to_timestamp('14-6月 -13 08.30.00.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),10800,null);
Insert into SERVICE_DETAIL (DETAIL_ID,SERVICE_ID,CLIENT_HOST,OS_USERNAME,PID,LOGIN_TIME,LOGOUT_TIME,DURATION,COST) values (4,2001,'192.168.172.4','guojing',null,null,to_timestamp('15-6月 -13 07.30.00.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),32400,null);
Insert into SERVICE_DETAIL (DETAIL_ID,SERVICE_ID,CLIENT_HOST,OS_USERNAME,PID,LOGIN_TIME,LOGOUT_TIME,DURATION,COST) values (5,2001,'192.168.172.4','guojing',null,null,to_timestamp('18-6月 -13 07.30.00.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),36000,null);
Insert into SERVICE_DETAIL (DETAIL_ID,SERVICE_ID,CLIENT_HOST,OS_USERNAME,PID,LOGIN_TIME,LOGOUT_TIME,DURATION,COST) values (6,2001,'192.168.172.4','guojing',null,null,to_timestamp('20-6月 -13 09.30.00.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),36000,null);

---------------------------------------------------
--   END DATA FOR TABLE SERVICE_DETAIL
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MODULE_INFO
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MODULE_INFO
Insert into MODULE_INFO (MODULE_ID,NAME) values (1,'角色管理');
Insert into MODULE_INFO (MODULE_ID,NAME) values (2,'管理员');
Insert into MODULE_INFO (MODULE_ID,NAME) values (3,'资费管理');
Insert into MODULE_INFO (MODULE_ID,NAME) values (4,'账务账号');
Insert into MODULE_INFO (MODULE_ID,NAME) values (5,'业务账号');
Insert into MODULE_INFO (MODULE_ID,NAME) values (6,'账单管理');
Insert into MODULE_INFO (MODULE_ID,NAME) values (7,'报表');

---------------------------------------------------
--   END DATA FOR TABLE MODULE_INFO
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE SERVICE
--   FILTER = none used
---------------------------------------------------
REM INSERTING into SERVICE
Insert into SERVICE (SERVICE_ID,ACCOUNT_ID,UNIX_HOST,OS_USERNAME,LOGIN_PASSWD,STATUS,CREATE_DATE,PAUSE_DATE,CLOSE_DATE,COST_ID) values (3002,1005,'123.123.123.123','abc','abc','1',to_timestamp('20-9月 -15 10.45.53.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),null,null,1);
Insert into SERVICE (SERVICE_ID,ACCOUNT_ID,UNIX_HOST,OS_USERNAME,LOGIN_PASSWD,STATUS,CREATE_DATE,PAUSE_DATE,CLOSE_DATE,COST_ID) values (3003,1005,'456.456.456.456','abcdef','abc','0',to_timestamp('20-9月 -15 10.53.57.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),null,null,1);
Insert into SERVICE (SERVICE_ID,ACCOUNT_ID,UNIX_HOST,OS_USERNAME,LOGIN_PASSWD,STATUS,CREATE_DATE,PAUSE_DATE,CLOSE_DATE,COST_ID) values (2001,1010,'192.168.0.26','guojing','guo1234','1',to_timestamp('08-9月 -15 06.57.10.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('19-9月 -15 04.12.59.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('19-9月 -15 03.39.50.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),2);
Insert into SERVICE (SERVICE_ID,ACCOUNT_ID,UNIX_HOST,OS_USERNAME,LOGIN_PASSWD,STATUS,CREATE_DATE,PAUSE_DATE,CLOSE_DATE,COST_ID) values (2002,1011,'192.168.0.26','huangr','huang234','1',to_timestamp('08-9月 -15 06.57.10.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('19-9月 -15 04.12.48.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('19-9月 -15 03.40.24.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),4);
Insert into SERVICE (SERVICE_ID,ACCOUNT_ID,UNIX_HOST,OS_USERNAME,LOGIN_PASSWD,STATUS,CREATE_DATE,PAUSE_DATE,CLOSE_DATE,COST_ID) values (2003,1011,'192.168.0.20','huangr','huang234','1',to_timestamp('08-9月 -15 06.57.10.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('19-9月 -15 04.12.48.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),null,3);
Insert into SERVICE (SERVICE_ID,ACCOUNT_ID,UNIX_HOST,OS_USERNAME,LOGIN_PASSWD,STATUS,CREATE_DATE,PAUSE_DATE,CLOSE_DATE,COST_ID) values (2004,1011,'192.168.0.23','huangr','huang234','1',to_timestamp('08-9月 -15 06.57.10.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('19-9月 -15 04.12.48.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),null,6);
Insert into SERVICE (SERVICE_ID,ACCOUNT_ID,UNIX_HOST,OS_USERNAME,LOGIN_PASSWD,STATUS,CREATE_DATE,PAUSE_DATE,CLOSE_DATE,COST_ID) values (2005,1019,'192.168.0.26','luwsh','luwu2345','1',to_timestamp('08-9月 -15 06.57.10.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('19-9月 -15 03.37.14.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),null,4);
Insert into SERVICE (SERVICE_ID,ACCOUNT_ID,UNIX_HOST,OS_USERNAME,LOGIN_PASSWD,STATUS,CREATE_DATE,PAUSE_DATE,CLOSE_DATE,COST_ID) values (2006,1019,'192.168.0.20','luwsh','luwu2345','0',to_timestamp('08-9月 -15 06.57.10.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),null,null,5);
Insert into SERVICE (SERVICE_ID,ACCOUNT_ID,UNIX_HOST,OS_USERNAME,LOGIN_PASSWD,STATUS,CREATE_DATE,PAUSE_DATE,CLOSE_DATE,COST_ID) values (2007,1020,'192.168.0.20','weixb','wei12345','0',to_timestamp('08-9月 -15 06.57.10.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),null,null,6);
Insert into SERVICE (SERVICE_ID,ACCOUNT_ID,UNIX_HOST,OS_USERNAME,LOGIN_PASSWD,STATUS,CREATE_DATE,PAUSE_DATE,CLOSE_DATE,COST_ID) values (2008,1010,'192.168.0.20','guojing','guo09876','1',to_timestamp('08-9月 -15 06.57.10.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('19-9月 -15 04.12.59.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),null,6);

---------------------------------------------------
--   END DATA FOR TABLE SERVICE
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE ROLE_MODULE
--   FILTER = none used
---------------------------------------------------
REM INSERTING into ROLE_MODULE
Insert into ROLE_MODULE (ROLE_ID,MODULE_ID) values (100,1);
Insert into ROLE_MODULE (ROLE_ID,MODULE_ID) values (100,2);
Insert into ROLE_MODULE (ROLE_ID,MODULE_ID) values (200,3);
Insert into ROLE_MODULE (ROLE_ID,MODULE_ID) values (200,4);
Insert into ROLE_MODULE (ROLE_ID,MODULE_ID) values (200,5);
Insert into ROLE_MODULE (ROLE_ID,MODULE_ID) values (200,6);
Insert into ROLE_MODULE (ROLE_ID,MODULE_ID) values (300,2);
Insert into ROLE_MODULE (ROLE_ID,MODULE_ID) values (300,7);
Insert into ROLE_MODULE (ROLE_ID,MODULE_ID) values (400,5);
Insert into ROLE_MODULE (ROLE_ID,MODULE_ID) values (1002,1);
Insert into ROLE_MODULE (ROLE_ID,MODULE_ID) values (1002,4);

---------------------------------------------------
--   END DATA FOR TABLE ROLE_MODULE
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE T_DEPT
--   FILTER = none used
---------------------------------------------------
REM INSERTING into T_DEPT
Insert into T_DEPT (DEPTNO,DNAME,LOC) values (1,'研发','北京');
Insert into T_DEPT (DEPTNO,DNAME,LOC) values (2,'销售','天津');

---------------------------------------------------
--   END DATA FOR TABLE T_DEPT
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE ACCOUNT
--   FILTER = none used
---------------------------------------------------
REM INSERTING into ACCOUNT
Insert into ACCOUNT (ACCOUNT_ID,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,PAUSE_DATE,CLOSE_DATE,REAL_NAME,IDCARD_NO,BIRTHDATE,GENDER,OCCUPATION,TELEPHONE,EMAIL,MAILADDRESS,ZIPCODE,QQ,LAST_LOGIN_TIME,LAST_LOGIN_IP) values (1005,null,'taiji001','256528','1',to_timestamp('15-3月 -08 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('19-9月 -15 04.11.30.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('15-9月 -15 08.24.47.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'zhangsanfeng','410381194302256528',to_timestamp('25-2月 -43 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'0','3','13669351234','zsf@wds.com','武当山','12334 ','12345',null,null);
Insert into ACCOUNT (ACCOUNT_ID,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,PAUSE_DATE,CLOSE_DATE,REAL_NAME,IDCARD_NO,BIRTHDATE,GENDER,OCCUPATION,TELEPHONE,EMAIL,MAILADDRESS,ZIPCODE,QQ,LAST_LOGIN_TIME,LAST_LOGIN_IP) values (1010,null,'xl18z60','190613','1',to_timestamp('10-1月 -09 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('19-9月 -15 04.12.29.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('19-9月 -15 04.12.59.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'guojing','330682196903190613',to_timestamp('19-3月 -69 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'1','2','13338924567',null,null,null,null,null,null);
Insert into ACCOUNT (ACCOUNT_ID,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,PAUSE_DATE,CLOSE_DATE,REAL_NAME,IDCARD_NO,BIRTHDATE,GENDER,OCCUPATION,TELEPHONE,EMAIL,MAILADDRESS,ZIPCODE,QQ,LAST_LOGIN_TIME,LAST_LOGIN_IP) values (1011,1010,'dgbf70','270429','1',to_timestamp('01-3月 -09 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('19-9月 -15 04.12.47.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),null,'huangrong','330902197108270429',to_timestamp('27-8月 -71 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'1','3','13637811357',null,null,null,null,null,null);
Insert into ACCOUNT (ACCOUNT_ID,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,PAUSE_DATE,CLOSE_DATE,REAL_NAME,IDCARD_NO,BIRTHDATE,GENDER,OCCUPATION,TELEPHONE,EMAIL,MAILADDRESS,ZIPCODE,QQ,LAST_LOGIN_TIME,LAST_LOGIN_IP) values (1015,1005,'mjjzh64','041115','1',to_timestamp('12-3月 -10 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),null,null,'zhangwuji','610121198906041115',to_timestamp('04-6月 -89 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'1','2','13572952468',null,null,null,null,null,null);
Insert into ACCOUNT (ACCOUNT_ID,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,PAUSE_DATE,CLOSE_DATE,REAL_NAME,IDCARD_NO,BIRTHDATE,GENDER,OCCUPATION,TELEPHONE,EMAIL,MAILADDRESS,ZIPCODE,QQ,LAST_LOGIN_TIME,LAST_LOGIN_IP) values (1019,1011,'ljxj90','310346','1',to_timestamp('01-2月 -12 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),null,to_timestamp('19-9月 -15 03.56.07.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'luwushuang','320211199307310346',to_timestamp('31-7月 -93 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'0','1','13186454984',null,null,null,null,null,null);
Insert into ACCOUNT (ACCOUNT_ID,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,PAUSE_DATE,CLOSE_DATE,REAL_NAME,IDCARD_NO,BIRTHDATE,GENDER,OCCUPATION,TELEPHONE,EMAIL,MAILADDRESS,ZIPCODE,QQ,LAST_LOGIN_TIME,LAST_LOGIN_IP) values (1020,null,'kxhxd20','012115','1',to_timestamp('20-2月 -12 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),null,null,'weixiaobao','321022200010012115',to_timestamp('01-10月-00 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'0','1','13953410078',null,null,null,null,null,null);
Insert into ACCOUNT (ACCOUNT_ID,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,PAUSE_DATE,CLOSE_DATE,REAL_NAME,IDCARD_NO,BIRTHDATE,GENDER,OCCUPATION,TELEPHONE,EMAIL,MAILADDRESS,ZIPCODE,QQ,LAST_LOGIN_TIME,LAST_LOGIN_IP) values (1021,null,'kxhxd21','012116','1',to_timestamp('20-2月 -12 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),null,null,'zhangsan','321022200010012116',to_timestamp('02-10月-00 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'0','1','13953410079',null,null,null,null,null,null);
Insert into ACCOUNT (ACCOUNT_ID,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,PAUSE_DATE,CLOSE_DATE,REAL_NAME,IDCARD_NO,BIRTHDATE,GENDER,OCCUPATION,TELEPHONE,EMAIL,MAILADDRESS,ZIPCODE,QQ,LAST_LOGIN_TIME,LAST_LOGIN_IP) values (1022,null,'kxhxd22','012117','1',to_timestamp('20-2月 -12 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),null,null,'lisi','321022200010012117',to_timestamp('03-10月-00 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'1','1','13953410080',null,null,null,null,null,null);
Insert into ACCOUNT (ACCOUNT_ID,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,PAUSE_DATE,CLOSE_DATE,REAL_NAME,IDCARD_NO,BIRTHDATE,GENDER,OCCUPATION,TELEPHONE,EMAIL,MAILADDRESS,ZIPCODE,QQ,LAST_LOGIN_TIME,LAST_LOGIN_IP) values (1023,null,'kxhxd23','012118','1',to_timestamp('20-2月 -12 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),null,null,'wangwu','321022200010012118',to_timestamp('04-10月-00 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'1','1','13953410081',null,null,null,null,null,null);
Insert into ACCOUNT (ACCOUNT_ID,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,PAUSE_DATE,CLOSE_DATE,REAL_NAME,IDCARD_NO,BIRTHDATE,GENDER,OCCUPATION,TELEPHONE,EMAIL,MAILADDRESS,ZIPCODE,QQ,LAST_LOGIN_TIME,LAST_LOGIN_IP) values (1024,null,'kxhxd24','012119','1',to_timestamp('20-2月 -12 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),null,null,'zhouliu','321022200010012119',to_timestamp('05-10月-00 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'0','1','13953410082',null,null,null,null,null,null);
Insert into ACCOUNT (ACCOUNT_ID,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,PAUSE_DATE,CLOSE_DATE,REAL_NAME,IDCARD_NO,BIRTHDATE,GENDER,OCCUPATION,TELEPHONE,EMAIL,MAILADDRESS,ZIPCODE,QQ,LAST_LOGIN_TIME,LAST_LOGIN_IP) values (1025,null,'kxhxd25','012120','1',to_timestamp('20-2月 -12 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),null,null,'maqi','321022200010012120',to_timestamp('06-10月-00 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'1','1','13953410083',null,null,null,null,null,null);

---------------------------------------------------
--   END DATA FOR TABLE ACCOUNT
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE FUNCTION_INFO
--   FILTER = none used
---------------------------------------------------
REM INSERTING into FUNCTION_INFO

---------------------------------------------------
--   END DATA FOR TABLE FUNCTION_INFO
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE T_EMP
--   FILTER = none used
---------------------------------------------------
REM INSERTING into T_EMP
Insert into T_EMP (EMPNO,ENAME,MGR,HIREDATE,SAL,COMM,DEPTNO) values (1,'Tom',1,to_timestamp('13-9月 -15 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),9000,0,1);
Insert into T_EMP (EMPNO,ENAME,MGR,HIREDATE,SAL,COMM,DEPTNO) values (2,'jerry',1,to_timestamp('10-9月 -15 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),1200,0,2);
Insert into T_EMP (EMPNO,ENAME,MGR,HIREDATE,SAL,COMM,DEPTNO) values (3,'Tom',2,to_timestamp('13-9月 -15 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),1600,0,1);
Insert into T_EMP (EMPNO,ENAME,MGR,HIREDATE,SAL,COMM,DEPTNO) values (4,'Anna',1,to_timestamp('13-9月 -15 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),900,0,2);

---------------------------------------------------
--   END DATA FOR TABLE T_EMP
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE ADMIN_INFO
--   FILTER = none used
---------------------------------------------------
REM INSERTING into ADMIN_INFO
Insert into ADMIN_INFO (ADMIN_ID,ADMIN_CODE,PASSWORD,NAME,TELEPHONE,EMAIL,ENROLLDATE) values (8020,'cccccc','cccc','ccccc','123456','ccc@tarena.com',to_timestamp('04-10月-15 09.42.33.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'));
Insert into ADMIN_INFO (ADMIN_ID,ADMIN_CODE,PASSWORD,NAME,TELEPHONE,EMAIL,ENROLLDATE) values (8021,'dddd','dddd','dddd','123456','123@123.com',to_timestamp('04-10月-15 09.48.29.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'));
Insert into ADMIN_INFO (ADMIN_ID,ADMIN_CODE,PASSWORD,NAME,TELEPHONE,EMAIL,ENROLLDATE) values (2000,'admin','123','ADMIN','123456789','admin@tarena.com.cn',to_timestamp('07-9月 -15 09.01.55.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'));
Insert into ADMIN_INFO (ADMIN_ID,ADMIN_CODE,PASSWORD,NAME,TELEPHONE,EMAIL,ENROLLDATE) values (3000,'zhangfei','123','ZhangFei','123456789','zhangfei@tarena.com.cn',to_timestamp('07-9月 -15 09.01.55.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'));
Insert into ADMIN_INFO (ADMIN_ID,ADMIN_CODE,PASSWORD,NAME,TELEPHONE,EMAIL,ENROLLDATE) values (4000,'liubei','123','LiuBei','123456789','liubei@tarena.com.cn',to_timestamp('07-9月 -15 09.01.55.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'));
Insert into ADMIN_INFO (ADMIN_ID,ADMIN_CODE,PASSWORD,NAME,TELEPHONE,EMAIL,ENROLLDATE) values (5000,'caocao','123','曹操','123456789','caocao@tarena.com.cn',to_timestamp('07-9月 -15 09.01.55.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'));
Insert into ADMIN_INFO (ADMIN_ID,ADMIN_CODE,PASSWORD,NAME,TELEPHONE,EMAIL,ENROLLDATE) values (6000,'aaa','123','AAA','123456789','aaa@tarena.com.cn',to_timestamp('07-9月 -15 09.01.55.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'));

---------------------------------------------------
--   END DATA FOR TABLE ADMIN_INFO
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE ADMIN_ROLE
--   FILTER = none used
---------------------------------------------------
REM INSERTING into ADMIN_ROLE
Insert into ADMIN_ROLE (ADMIN_ID,ROLE_ID) values (2000,100);
Insert into ADMIN_ROLE (ADMIN_ID,ROLE_ID) values (3000,200);
Insert into ADMIN_ROLE (ADMIN_ID,ROLE_ID) values (4000,300);
Insert into ADMIN_ROLE (ADMIN_ID,ROLE_ID) values (5000,100);
Insert into ADMIN_ROLE (ADMIN_ID,ROLE_ID) values (5000,200);
Insert into ADMIN_ROLE (ADMIN_ID,ROLE_ID) values (5000,300);
Insert into ADMIN_ROLE (ADMIN_ID,ROLE_ID) values (8020,100);
Insert into ADMIN_ROLE (ADMIN_ID,ROLE_ID) values (8021,300);

---------------------------------------------------
--   END DATA FOR TABLE ADMIN_ROLE
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE SERVICE_UPDATE_BAK
--   FILTER = none used
---------------------------------------------------
REM INSERTING into SERVICE_UPDATE_BAK
Insert into SERVICE_UPDATE_BAK (ID,SERVICE_ID,COST_ID) values (2,3003,3);

---------------------------------------------------
--   END DATA FOR TABLE SERVICE_UPDATE_BAK
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE ROLE_INFO
--   FILTER = none used
---------------------------------------------------
REM INSERTING into ROLE_INFO
Insert into ROLE_INFO (ROLE_ID,NAME) values (400,'aaa');
Insert into ROLE_INFO (ROLE_ID,NAME) values (1002,'管理');
Insert into ROLE_INFO (ROLE_ID,NAME) values (600,'ccc');
Insert into ROLE_INFO (ROLE_ID,NAME) values (100,'管理员');
Insert into ROLE_INFO (ROLE_ID,NAME) values (200,'营业员');
Insert into ROLE_INFO (ROLE_ID,NAME) values (300,'经理');

---------------------------------------------------
--   END DATA FOR TABLE ROLE_INFO
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE BILL
--   FILTER = none used
---------------------------------------------------
REM INSERTING into BILL
Insert into BILL (BILL_ID,ACCOUNT_ID,BILL_MONTH,COST,PAYMENT_MODE,PAY_STATE) values (1,1011,'201501',200,null,'0         ');
Insert into BILL (BILL_ID,ACCOUNT_ID,BILL_MONTH,COST,PAYMENT_MODE,PAY_STATE) values (2,1005,'201501',500,'0','1         ');
Insert into BILL (BILL_ID,ACCOUNT_ID,BILL_MONTH,COST,PAYMENT_MODE,PAY_STATE) values (3,1005,'201502',200,null,'0         ');
Insert into BILL (BILL_ID,ACCOUNT_ID,BILL_MONTH,COST,PAYMENT_MODE,PAY_STATE) values (4,1010,'201501',1000,'1','1         ');

---------------------------------------------------
--   END DATA FOR TABLE BILL
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE COST
--   FILTER = none used
---------------------------------------------------
REM INSERTING into COST
Insert into COST (COST_ID,NAME,BASE_DURATION,BASE_COST,UNIT_COST,STATUS,DESCR,CREATIME,STARTIME,COST_TYPE) values (1,'5.9元套餐',20,5.9,0.4,'0','5.9元20小时/月,超出部分0.4元/时',to_timestamp('07-9月 -15 09.00.11.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),null,'1');
Insert into COST (COST_ID,NAME,BASE_DURATION,BASE_COST,UNIT_COST,STATUS,DESCR,CREATIME,STARTIME,COST_TYPE) values (2,'6.9元套餐',40,6.9,0.3,'0','6.9元40小时/月,超出部分0.3元/时',to_timestamp('07-9月 -15 09.00.11.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),null,'1');
Insert into COST (COST_ID,NAME,BASE_DURATION,BASE_COST,UNIT_COST,STATUS,DESCR,CREATIME,STARTIME,COST_TYPE) values (3,'8.5元套餐',100,8.5,0.2,'1','8.5元100小时/月,超出部分0.2元/时',to_timestamp('07-9月 -15 09.00.11.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),null,'1');
Insert into COST (COST_ID,NAME,BASE_DURATION,BASE_COST,UNIT_COST,STATUS,DESCR,CREATIME,STARTIME,COST_TYPE) values (4,'10.5元套餐',200,10.5,0.1,'1','10.5元200小时/月,超出部分0.1元/时',to_timestamp('07-9月 -15 09.00.11.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),null,'1');
Insert into COST (COST_ID,NAME,BASE_DURATION,BASE_COST,UNIT_COST,STATUS,DESCR,CREATIME,STARTIME,COST_TYPE) values (5,'计时收费',null,null,0.5,'0','0.5元/时,不使用不收费',to_timestamp('07-9月 -15 09.00.12.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),null,'3');
Insert into COST (COST_ID,NAME,BASE_DURATION,BASE_COST,UNIT_COST,STATUS,DESCR,CREATIME,STARTIME,COST_TYPE) values (6,'包月',null,20,null,'0','每月20元,不限制使用时间',to_timestamp('07-9月 -15 09.00.12.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),null,'2');

---------------------------------------------------
--   END DATA FOR TABLE COST
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE HOST
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HOST
Insert into HOST (HOST_ID,NAME,LOCATION) values ('192.168.0.26','sunv210','beijing');
Insert into HOST (HOST_ID,NAME,LOCATION) values ('192.168.0.20','sun-server','beijing');
Insert into HOST (HOST_ID,NAME,LOCATION) values ('192.168.0.23','sun280','beijing');
Insert into HOST (HOST_ID,NAME,LOCATION) values ('192.168.0.200','ultra10','beijing');

---------------------------------------------------
--   END DATA FOR TABLE HOST
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE BILL_ITEM
--   FILTER = none used
---------------------------------------------------
REM INSERTING into BILL_ITEM
Insert into BILL_ITEM (ITEM_ID,BILL_ID,SERVICE_ID,COST) values (1,1,2001,1000);
Insert into BILL_ITEM (ITEM_ID,BILL_ID,SERVICE_ID,COST) values (2,3,2001,300);

---------------------------------------------------
--   END DATA FOR TABLE BILL_ITEM
---------------------------------------------------
--------------------------------------------------------
--  Constraints for Table ACCOUNT
--------------------------------------------------------

  ALTER TABLE "ACCOUNT" ADD CONSTRAINT "ACCOUNT_GENDER_CK" CHECK (gender in (0,1)) ENABLE;
 
  ALTER TABLE "ACCOUNT" ADD CONSTRAINT "ACCOUNT_ID_PK" PRIMARY KEY ("ACCOUNT_ID") ENABLE;
 
  ALTER TABLE "ACCOUNT" ADD CONSTRAINT "ACCOUNT_INCARD_NO" UNIQUE ("IDCARD_NO") ENABLE;
 
  ALTER TABLE "ACCOUNT" ADD CONSTRAINT "ACCOUNT_LOGIN_NAME_UK" UNIQUE ("LOGIN_NAME") ENABLE;
 
  ALTER TABLE "ACCOUNT" ADD CONSTRAINT "ACCOUNT_STATUS_CK" CHECK (status in (0,1,2)) ENABLE;
 
  ALTER TABLE "ACCOUNT" MODIFY ("LOGIN_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "ACCOUNT" MODIFY ("LOGIN_PASSWD" NOT NULL ENABLE);
 
  ALTER TABLE "ACCOUNT" MODIFY ("REAL_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "ACCOUNT" MODIFY ("IDCARD_NO" NOT NULL ENABLE);
 
  ALTER TABLE "ACCOUNT" MODIFY ("TELEPHONE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ADMIN_INFO
--------------------------------------------------------

  ALTER TABLE "ADMIN_INFO" MODIFY ("ADMIN_ID" NOT NULL ENABLE);
 
  ALTER TABLE "ADMIN_INFO" MODIFY ("ADMIN_CODE" NOT NULL ENABLE);
 
  ALTER TABLE "ADMIN_INFO" MODIFY ("PASSWORD" NOT NULL ENABLE);
 
  ALTER TABLE "ADMIN_INFO" MODIFY ("NAME" NOT NULL ENABLE);
 
  ALTER TABLE "ADMIN_INFO" MODIFY ("ENROLLDATE" NOT NULL ENABLE);
 
  ALTER TABLE "ADMIN_INFO" ADD PRIMARY KEY ("ADMIN_ID") ENABLE;
 
  ALTER TABLE "ADMIN_INFO" ADD UNIQUE ("ADMIN_CODE") ENABLE;
--------------------------------------------------------
--  Constraints for Table ADMIN_ROLE
--------------------------------------------------------

  ALTER TABLE "ADMIN_ROLE" ADD CONSTRAINT "ADMIN_ROLE_PK" PRIMARY KEY ("ADMIN_ID", "ROLE_ID") ENABLE;
 
  ALTER TABLE "ADMIN_ROLE" MODIFY ("ADMIN_ID" NOT NULL ENABLE);
 
  ALTER TABLE "ADMIN_ROLE" MODIFY ("ROLE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BILL
--------------------------------------------------------

  ALTER TABLE "BILL" ADD CONSTRAINT "BILL_ID_PK" PRIMARY KEY ("BILL_ID") ENABLE;
 
  ALTER TABLE "BILL" ADD CONSTRAINT "BILL_PAYMENT_CODE_CK" CHECK (payment_mode in (0,1,2,3)) ENABLE;
 
  ALTER TABLE "BILL" ADD CONSTRAINT "BILL_PAY_STATE_CK" CHECK (pay_state in (0,1)) ENABLE;
 
  ALTER TABLE "BILL" MODIFY ("ACCOUNT_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BILL_ITEM
--------------------------------------------------------

  ALTER TABLE "BILL_ITEM" ADD CONSTRAINT "BILL_ITEM_ID_PK" PRIMARY KEY ("ITEM_ID") ENABLE;
 
  ALTER TABLE "BILL_ITEM" MODIFY ("BILL_ID" NOT NULL ENABLE);
 
  ALTER TABLE "BILL_ITEM" MODIFY ("SERVICE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table COST
--------------------------------------------------------

  ALTER TABLE "COST" ADD CONSTRAINT "COST_ID_PK" PRIMARY KEY ("COST_ID") ENABLE;
 
  ALTER TABLE "COST" ADD CONSTRAINT "COST_STATUS_CK" CHECK (status  in  (0,1)) ENABLE;
 
  ALTER TABLE "COST" ADD CONSTRAINT "COST_TYPE_CK" CHECK (cost_type in  (1,2,3)) ENABLE;
 
  ALTER TABLE "COST" MODIFY ("NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FUNCTION_INFO
--------------------------------------------------------

  ALTER TABLE "FUNCTION_INFO" ADD CONSTRAINT "FUNCTION_INFO_ID_PK" PRIMARY KEY ("FUNCTION_ID") ENABLE;
 
  ALTER TABLE "FUNCTION_INFO" MODIFY ("FUNCTION_CODE" NOT NULL ENABLE);
 
  ALTER TABLE "FUNCTION_INFO" MODIFY ("MODULE_ID" NOT NULL ENABLE);
 
  ALTER TABLE "FUNCTION_INFO" MODIFY ("NAME" NOT NULL ENABLE);
 
  ALTER TABLE "FUNCTION_INFO" MODIFY ("URL" NOT NULL ENABLE);
 
  ALTER TABLE "FUNCTION_INFO" ADD UNIQUE ("FUNCTION_CODE") ENABLE;
--------------------------------------------------------
--  Constraints for Table HOST
--------------------------------------------------------

  ALTER TABLE "HOST" ADD CONSTRAINT "HOST_ID_PK" PRIMARY KEY ("HOST_ID") ENABLE;
--------------------------------------------------------
--  Constraints for Table MODULE_INFO
--------------------------------------------------------

  ALTER TABLE "MODULE_INFO" ADD CONSTRAINT "MODULE_INFO_ID_PK" PRIMARY KEY ("MODULE_ID") ENABLE;
 
  ALTER TABLE "MODULE_INFO" MODIFY ("NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ROLE_INFO
--------------------------------------------------------

  ALTER TABLE "ROLE_INFO" ADD CONSTRAINT "ROLE_INFO_ID_PK" PRIMARY KEY ("ROLE_ID") ENABLE;
 
  ALTER TABLE "ROLE_INFO" MODIFY ("NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ROLE_MODULE
--------------------------------------------------------

  ALTER TABLE "ROLE_MODULE" ADD CONSTRAINT "ROLE_MODULE_PK" PRIMARY KEY ("ROLE_ID", "MODULE_ID") ENABLE;
 
  ALTER TABLE "ROLE_MODULE" MODIFY ("ROLE_ID" NOT NULL ENABLE);
 
  ALTER TABLE "ROLE_MODULE" MODIFY ("MODULE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SERVICE
--------------------------------------------------------

  ALTER TABLE "SERVICE" ADD CONSTRAINT "SERVICE_ID_PK" PRIMARY KEY ("SERVICE_ID") ENABLE;
 
  ALTER TABLE "SERVICE" ADD CONSTRAINT "SERVICE_STATUS_CK" CHECK ( status in (0,1,2) ) ENABLE;
 
  ALTER TABLE "SERVICE" ADD CONSTRAINT "SERVICE_UNIXHOST_OSUSERNAME_UK" UNIQUE ("UNIX_HOST", "OS_USERNAME") ENABLE;
 
  ALTER TABLE "SERVICE" MODIFY ("UNIX_HOST" CONSTRAINT "SERVICE_UNIX_HOST_FK" NOT NULL ENABLE);
 
  ALTER TABLE "SERVICE" MODIFY ("ACCOUNT_ID" NOT NULL ENABLE);
 
  ALTER TABLE "SERVICE" MODIFY ("OS_USERNAME" NOT NULL ENABLE);
 
  ALTER TABLE "SERVICE" MODIFY ("LOGIN_PASSWD" NOT NULL ENABLE);
 
  ALTER TABLE "SERVICE" MODIFY ("COST_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SERVICE_DETAIL
--------------------------------------------------------

  ALTER TABLE "SERVICE_DETAIL" ADD CONSTRAINT "SERVICE_DTAIL_ID_PK" PRIMARY KEY ("DETAIL_ID") ENABLE;
 
  ALTER TABLE "SERVICE_DETAIL" MODIFY ("SERVICE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SERVICE_UPDATE_BAK
--------------------------------------------------------

  ALTER TABLE "SERVICE_UPDATE_BAK" MODIFY ("SERVICE_ID" NOT NULL ENABLE);
 
  ALTER TABLE "SERVICE_UPDATE_BAK" MODIFY ("COST_ID" NOT NULL ENABLE);
 
  ALTER TABLE "SERVICE_UPDATE_BAK" ADD PRIMARY KEY ("ID") ENABLE;
--------------------------------------------------------
--  DDL for Index ACCOUNT_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACCOUNT_ID_PK" ON "ACCOUNT" ("ACCOUNT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ACCOUNT_INCARD_NO
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACCOUNT_INCARD_NO" ON "ACCOUNT" ("IDCARD_NO") 
  ;
--------------------------------------------------------
--  DDL for Index ACCOUNT_LOGIN_NAME_UK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACCOUNT_LOGIN_NAME_UK" ON "ACCOUNT" ("LOGIN_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index ADMIN_ROLE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ADMIN_ROLE_PK" ON "ADMIN_ROLE" ("ADMIN_ID", "ROLE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index BILL_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BILL_ID_PK" ON "BILL" ("BILL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index BILL_ITEM_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BILL_ITEM_ID_PK" ON "BILL_ITEM" ("ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index COST_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "COST_ID_PK" ON "COST" ("COST_ID") 
  ;
--------------------------------------------------------
--  DDL for Index FUNCTION_INFO_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FUNCTION_INFO_ID_PK" ON "FUNCTION_INFO" ("FUNCTION_ID") 
  ;
--------------------------------------------------------
--  DDL for Index HOST_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HOST_ID_PK" ON "HOST" ("HOST_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MODULE_INFO_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MODULE_INFO_ID_PK" ON "MODULE_INFO" ("MODULE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ROLE_INFO_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROLE_INFO_ID_PK" ON "ROLE_INFO" ("ROLE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ROLE_MODULE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROLE_MODULE_PK" ON "ROLE_MODULE" ("ROLE_ID", "MODULE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SERVICE_DTAIL_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SERVICE_DTAIL_ID_PK" ON "SERVICE_DETAIL" ("DETAIL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SERVICE_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SERVICE_ID_PK" ON "SERVICE" ("SERVICE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SERVICE_UNIXHOST_OSUSERNAME_UK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SERVICE_UNIXHOST_OSUSERNAME_UK" ON "SERVICE" ("UNIX_HOST", "OS_USERNAME") 
  ;
--------------------------------------------------------
--  Ref Constraints for Table ACCOUNT
--------------------------------------------------------

  ALTER TABLE "ACCOUNT" ADD CONSTRAINT "ACCOUNT_RECOMMENDER_ID_FK" FOREIGN KEY ("RECOMMENDER_ID")
	  REFERENCES "ACCOUNT" ("ACCOUNT_ID") ENABLE;

--------------------------------------------------------
--  Ref Constraints for Table ADMIN_ROLE
--------------------------------------------------------

  ALTER TABLE "ADMIN_ROLE" ADD CONSTRAINT "ADMIN_ROLE_ADMIN_ID_FK" FOREIGN KEY ("ADMIN_ID")
	  REFERENCES "ADMIN_INFO" ("ADMIN_ID") ENABLE;
 
  ALTER TABLE "ADMIN_ROLE" ADD CONSTRAINT "ADMIN_ROLE_ROLE_ID_FK" FOREIGN KEY ("ROLE_ID")
	  REFERENCES "ROLE_INFO" ("ROLE_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BILL
--------------------------------------------------------

  ALTER TABLE "BILL" ADD CONSTRAINT "BILL_ACCOUNT_ID" FOREIGN KEY ("ACCOUNT_ID")
	  REFERENCES "ACCOUNT" ("ACCOUNT_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BILL_ITEM
--------------------------------------------------------

  ALTER TABLE "BILL_ITEM" ADD CONSTRAINT "BILL_ITME_BILL_ID" FOREIGN KEY ("BILL_ID")
	  REFERENCES "BILL" ("BILL_ID") ENABLE;

--------------------------------------------------------
--  Ref Constraints for Table FUNCTION_INFO
--------------------------------------------------------

  ALTER TABLE "FUNCTION_INFO" ADD CONSTRAINT "FUNCTION_MODULE_ID_FK" FOREIGN KEY ("MODULE_ID")
	  REFERENCES "MODULE_INFO" ("MODULE_ID") ENABLE;



--------------------------------------------------------
--  Ref Constraints for Table ROLE_MODULE
--------------------------------------------------------

  ALTER TABLE "ROLE_MODULE" ADD CONSTRAINT "ROLE_MODULE_MODULE_ID_FK" FOREIGN KEY ("MODULE_ID")
	  REFERENCES "MODULE_INFO" ("MODULE_ID") ENABLE;
 
  ALTER TABLE "ROLE_MODULE" ADD CONSTRAINT "ROLE_MODULE_ROLE_ID_FK" FOREIGN KEY ("ROLE_ID")
	  REFERENCES "ROLE_INFO" ("ROLE_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SERVICE
--------------------------------------------------------

  ALTER TABLE "SERVICE" ADD CONSTRAINT "SERVICE_ACCOUNT_ID_FK" FOREIGN KEY ("ACCOUNT_ID")
	  REFERENCES "ACCOUNT" ("ACCOUNT_ID") ENABLE;
 
  ALTER TABLE "SERVICE" ADD CONSTRAINT "SERVICE_COST_ID_FK" FOREIGN KEY ("COST_ID")
	  REFERENCES "COST" ("COST_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SERVICE_DETAIL
--------------------------------------------------------

  ALTER TABLE "SERVICE_DETAIL" ADD CONSTRAINT "SERVICE_DETAIL_SERVICE_ID" FOREIGN KEY ("SERVICE_ID")
	  REFERENCES "SERVICE" ("SERVICE_ID") ENABLE;

