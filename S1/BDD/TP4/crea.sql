BEGIN 
EXECUTE IMMEDIATE 'DROP TABLE AB_NB';
EXCEPTION
 WHEN OTHERS THEN 
	IF SQLCODE != -942 THEN
	RAISE 
	END IF;
END;
/
/*********************/


CREATE TABLE AB_NB(
	NUMERO NUMBER(6, 0),
	NB NUMBER(3, 0),
	CONSTRAINT PK_NUM PRIMARY KEY (NUMERO),
	CONSTRAINT FK_NUM FOREIGN KEY (NUMERO) REFERENCES ABONNE.NUM_AB
);