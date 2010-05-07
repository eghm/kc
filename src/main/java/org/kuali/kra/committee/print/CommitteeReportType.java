/*
 * Copyright 2006-2010 The Kuali Foundation
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
package org.kuali.kra.committee.print;

/**
 * This class represents different types of reports for committee.
 */
public enum CommitteeReportType {
    /** Report type for the committee batch correspondence. */
    BATCH_CORRESPONDENCE ("batchCorrespondence"),

    /** Report type for the committee roster. */
    ROSTER ("roster"),

    /** Report type for the committee future scheduled meetings. */
    FUTURE_SCHEDULED_MEETINGS ("futureScheduledMeetings");
    
    private String committeeReportType;

    /**
     * 
     * Constructs a CommitteeReportType.java.
     * @param committeeReportType
     */
    CommitteeReportType(String committeeReportType) {
        this.committeeReportType = committeeReportType;
    }
    
    public String getCommitteeReportType() {
        return committeeReportType;
    }
}
