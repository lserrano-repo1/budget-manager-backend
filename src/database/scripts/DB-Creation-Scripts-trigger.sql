CREATE OR REPLACE TRIGGER upd_acc_income_balance_trg
AFTER INSERT OR UPDATE ON BUDGETMAN.TRANSACTION  
FOR EACH ROW 
DECLARE
	PRAGMA AUTONOMOUS_TRANSACTION;
	v_amount_inc BUDGETMAN.ACCOUNT.ACC_BALANCE%TYPE  DEFAULT 0;
	v_amount_exp BUDGETMAN.ACCOUNT.ACC_BALANCE%TYPE  DEFAULT 0;
BEGIN 

	dbms_output.put_line('STARTING trigger upd_acc_income_balance_trg');

	BEGIN
		SELECT DISTINCT sum(t.TRN_AMOUNT) OVER (PARTITION BY t.ACC_ID, t.TYP_ID) INTO v_amount_inc 
		FROM BUDGETMAN.TRANSACTION t 
		WHERE t.ACC_ID=:NEW.ACC_ID AND t.TYP_ID=1;
	EXCEPTION 
		WHEN NO_DATA_FOUND THEN
			IF(:NEW.TYP_ID=1) THEN
				v_amount_inc:=:NEW.TRN_AMOUNT;
			ELSE 
				v_amount_inc:=0;
			END IF;
	END;

	dbms_output.put_line('INIT = v_amount_inc:'|| v_amount_inc);


	BEGIN
		SELECT DISTINCT sum(t.TRN_AMOUNT) OVER (PARTITION BY t.ACC_ID, t.TYP_ID) INTO v_amount_exp
		FROM BUDGETMAN.TRANSACTION t 
		WHERE t.ACC_ID=:NEW.ACC_ID AND t.TYP_ID=2;
	EXCEPTION 
		WHEN NO_DATA_FOUND THEN
			IF(:NEW.TYP_ID=2) THEN
				v_amount_exp:=:NEW.TRN_AMOUNT;
			ELSE 
				v_amount_exp:=0;
			END IF;
			
	END;

	dbms_output.put_line('INIT = v_amount_exp:'|| v_amount_exp);
	


	dbms_output.put_line('--------------------------------');
	dbms_output.put_line('v_amount_inc:'|| v_amount_inc);
	dbms_output.put_line('v_amount_exp:'|| v_amount_exp);
	dbms_output.put_line('NEW.ACC_ID:'  || :NEW.ACC_ID);
	dbms_output.put_line('NEW.TRN_AMOUNT ='|| :NEW.TRN_AMOUNT);
	dbms_output.put_line('balance = (v_amount_inc - v_amount_exp) :'     || (v_amount_inc - v_amount_exp));

	UPDATE BUDGETMAN.ACCOUNT acc
		SET acc.ACC_BALANCE= (v_amount_inc-v_amount_exp)
		, acc.ACC_LAST_UPDATED =SYSDATE 
	WHERE acc.ACC_ID =:NEW.ACC_ID; 
	COMMIT;

	dbms_output.put_line('ENDING trigger upd_acc_income_balance_trg');
	
END upd_acc_income_balance_trg;


