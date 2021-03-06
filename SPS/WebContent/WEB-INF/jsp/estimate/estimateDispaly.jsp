<%--
    Document   : Application Form
    Created on : May 16, 2010, 11:21:45 AM
    Author     : Dileepa Waduge
--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/WEB-INF/jsp/include.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Estimate Viewer</title>
<link rel="stylesheet" type="text/css" href="../../style/style.css" />
<script type="text/javascript" src="../../script/generateJobNo.js"> </script>
<script type="text/javascript" src="../../script/javascript.js"> </script>

<s:head />
</head>
<body onload="buttonLoader()">
<table id="tblOuter" class="tblOuter">
	<tbody>
		<tr>
			<td>
			<table id="tblInner" class="tblInner">
				<tbody>
					<tr>
						<td id="tdHeader">
						<table id="tblHeader" class="tblHeader" cellpadding="0"
							cellspacing="0">
							<tbody>
									<tr>
				                        <td ><img src="../../image/NewSPS2.gif" width="100%"  alt="NewSPS2"/>
				                        </td>
				                        <td width="*" bgcolor="#000033"></td>
				                        <td width="*" bgcolor="#000033"></td>
				                     </tr>				
							</tbody>
						</table>
						</td>
					</tr>
					<!-- tr>
						<td></td>
					</tr-->
					<tr>
						<td id="tdWelcome">
						<table class="tblWelcome" border="0" cellpadding="0"
							cellspacing="0">
							<thead>
								<tr>
									<th width="70%"></th>
									<th width="10%"></th>
									<th width="10%"></th>
									<th width="*"></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="tdPath"><s:property value="path"></s:property></td>
									<td class="tdWelcomeLabel">Welcome</td>
									<td class="tdWelcomeUser"><s:property
										value="loggedInUserId"></s:property></td>
									<td class="tdLogOut"><a href="<s:url action="logout"/>">Logout</a></td>
								</tr>
							</tbody>
						</table>
						</td>
					</tr>
					<!-- tr>
						<td></td>
					</tr-->
					<tr>
						<td id="tdContent">
						<table class="tblContent" border="1" cellpadding="0"
							cellspacing="0">
							<thead>
								<tr>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><s:form name="estimateViewer" action="estimateViewer" method="POST"
										validate="true" theme="simple">
										<table width="100%" class="tldFromContent" border="0">
											<thead>
												<tr>
													<th></th>

												</tr>
											</thead>
											<tbody>
												<tr>
													<td>
													<table width="100%" border="0">
														<thead>
															<tr>
																<th width="40%"></th>
																<th width="10%"></th>
																<th width="*"></th>

															</tr>
														</thead>
														<tbody>
															<tr>
																<td class="tdHeadings">Create Job</td>
																<td></td>
																<s:if test="%{messageType=='ERROR'}">
																<td class="tdMsgStyle"><s:property value="errorMessage"></s:property></td>
																</s:if>
																<s:elseif test="%{messageType=='INFO'}">
																<td class="tdMsgStyleInfo"><s:property value="errorMessage"></s:property></td>
																</s:elseif>
																<s:elseif test="%{messageType=='DONE'}">
																<td class="tdMsgStyleDone"><s:property value="errorMessage"></s:property></td>
																</s:elseif>
															</tr>
														</tbody>

													</table>
													</td>
												</tr>
												<tr>
													<td></td>
												</tr>
												<tr>
													<td></td>
												</tr>
												<tr>
													<td class="tdHeadings" colspan="4">Estimate Detail</td>
												</tr>
												<tr>
													<td>
													<table width="100%" class="tldFromContent" border="0" >
														<thead>
															<tr>
																<th width="5%"></th>
																<th width="15%"></th>
																<th width="10%"></th>
																<th width="15%"></th>
																<th width="*"></th>
																<th width="5%"></th>
															</tr>
														</thead>
														<tbody>
														
															<tr>
																<td></td>
																<td><s:label value="Cost Center No"></s:label></td>
																<td><s:textfield name="costCenterNo" id="txfdCostCenterNo" size="6" maxlength="6" cssClass="inputArea" ></s:textfield></td>
																<td></td>
																<td></td>
																<td></td>
															</tr>
															<tr>
																<td></td>
																<td><s:label value="CSC No"></s:label></td>
																<td><s:textfield name="cSCNo" id="txfdcSCNo" size="6" maxlength="6" cssClass="inputArea" ></s:textfield></td>
																<td></td>
																<td></td>
																<td></td>
															</tr>
															<tr>
																<td></td>
																<td><s:label value="Estimate No"></s:label></td>
																<td><s:select  name="estimateNo" id="txfdEstimateNo" headerKey="1" headerValue="-- Please Select --" list="estimateNoList" onchange="form.submit()" /></td>
																<!--<td><s:textfield name="estimateNo" id="txfdEstimateNo" size="20" maxlength="20" cssClass="inputArea" ></s:textfield></td>-->
																<td></td>
																<td></td>
																<td></td>
															</tr>
															
															<tr>
																<td></td>
																<td colspan="4"><s:label value="Applicant Details"></s:label></td>
																<td></td>
																
															</tr>
															<tr>
																<td></td>
																<td><s:label value="Applicant Name"></s:label></td>
																<td><s:textarea name="fullName" id="txfdFullName" cols="30" rows="1"></s:textarea></td>
																<td><s:label value="Application Date"></s:label></td>
																<td><s:textfield name="applicationDate" id="txfdApplicationDate" size="10" maxlength="10" cssClass="inputArea" ></s:textfield></td>
																<td></td>
															</tr>
															<tr>
																<td></td>
																<td><s:label value="Full Address"></s:label></td>
																<td><s:textarea name="fullAddress"  id="txfdFullAddress" cols="30" rows="2"></s:textarea></td>
																<td><s:label value="Remarks"></s:label></td>
																<td><s:textfield name="remarks" id="txfdRemarks" size="10" maxlength="10" cssClass="inputArea" ></s:textfield></td>
																<td></td>
															</tr>
															<tr>
																<td></td>
																<td><s:label value="Assessment No"></s:label></td>
																<td><s:textfield name="assessmentNo" id="txfdAssessmentNo" size="6" maxlength="6"></s:textfield></td>
																<td><s:label value="Neighbours Acc. No"></s:label></td>
																<td><s:textfield name="neighboursAccNo" id="txfdNeighboursAccNo" size="10" maxlength="10" onkeyup="numericValidate(this,event);"></s:textfield></td>
																<td></td>
															</tr>
																												 
														
															<tr>
																<td></td>
																<td><s:submit theme="simple" value="Generate Job No" method="generateJobNo" id="btnGenerateJobNo" onclick=""></s:submit></td>
																<td><s:textfield name="jobNo" id="txfdJobNo" size="20" readonly="true"></s:textfield></td>
																<td></td>
																<td></td>
																<td></td>
															</tr>	
																						
														</tbody>

													</table>
													</td>
												</tr>
												<tr>
													<td></td>
												</tr>
												
												<tr>
													<td></td>
												</tr>
												
												<tr>
													<td id="tdBotton" colspan="3">
													<s:submit theme="simple" align="right" value="Exit" method="close" id="btnClose" ></s:submit>
													<s:reset theme="simple" align="right" value="Clear" />	
													<s:hidden id="state" name="state"></s:hidden>
													<s:hidden id="hiddenSecondState" name="hiddenSecondState"></s:hidden>
													<s:hidden id="path" name="path"></s:hidden> 
													<s:hidden id="status" name="status"></s:hidden> 
													<s:hidden id="errorMessage" name="errorMessage"></s:hidden></td>
												</tr>
											</tbody>
										</table>

									</s:form></td>
								</tr>
								<tr>
									<td></td>
								</tr>
								<tr>
									<td></td>
								</tr>
							</tbody>
						</table>

						</td>
					</tr>
					<tr>
						<td id="tdFooter">
						<table class="tblFooter" border="1" cellpadding="0"
							cellspacing="0">

							<tbody>
								<tr>
									 <td id="tdFooter">
                                        <table class="tblFooter" border="1" cellpadding="0" cellspacing="0">

                                            <tbody>
                                                <tr>
                                                    <td class="footerNotice" align="center">@ Ceylon Electricity Board</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
								</tr>
							</tbody>
						</table>
						</td>
					</tr>
				</tbody>
			</table>


			</td>
		</tr>
	</tbody>
</table>


</body>
</html>