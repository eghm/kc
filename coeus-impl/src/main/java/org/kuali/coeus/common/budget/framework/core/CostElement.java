/*
 * Copyright 2005-2014 The Kuali Foundation
 * 
 * Licensed under the Educational Community License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.osedu.org/licenses/ECL-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.kuali.coeus.common.budget.framework.core;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.kuali.coeus.common.budget.api.core.CostElementContract;
import org.kuali.coeus.common.budget.framework.core.category.BudgetCategory;
import org.kuali.coeus.common.budget.framework.rate.ValidCeRateType;
import org.kuali.coeus.sys.framework.model.KcPersistableBusinessObjectBase;
import org.kuali.coeus.sys.framework.persistence.BooleanNFConverter;
import org.kuali.rice.core.api.mo.common.active.MutableInactivatable;
import org.kuali.rice.krad.data.jpa.FilterGenerator;
import org.kuali.rice.krad.data.jpa.converters.BooleanYNConverter;

@Entity
@Table(name = "COST_ELEMENT")
public class CostElement extends KcPersistableBusinessObjectBase implements Comparable<CostElement>, MutableInactivatable, CostElementContract {

    @Id
    @Column(name = "COST_ELEMENT")
    private String costElement;

    @Column(name = "BUDGET_CATEGORY_CODE")
    private String budgetCategoryCode;

    @Column(name = "DESCRIPTION")
    private String description;

    @Column(name = "ON_OFF_CAMPUS_FLAG")
    @Convert(converter = BooleanNFConverter.class)
    private Boolean onOffCampusFlag;

    @Column(name = "ACTIVE_FLAG")
    @Convert(converter = BooleanYNConverter.class)
    private boolean active;

    @Column(name = "FIN_OBJECT_CODE")
    private String financialObjectCode;

    @OneToMany(mappedBy = "costElementBo")
    @FilterGenerator(attributeName = "active", attributeValue = "true")
    private List<ValidCeRateType> validCeRateTypes;

    @ManyToOne(fetch = FetchType.LAZY, cascade = { CascadeType.REFRESH })
    @JoinColumn(name = "BUDGET_CATEGORY_CODE", referencedColumnName = "BUDGET_CATEGORY_CODE", insertable = false, updatable = false)
    private BudgetCategory budgetCategory;

    @Transient
    private String budgetCategoryTypeCode;

    public CostElement() {
        validCeRateTypes = new ArrayList<ValidCeRateType>();
    }

    @Override
    public String getFinancialObjectCode() {
        return financialObjectCode;
    }

    public void setFinancialObjectCode(String financialObjectCode) {
        this.financialObjectCode = financialObjectCode;
    }

    @Override
    public String getCostElement() {
        return costElement;
    }

    public void setCostElement(String costElement) {
        this.costElement = costElement;
    }

    @Override
    public String getBudgetCategoryCode() {
        return budgetCategoryCode;
    }

    public void setBudgetCategoryCode(String budgetCategoryCode) {
        this.budgetCategoryCode = budgetCategoryCode;
    }

    @Override
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public Boolean getOnOffCampusFlag() {
        return onOffCampusFlag;
    }

    public void setOnOffCampusFlag(Boolean onOffCampusFlag) {
        this.onOffCampusFlag = onOffCampusFlag;
    }

    @Override
    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    @Override
    public List<ValidCeRateType> getValidCeRateTypes() {
        return validCeRateTypes;
    }

    public void setValidCeRateTypes(List<ValidCeRateType> validCeRateTypes) {
        this.validCeRateTypes = validCeRateTypes;
    }

    @Override
    public int compareTo(CostElement costElement) {
        return this.costElement.compareTo(costElement.costElement);
    }

    @Override
    public BudgetCategory getBudgetCategory() {
        return budgetCategory;
    }

    public void setBudgetCategory(BudgetCategory budgetCategory) {
        this.budgetCategory = budgetCategory;
    }

    public String getBudgetCategoryTypeCode() {
        return budgetCategoryTypeCode;
    }

    public void setBudgetCategoryTypeCode(String budgetCategoryTypeCode) {
        this.budgetCategoryTypeCode = budgetCategoryTypeCode;
    }
}
