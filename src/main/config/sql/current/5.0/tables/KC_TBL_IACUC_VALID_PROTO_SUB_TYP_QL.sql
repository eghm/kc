CREATE TABLE IACUC_VALID_PROTO_SUB_TYP_QL ( 
    VALID_PROTO_SUB_TYPE_QUAL_ID NUMBER(12,0) NOT NULL, 
    SUBMISSION_TYPE_CODE VARCHAR2(3) NOT NULL, 
    SUBMISSION_TYPE_QUAL_CODE VARCHAR2(3) NOT NULL, 
    UPDATE_TIMESTAMP DATE NOT NULL, 
    UPDATE_USER VARCHAR2(60) NOT NULL, 
    VER_NBR NUMBER(8,0) DEFAULT 1 NOT NULL, 
    OBJ_ID VARCHAR2(36) NOT NULL)
/
ALTER TABLE IACUC_VALID_PROTO_SUB_TYP_QL
ADD CONSTRAINT PK_AC_VALID_PROTO_SUB_TYP_QL 
PRIMARY KEY (VALID_PROTO_SUB_TYPE_QUAL_ID)
/
