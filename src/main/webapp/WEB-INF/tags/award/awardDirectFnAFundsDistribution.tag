<%--
 Copyright 2006-2008 The Kuali Foundation
 
 Licensed under the Educational Community License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.osedu.org/licenses/ECL-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
--%>
<%@ include file="/WEB-INF/jsp/kraTldHeader.jsp"%>

<c:set var="awardAttributes" value="${DataDictionary.Award.attributes}" />
<c:set var="awardDirectFandADistributionAttributes" value="${DataDictionary.AwardDirectFandADistribution.attributes}" />
<c:set var="action" value="awardTimeAndMoney" />



<kul:tab tabTitle="Direct/F&A Funds Distribution" defaultOpen="false" tabErrorKey="newAwardDirectFandADistribution.*,document.awardList[0].awardDirectFandADistributions*">
	<div class="tab-container" align="center">
    	<h3>
    		<span class="subhead-left">Direct/F&A Funds Distribution</span>
        </h3>
        <table id="Direct-FandA-Funds-Distribution-table" cellpadding="0" cellspacing="0" summary="Direct F and A Distribution">
			<tr>
				<th width="30%" align="right"><kul:htmlAttributeLabel attributeEntry="${awardAttributes.beginDate}" useShortLabel="true" noColon="false" /></th>
				<td  width="20%">          	  
            	  	 ${KualiForm.document.awardList[0].beginDate}           	 
            	</td>
				<th width="30%" align="right"><kul:htmlAttributeLabel attributeEntry="${awardAttributes.awardExecutionDate}" useShortLabel="true" noColon="false" /></th>
				<td width="20%">
            	  	${KualiForm.document.awardList[0].awardExecutionDate}
            	</td>
			</tr>
			<tr>
				<th width="30%" align="right"><kul:htmlAttributeLabel attributeEntry="${awardAttributes.obligatedTotal}" useShortLabel="true" noColon="false" /></th>
				<td width="20%">            	  	
            	  	 $${KualiForm.document.awardList[0].obligatedTotal}           	 
            	</td>
				<th width="30%" align="right"><kul:htmlAttributeLabel attributeEntry="${awardAttributes.anticipatedTotal}" useShortLabel="true" noColon="false" /></th>
				<td width="20%">
            	  	 $${KualiForm.document.awardList[0].anticipatedTotal}
            	</td>
			</tr>
			</table>
			<table cellpadding="0" cellspacing="0">
			<tr>
				<th scope="row" width="6%">&nbsp;</th>
				<th width="17%"><kul:htmlAttributeLabel attributeEntry="${awardDirectFandADistributionAttributes.startDate}" useShortLabel="true" noColon="true" /></th>
				<th width="17%"><kul:htmlAttributeLabel attributeEntry="${awardDirectFandADistributionAttributes.endDate}" useShortLabel="true" noColon="true" /></th>
				<th width="20%"><kul:htmlAttributeLabel attributeEntry="${awardDirectFandADistributionAttributes.directCost}" useShortLabel="true" noColon="true"/></th>
				<th width="20%"><kul:htmlAttributeLabel attributeEntry="${awardDirectFandADistributionAttributes.indirectCost}" useShortLabel="true" noColon="true"/></th>
				<th width="20%"><div align="center">Actions</div></th>
			</tr>
			<tr>
            	<th align="center" scope="row"><div align="center">Add:</div></th>
            	<td class="infoline">
            	  	<div align="center">
            	  	 	<kul:htmlControlAttribute property="directFandADistributionFormHelper.newAwardDirectFandADistribution.startDate" attributeEntry="${awardDirectFandADistributionAttributes.startDate}" datePicker="true"/>
            	 	</div>
            	</td>
	            <td class="infoline">
	              	<div align="center">
	            		<kul:htmlControlAttribute property="directFandADistributionFormHelper.newAwardDirectFandADistribution.endDate" attributeEntry="${awardDirectFandADistributionAttributes.endDate}" datePicker="true"/>
	              	</div>
	            </td>
	            <td class="infoline">
	            	<div align="right">
            	    	<kul:htmlControlAttribute property="directFandADistributionFormHelper.newAwardDirectFandADistribution.directCost" attributeEntry="${awardDirectFandADistributionAttributes.directCost}"/>
            	  	</div>
	            </td>
	            <td class="infoline">
	            	<div align="right">
            	    	<kul:htmlControlAttribute property="directFandADistributionFormHelper.newAwardDirectFandADistribution.indirectCost" attributeEntry="${awardDirectFandADistributionAttributes.indirectCost}"/>
            	  	</div>
	            </td>
	           <td class="infoline">
	            	<div align=center>
						<html:image property="methodToCall.addAwardDirectFandADistribution.anchor${tabKey}"
						src='${ConfigProperties.kra.externalizable.images.url}tinybutton-add1.gif' styleClass="tinybutton"/>
					</div>
	            </td>
	         </tr>
	          <c:forEach var="awardDirectFandADistribution" items="${KualiForm.document.awardList[0].awardDirectFandADistributions}" varStatus="status">
	             <tr>
					<th width="6%" class="infoline">
						<c:out value="${awardDirectFandADistribution.budgetPeriod}" />
					</th>
					<td width="17%" valign="middle">
					<div align="center">
                		<kul:htmlControlAttribute property="document.awardList[0].awardDirectFandADistributions[${status.index}].startDate" attributeEntry="${awardDirectFandADistributionAttributes.startDate}" datePicker="true"/>
					</div>
					</td>
	                <td width="17%" valign="middle">
					<div align="center">
                		<kul:htmlControlAttribute property="document.awardList[0].awardDirectFandADistributions[${status.index}].endDate" attributeEntry="${awardDirectFandADistributionAttributes.endDate}" datePicker="true"/>
					</div>
	                </td>
	                <td width="20%" valign="right">                	
					<div align="right">
                  		<kul:htmlControlAttribute property="document.awardList[0].awardDirectFandADistributions[${status.index}].directCost" attributeEntry="${awardDirectFandADistributionAttributes.directCost}"/> 
					</div>
					</td>
	                <td width="20%" valign="right">                	
					<div align="right">
                  		<kul:htmlControlAttribute property="document.awardList[0].awardDirectFandADistributions[${status.index}].indirectCost" attributeEntry="${awardDirectFandADistributionAttributes.indirectCost}"/> 
					</div>
					</td>
					<td width="10%">
					<div align="center">&nbsp;
						<html:image property="methodToCall.deleteAwardDirectFandADistribution.line${status.index}.anchor${currentTabIndex}"
						src='${ConfigProperties.kra.externalizable.images.url}tinybutton-delete1.gif' styleClass="tinybutton"/>
					</div>
	                </td>
	             </tr>
	           </c:forEach> 
	           <tr>
          		<th align="right" colspan="3" scope="row"><div>Total:</div></th>
          		<th align="right">
          			<div align="right">  		                		
	                	$<fmt:formatNumber value="${KualiForm.document.awardList[0].totalDirectFandADistributionDirectCostAmount}" type="currency" currencySymbol="" maxFractionDigits="2" />
	                </div>
	         	</th>
	         	<th align="right">
          			<div align="right">  		                		
	                	$<fmt:formatNumber value="${KualiForm.document.awardList[0].totalDirectFandADistributionIndirectCostAmount}" type="currency" currencySymbol="" maxFractionDigits="2" />
	                </div>
	         	</th>
	         	<th align="center" rowspan="2">
					<html:image property="methodToCall.recalculateDirectFandADistributionTotals.anchor${tabKey}"
					src='${ConfigProperties.kra.externalizable.images.url}tinybutton-recalculate.gif' styleClass="tinybutton"/> 
   				</th>  
          	   </tr>
          	   <tr>
          		<th align="right" colspan="3" scope="row"><div>Total Anticipated(Direct + F&A):</div></th>
          		<th align="right" colspan="2">
          			<div align="right">  		                		
	                	$<fmt:formatNumber value="${KualiForm.document.awardList[0].totalDirectFandADistributionAnticipatedCostAmount}" type="currency" currencySymbol="" maxFractionDigits="2" />
	                </div>
	         	</th>
		</table>
	</div>
</kul:tab>
