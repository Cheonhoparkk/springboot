SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS NEW_TABLE;




/* Create Tables */

CREATE TABLE PAPAGO_TEST
(
	PT_NUM int NOT NULL AUTO_INCREMENT,
	PT_SOURCE varchar(6) NOT NULL,
	PT_TARGET varchar(6) NOT NULL,
	PT_TEXT text NOT NULL,
	PT_RESULT text NOT NULL,
	PT_CREDAT char(8),
	PRIMARY KEY (PT_NUM)
);


