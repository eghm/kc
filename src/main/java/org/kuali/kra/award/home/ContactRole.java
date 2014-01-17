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
package org.kuali.kra.award.home;

import org.kuali.rice.krad.bo.BusinessObject;


/**
 * This class defines an Award contact role
 */
public interface ContactRole extends BusinessObject {
    String PI_CODE = "PI";
    String COI_CODE = "COI";
    String KEY_PERSON_CODE = "KP";
        
    String getRoleCode();
    String getRoleDescription();
}
