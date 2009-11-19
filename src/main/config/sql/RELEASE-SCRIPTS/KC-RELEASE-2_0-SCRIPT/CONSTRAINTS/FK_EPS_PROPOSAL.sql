ALTER TABLE EPS_PROPOSAL 
    ADD CONSTRAINT FK_EPS_PROPOSAL_DOCUMENT FOREIGN KEY (DOCUMENT_NUMBER) 
                REFERENCES EPS_PROPOSAL_DOCUMENT (DOCUMENT_NUMBER) ENABLE; 
                
ALTER TABLE EPS_PROPOSAL 
    ADD CONSTRAINT EPS_PROPOSAL_FK1 FOREIGN KEY (HIERARCHY_PROPOSAL_NUMBER) 
                REFERENCES EPS_PROPOSAL (PROPOSAL_NUMBER) ;
