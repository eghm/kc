DELIMITER /
UPDATE KRIM_ENTITY_EMAIL_T 
SET EMAIL_ADDR = 'kc.grants.gov@kuali.org' 
WHERE ENTITY_ID=(select ENTITY_ID from KRIM_PRNCPL_T where PRNCPL_NM='quickstart')
/
DELIMITER ;
