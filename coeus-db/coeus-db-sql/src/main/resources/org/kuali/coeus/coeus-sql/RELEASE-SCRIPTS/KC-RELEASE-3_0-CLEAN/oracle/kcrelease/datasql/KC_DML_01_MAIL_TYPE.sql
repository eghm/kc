TRUNCATE TABLE MAIL_TYPE DROP STORAGE
/
INSERT INTO MAIL_TYPE (MAIL_TYPE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('1','Regular','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO MAIL_TYPE (MAIL_TYPE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('2','Electronic','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO MAIL_TYPE (MAIL_TYPE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('3','Delivery Service','admin',SYSDATE,SYS_GUID(),1)
/
