/*
 * Copyright 2005-2014 The Kuali Foundation
 * 
 * Licensed under the Educational Community License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.opensource.org/licenses/ecl1.php
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.kuali.kra.protocol.actions.delete;

import org.kuali.kra.protocol.ProtocolBase;
import org.kuali.kra.protocol.onlinereview.ProtocolOnlineReviewService;
import org.kuali.rice.kew.api.exception.WorkflowException;
import org.kuali.rice.krad.service.BusinessObjectService;
import org.kuali.rice.krad.service.DocumentService;

public abstract class ProtocolDeleteServiceImplBase implements ProtocolDeleteService {

    private DocumentService documentService;
    private BusinessObjectService businessObjectService;
    private ProtocolOnlineReviewService protocolOnlineReviewService;
    
    private static final String DELETE_FINALIZE_OLR_ANNOTATION = "Online Review finalized as part of withdraw action on protocol.";

    public void setDocumentService(DocumentService documentService) {
        this.documentService = documentService;
    }
    
    /**
     * Set the business object service.
     * @param businessObjectService the business object service
     */
    public void setBusinessObjectService(BusinessObjectService businessObjectService) {
        this.businessObjectService = businessObjectService;
    }
    
    /**
     * We never delete documents from the database.  Rather, we simply mark
     * it as deleted.
     * @throws WorkflowException 
     * @see org.kuali.kra.irb.actions.delete.ProtocolDeleteService#delete(org.kuali.kra.irb.ProtocolBase, org.kuali.kra.irb.actions.delete.ProtocolDeleteBean)
     */
    public void delete(ProtocolBase protocol, ProtocolDeleteBean deleteBean) throws WorkflowException {
        protocol.setProtocolStatusCode(getDeletedProtocolStatusCodeHook());
        protocol.setActive(false);
        businessObjectService.save(protocol.getProtocolDocument());
        
        /*
         * By marking the protocol document as canceled, the protocol
         * is removed from the user's action list.
         */
        documentService.cancelDocument(protocol.getProtocolDocument(), null);
        protocolOnlineReviewService.finalizeOnlineReviews(protocol.getProtocolSubmission(), DELETE_FINALIZE_OLR_ANNOTATION);
    
    }

    protected abstract String getDeletedProtocolStatusCodeHook();

    public ProtocolOnlineReviewService getProtocolOnlineReviewService() {
        return protocolOnlineReviewService;
    }

    public void setProtocolOnlineReviewService(ProtocolOnlineReviewService protocolOnlineReviewService) {
        this.protocolOnlineReviewService = protocolOnlineReviewService;
    }

}
