/*
 * Copyright 2005-2010 The Kuali Foundation
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
package org.kuali.kra.protocol.actions.reviewcomments;

import java.util.List;

import org.kuali.kra.protocol.ProtocolDocument;
import org.kuali.kra.protocol.onlinereview.ProtocolReviewAttachment;
import org.kuali.kra.rule.BusinessRuleInterface;
import org.kuali.kra.rule.event.KraDocumentEventBaseExtension;

/**
 * 
 * This class is for the rule event of 'manage review attachment'
 */
public abstract class ProtocolManageReviewAttachmentEvent<PRA extends ProtocolReviewAttachment> extends KraDocumentEventBaseExtension {
    
    private String propertyName;
    private List<PRA> reviewAttachments;

    /**
     * Constructs a ProtocolManageReviewAttachmentEvent.
     * 
     * @param document The document to validate
     * @param propertyName The error path property prefix
     * @param reviewAttachments The manage Reviewer Attachment
     */
    public ProtocolManageReviewAttachmentEvent(ProtocolDocument document, String propertyName, List<PRA> reviewAttachments) {
        super("Enter reviewer attachment", "", document);
        this.propertyName = propertyName;
        this.reviewAttachments = reviewAttachments;
    }
    
    public ProtocolDocument getProtocolDocument() {
        return (ProtocolDocument) getDocument();
    }
    
    public String getPropertyName() {
        return propertyName;
    }
    
 
    @Override
    @SuppressWarnings("unchecked")
    public BusinessRuleInterface getRule() {
        return getNewProtocolManageReviewAttachmentRuleInstaceHook();
    }

    protected abstract ProtocolManageReviewAttachmentRule<?> getNewProtocolManageReviewAttachmentRuleInstaceHook();

    
    public List<PRA> getReviewAttachments() {
        return reviewAttachments;
    }


}