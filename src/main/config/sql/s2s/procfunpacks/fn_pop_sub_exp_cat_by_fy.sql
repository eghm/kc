create or replace function fn_pop_sub_exp_cat_by_fy (period_start in OSP$SUBCONTRACT_EXP_CAT_DET.FISCAL_PERIOD%TYPE,
																	 period_end in OSP$SUBCONTRACT_EXP_CAT_DET.FISCAL_PERIOD%TYPE) return number is 

begin


delete from OSP$SUB_EXP_CAT_BY_FY;

begin

	INSERT INTO OSP$SUB_EXP_CAT_BY_FY
	(MIT_AWARD_NUMBER,               
	LARGE_BUSINESS_AMT,             
	SMALL_BUSINESS_AMT,             
	WOMAN_OWNED_AMT,                
	A8_DISADVANTAGE_AMT,            
	HUB_ZONE_AMT,                   
	VETERAN_OWNED_AMT,              
	SERVICE_DISABLED_VET_OWNED_AMT,
	HISTORICAL_BLACK_COLLEGE_AMT,   
	UPDATE_TIMESTAMP,               
	UPDATE_USER)                    
	SELECT distinct det.MIT_AWARD_NUMBER, LB.AMT LARGE_BUSINESS, SB.AMT SMALL_BUSINESS,
						 WO.AMT WOMAN_OWNED, DA.AMT DISADVANTAGE, HZ.AMT HUB_ZONE,
						 VO.AMT VETERAN_OWNED, DV.AMT DISABLE_VETERAN, HBC.AMT HB_COLLEGE, sysdate, user
	FROM OSP$SUBCONTRACT_EXP_CAT_DET DET, 
	(select MIT_AWARD_NUMBER, sum(AMOUNT) amt
	from OSP$SUBCONTRACT_EXP_CAT_DET 
	where IS_LARGE_BUSINESS = 'Y'
	group by MIT_AWARD_NUMBER) LB,
	(select MIT_AWARD_NUMBER, sum(AMOUNT) amt
	from OSP$SUBCONTRACT_EXP_CAT_DET 
	where IS_SMALL_BUSINESS = 'Y'
	group by MIT_AWARD_NUMBER) SB,
	(select MIT_AWARD_NUMBER, sum(AMOUNT) amt
	from OSP$SUBCONTRACT_EXP_CAT_DET 
	where IS_WOMAN_OWNED = 'Y'
	group by MIT_AWARD_NUMBER) WO,
	(select MIT_AWARD_NUMBER, sum(AMOUNT) amt
	from OSP$SUBCONTRACT_EXP_CAT_DET 
	where IS_8A_DISADVANTAGE = 'Y'
	group by MIT_AWARD_NUMBER) DA,
	(select MIT_AWARD_NUMBER, sum(AMOUNT) amt
	from OSP$SUBCONTRACT_EXP_CAT_DET 
	where IS_HUB_ZONE = 'Y'
	group by MIT_AWARD_NUMBER) HZ,
	(select MIT_AWARD_NUMBER, sum(AMOUNT) amt
	from OSP$SUBCONTRACT_EXP_CAT_DET 
	where IS_VETERAN_OWNED = 'Y'
	group by MIT_AWARD_NUMBER) VO,
	(select MIT_AWARD_NUMBER, sum(AMOUNT) amt
	from OSP$SUBCONTRACT_EXP_CAT_DET 
	where IS_SERVICE_DISABLED_VET_OWNED = 'Y'
	group by MIT_AWARD_NUMBER) DV,
	(select MIT_AWARD_NUMBER, sum(AMOUNT) amt
	from OSP$SUBCONTRACT_EXP_CAT_DET 
	where IS_HISTORICAL_BLACK_COLLEGE = 'Y'
	group by MIT_AWARD_NUMBER) HBC
	WHERE DET.MIT_AWARD_NUMBER = LB.MIT_AWARD_NUMBER (+)
		and DET.MIT_AWARD_NUMBER = SB.MIT_AWARD_NUMBER (+) 
		and DET.MIT_AWARD_NUMBER = WO.MIT_AWARD_NUMBER (+) 
		and DET.MIT_AWARD_NUMBER = DA.MIT_AWARD_NUMBER (+) 
		and DET.MIT_AWARD_NUMBER = HZ.MIT_AWARD_NUMBER (+) 
		and DET.MIT_AWARD_NUMBER = VO.MIT_AWARD_NUMBER (+) 
		and DET.MIT_AWARD_NUMBER = DV.MIT_AWARD_NUMBER (+)
		and DET.MIT_AWARD_NUMBER = HBC.MIT_AWARD_NUMBER (+)  
  AND DET.FISCAL_PERIOD >= period_start AND DET.FISCAL_PERIOD <= period_end;
	
	
	
	exception
		when others then
			raise_application_error(-20100, 'Error inserting data in OSP$SUB_EXP_CAT_BY_FY. SQLCODE - ' || SQLCODE || 
										  ' - Error - ' || SQLERRM);
			return -1;
end;

Return(1);
end;

/

