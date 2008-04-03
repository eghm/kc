CREATE OR REPLACE PROCEDURE          GET_PROP_BIO_FOR_PERSON
   ( AW_PROPOSAL_NUMBER IN OSP$EPS_PROP_PERSON_BIO.PROPOSAL_NUMBER%TYPE,
   	 AW_PERSON_ID IN OSP$EPS_PROP_PERSON_BIO.PERSON_ID%TYPE,
	  cur_generic IN OUT result_sets.cur_generic) is

	PDF_COUNT INTEGER ;
	SOURCE_COUNT INTEGER ;

begin


open cur_generic for

  SELECT OSP$EPS_PROP_PERSON_BIO.PROPOSAL_NUMBER,
  	     OSP$EPS_PROP_PERSON_BIO.PERSON_ID,
         OSP$EPS_PROP_PERSON_BIO.BIO_NUMBER,
         OSP$EPS_PROP_PERSON_BIO.DESCRIPTION,
         OSP$EPS_PROP_PERSON_BIO.UPDATE_TIMESTAMP,
         OSP$EPS_PROP_PERSON_BIO.UPDATE_USER,
			PDF_COUNT,		      -- For use in datawindow bitmap
			SOURCE_COUNT,	      -- For use in datawindow bitmap
   		6 PDF_FLAG_BORDER,   -- For setting border of pdf flag in datawindows (6=3D raised)
   		6 SOURCE_FLAG_BORDER, -- For setting border of source flag in datawindows (6=3D raised)
		OSP$EPS_PROP_PERSON_BIO_PDF.BIO_NUMBER as PDF_BIO_NUMBER,
--		OSP$EPS_PROP_PERSON_BIO_SOURCE.BIO_NUMBER as SOURCE_BIO_NUMBER,
		OSP$EPS_PROP_PERSON_BIO.DOCUMENT_TYPE_CODE, -- Added for Proposal Person Bio Enhancement
		OSP$EPS_PROP_PER_DOC_TYPE.DESCRIPTION AS DOCUMENT_TYPE_DESC -- Added for Proposal Person Bio Enhancement
    FROM OSP$EPS_PROP_PERSON_BIO,
		 OSP$EPS_PROP_PERSON_BIO_PDF,
--		 OSP$EPS_PROP_PERSON_BIO_SOURCE,
		 OSP$EPS_PROP_PER_DOC_TYPE -- Added for Proposal Person Bio Enhancement
   WHERE OSP$EPS_PROP_PERSON_BIO.PROPOSAL_NUMBER = AW_PROPOSAL_NUMBER
   AND OSP$EPS_PROP_PERSON_BIO.PERSON_ID = AW_PERSON_ID
   AND ((OSP$EPS_PROP_PERSON_BIO.PROPOSAL_NUMBER = OSP$EPS_PROP_PERSON_BIO_PDF.PROPOSAL_NUMBER (+))
   AND (OSP$EPS_PROP_PERSON_BIO.PERSON_ID = OSP$EPS_PROP_PERSON_BIO_PDF.PERSON_ID(+))
   AND (OSP$EPS_PROP_PERSON_BIO.BIO_NUMBER = OSP$EPS_PROP_PERSON_BIO_PDF.BIO_NUMBER(+)))
--    AND ((OSP$EPS_PROP_PERSON_BIO.PROPOSAL_NUMBER = OSP$EPS_PROP_PERSON_BIO_SOURCE.PROPOSAL_NUMBER (+))
--    AND (OSP$EPS_PROP_PERSON_BIO.PERSON_ID = OSP$EPS_PROP_PERSON_BIO_SOURCE.PERSON_ID(+))
--    AND (OSP$EPS_PROP_PERSON_BIO.BIO_NUMBER = OSP$EPS_PROP_PERSON_BIO_SOURCE.BIO_NUMBER(+)))
   AND  OSP$EPS_PROP_PERSON_BIO.DOCUMENT_TYPE_CODE = OSP$EPS_PROP_PER_DOC_TYPE.DOCUMENT_TYPE_CODE(+);-- Added for Proposal Person Bio Enhancement

end;
/

