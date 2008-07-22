CREATE OR REPLACE PROCEDURE          GET_ROLODEX ( al_RolodexId in number,
	   cur_generic IN OUT result_sets.cur_generic) is

begin


open cur_generic for
	 SELECT
	 	   OSP$ROLODEX.ROLODEX_ID,
		   OSP$ROLODEX.LAST_NAME,
		   OSP$ROLODEX.FIRST_NAME,
		   OSP$ROLODEX.MIDDLE_NAME,
		   OSP$ROLODEX.SUFFIX,
		   OSP$ROLODEX.PREFIX,
		   OSP$ROLODEX.TITLE,
		   OSP$ROLODEX.ORGANIZATION,
		   OSP$ROLODEX.ADDRESS_LINE_1,
		   OSP$ROLODEX.ADDRESS_LINE_2,
		   OSP$ROLODEX.ADDRESS_LINE_3,
		   OSP$ROLODEX.FAX_NUMBER,
		   OSP$ROLODEX.EMAIL_ADDRESS,
		   OSP$ROLODEX.CITY,
		   OSP$ROLODEX.COUNTY,
		   OSP$ROLODEX.STATE,
		   OSP$ROLODEX.POSTAL_CODE,
		   OSP$ROLODEX.COMMENTS,
		   OSP$ROLODEX.PHONE_NUMBER,
		   OSP$ROLODEX.COUNTRY_CODE,
		   OSP$ROLODEX.SPONSOR_CODE,
		   OSP$ROLODEX.OWNED_BY_UNIT,
		   OSP$ROLODEX.SPONSOR_ADDRESS_FLAG,
		   OSP$ROLODEX.DELETE_FLAG,
		   OSP$ROLODEX.CREATE_USER,
		   OSP$ROLODEX.UPDATE_TIMESTAMP,
		   OSP$ROLODEX.UPDATE_USER,
		   OSP$COUNTRY_CODE.COUNTRY_NAME
	  FROM OSP$ROLODEX, OSP$COUNTRY_CODE
	  WHERE ROLODEX_ID = al_RolodexId AND
	  		OSP$ROLODEX.COUNTRY_CODE =  OSP$COUNTRY_CODE.COUNTRY_CODE(+);
end;
/

