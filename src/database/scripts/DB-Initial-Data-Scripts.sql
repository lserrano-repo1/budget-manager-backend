/*
 INITIAL DATA LOADING
 Budget Manager SYSTEM
 Author: Luis E. Serrano
 Date: December 2022
 Version: 1.0.0
*/

/* USERS */
/*
	"email":"test2@domain.com",
    "password":"secret1"
*/
INSERT INTO BUDGETMAN.USERDATA(USR_SALUTATION, USR_FIRST_NAME, USR_LAST_NAME, USR_EMAIL, USR_PASSWORD, USR_TOKEN)  VALUES ('Sr.','Luis','Serrano','test2@domain.com', '$2a$08$RddRLK5faZtSfPDmZEi1.e4ynTOxerSGUeJHh0JTKStK15/EZ9cZi','8D1C02DC59500E8E24682E2712F5B263');
commit;

/* BANK */
INSERT INTO BUDGETMAN.BANK (BNK_NAME, BNK_ADDRESS, BNK_CONTACT, BNK_CONTACT_EMAIL) VALUES ('CITY Bank', 'Centro Financiero Gigante', 'Erlinda Smith', 'erlinda.smith@citi.bank.sv');
INSERT INTO BUDGETMAN.BANK (BNK_NAME, BNK_ADDRESS, BNK_CONTACT, BNK_CONTACT_EMAIL) VALUES ('BMO', 'Montreal CA', 'Jackes Custeau', 'jc.poirot@bmo.ca');
INSERT INTO BUDGETMAN.BANK (BNK_NAME, BNK_ADDRESS, BNK_CONTACT, BNK_CONTACT_EMAIL) VALUES ('Santander', 'Madrid España', 'Carlos Camallot', 'c.camalot@santander.es');
commit;

/* CATEGORIES */
INSERT INTO BUDGETMAN.CATEGORIES (cat_name) values ('Meals');
INSERT INTO BUDGETMAN.CATEGORIES (cat_name) values ('Transportation');
INSERT INTO BUDGETMAN.CATEGORIES (cat_name) values ('Recreation');
INSERT INTO BUDGETMAN.CATEGORIES (cat_name) values ('Travels');
INSERT INTO BUDGETMAN.CATEGORIES (cat_name) values ('Maintenance');
INSERT INTO BUDGETMAN.CATEGORIES (cat_name) values ('Studies');
INSERT INTO BUDGETMAN.CATEGORIES (cat_name) values ('Supermarket');
INSERT INTO BUDGETMAN.CATEGORIES (cat_name) values ('Clothes');
INSERT INTO BUDGETMAN.CATEGORIES (cat_name) values ('Shoes');
INSERT INTO BUDGETMAN.CATEGORIES (cat_name) values ('Other shooping');
commit;

/* Transaction Types */
INSERT INTO BUDGETMAN.TRANTYPE (TYP_NAME) VALUES ('INCOME');
INSERT INTO BUDGETMAN.TRANTYPE (TYP_NAME) VALUES ('EXPENSE');
commit;

/* CURRENCIES */
INSERT INTO BUDGETMAN.CURRENCY (cur_name,CUR_ABBREVIATION) VALUES ('EURO', 'EUR');
INSERT INTO BUDGETMAN.CURRENCY (cur_name,CUR_ABBREVIATION) VALUES ('USA DOLLAR', 'USD');
INSERT INTO BUDGETMAN.CURRENCY (cur_name,CUR_ABBREVIATION) VALUES ('CANADA DOLLAR', 'CAD');
commit;

/* EXCHANGE RATES */
INSERT INTO BUDGETMAN.EXCHGRATE (CUR_ID, EXC_LAST_UPDATE, EXC_VALUE, EXC_CURRENCY_REF) VALUES (2, sysdate, 1.000, 'USD');
INSERT INTO BUDGETMAN.EXCHGRATE (CUR_ID, EXC_LAST_UPDATE, EXC_VALUE, EXC_CURRENCY_REF) VALUES (1, sysdate, 1.106, 'USD');
INSERT INTO BUDGETMAN.EXCHGRATE (CUR_ID, EXC_LAST_UPDATE, EXC_VALUE, EXC_CURRENCY_REF) VALUES (3, sysdate, 0.950, 'USD');
commit;

