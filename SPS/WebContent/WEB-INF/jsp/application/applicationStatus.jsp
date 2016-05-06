<%@ include file="/WEB-INF/jsp/include.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Application Status</title>
<link rel="stylesheet" type="text/css" href="../../style/style.css" />

<script type="text/javascript" src="../../script/javascript.js">
	
</script>
<script type="text/javascript">
	function submitForm() {
		document.forms["AppStatusForm"].submit();

	}
	function goBackToSearchResults()
	{
			window.history.go(-2);
		//return false;
	}
</script>
    <style type="text/css">

        .style1
        {
            width: 517px;
            font-size: 11px;
        }
                 
        .style3
        {
            font-weight: bold;
        }
        .style8
        {
            width: 11px;
        }
         
        .style9
        {
            width: 8px;
        }
         
        .style10
        {
            width: 116px;
        }
        .style13
        {
            width: 225px;
        }
        .style15
        {
            width: 200px;
        }
        .style14
        {
            width: 250px;
        }
        .style12
        {
            width: 2px;
        }
        .tldFromContent{
    font: normal small/1.0em Verdana, sans-serif;
    font-size:11.5px;
    border-collapse: collapse;
    border: small
    
}


        .style17
        {
            width: 20px;
        }
        .style18
        {
            width: 10px;
        }
         
        .style19
        {
            width: 829px;
        }
        .style20
        {
            width: 1032px;
        }
         
        .style21
        {
            width: 74px;
        }
         
        .style22
        {
            width: 307px;
        }
         
        </style>
<s:head />
<sx:head />
</head>
<body onLoad="buttonLoader()">
<table id="tblOuter" class="tblOuter">
	<tbody>
		<tr>
			<td>
			<table id="tblInner" class="tblInner">
				<tbody>
					<tr>
						<td id="tdHeader" class="style20">
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
					<!--tr>
						<td></td>
					</tr-->
					<tr>
						<td id="tdWelcome" class="style20">
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
									<td><a href="<s:url action="logout"/>">Logout</a></td>
								</tr>
							</tbody>
						</table>
						</td>
					</tr>
					<!-- tr>
						<td></td>
					</tr-->
					<tr>
						<td id="tdContent" class="style20">
					<table class="tblContent" border="1" cellpadding="0"
							cellspacing="0">
							<thead>
								<tr>
									<th ></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><s:form action="loadAppStatusPage" method="POST"
										validate="true" theme="simple" name="AppStatusForm">
										<table width="100%" class="tldFromContent" border="0">
											<tr>
												<td height="48" colspan="25" class="listHeader">
												<table width="118%" border="0">
													<tr>
														<td width="26%" class="listHeader">&nbsp;</td>
														<td width="74%" style="text-align: right"><s:submit
													theme="simple" align="right" value="X" type="submit"
													method="Close" id="btnClose"></s:submit></td>
													</tr>
													<tr>
														<td width="26%" class="listHeader">Application Status</td>
														<td width="74%"><span style="background-color: lime;">
														<s:property value="lblSuccess" /> </span> <span
															style="background-color: red;"> <s:property
															value="lblError" /> </span></td>
													</tr>
													<tr>
														<td width="26%" class="listHeader">
                                                                <table class="style1" width="100%">
                                                                    <tr>
                                                                        <td class="style3" colspan="4">
                                                                            (1.)Application Details</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style8">
                                                                            </td>
                                                                                    <td class="style21">
                                                                                        Applicatin ID</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                      <s:textfield id="appID"
													    name="appID" size="25"></s:textfield><s:submit
													    theme="simple" type="submit" value="Search" method="Search" 
													    id="btnSearch">
												    </s:submit>  </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style21">
                                                                                        Application Detail</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <s:property value="applicatinDetails" /></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style21">
                                                                                        Name</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <s:property
													value="applicantName" /></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style21">
                                                                                        NIC/Passport</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <s:property
													value="applicantNIC" /></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style21">
                                                                                        Personel
                                                                                        Address</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <s:property
													value="applicantAddress" /></td>
                                                                                </tr>
                                                                                
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style21">
                                                                                        Service Address</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                      <s:property
													value="serviceAddress" />  </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style21">
                                                                                        Application Type</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                       <s:property
													value="applicationType" /> </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style21">
                                                                                        Submit Date/Confirm Date</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <s:property
													value="submitDate" /> </td>
                                                                                </tr>
                                                                                
                                                                              <!--     <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style21">
                                                                                        Assessment Number</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <s:property
													value="assesmentNumber" /> </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style21">
                                                                                        Neighbour Acc Number</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <s:property
													value="neighbourAccNumber" /> </td>
                                                                                </tr> 
                                                                                 <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style21">
                                                                                        Existing Accn Number</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <s:property
													value="existingAccNumber" /> </td>
                                                                                </tr>
                                                                                
                                                                                
                                                                                
                                                                        <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style21">
                                                                                        No of Damage Meters</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <s:property
													value="noOfDamageMeters" /> </td>
                                                                                </tr>  -->        
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                <tr>
                                                                                    <td   class="style3" colspan="4">
                                                                                        (2.)PIV I Details</td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style21">
                                                                                        Is PIV 01 issued ?</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <img
													src="<s:text name="img_piv1" />" /></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style21">
                                                                                        Application number</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <s:property
													value="applicationNumber" /></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        </td>
                                                                                    <td class="style21">
                                                                                        PIV Number</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <s:property
													value="piv1Number" /></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style21">
                                                                                        Amount</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <s:property
													value="piv1Amount" /></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style21">
                                                                                        PIV Date</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <s:property
													value="piv1Date" /></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style21">
                                                                                        Is PIV Paid ?</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <img
													src="<s:text name="img_piv1Paid" />" alt=""></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style21">
                                                                                        Date Paid</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <s:property
													value="piv1PaidDate" /></td>
                                                                                </tr>
                                                                                
                                                                                 <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style21">
                                                                                        Printed PIV Number</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <s:property
													value="piv1PrintedPIVNumber" /></td>
                                                                                </tr>
                                                                                 <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style21">
                                                                                        Bank Code/Branch Code</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <s:property
													value="piv1BankCodeBranchCode" /></td>
                                                                                </tr>
                                                                                 <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style21">
                                                                                        Payment Mode</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <s:property
													value="piv1PaymentMode" /></td>
                                                                                </tr>
                                                                                 <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style21">
                                                                                        Cheque Date/Number</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <s:property
													value="piv1ChequeDateNumber" /></td>
                                                                                </tr>
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                <tr>
                                                                                    <td class="style13" colspan="4">
                                                                                        <strong>(3.)Loan Details</strong></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style21">
                                                                                        Has applied for a Loan</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <img
													src="<s:text name="img_hasAppliedForLoan" />" alt=""></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style21">
                                                                                        Member of Samurdhi ?</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <s:property
													value="isMemberOfSamurdhi" /></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style21">
                                                                                        Share price</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <s:property
													value="sharePrice" /></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style21">
                                                                                        No of shares</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <s:property
													value="noOfShares" /></td>
                                                                                </tr>
                                                                               
                                                                                 
                                                                               
                                                                                <tr>
                                                                                    <td class="style15" colspan="4">
                                                                                        <strong>(4.)Schedule Details</strong></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style21">
                                                                                        Is visited ?</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <img
													src="<s:text name="img_siteVisited" />" /> </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style21">
                                                                                        Appoinment date</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <s:property
													value="siteVisitedDate" /></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style21">
                                                                                        Remarks</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <s:property
													value="siteVisitingFailedReason" /></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style21">
                                                                                        Status</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <s:property
													value="appoinmentStatus" /></td>
                                                                                </tr>
                                                                                 <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style21">
                                                                                        Allocated Date</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <s:property
													value="allocatedDate" /></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style21">
                                                                                        Allocated By</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                       <s:property
													value="allocatedBy" /></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style21">
                                                                                        Allocated To</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <s:property
													value="allocatedTo" /></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style14" colspan="4">
                                                                                        <strong>(5.)Reinspection Detials</strong></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style12" colspan="3">
                                                                                        <table class="tldFromContent" border="1">
											    <tr>
											      <td><strong>PIV Number</strong></td>
											      <td><strong>PIV Date</strong></td>
											      <td><strong>Amount</strong></td>
											      <td><strong>Paid Date</strong></td>
										        </tr>
											    <s:iterator value="reinspectionPIVList">
											      <tr>
											        <td><s:property value="id.pivNo" /></td>
											        <td align="right"><s:property value="pivDate" /></td>
											        <td align="right"><s:property value="pivAmount" /></td>
											        <td align="right"><s:property value="paidDate" /></td>
										          </tr>
										        </s:iterator>
										      </table></td>
                                                                                </tr>
                                                                               
                                                                                <tr>
                                                                        <td class="style14" colspan="4">
                                                                            <strong>(6.)Standard Estimate/Quotation Detials</strong></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style8">
                                                                            &nbsp;</td>
                                                                        <td class="style21">
                                                                            Is estimate created ?</td>
                                                                        <td class="style9">
                                                                            :</td>
                                                                        <td>
                                                                            <img
													src="<s:text name="img_serviceEstimate" />" ></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style8">
                                                                            &nbsp;</td>
                                                                        <td class="style21">
                                                                            Estimate number</td>
                                                                        <td class="style9">
                                                                            :</td>
                                                                        <td>
                                                                            <s:property
													value="estimateNumber" /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style8">
                                                                            &nbsp;</td>
                                                                        <td class="style21">
                                                                            Estimate Date</td>
                                                                        <td class="style9">
                                                                            :</td>
                                                                        <td>
                                                                            <s:property
													value="estimateDate" /></td>
                                                                    </tr>
                                                                    
                                                                     <tr>
                                                                        <td class="style8">
                                                                            &nbsp;</td>
                                                                        <td class="style21">
                                                                            Fixed Cost</td>
                                                                        <td class="style9">
                                                                            :</td>
                                                                        <td>
                                                                            <s:property
													value="fixedCost" /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style8">
                                                                            &nbsp;</td>
                                                                        <td class="style21">
                                                                            Variable Cost</td>
                                                                        <td class="style9">
                                                                            :</td>
                                                                        <td>
                                                                            <s:property
													value="variableCost" /></td>
                                                                    </tr>
                                                                    
                                                                    <tr>
                                                                        <td class="style8">
                                                                            &nbsp;</td>
                                                                        <td class="style21">
                                                                            Security Deposit</td>
                                                                        <td class="style9">
                                                                            :</td>
                                                                        <td>
                                                                            <s:property
													value="securityDeposit" /></td>
                                                                    </tr>
                                                                    
                                                                    <tr>
                                                                        <td class="style8">
                                                                            &nbsp;</td>
                                                                        <td class="style21">
                                                                            Other Cost</td>
                                                                        <td class="style9">
                                                                            :</td>
                                                                        <td>
                                                                            <s:property
													value="otherCost" /></td>
                                                                    </tr>
                                                                    
                                                                    <tr>
                                                                        <td class="style8">
                                                                            &nbsp;</td>
                                                                        <td class="style21">
                                                                            Temporary Deposit</td>
                                                                        <td class="style9">
                                                                            :</td>
                                                                        <td>
                                                                            <s:property
													value="temporaryDeposit" /></td>
                                                                    </tr>
                                                                    
                                                                    <tr>
                                                                        <td class="style8">
                                                                            &nbsp;</td>
                                                                        <td class="style21">
                                                                            Conversion Cost</td>
                                                                        <td class="style9">
                                                                            :</td>
                                                                        <td>
                                                                            <s:property
													value="conversionCost" /></td>
                                                                    </tr>
                                                                    
                                                                    <tr>
                                                                        <td class="style8">
                                                                            &nbsp;</td>
                                                                        <td class="style21">
                                                                            Labour Cost</td>
                                                                        <td class="style9">
                                                                            :</td>
                                                                        <td>
                                                                            <s:property
													value="labourCost" /></td>
                                                                    </tr>
                                                                    
                                                                    <tr>
                                                                        <td class="style8">
                                                                            &nbsp;</td>
                                                                        <td class="style21">
                                                                            Transport Cost</td>
                                                                        <td class="style9">
                                                                            :</td>
                                                                        <td>
                                                                            <s:property
													value="transportCost" /></td>
                                                                    </tr>
                                                                    
                                                                    <tr>
                                                                        <td class="style8">
                                                                            &nbsp;</td>
                                                                        <td class="style21">
                                                                            Overhead Cost</td>
                                                                        <td class="style9">
                                                                            :</td>
                                                                        <td>
                                                                            <s:property
													value="overheadCost" /></td>
                                                                    </tr>
                                                                    
                                                                    <tr>
                                                                        <td class="style8">
                                                                            &nbsp;</td>
                                                                        <td class="style21">
                                                                            Additional Deposit</td>
                                                                        <td class="style9">
                                                                            :</td>
                                                                        <td>
                                                                            <s:property
													value="additionalDeposit" /></td>
                                                                    </tr>
                                                                    
                                                                    <tr>
                                                                        <td class="style8">
                                                                            &nbsp;</td>
                                                                        <td class="style21">
                                                                            Damage Cost</td>
                                                                        <td class="style9">
                                                                            :</td>
                                                                        <td>
                                                                            <s:property
													value="damageCost" /></td>
                                                                    </tr>
                                                                    
                                                                    <tr>
                                                                        <td class="style8">
                                                                            &nbsp;</td>
                                                                        <td class="style21">
                                                                            Other Material Cost</td>
                                                                        <td class="style9">
                                                                            :</td>
                                                                        <td>
                                                                            <s:property
													value="otherMaterialCost" /></td>
                                                                    </tr>
                                                                    
                                                                    
                                                                    <tr>
                                                                        <td class="style8">
                                                                            &nbsp;</td>
                                                                        <td class="style21">
                                                                            Other Labour Cost</td>
                                                                        <td class="style9">
                                                                            :</td>
                                                                        <td>
                                                                            <s:property
													value="otherLabourCost" /></td>
                                                                    </tr>
                                                                    
                                                                    <tr>
                                                                        <td class="style8">
                                                                            &nbsp;</td>
                                                                        <td class="style21">
                                                                            Contegency Cost</td>
                                                                        <td class="style9">
                                                                            :</td>
                                                                        <td>
                                                                            <s:property
													value="contegencyCost" /></td>
                                                                    </tr>
                                                                    
                                                                    <tr>
                                                                        <td class="style8">
                                                                            &nbsp;</td>
                                                                        <td class="style21">
                                                                            Board Charge</td>
                                                                        <td class="style9">
                                                                            :</td>
                                                                        <td>
                                                                            <s:property
													value="boardCharge" /></td>
                                                                    </tr>
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    <tr>
                                                                        <td class="style8">
                                                                            &nbsp;</td>
                                                                        <td class="style21">
                                                                            Standard Estimate(Total)</td>
                                                                        <td class="style9">
                                                                            :</td>
                                                                        <td>
                                                                            <b><s:property
													value="estimateAmount" /></b></td>
                                                                    </tr>
                                                                    
                                                                    
                                                                    
                                                                    
                                                                           <tr>
                                                                                    <td class="style14" colspan="4">
                                                                                        <strong>(7.)Work(Detailed) Estimate</strong></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style12" colspan="3">
                                                                                        <table class="tldFromContent" border="1">
											    <tr>
											      <td><strong>Mat Code</strong></td>
											      <td><strong>Unit Pirce</strong></td>
											      <td><strong>Estimate Qty</strong></td>
											      <td><strong>Estimate Cost</strong></td>
										        </tr>
											    <s:iterator value="materialDetails">
											      <tr>
											        <td><s:property value="id.resCd" /></td>
											        <td align="right"><s:property value="unitPrice" /></td>
											        <td align="right"><s:property value="estimateQty" /></td>
											        <td align="right"><s:property value="estimateCost" /></td>
										          </tr>
										        </s:iterator>
										      </table></td>
                                                                                </tr>
                                                                                
                                                                                 <tr>
                                                                        <td class="style8">
                                                                            &nbsp;</td>
                                                                        <td class="style21">
                                                                            Detail Estimate Cost</td>
                                                                        <td class="style9">
                                                                            :</td>
                                                                        <td>
                                                                            <b><s:property
													value="detailCost" /> </b> </td>
                                                                    </tr>
                                                                    
                                                                    <tr>
                                                                        <td class="style8">
                                                                            &nbsp;</td>
                                                                        <td class="style21">
                                                                            Is estimate approved ?</td>
                                                                        <td class="style9">
                                                                            :</td>
                                                                        <td>
                                                                            <img
													src="<s:text name="img_estimateApproval" />" alt=""></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style8">
                                                                            &nbsp;</td>
                                                                        <td class="style21">
                                                                            Current status of the estimate</td>
                                                                        <td class="style9">
                                                                            :</td>
                                                                        <td style="background-color: #FFFF00">
                                                                            <s:property
													value="estimateStatus" /></td>
                                                                    </tr>
                                                                                
                                                                                </table>
                                                                        </td>
														<td width="74%" valign="top">
                                                                <table class="style1">
                                                                     <tr>
                                                                                    <td class="style15" colspan="4">
                                                                                        <strong>(8.)PIV II Details</strong></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style22">
                                                                                        Is PIV 02 issued ?</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <img
													src="<s:text name="img_piv2" />" alt=""></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style22">
                                                                                        Application number</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <s:property
													value="applicationNumber" /></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style22">
                                                                                        PIV number</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <s:property
													value="piv2Number" /></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style22">
                                                                                        Amount</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <s:property
													value="piv2Amount" /></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style22">
                                                                                        PIV Date</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <s:property
													value="piv2Date" /></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style22">
                                                                                        Is PIV Paid ?</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <img
													src="<s:text name="img_piv2Paid" />" alt=""></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style22">
                                                                                        Date paid</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <s:property
													value="piv2PaidDate" /></td>
                                                                                </tr>
                                                                                
                                                                                
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style22">
                                                                                        Printed PIV Number</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <s:property
													value="piv2PrintedPIVNumber" /></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style22">
                                                                                        Bank Code/Branch Code</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <s:property
													value="piv2BankCodeBranchCode" /></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style22">
                                                                                        Payment Mode</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <s:property
													value="piv2PaymentMode" /></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style22">
                                                                                        Cheque Date/Number</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <s:property
													value="piv2ChequeDateNumber" /></td>
                                                                                </tr>
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                <tr>
                                                                                    <td class="style15" colspan="4">
                                                                                        <strong>(9.)PIV II (Loan) Details</strong></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        </td>
                                                                                    <td class="style22">
                                                                                        Is PIV 02(Loan) Issued ?</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style19">
                                                                                        <img
													src="<s:text name="img_piv2_loan" />" ></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        </td>
                                                                                    <td class="style22">
                                                                                        PIV number</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style19">
                                                                                       <s:property value="piv2Number_loan" /> </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style22">
                                                                                        Amount</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <s:property value="piv2Amount_loan" /></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style22">
                                                                                        PIV Date</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <s:property value="piv2Date_loan" /></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style22">
                                                                                        Is PIV Paid?</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <img
													src="<s:text name="img_piv2LoanPaid" />" alt=""></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style22">
                                                                                        Date paid</td>
                                                                                    <td class="style9">
                                                                                        :</td>
                                                                                    <td class="style10">
                                                                                        <s:property value="piv2PaidDate_loan" /></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style22">
                                                                                        &nbsp;</td>
                                                                                    <td class="style9">
                                                                                        &nbsp;</td>
                                                                                    <td class="style10">
                                                                                        &nbsp;</td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style22">
                                                                                        &nbsp;</td>
                                                                                    <td class="style9">
                                                                                        &nbsp;</td>
                                                                                    <td class="style10">
                                                                                        &nbsp;</td>
                                                                                </tr>
                                                                    
                                                                    <tr>
                                                                        <td class="style15" colspan="4">
                                                                            <strong>(10.)Job Detials</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style17">
                                                                            &nbsp;</td>
                                                                        <td class="style22">
                                                                            Is job created ?</td>
                                                                        <td class="style18">
                                                                            :</td>
                                                                        <td>
                                                                            <img
													src="<s:text name="img_jobCreated" />" alt=""></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style17">
                                                                            &nbsp;</td>
                                                                        <td class="style22">
                                                                            Job Number</td>
                                                                        <td class="style18">
                                                                            :</td>
                                                                        <td>
                                                                            <s:property value="projectNumber" /></td>
                                                                    </tr>
                                                                    
                                                                    <tr>
                                                                        <td class="style17">
                                                                            &nbsp;</td>
                                                                        <td class="style22">
                                                                            Job Created Date</td>
                                                                        <td class="style18">
                                                                            :</td>
                                                                        <td>
                                                                            <s:property value="jobCreatedDate" /></td>
                                                                    </tr>
                                                                    
                                                                     <tr>
                                                                                    <td class="style8">
                                                                                        &nbsp;</td>
                                                                                    <td class="style12" colspan="3">
                                                                                        <table class="tldFromContent" border="1">
											    <tr>
											      <td><strong>Mat Code</strong></td>
											      <td><strong>Unit Pirce</strong></td>
											      <td><strong>Estimate Qty</strong></td>
											      <td><strong>Estimate Cost</strong></td>
										        </tr>
											    <s:iterator value="jobMaterialDetails">
											      <tr>
											        <td><s:property value="id.resCd" /></td>
											        <td align="right"><s:property value="unitPrice" /></td>
											        <td align="right"><s:property value="estimateQty" /></td>
											        <td align="right"><s:property value="estimateCost" /></td>
										          </tr>
										        </s:iterator>
										      </table></td>
                                                                                </tr>
                                                                    
                                                                    
                                                                     <tr>
                                                                        <td class="style17">
                                                                            &nbsp;</td>
                                                                        <td class="style22">
                                                                            Job Material Cost</td>
                                                                        <td class="style18">
                                                                            :</td>
                                                                        <td>
                                                                           <b> <s:property value="jobMaterialCost" /> </b> </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style17">
                                                                            &nbsp;</td>
                                                                        <td class="style22">
                                                                            Current Status of the Job</td>
                                                                        <td class="style18">
                                                                            :</td>
                                                                        <td style="background-color: #FFFF00">
                                                                            <s:property value="jobStatus" />  </td>
                                                                    </tr>
                                                                    
                                                                    
                                                                    <tr>
                                                                        <td class="style17">
                                                                            &nbsp;</td>
                                                                        <td class="style22">
                                                                            Contractor Allocated ?</td>
                                                                        <td class="style18">
                                                                            :</td>
                                                                        <td>
                                                                            <img
													src="<s:text name="img_contractorAllocated" />" ></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style17">
                                                                            &nbsp;</td>
                                                                        <td class="style22">
                                                                            Contractor Name</td>
                                                                        <td class="style18">
                                                                            :</td>
                                                                        <td>
                                                                            <s:property value="contractorName" /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style17">
                                                                            &nbsp;</td>
                                                                        <td class="style22">
                                                                            Contractor Allocated Date</td>
                                                                        <td class="style18">
                                                                            :</td>
                                                                        <td>
                                                                            <s:property value="contractorAllocatedDate" /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style17">
                                                                            &nbsp;</td>
                                                                        <td class="style22">
                                                                            Job Finished Date(System)</td>
                                                                        <td class="style18">
                                                                            :</td>
                                                                        <td>
                                                                            <s:property value="finishedDate" /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style17">
                                                                            &nbsp;</td>
                                                                        <td class="style22">
                                                                            Is consumer energized ?</td>
                                                                        <td class="style18">
                                                                            :</td>
                                                                        <td>
                                                                            <img
													src="<s:text name="img_enagized" />" alt=""> </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style17">
                                                                            &nbsp;</td>
                                                                        <td class="style22">
                                                                            Energized date</td>
                                                                        <td class="style18">
                                                                            :</td>
                                                                        <td>
                                                                            <s:property value="enagizedDate" /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style17">
                                                                            &nbsp;</td>
                                                                        <td class="style22">
                                                                            Bill Exported ?</td>
                                                                        <td class="style18">
                                                                            :</td>
                                                                        <td>
                                                                            <img
													src="<s:text name="img_billExported" />"  ></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style17">
                                                                            &nbsp;</td>
                                                                        <td class="style22">
                                                                            Bill Exported Date</td>
                                                                        <td class="style18">
                                                                            :</td>
                                                                        <td>
                                                                           <s:property value="billExportedDate" /> </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style17">
                                                                            &nbsp;</td>
                                                                        <td class="style22">
                                                                            Account Number</td>
                                                                        <td class="style18">
                                                                            :</td>
                                                                        <td>
                                                                          <s:property value="accountNumber" /> </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style17">
                                                                            &nbsp;</td>
                                                                        <td class="style22">
                                                                            Account Created Date</td>
                                                                        <td class="style18">
                                                                            :</td>
                                                                        <td>
                                                                            <s:property value="accountCreatedDate" /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style17">
                                                                            &nbsp;</td>
                                                                        <td class="style22">
                                                                            &nbsp;</td>
                                                                        <td class="style18">
                                                                            &nbsp;</td>
                                                                        <td>
                                                                            &nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style17">
                                                                            &nbsp;</td>
                                                                        <td class="style22">
                                                                            &nbsp;</td>
                                                                        <td class="style18">
                                                                            &nbsp;</td>
                                                                        <td>
                                                                            &nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style17">
                                                                            &nbsp;</td>
                                                                        <td class="style22">
                                                                            &nbsp;</td>
                                                                        <td class="style18">
                                                                            &nbsp;</td>
                                                                        <td>
                                                                            &nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style17">
                                                                            &nbsp;</td>
                                                                        <td class="style22">
                                                                            &nbsp;</td>
                                                                        <td class="style18">
                                                                            &nbsp;</td>
                                                                        <td>
                                                                            &nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style17">
                                                                            &nbsp;</td>
                                                                        <td class="style22">
                                                                            &nbsp;</td>
                                                                        <td class="style18">
                                                                            &nbsp;</td>
                                                                        <td>
                                                                            &nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style17">
                                                                            &nbsp;</td>
                                                                        <td class="style22">
                                                                            &nbsp;</td>
                                                                        <td class="style18">
                                                                            &nbsp;</td>
                                                                        <td>
                                                                            &nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style17">
                                                                            &nbsp;</td>
                                                                        <td class="style22">
                                                                            &nbsp;</td>
                                                                        <td class="style18">
                                                                            &nbsp;</td>
                                                                        <td>
                                                                            &nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style17">
                                                                            &nbsp;</td>
                                                                        <td class="style22">
                                                                            &nbsp;</td>
                                                                        <td class="style18">
                                                                            &nbsp;</td>
                                                                        <td>
                                                                            &nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style17">
                                                                            &nbsp;</td>
                                                                        <td class="style22">
                                                                            &nbsp;</td>
                                                                        <td class="style18">
                                                                            &nbsp;</td>
                                                                        <td>
                                                                            &nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style17">
                                                                            &nbsp;</td>
                                                                        <td class="style22">
                                                                            &nbsp;</td>
                                                                        <td class="style18">
                                                                            &nbsp;</td>
                                                                        <td>
                                                                            &nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style17">
                                                                            &nbsp;</td>
                                                                        <td class="style22">
                                                                            &nbsp;</td>
                                                                        <td class="style18">
                                                                            &nbsp;</td>
                                                                        <td>
                                                                            &nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style17">
                                                                            &nbsp;</td>
                                                                        <td class="style22">
                                                                            &nbsp;</td>
                                                                        <td class="style18">
                                                                            &nbsp;</td>
                                                                        <td>
                                                                            &nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style17">
                                                                            &nbsp;</td>
                                                                        <td class="style22">
                                                                            &nbsp;</td>
                                                                        <td class="style18">
                                                                            &nbsp;</td>
                                                                        <td>
                                                                            &nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style17">
                                                                            &nbsp;</td>
                                                                        <td class="style22">
                                                                            &nbsp;</td>
                                                                        <td class="style18">
                                                                            &nbsp;</td>
                                                                        <td>
                                                                            &nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style17">
                                                                            &nbsp;</td>
                                                                        <td class="style22">
                                                                            &nbsp;</td>
                                                                        <td class="style18">
                                                                            &nbsp;</td>
                                                                        <td>
                                                                            &nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style17">
                                                                            &nbsp;</td>
                                                                        <td class="style22">
                                                                            &nbsp;</td>
                                                                        <td class="style18">
                                                                            &nbsp;</td>
                                                                        <td>
                                                                            &nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style17">
                                                                            &nbsp;</td>
                                                                        <td class="style22">
                                                                            &nbsp;</td>
                                                                        <td class="style18">
                                                                            &nbsp;</td>
                                                                        <td>
                                                                            &nbsp;</td>
                                                                    </tr>
                                                                    </table>
                                                                        </td>
													</tr>
												</table>
												</td>
 
											</tr>

											 
											<tr>
												<td height="32">&nbsp;</td>
												<td height="32">
												
												<s:submit
													theme="simple" align="right" value="Exit" type="submit"
													method="Close" id="btnClose"></s:submit>
													
												
													
													</td>
												<td height="32">&nbsp;</td>
												<td height="32">&nbsp;</td>
												<td height="32">&nbsp;</td>
												<td width="285" height="32">&nbsp;</td>
												<td width="29" height="32">&nbsp;</td>
												<td width="28" height="32">&nbsp;</td>
												<td width="28" height="32">&nbsp;</td>
												<td width="28" height="32">&nbsp;</td>
												<td width="1" height="32">&nbsp;</td>
												<td width="1" height="32">&nbsp;</td>
												<td height="32">&nbsp;</td>
												<td height="32">&nbsp;</td>
												<td height="32">&nbsp;</td>
												<td height="32">&nbsp;</td>
												<td height="32">&nbsp;</td>
												<td height="32">&nbsp;</td>
												<td height="32">&nbsp;</td>
												<td height="32">&nbsp;</td>
												<td height="32">&nbsp;</td>
												<td height="32">&nbsp;</td>
												<td height="32">&nbsp;</td>
												<td height="32">&nbsp;</td>
												<td height="32">&nbsp;</td>
											</tr>
											<tr>
												<td colspan="25">&nbsp;</td>
											</tr>
										</table>

								  </s:form></td>
								</tr>

							</tbody>
						</table>

						</td>
					</tr>
					<tr>
						<td id="tdFooter" class="style20">
						<table class="tblFooter" border="1" cellpadding="0"
							cellspacing="0">

							<tbody>
								<tr align="Center">
									<td>@ Ceylon Electricity Board</td>
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
