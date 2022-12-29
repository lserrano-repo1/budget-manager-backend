/*
 TABLE CREATION
 Budget Manager SYSTEM
 Author: Luis E. Serrano
 Date: December 2022
 Version: 1.0.0
*/

/* Table creation scripts */

/* create user data (USERDATA) table */
CREATE TABLE BUDGETMAN.USERDATA (
	USR_ID number GENERATED BY DEFAULT AS IDENTITY,
	USR_SALUTATION varchar2(25),
	USR_FIRST_NAME varchar2(80),
	USR_LAST_NAME varchar2(80),
	USR_EMAIL varchar2(100),
	USR_PASSWORD varchar2(100),
	USR_TOKEN varchar2(1000),
	USR_CREATION_DATE DATE DEFAULT sysdate,
	USR_LAST_MODIFIED DATE,
	PRIMARY KEY(USR_ID)
);


/* create table BANK */
CREATE TABLE BUDGETMAN.BANK (
	BNK_ID NUMBER GENERATED BY DEFAULT AS IDENTITY ,
	BNK_NAME varchar2(80),
	BNK_ADDRESS varchar2(250),
	BNK_CONTACT varchar2(100),
	BNK_CONTACT_EMAIL varchar2(100),
	BNK_CREATION_DATE DATE DEFAULT sysdate,
	BNK_LAST_MODIFIED DATE,
	PRIMARY KEY (BNK_ID)
);

/* Transaction types */
CREATE TABLE BUDGETMAN.TRANTYPE (
	TYP_ID NUMBER GENERATED BY DEFAULT AS IDENTITY ,
	TYP_NAME varchar2(80),
	PRIMARY KEY (TYP_ID)
);


/* Categories */
CREATE TABLE BUDGETMAN.CATEGORIES (
	CAT_ID NUMBER GENERATED BY DEFAULT AS IDENTITY,
	CAT_NAME varchar2(100),
	PRIMARY KEY(CAT_ID)
);


/* Currencies */
CREATE TABLE BUDGETMAN.CURRENCY(
	CUR_ID NUMBER GENERATED BY DEFAULT AS IDENTITY,
	CUR_NAME varchar2(100),
	CUR_ABBREVIATION varchar2(5),
	PRIMARY KEY(CUR_ID)
);


/* Exchange rates */
CREATE TABLE BUDGETMAN.EXCHGRATE(
	EXC_ID NUMBER GENERATED BY DEFAULT AS IDENTITY,
	CUR_ID NUMBER, 
	EXC_LAST_UPDATE DATE,
	EXC_VALUE NUMBER(9,4),
	EXC_CURRENCY_REF varchar2(50),
	PRIMARY KEY(EXC_ID),
	FOREIGN KEY(CUR_ID) REFERENCES BUDGETMAN.CURRENCY(CUR_ID)  
);

/* Account */ 
CREATE TABLE BUDGETMAN.ACCOUNT (
	ACC_ID NUMBER GENERATED BY DEFAULT AS IDENTITY ,
	USR_ID NUMBER ,
	BNK_ID NUMBER ,
	CUR_ID NUMBER,
	ACC_NUMBER varchar2(100),
	ACC_CREATION_DATE DATE DEFAULT sysdate,
	ACC_LAST_UPDATED DATE,
	ACC_BALANCE NUMBER(*,4),
	PRIMARY KEY (ACC_ID),
	FOREIGN KEY(USR_ID) REFERENCES BUDGETMAN.USERDATA(USR_ID),
	FOREIGN KEY(BNK_ID) REFERENCES BUDGETMAN.BANK(BNK_ID),
	FOREIGN KEY(CUR_ID) REFERENCES BUDGETMAN.CURRENCY(CUR_ID)
);


/* Transaction */
CREATE TABLE BUDGETMAN.TRANSACTION (
	TRN_ID NUMBER GENERATED BY DEFAULT AS IDENTITY,
	CUR_ID NUMBER,
	ACC_ID NUMBER,
	CAT_ID NUMBER,
	TYP_ID NUMBER,
	TRN_CREATION_DATE DATE DEFAULT sysdate,
	TRN_AMOUNT NUMBER(*,4),
	TRN_DESCRIPTION varchar2(500),
	PRIMARY KEY(TRN_ID),
	FOREIGN KEY(CUR_ID) REFERENCES BUDGETMAN.CURRENCY(CUR_ID),
	FOREIGN KEY(ACC_ID) REFERENCES BUDGETMAN.ACCOUNT(ACC_ID),
	FOREIGN key(CAT_ID) REFERENCES BUDGETMAN.CATEGORIES(CAT_ID),
	FOREIGN KEY(TYP_ID) REFERENCES BUDGETMAN.TRANTYPE(TYP_ID)
);
commit;

CREATE OR REPLACE FUNCTION BUDGETMAN.TOKEN_GENERATOR(password_secret VARCHAR2) RETURN VARCHAR2
IS
	VRESULT VARCHAR2(4000);
BEGIN
	SELECT UTL_RAW.CAST_TO_VARCHAR2(UTL_I18N.STRING_TO_RAW(STANDARD_HASH(password_secret,'MD5'),'AL32UTF8')) INTO VRESULT FROM dual;
	RETURN VRESULT;
END TOKEN_GENERATOR;
/
