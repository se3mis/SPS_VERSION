<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="/WEB-INF/jsp/include.jsp"%>
<%@ page language="java" %>
<html>
<head>
<sx:head />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>

<s:if test="%{isViewOnly == 'true'}">
VIEW ESTIMATION
</s:if>
<s:elseif test="%{isModify=='true'}">
MODIFY ESTIMATION
</s:elseif>
<s:elseif test="%{isUndoReject=='true'}">
UNDO REJECTED ESTIMATION
</s:elseif>
<s:elseif test="%{isApprove=='true'}">
APPROVE/REJECT ESTIMATION
</s:elseif>
<s:elseif test="%{isPrint=='true'}">
PRINT ESTIMATION
</s:elseif>
<s:else>NEW ESTIMATION</s:else>
</title>
<link rel="stylesheet" type="text/css" href="../../style/style.css" />

<script type="text/javascript" src="../../script/estimate.js"> </script>
<script type="text/javascript" src="../../script/javascript.js"> </script>
<script type="text/javascript" src="../../script/jquery/jquery.js"> </script>
<script type="text/javascript" src="../../script/jquery/jquery.min.js"> </script>

<link rel="stylesheet" type="text/css" href="../../script/ext-3.3.1/css/setup.css" media="all" />
<link rel="stylesheet" type="text/css" href="../../script/ext-3.3.1/resources/css/ext-all.css" />
<link rel="stylesheet" type="text/css" href="../../script/ext-3.3.1/resources/css/xtheme-gray.css" />
 <script type="text/javascript" src="../../script/ext-3.3.1/adapter/ext/ext-base.js"></script>
        <script type="text/javascript" src="../../script/ext-3.3.1/ext-all-debug.js"></script>
<link rel="stylesheet" type="text/css" href="../../style/datePicker.css" />		
<script src="../../script/jquery/jquery.datePicker-min.js" type="text/javascript"></script>
<script type="text/javascript"><!--
var estmatedCost = '';
var nodeId='';
var nodeText='';
var selectedpegItem='';

var allSelected = new Array();
Ext.onReady(function() {
clearPeggingScheduleForm();
 $('#estimateDatePicker').datePicker({clickInput:true});
 $('#pivDatePicker').datePicker({clickInput:true});
	
	var contextPath='sps/loadPegInfo.ajax';

	var pegTreeLoader = new Ext.tree.TreeLoader({
		url: contextPath + '?ajax_command=loadPegInfo' // equivalent to dataUrl
	});
	
	var pegTreePanel = new Ext.tree.TreePanel({
		title: 'Peg Info',
		collapsible: false,
		animCollapse: false,
		border: true,
		id: 'pegTree',
		el: 'pegTree', // html element id
		autoScroll: true,
		animate: false,
		enableDD: true,
		containerScroll: true,
		height: 400,
		width: 300,
		loader: pegTreeLoader,
		rootVisible: false,
		listeners: {
            click :function (node,checked) {
			
                if(node){
                	nodeId = node.id;
    				nodeText = node.text;
					selectedpegItem = node.id;
                    if(node.hasChildNodes()){
                        node.expand();
						
                        node.eachChild(function(n) {
                           // n.getUI().toggleCheck(checked);
							//alert(node.id);
							
                        });
                    }
                }
            }
        }// set for not displaying 'Global root';
	});

	// set the root node
	var pegTreeRoot = new Ext.tree.AsyncTreeNode({
		text: 'Global root',
		draggable: false,
		//id: '0' // id of the root node
		 id:'source'
	});

	
	var hiddenPkgs = [];
    var markCount = [];

   
	// render the tree
	//pegTreePanel.setRootNode(pegTreeRoot);
	//pegTreePanel.render();
	loadReviseJobNos();
});

function printingEstimate()
{

	
	
	//getData();
	//alert(itemCodeList.length);
	//for (var j = 0; j < itemCodeList.length; j++) {
	//	allSelected = allSelected+itemCodeList[j];
	//	alert(allSelected);
	//} 

	
	document.PIVApplet.print(
			$('#estimateNo').val(),$('#fundsou').val(),$('#description').val(),$('#categoryId').val(),$('#estimateDatePicker').val(),$('#listRescd').val(),
			$('#listResName').val(),$('#listUom').val(),$('#listUnitPrice').val(),$('#listQuantity').val(),$('#listEstimateCost').val(),$('#totPages').val(),$('#esname').val());
			
	
}
function printingEstimateSummary()
{
	
	
	
	//getData();
	//alert(itemCodeList.length);
	//for (var j = 0; j < itemCodeList.length; j++) {
	//	allSelected = allSelected+itemCodeList[j];
	//	alert(allSelected);
	//} 

			 
	document.PIVApplet.printDetailsEstimate(
			$('#estimateNo').val(),$('#fundsou').val(),$('#description').val(),$('#categoryId').val(),$('#estimateDatePicker').val()
			,$('#pivNo').val(),$('#amount').val(),$('#pivDatePicker').val(),$('#district').val(),$('#divSec').val(),$('#area').val()
			,$('#eCSC').val(),"0",$('#materialCost').val(),$('#wayleaves').val(),$('#transport').val(),$('#labour').val()
			,$('#subsistance').val(),$('#contingencies').val(),$('#overhead').val(),$('#otherCost').val(),$('#totalConstructionCost').val(),
			$('#rebateCost').val(),$('#totalcapitalCost').val(),$('#otherCostType').val());
			
	
}
function clearPeggingScheduleForm(){
	$.getJSON("smc/clearPeggingScheduleForm.ajax", {
			ajax_command: "clearPeggingScheduleForm",ajax_ieCacheFix:new Date().getTime() },
			function(json){ 
	
	});
	$("#estimateDetails tr:gt(0)").remove();
}
function show_OtherMaterials() {

	var wareHouseId=escape($("#wareHouseId").val());
	var applicationId=$("#applicationId").val();	
	
	
	document.getElementById('otherMatdiv').style.display = '';
	document.getElementById('otherResourcesdiv').style.display = 'none';
	document.getElementById('nplMatdiv').style.display = 'none';

	$.getJSON("smc/addOtherMaterials.ajax?warehouseId="+wareHouseId, {ajax_command: "loadAvailableOtherMaterials",ajax_ieCacheFix:new Date().getTime() },
		function(json){ 
		
				$("#otherMattable tr:gt(0)").remove();
				if(json.otherMaterials.length == 0){
					alert("No master data found for this cost center!!!!" );
				}				
				$.each(json.otherMaterials,function(i,otherMaterialsjson){
									
					var otherMattable = '<tr  id="otherMaterials'+otherMaterialsjson.resourceCode+'">'+
								'<td align="right"><input type="checkbox" class="required" style="text-align: left" name="chkMatCode" id="'+otherMaterialsjson.resourceCode+'"  value=""  /></td>'+	
								'<td id="resourceCode'+otherMaterialsjson.resourceCode+'" align="left" style="text-align: left">'+otherMaterialsjson.resourceCode+'</td>'+					
						
								'<td id="description'+otherMaterialsjson.resourceCode+'" align="left" style="text-align: left">'+otherMaterialsjson.resourceName+'</td>'+
								'<td id="uom'+otherMaterialsjson.resourceCode+'" align="left" style="text-align: left">'+otherMaterialsjson.uom+'</td>'+
								'<td id="s2d'+otherMaterialsjson.resourceCode+'" align="left" style="text-align: left" >'+otherMaterialsjson.unitPrice+'</td>'+
								'</tr></table></td>'+
								'</tr>';
							
					$('#otherMattable').append(otherMattable);
			
				});
		}
	);

}
function show_OtherResources() {

	//var wareHouseId=escape($("#wareHouseId").val());
	var applicationId=$("#applicationId").val();	
	//alert(applicationId);
	
	document.getElementById('otherResourcesdiv').style.display = '';
	document.getElementById('otherMatdiv').style.display = 'none';
	document.getElementById('nplMatdiv').style.display = 'none';
	
	$.getJSON("smc/showOtherResources.ajax", {ajax_command: "showOtherResources",ajax_ieCacheFix:new Date().getTime() },
		function(json){ 
		
				$("#otherResourceTable tr:gt(0)").remove();	
				if(json.otherResources.length == 0){
					alert("No master data found for this cost center!!!!" );
				}				
				$.each(json.otherResources,function(i,otherResourcejson){
									
					var otherResourceTable = '<tr  id="otherResource'+otherResourcejson.resourceCode+'">'+
								'<td align="right"><input type="checkbox" class="required" style="text-align: left" name="chkMatCode" id="'+otherResourcejson.resourceCode+'"  value=""  /></td>'+	
								'<td id="resourceCode'+otherResourcejson.resourceCode+'" align="left" style="text-align: left">'+otherResourcejson.resourceCode+'</td>'+
								'<td id="resourceType'+otherResourcejson.resourceCode+'" align="left" style="text-align: left">'+otherResourcejson.resourceType+'</td>'+					
								'<td id="resourceName'+otherResourcejson.resourceCode+'" align="left" style="text-align: left">'+otherResourcejson.resourceName+'</td>'+
								'<td id="uom'+otherResourcejson.resourceCode+'" align="left" style="text-align: left">'+otherResourcejson.uom+'</td>'+					
								'<td id="unitPrice'+otherResourcejson.resourceCode+'" align="left" style="text-align: left">'+otherResourcejson.unitPrice+'</td>'+
								//'<td align="right"><input type="text" class="required" style="text-align: left" name="estimateCost" id="estimateCost"  value=""  /></td>'+	
								//'<td id="resourceCode1'+otherResourcejson.resourceCode+'" align="middle" style="text-align: left">'+otherResourcejson.resourceCat+'</td>'+
								
								'</tr></table></td>'+
								'</tr>';
							
					$('#otherResourceTable').append(otherResourceTable);
			
				});
		}
	);

}

function show_NPLMaterials() {

	//var wareHouseId=escape($("#wareHouseId").val());
	var applicationId=$("#applicationId").val();	
	//alert(applicationId);
	
	//alert("hi");
	document.getElementById('nplMatdiv').style.display = '';
	document.getElementById('otherResourcesdiv').style.display = 'none';
	document.getElementById('otherMatdiv').style.display = 'none';

	
	$.getJSON("smc/showNPLMaterials.ajax", {ajax_command: "showNPLMaterials",ajax_ieCacheFix:new Date().getTime() },
		function(json){ 
		
				$("#NPLMaterialsTable tr:gt(0)").remove();
				if(json.otherNPLMaterials.length == 0){
					alert("No master data found for this cost center!!!!" );
				}		
				
				$.each(json.otherNPLMaterials,function(i,otherNPLjson){
						//alert(otherNPLjson.unitPrice);			
					var NPLMaterialsTable = '<tr  id="nplMaterials'+otherNPLjson.resourceCode+'">'+
						'<td align="right"><input type="checkbox" class="required" style="text-align: left" name="chkMatCode" id="'+otherNPLjson.resourceCode+'"  value=""  /></td>'+	
					'<td id="resourceCode'+otherNPLjson.resourceCode+'" align="left" style="text-align: left">'+otherNPLjson.resourceCode+'</td>'+					
			
					'<td id="description'+otherNPLjson.resourceCode+'" align="left" style="text-align: left">'+otherNPLjson.resourceName+'</td>'+
					'<td id="uom'+otherNPLjson.resourceCode+'" align="left" style="text-align: left">'+otherNPLjson.uom+'</td>'+
					'<td id="s2d'+otherNPLjson.resourceCode+'" align="left" style="text-align: left" >'+otherNPLjson.unitPrice+'</td>'+
					'</tr></table></td>'+
					'</tr>';
							//alert(NPLMaterialsTable);
					$('#NPLMaterialsTable').append(NPLMaterialsTable);
			
				});
		}
	);

}
function add_materials(resourType){

	addSelectedItems(resourType);


}

function hide_OtherMaterials()
{
	document.getElementById('otherMatdiv').style.display = 'none';
	
}
function hide_OtherResources()
{
	document.getElementById('otherResourcesdiv').style.display = 'none';
	
}
function hide_NPLResources()
{
	document.getElementById('nplMatdiv').style.display = 'none';
	
}
function addSelectedItems(resourType){

	var checkSelected = false;
	var selectedItemsList='';
	var selected = new Array();
    $("input:checkbox:checked").each(function() {
		
		selected.push($(this).attr('id'));
		$(this).attr('checked', false);
    });
	//document.getElementById('addedPegInfo').style.display = '';
	for (var j = 0; j < selected.length; j++) {
		selectedItemsList = selectedItemsList+selected[j]+'|';
	} 
	//alert(escape(resourType))
	    if(selectedItemsList !=''){
		$.getJSON("smc/loadAdditionalResourceDetails.ajax?selectedItems="+escape(selectedItemsList)+"&func=add"+"&resourceType="+escape(resourType), {
		ajax_command: "loadAdditionalResourceDetails",ajax_ieCacheFix:new Date().getTime() },
		function(json){ 
			
				if(json.invalid){	
				    invalidStatus = "true";
					alert(json.errorMessage);
					return;
				}
				$.each(json.addedMaterials,function(i,estimateDetails){
					
					//$('#totalcostRow').remove();
								//alert(json.addedMaterials.length);						
					var estimateDetails1 = '<tr  id="lineseciid'+estimateDetails.selectedPegId+'">'+	
					//'<td id="radio'+estimateDetails.selectedPegId+'" align="middle" ><input type="radio" class="required" style="text-align: right" name="pegradio" id="'+estimateDetails.selectedPegId+'"  value="'+estimateDetails.selectedPegId+'"  /></td>'+																							
					//'<td id="resourceType'+estimateDetails.selectedPegId+'" align="middle" >'+estimateDetails.resourceType+'</td>'+
					'<td id="resourceCode'+estimateDetails.selectedPegId+'" align="left" >'+estimateDetails.resourceCode+'</td>'+
					'<td id="resourceName'+estimateDetails.selectedPegId+'" align="left" >'+estimateDetails.resourceName+'</td>'+
					'<td id="uom'+estimateDetails.selectedPegId+'" align="left" >'+estimateDetails.uom+'</td>';
					//'<td id="unitPrice'+estimateDetails.selectedPegId+'" align="middle" >'+estimateDetails.unitPrice+'</td>';
					
					var estimateDetailsOtherResource ='<td id="unitPrice'+estimateDetails.selectedPegId+'" align="left" ><input type="text" class="required" style="text-align: right;color: green;" name="'+estimateDetails.unitPrice+'" id="'+estimateDetails.unitPrice+'"  maxlength="10" size="10" value="" onchange="onNumChange(this,'+estimateDetails.unitPrice+',\'' + estimateDetails.selectedPegId + '\')"/></td>'+
					'<td id="estimateQuantity'+estimateDetails.selectedPegId+'" align="left" ><input type="text" class="required" style="text-align: right;color: green;" name="'+estimateDetails.estimateQuantity+'" id="'+estimateDetails.estimateQuantity+'"  maxlength="10" size="10" value="1"  onchange="onNumChange(this,'+estimateDetails.unitPrice+',\'' + estimateDetails.selectedPegId + '\')" /></td>'+
						'<td align="left" ><input type="text" class="required" style="text-align: right;color: green;" name="estimateCost"  id="estimateCost'+estimateDetails.selectedPegId+'"  maxlength="10" size="10" value="" onchange="onNumChange(this,'+estimateDetails.unitPrice+',\'' + estimateDetails.selectedPegId + '\')" /></td>'+
						'<td width=\'25px\' align=\'center\'><image onclick="deleteDetailLine(\'' + estimateDetails.isFromPegSchedule + '\'' +',\'' + estimateDetails.selectedPegId + '\'' +',\'' + resourType+'\')" src="../../image/X.png" /></td>'+
					
						'</tr>';
					
					var estimateDetailsOther ='<td id="unitPrice'+estimateDetails.selectedPegId+'" align="left" >'+estimateDetails.unitPrice+'</td>'+
					'<td id="estimateQuantity'+estimateDetails.selectedPegId+'" align="left" ><input type="text" class="required" style="text-align: right;color: green;" name="'+estimateDetails.estimateQuantity+'" id="'+estimateDetails.estimateQuantity+'"  maxlength="10" size="10" value="" onchange="onNumChange(this,'+estimateDetails.unitPrice+',\'' + estimateDetails.selectedPegId + '\')" /></td>'+
						'<td align="left" ><input type="text" class="required" style="text-align: right;color: green;" readOnly="true" name="estimateCost"  id="estimateCost'+estimateDetails.selectedPegId+'"  maxlength="10" size="10" value=""  onchange="onNumChange(this,'+estimateDetails.unitPrice+',\'' + estimateDetails.selectedPegId + '\')"/></td>'+
						'<td width=\'25px\' align=\'center\'><image onclick="deleteDetailLine(\'' + estimateDetails.isFromPegSchedule + '\'' +',\'' + estimateDetails.selectedPegId + '\'' +',\'' + resourType+'\')" src="../../image/X.png" /></td>'+
					
						'</tr>';
					
					if(resourType=='otherMat'){
						$('#estimateDetails').append(estimateDetails1+estimateDetailsOther);
						
					}else{
					
						$('#estimateDetails').append(estimateDetails1+estimateDetailsOtherResource);
					}
					
				
					//$('#estimateDetails').append(estimateDetails1);
				
					
				});
				
				
			}
		);
 }else{
	alert("Please Select Items!!!...");
 }
	    
	
	
}

function onNumChangePegId(pegId){


selectedpegItem = pegId.value;
}
function onNumChange(quan,standCost,resourceCode){
//alert("hi");
	   if(!(quan.value > 0) || quan.value < 0){
	       
	       alert("Please enter valid Quantity");
	       quan.value = '';
	       return;
	    } else {
	        
			estmatedCost = quan.value*standCost;
			//$("#totalcost"+lineid).val(estmatedCost);
			$("#estimateCost"+resourceCode).val(estmatedCost);
			
			$.getJSON("smc/getEstimatedUpdateDetails.ajax?lineid="+resourceCode+"&quantity="+quan.value+"&linecost="+estmatedCost, {
				ajax_command: "getEstimatedUpdateDetails",ajax_ieCacheFix:new Date().getTime() },
				function(json){ 
		
			});
			
			var rows =$('#estimateDetails tr');
			var rowcount = rows.length;
			var calculatedCost=0;	
			var lineCost =0;
		
		  $("#estimateDetails tbody tr input[name$='estimateCost']").each(function() {
			  lineCost = $(this).val();
		
			  calculatedCost=parseFloat(isNaN(calculatedCost) ? 0 : calculatedCost) + parseFloat(isNaN(lineCost) ? 0 : lineCost);
				 
				 if(!isNaN(calculatedCost))
				 {
					 $("#totalCost").text(calculatedCost);
					 $("#totalCost").val(calculatedCost);
				 }
		   });

		}
	}

function onNumChange1(quantity){

var selectedID=nodeId;


document.getElementById('addedPegInfo').style.display = '';

	    if(selectedID !=''){
			$.getJSON("smc/prepareEstimateDetails.ajax?selectedPegId="+selectedID+"&quantity="+quantity.value, {
			ajax_command: "prepareEstimateDetails",ajax_ieCacheFix:new Date().getTime() },
			function(json){ 
				var myCell = $('#estimateDetails');
							//alert(json.description);
					$.each(json.estimateDetails,function(i,estimateDetail){
					//$('#lineseciid'+estimateDetail.selectedPegId).remove();
					
				//alert(json.scanStatus);
					//var edd=normjson.standardcost;			
				//$('#description').text(json.scanStatus);
															
				var estimateDetails = '<tr  id="lineseciid'+estimateDetail.selectedPegId+'">'+	
								//'<td id="radio'+estimateDetail.selectedPegId+'" align="middle" ><input type="radio" class="required" style="text-align: right" name="pegradio" id="'+estimateDetail.selectedPegId+'"  value="'+estimateDetail.selectedPegId+'"  /></td>'+																							
								'<td id="resourceType'+estimateDetail.selectedPegId+'" align="left" >'+estimateDetail.resourceType+'</td>'+
								'<td id="resourceCode'+estimateDetail.selectedPegId+'" align="left" >'+estimateDetail.resourceCode+'</td>'+
								'<td id="resourceCategory'+estimateDetail.selectedPegId+'" align="left" >'+estimateDetail.resourceCategory+'</td>'+
								'<td id="uom'+estimateDetail.selectedPegId+'" align="left" >'+estimateDetail.uom+'</td>'+
								'<td id="unitPrice'+estimateDetail.selectedPegId+'" align="left" >'+estimateDetail.unitPrice+'</td>'+
								//'<td id="estimateQuantity'+estimateDetail.selectedPegId+'" align="middle" >'+estimateDetail.estimateQuantity+'</td>'+
								//'<td id="estimateQuantity'+estimateDetail.selectedPegId+'" align="middle" ><input type="text" class="required" style="text-align: right" name="'+estimateDetail.estimateQuantity+'" id="'+estimateDetail.estimateQuantity+'"  maxlength="10" size="10" value="'+estimateDetail.estimateQuantity+'"  /></td>'+
								
								'<td id="estimateCost'+estimateDetail.selectedPegId+'" align="left" >'+estimateDetail.estimateCost+'</td>'+
								//'<td id="tolerance'+estimateDetail.selectedPegId+'" align="middle" >'+estimateDetail.tolerance+'</td>'+
								//'<td align="right"><input type="text" class="required" style="text-align: right" name="'+json.quantity+'" id="'+json.quantity+'"  maxlength="10" size="10" value=""  onchange="onNumChange(this)"  /></td>'+
								
								'</tr>';
							
$('#estimateDetails').append(estimateDetails);

					});
					
					//show_materials();
					//show_materials();
					//dojo.event.topic.publish("display_norms");
					//document.getElementById('otherMat').style.display = '';
								//$('#pkgtable').append(pkgTable1+pkgTable2);
				}
			);
	 }else{
		alert("Please Select Items!!!...");
	 }

}



function validateSelection(val){
var isSelected = false;
if(allSelected.length > 0){
for(var i =0; i<allSelected.length;i++){
                    //alert(val == selected[i]);
               if(val == allSelected[i]){
			//alert("hi");
					 alert("Already have selected that item!!!!");
					  isSelected = true;
                   }else{
				    isSelected = false;
				   }                            
            }
	}
	
	return isSelected;
}	

function validateQuantity(quan){

   if(!(quan.value > 0) || quan.value < 0){
       
       alert("Please enter valid Quantity");
       quan.value = '';
       return;
    }
}	
function addPegItems(){
	var applicationId=$("#applicationId").val();	
	//alert(applicationId);
	if(applicationId==-1){
		alert("Please select Reference Number");
		return;
	}
	var selectedID=nodeId;
	var selectedIDValue = nodeText;
	
	document.getElementById('addedPegInfo').style.display = '';
	  if(selectedID ==''){
		alert("Please Select Items!!!...");
		
       return;
	  }
	  if( document.getElementById('itemquantity').value ==''){
		alert("Please Enter Item Quantity!!!...");
		
       return;
	  }
	 nodeId='';
	 nodeText='';
	 var invalidStatus = "false";
	//alert(document.getElementById('itemquantity').value);
	
    	   
			$.getJSON("smc/showPegInfo.ajax?selectedPegId="+selectedID+"&selectedPegText="+selectedIDValue+"&quantity="+document.getElementById('itemquantity').value+"&applicationId="+applicationId, {
				ajax_command: "showPegInfo",ajax_ieCacheFix:new Date().getTime() },
				function(json){ 
					var myCell = $('#pkgtable');
								
					if(json.invalid){
					    invalidStatus = "true";
						alert(json.errorMessage);
						return;
					}	
 					
					var pkgTable1 = '<tr  id="pegid'+json.selectedPegId+'">'+	
									'<td id="radio'+json.selectedPegId+'" align="left" ><input type="radio" class="required" style="text-align: right" name="pegradio" id="'+json.selectedPegId+'"  value="'+json.selectedPegId+'"  onchange="onNumChangePegId(this)"  /></td>'+																							
									'<td id="description'+json.selectedPegId+'" align="left" >'+json.description+'</td>'+
									'<td id="quantity'+json.selectedPegId+'" align="left" >'+document.getElementById('itemquantity').value+'</td>'+
									//'<td align="right"><input type="text" class="required" style="text-align: right" name="'+json.quantity+'" id="'+json.quantity+'"  maxlength="10" size="10" value="" onchange="onNumChange1(this)" /></td>'+
									//'<td width=\'25px\' align=\'center\'><image onclick="deletePegDetailLine(\'' + json.selectedPegId + '\')" src="../../image/X.png" /></td>'+
									'</tr>';
								
					$('#pkgtable').append(pkgTable1);
					$.each(json.estimateDetails,function(i,estimateDetail){
						
															
					var estimateDetails = '<tr  id="lineseciid'+estimateDetail.resourceCode+'">'+	
									//'<td id="radio'+estimateDetail.selectedPegId+'" align="middle" ><input type="radio" class="required" style="text-align: right" name="pegradio" id="'+estimateDetail.selectedPegId+'"  value="'+estimateDetail.selectedPegId+'"  /></td>'+																							
									//'<td id="resourceType'+estimateDetail.selectedPegId+estimateDetail.resourceCode+'" align="middle" >'+estimateDetail.resourceType+'</td>'+
									'<td id="resourceCode'+estimateDetail.resourceCode+'" align="left" >'+estimateDetail.resourceCode+'</td>'+
									'<td id="resourceName'+estimateDetail.resourceCode+'" align="left" >'+estimateDetail.resourceName+'</td>'+
									'<td id="uom'+estimateDetail.resourceCode+'" align="left" >'+estimateDetail.uom+'</td>'+
									'<td id="unitPrice'+estimateDetail.resourceCode+'" align="left" >'+estimateDetail.unitPrice+'</td>'+
									'<td id="estimateQuantity'+estimateDetail.resourceCode+'" align="left" ><input type="text" class="required" style="text-align: right;color: green;" name="'+estimateDetail.estimateQuantity+'" id="'+estimateDetail.estimateQuantity+'"  maxlength="10" size="10"  value="'+estimateDetail.estimateQuantity+'" onchange="onNumChange(this,'+estimateDetail.unitPrice+',\'' + estimateDetail.resourceCode + '\')" /></td>'+
									'<td align="left" ><input type="text" class="required" style="text-align: right;color: green;"  name="estimateCost"  id="estimateCost'+estimateDetail.resourceCode+'"  maxlength="10" size="10" value="'+estimateDetail.estimateCost+'"  /></td>'+

									'<td width=\'25px\' align=\'center\'><image onclick="deleteDetailLine(\'' + estimateDetail.isFromPegSchedule + '\'' +',\'' + estimateDetail.resourceCode + '\'' +',\'' + null+'\')" src="../../image/X.png" /></td>'+

									'</tr>';
								
								$('#estimateDetails').append(estimateDetails);
						
					}
					
				);
			}
		);
		catculateTotalCost();
				
	

}

function catculateTotalCost(){
	
		var rows =$('#estimateDetails tr');
		var rowcount = rows.length;
		var calculatedCost=0;	
		var lineCost =0;
		//alert(rows);
	  $("#estimateDetails tbody tr input[name$='estimateCost']").each(function() {
		  lineCost = $(this).val();
	
		  calculatedCost=parseFloat(isNaN(calculatedCost) ? 0 : calculatedCost) + parseFloat(isNaN(lineCost) ? 0 : lineCost);
			 
			 
	   });
	   if(!isNaN(calculatedCost)){
	  
				// $("#totalCost").text(calculatedCost);
				 $("#totalCost").val(calculatedCost);
				 
			 }
			  //alert(calculatedCost);
}


function deleteDetailLine(isFromPegSchedule,lineid,resourceType){
//alert(resourceType);

	
	var status= confirm("Do you really want to remove this ?");
	 if (status== true){
		 var deleteItemValue=$("#estimateCost"+lineid).val();	
			
			var totalEstimatedCost=$("#totalCost").val();
			
			var newCost = 0;
			if(!document.getElementById("estimateCost"+lineid).value==''){
				newCost= totalEstimatedCost - parseFloat(deleteItemValue);
			}
			
				
			$("#totalCost").val(newCost);
	
			//alert(lineid);
				
				$('#lineseciid'+lineid).remove();
				$.getJSON("smc/deleteReviseDetails.ajax?selectedItems="+lineid, {
				ajax_command: "deleteReviseDetails",ajax_ieCacheFix:new Date().getTime() },
					function(json){ 
						if(json.invalid){	
						    invalidStatus = "true";
							alert(json.errorMessage);
							return;
						}
							
					}
				);
			
			//}
	 }
	 else{
	  	return;
	 }
	  			
	
	
}
function viewMasterDetails(){
	
	var selectedID=selectedpegItem;
	
	document.getElementById('addedPegInfo').style.display = '';
	//alert(selectedID);
    	    if(selectedID !=''){
				$.getJSON("smc/viewMasterDetails.ajax?selectedPegId="+selectedID, {
				ajax_command: "viewMasterDetails",ajax_ieCacheFix:new Date().getTime() },
				function(json){ 
					var myCell = $('#masterDetails');
								//alert(json.description);
								$("#masterDetails tr:gt(0)").remove();
						$.each(json.masterDetails,function(i,masterDetail){
						//$('#linesecid'+i).remove();
							
					//alert(json.scanStatus);
						//var edd=normjson.standardcost;			
					//$('#description').text(json.scanStatus);
																
					var masterDetails = '<tr  id="linesecid'+masterDetail.selectedPegId+'">'+	
									'<td id="resourceType'+masterDetail.selectedPegId+'" align="left" >'+masterDetail.resourceType+'</td>'+
									'<td id="resourceCode'+masterDetail.selectedPegId+'" align="left" >'+masterDetail.resourceCode+'</td>'+
									'<td id="resourceName'+masterDetail.selectedPegId+'" align="left" >'+masterDetail.resourceName+'</td>'+
									'<td id="estimateQuantity'+masterDetail.selectedPegId+'" align="left" >'+masterDetail.estimateQuantity+'</td>'+
									'</tr>';
								
$('#masterDetails').append(masterDetails);

						});
						
						
					}
				);
		 }else{
			alert("Please Select Items!!!...");
		 }
	
}

function load_ResourceTypes()
{


	//$("#applicationRefs select option:gt(0)").remove();
	//$("#subcribers select option:gt(0)").remove();
	 $.getJSON("sps/loadResourceTypes.ajax", {ajax_command:"loadResourceTypes",ajax_ieCacheFix:new Date().getTime()}, function(json) {

        if (json.jsonarrayResourceTypes != null && json.jsonarrayResourceTypes.length > 0) {
            for (x = 0; x < json.jsonarrayResourceTypes.length; x++) {
             
                $("#resourceTypes select").append($('<option></option>').val(json.jsonarrayResourceTypes[x].id).html(json.jsonarrayResourceTypes[x].name));
            }
        }
       
	 });
	

	
}
function load_ResourceCodes(resourceTypeId)
{

//if(resourceTypeId=="0"){
			$('#resourceName').val("");	
			$('#unitPrice').val("");
			$('#tollerance').val("");	
			$('#estiQuantity').val("");	
			$('#totalCost').val("");
			
			//return;	
			//}
	//$("#applicationRefs select option:gt(0)").remove();
	$("#resourceCodes select option:gt(0)").remove();
	//alert(resourceTypeId.value);
	 $.getJSON("sps/loadResourceCodes.ajax?resourceTypeId="+resourceTypeId.value, {ajax_command:"loadResourceCodes",ajax_ieCacheFix:new Date().getTime()}, function(json) {

        if (json.jsonarrayResourceCodes != null && json.jsonarrayResourceCodes.length > 0) {
            for (x = 0; x < json.jsonarrayResourceCodes.length; x++) {
             
                $("#resourceCodes select").append($('<option></option>').val(json.jsonarrayResourceCodes[x].id).html(json.jsonarrayResourceCodes[x].name));
            }
        }
       
	 });

	
}
function showAddJobInfo()
{
	document.getElementById('newEstimaleDetails').style.display = '';
	load_ResourceTypes();
}
function cancel(){

	document.getElementById('newEstimaleDetails').style.display = 'none';
}

function loadEstimateData(){

		$('#resourceName').val("");	
		$('#unitPrice').val("");
		$('#tollerance').val("");	
		$('#estiQuantity').val("");	
		$('#totalCost').val("");
			
		$("#resourceCodes select option:gt(0)").remove();
	//alert(resourceType.value);
		//var resourceTypeId=resourceType.value;	
		var resourceTypeId=escape($("#resourceTypeId").val());	
		$.getJSON("smc/loadResourceDetails.ajax?resourceTypeId="+resourceTypeId, {
		ajax_command: "loadResourceDetails",ajax_ieCacheFix:new Date().getTime() },
		function(json){ 
				
			$('#lineSectypeId').val(json.lineSectypeId);				
			$('#resourceName').val(json.resourceName);	
			$('#unitPrice').val(json.unitPrice);
			$('#tollerance').val(json.tolerance);	
			$('#estiQuantity').val(json.estimateQuantity);	
			$('#totalCost').val(json.totalCost);
				 
			if (json.jsonarrayResourceCodes != null && json.jsonarrayResourceCodes.length > 0) {
				for (x = 0; x < json.jsonarrayResourceCodes.length; x++) {
				 
					$("#resourceCodes select").append($('<option></option>').val(json.jsonarrayResourceCodes[x].id).html(json.jsonarrayResourceCodes[x].name));
				}
				$('#resourceCodeId').val(json.resourceCode);
			}

			});

	}
function calculateTotal(quan,unitPrice,resourceCode){


	
//if(!($('#estiQuantity').val() > 0) || $('#estiQuantity').val() < 0){
     if(!(quan.value > 0) || quan.value < 0){   
       alert("Please enter valid Quantity");
      // $('#estiQuantity').val('');
	   quan.value = '';
       return;
      
    }
	//alert("quan "+quan  ",unitPrice"+unitPrice "resourceCode"+resourceCode);
	document.getElementById('totalCost').style.display = '';
	
	//$("#totalCost").val($('#unitPrice').val()*quan.value);


	var estmatedCost = quan.value*unitPrice;
	//alert();
	//alert($("#estimateCost"+resourceCode));
		$("#estimateCost"+resourceCode).val(estmatedCost);
		
		
		
		var rows =$('#estimateDetails tr');
		var rowcount = rows.length;
		var calculatedCost=0;	
		var lineCost =0;
	
	  $("#estimateDetails tbody tr input[name$='estimateCost']").each(function() {
		  lineCost = $(this).val();
	
		  calculatedCost=parseFloat(isNaN(calculatedCost) ? 0 : calculatedCost) + parseFloat(isNaN(lineCost) ? 0 : lineCost);
			 
			 if(!isNaN(calculatedCost))
			 {
				 $("#totalCost").text(calculatedCost);
				 $("#totalCost").val(calculatedCost);
			 }
	   });

	   
 /*if(!(quan.value > 0) || quan.value < 0){
       
       alert("Please enter valid Quantity");
       quan.value = '';
       return;
    }	*/
}
function loadReviseJobNos(){
	clearPeggingScheduleForm();
	
	 $.getJSON("sps/loadJobNumbers.ajax?selectedCustomer=" + 1, {ajax_command:"loadJobNumbers",ajax_ieCacheFix:new Date().getTime()}, function(json) {
//alert("hi");
	 //alert(json.jsonarrayapplicationrefs.length);
	 //  alert(json.jsonarrayEstimationRefNumbers.length);
	  // alert("hi");
      
	       if (json.jsonarrayrevisejobNos != null && json.jsonarrayrevisejobNos.length > 0) {
	           for (x = 0; x < json.jsonarrayrevisejobNos.length; x++) {
	            
	               $("#projectNos select").append($('<option></option>').val(json.jsonarrayrevisejobNos[x].id).html(json.jsonarrayrevisejobNos[x].name));
	           }
	       }
		  
	       $('#costCenterNo').val(json.costCenter);
		 });
	
}



function loadDefaultDropDownsValues(){
clearPeggingScheduleForm();
	  if( $('#applicationId').val() != '-1' || $('#projectNo').val() != '-1' ){
	  //alert("hi");
	  $("#wareHouse select option:gt(0)").remove();
	  $("#fundsource select option:gt(0)").remove();
	  $("#category select option:gt(0)").remove();
	  $("#funid select option:gt(0)").remove();
	  
	  
	 $.getJSON("sps/loadDefaultDropDownsValues.ajax?selectedCustomer=" + 1, {ajax_command:"loadDropDownsValues",ajax_ieCacheFix:new Date().getTime()}, function(json) {

				   if (json.jsonWarehouses != null && json.jsonWarehouses.length > 0) {
					   for (x = 0; x < json.jsonWarehouses.length; x++) {
						
						   $("#wareHouse select").append($('<option></option>').val(json.jsonWarehouses[x].id).html(json.jsonWarehouses[x].name));
					   }
				   }
				 $('#costCenterNo').val(json.costCenter);
				 $('#wareHouseId').val(json.warehouse);

				 if (json.jsonFundsources != null && json.jsonFundsources.length > 0) {
					 for (x = 0; x < json.jsonFundsources.length; x++) {
					  
						 $("#fundsource select").append($('<option></option>').val(json.jsonFundsources[x].id).html(json.jsonFundsources[x].name));
					 }
				 }
				  $('#fundsou').val(json.fundsource);
				 
				   if (json.jsonCategoryCodes != null && json.jsonCategoryCodes.length > 0) {
					   for (x = 0; x < json.jsonCategoryCodes.length; x++) {
						
						   $("#category select").append($('<option></option>').val(json.jsonCategoryCodes[x].id).html(json.jsonCategoryCodes[x].name));
					   }
				   }
				
				 $('#categoryId').val(json.categoryCode);
				 
				  if (json.jsonfundIds != null && json.jsonfundIds.length > 0) {
					   for (x = 0; x < json.jsonfundIds.length; x++) {
						
						   $("#funid select").append($('<option></option>').val(json.jsonfundIds[x].id).html(json.jsonfundIds[x].name));
					   }
				   }
				
				 $('#fundid').val(json.fundid);
			
	 });
	  }
	
	
}

function loadCategoryCodes(){
	$("#category select option:gt(0)").remove();
	 $.getJSON("sps/loadCategoryCodes.ajax?warehouse=" +$('#wareHouseId').val(), {ajax_command:"loadCategoryCodes",ajax_ieCacheFix:new Date().getTime()}, function(json) {

       if (json.categoryCodes != null && json.categoryCodes.length > 0) {
           for (x = 0; x < json.categoryCodes.length; x++) {
            
               $("#category select").append($('<option></option>').val(json.categoryCodes[x].id).html(json.categoryCodes[x].name));
           }
       }
      
  	 $('#categoryId').val(json.categoryCode);

  
	 });
	
	
}

function loadFundIds(){
//alert( $('#fundsou').val());
	$("#funid select option:gt(0)").remove();
	 $.getJSON("sps/loadFundIds.ajax?foundsource=" + $('#fundsou').val()+"&deptId="+$('#costCenterNo').val(), {ajax_command:"loadFundIds",ajax_ieCacheFix:new Date().getTime()}, function(json) {

       if (json.jsonfundIds != null && json.jsonfundIds.length > 0) {
					   for (x = 0; x < json.jsonfundIds.length; x++) {
						
						   $("#funid select").append($('<option></option>').val(json.jsonfundIds[x].id).html(json.jsonfundIds[x].name));
					   }
				   }
				
				 $('#fundid').val(json.fundid);

  
	 });
	
	
}

function loadReviseDetails(val){
		loadDefaultDropDownsValues();
	   		//alert(val.value);
		if(val.value=="-1"){
			
		$('#totalCost').val("");	
		$('#rebate').val("");
		$('#estimateDatePicker').val("");	
		$('#fundsou').val("");	
		$('#wareHouseId').val(-1);	
		$('#fundid').val("");	
		$('#amount').val("");	
		$('#fileRef').val("");	
		$('#description').val("");	
		$('#categoryId').val("");	
		$('#pivNo').val("");
		$('#pivDatePicker').val("");
		$('#reviseReason').val("");
		$('#rejectReason').val("");
		//$("#amount").attr("disabled", "disabled");
		$("#update").attr("disabled", "disabled");
		$("#projectNo").val("");
		$("#applicationId").val(-1);
			//$("#update").attr("disabled", "disabled");
			//$("#save").attr("disabled", "disabled");
			//$("#bulkAddSub").attr("disabled", "disabled");
			//$("#landAddSub").attr("disabled", "disabled");
			return;	
		}else{
			//document.getElementById('normsdiv').style.display = 'none';
		  	$("#update").removeAttr("disabled");
		  	//$("#bulkAddSub").removeAttr("disabled");
		  	//$("#landAddSub").removeAttr("disabled");
		   	//$("#update").removeAttr("disabled");
		}
	
		$.getJSON("smc/loadReviseDetails.ajax?projectNo="+val.value, {
		ajax_command: "loadReviseDetailsForPrint",ajax_ieCacheFix:new Date().getTime() },
		function(json){ 
			
			//$('#totalCost').val(json.totalCost);
			$("#totalCostDisplay").val(json.totalCost);	
			//$("#totalCostConsumerPayable").val(intToFormat(json.totalCostPayable));			
			$('#rebate').val(json.rebate);
			$('#estimateDatePicker').val(json.estimateDatePicker);	
			$('#fundsou').val(json.fundsou);	
			$('#fundid').val(json.fundid);
			$('#reviseReason').val(json.reviseReason);
			$('#rejectReason').val(json.rejectedReason);
			$('#description').val(json.description);	
			$('#categoryId').val(json.categoryId);	
			$('#pivNo').val(json.pivNo);	
			$('#amount').val(json.amount);
			$('#estimateNo').val(json.estimateNo);
			
			//$('#applicationId').val(json.stdEstimateNo);
			 $('#costCenterNo').val(json.costCenter);
//alert(json.estimateDetails.length);			
			$('#pivDatePicker').val(json.pivDatePicker);	
			$('#listRescd').val(json.listRescd);	
			$('#listResName').val(json.listResName);	
			$('#listUnitPrice').val(json.listUnitPrice);	
			$('#listUom').val(json.listUom);	
			$('#listQuantity').val(json.listQuantity);	
			$('#listEstimateCost').val(json.listEstimateCost);	
			$('#materialCost').val(json.materialCost);	
			$('#wayleaves').val(json.wayleaves);	
			$('#transport').val(json.transport);	
			$('#labour').val(json.labour);	
			$('#subsistance').val(json.subsistance);	
			$('#contingencies').val(json.contingencies);	
			$('#overhead').val(json.overhead);	
			$('#totalConstructionCost').val(json.totalConstructionCost);	
			$('#totalcapitalCost').val(json.totalcapitalCost);
			$('#rebateCost').val(json.rebateCost);
			$('#totPages').val(json.totPages);
			$('#otherCost').val(json.otherCost);
			$('#divSec').val(json.divSec);
			$('#area').val(json.area);
			$('#eCSC').val(json.eCSC);
			$('#district').val(json.district);
			$('#esname').val(json.esname);
			$('#otherCostType').val(json.otherCostType);
			

				$.each(json.estimateDetails,function(i,estimateDetail){
							
																
						var estimateDetails = '<tr  id="lineseciid'+estimateDetail.resourceCode+'">'+	
										//'<td id="radio'+estimateDetail.selectedPegId+'" align="middle" ><input type="radio" class="required" style="text-align: right" name="pegradio" id="'+estimateDetail.selectedPegId+'"  value="'+estimateDetail.selectedPegId+'"  /></td>'+																							
										//'<td id="resourceType'+estimateDetail.selectedPegId+estimateDetail.resourceCode+'" align="middle" >'+estimateDetail.resourceType+'</td>'+
										'<td id="resourceCode'+estimateDetail.resourceCode+'" align="left" >'+estimateDetail.resourceCode+'</td>'+
										'<td id="resourceName'+estimateDetail.resourceCode+'" align="left" >'+estimateDetail.resourceName+'</td>'+
										'<td id="uom'+estimateDetail.resourceCode+'" align="left" >'+estimateDetail.uom+'</td>'+
										'<td id="unitPrice'+estimateDetail.resourceCode+'" align="left" >'+estimateDetail.unitPrice+'</td>'+
										'<td id="estimateQuantity'+estimateDetail.resourceCode+'" align="left" ><input type="text" class="required" style="text-align: right;color: green;" name="'+estimateDetail.estimateQuantity+'" id="'+estimateDetail.estimateQuantity+'"  maxlength="10" size="10" readonly="true" value="'+estimateDetail.estimateQuantity+'" onchange="onNumChange(this,'+estimateDetail.unitPrice+',\'' + estimateDetail.resourceCode + '\')"  /></td>'+
										'<td align="left" ><input type="text" class="required" style="text-align: right;color: green;"  name="estimateCost"  id="estimateCost'+estimateDetail.resourceCode+'"  maxlength="10" size="10" readonly="true" value="'+estimateDetail.estimateCost+'"  /></td>'+
	
										//'<td width=\'25px\' align=\'center\'><image onclick="deleteDetailLine(\'' + estimateDetail.isFromPegSchedule + '\'' +',\'' + estimateDetail.resourceCode + '\'' +',\'' + null+'\')" src="../../image/X.png" /></td>'+
	
										'</tr>';
									
									$('#estimateDetails').append(estimateDetails);
							
				}
				);

				$.each(json.pegDetails,function(i,pegDetail){
				
	
						var pkgTable1 = '<tr  id="pegid'+pegDetail.selectedPegId+'">'+	
						'<td id="radio'+pegDetail.selectedPegId+'" align="left" ><input type="radio" class="required" style="text-align: right" name="pegradio" id="'+pegDetail.selectedPegId+'"  value="'+pegDetail.selectedPegId+'"  onchange="onNumChangePegId(this)"  /></td>'+																							
						'<td id="description'+pegDetail.selectedPegId+'" align="left" >'+pegDetail.description+'</td>'+
						'<td id="quantity'+pegDetail.selectedPegId+'" align="left" >'+pegDetail.quantity+'</td>'+
						//'<td align="right"><input type="text" class="required" style="text-align: right" name="'+json.quantity+'" id="'+json.quantity+'"  maxlength="10" size="10" value="" onchange="onNumChange1(this)" /></td>'+
						//'<td width=\'25px\' align=\'center\'><image onclick="deletePegDetailLine(\'' + json.selectedPegId + '\')" src="../../image/X.png" /></td>'+
						'</tr>';
					
						$('#pkgtable').append(pkgTable1);
	
				}
				);
			});

		
	}
</script>

</head>

<body>
<table id="tblOuter" class="tblOuter">
	<tbody>
		<tr>
			<td>
			<table id="tblInner" class="tblInner" >
				<tbody>
					<tr>
						<td width="303" id="tdHeader">
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
					<tr  class="tblInner">
						<td>
						<s:form id="frmRevise" name="frmRevise" action="reviseJobBS!ReviseValidationBS" method="POST"
										validate="true" theme="simple">
						  		<table align="center" class="tldFromContent1" width="100%">
						  			<tr>
									<td width="25%">Job No</td>
									<td width="25%">
										<div id="projectNos"><select name="projectNo" id="projectNo" onchange="loadReviseDetails(this)"><option value="-1">--Select--</option></select></div>
									</td>
									<td  width="25%">Fund Source</td>
									<td  width="25%"><div id="fundsource"><select name="fundsou" id="fundsou" onchange="loadFundIds()" disabled="disabled"></select></div></td>
									<td  width="25%">File Ref</td>
									<td  width="25%"><input type="text" name="fileRef"  id="fileRef" " disabled="disabled"/></td>
									
									</tr>
									<tr>
									
									<td  width="25%">Cost Center</td>
									<td  width="25%"><input type="text" name="costCenterNo"  id="costCenterNo"  disabled="disabled"/>
									</td>
									<td  width="25%">&nbsp;</td>
									<td  width="25%">&nbsp;</td>
									<td  width="25%">PIV Number</td>
									<td  width="25%"><input type="text" name="pivNo"  id="pivNo"/></td>
									</tr>
									<tr>
									<td  width="25%">Ware House</td>
									<td  width="25%"><div id="wareHouse"><select name="wareHouseId" id="wareHouseId" onchange="loadCategoryCodes()" disabled="disabled"><option value="-1">--Select--</option></select></div></td>
									<td  width="25%">&nbsp;</td>
									<td  width="25%">&nbsp;</td>
									<td  width="25%">Amount</td>
									<td  width="25%"><input type="text" name="amount"  id="amount" onChange="validateQuantity(this)" disabled="disabled"/></td>
									
									</tr>
									<tr>
									<td  width="25%">Estimate Date</td>
									<td  width="25%"><input type="text"  name="it" id="estimateDatePicker" readOnly="true" disabled="disabled"/></td>
									
									<td  width="25%">Fund ID</td>
									<td  width="25%"><div id="funid"><select name="fundid" id="fundid" disabled="disabled"></select></div></td>
									<td  width="25%">Rebate</td>
									<td  width="25%"><input type="text" name="rebate"  id="rebate" onChange="validateQuantity(this)" disabled="disabled"/></td>
									</tr>
									<tr>
									<td  width="25%">Total Cost</td>
									<td  width="25%"><input type="text" name="totalCost"  id="totalCost" readOnly="true" disabled="disabled"/>
										<input type="text" name="totalCostDisplay"  id="totalCostDisplay" readOnly="true"/></td>
									<!--<s:if test="%{smcType='TCI' && (costCenterNo=='510.20' || costCenterNo=='543.10' || costCenterNo=='543.20' || costCenterNo=='543.40'}"> 
										<td  width="25%">Total Cost Payable By Consumer</td>
										<td  width="25%"><input type="text" name="totalCostConsumerPayable"  id="totalCostConsumerPayable" readOnly="true"/></td>
									</s:if>-->
									<td  width="25%">Estimate categoty</td>
									<td  width="25%"><div id="category"><select name="categoryId" id="categoryId" disabled="disabled"></select></div></td>
									<td  width="25%">Description</td>
									<td  width="25%"><textarea name="description" id="description" rows="5" cols="60" disabled="disabled"></textarea></td>
									
									</tr>
									<tr>
									<td  width="25%">PIV Date</td>
									<td  width="25%"><input type="text"  name="it1" id="pivDatePicker" readOnly="true"/></td>
									<td  width="25%">Revise Reason</td>
									<td  width="25%"><textarea name="reviseReason" id="reviseReason" rows="5" cols="30" disabled="disabled"></textarea></td>
									<td  width="25%">Reject Reason</td>
									<td  width="25%"><textarea name="rejectReason" id="rejectReason" rows="5" cols="60" disabled="disabled"></textarea></td>
									
									</tr>
									
									<tr>
									<td  width="25%">Estimate Number</td>
									<td  width="25%"><input type="text"  name="estimateNo" id="estimateNo" readOnly="true" disabled="disabled"/></td>
									
									
									<td  width="25%">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td  width="25%">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td  width="25%">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td  width="25%">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td  width="25%">&nbsp;&nbsp;&nbsp;&nbsp;</td>
								
									<td  width="25%">
										
																
								
									</tr>
							<tr>
									<td  width="25%">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td  width="25%">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td  width="25%">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td  width="25%">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td  width="25%">&nbsp;&nbsp;&nbsp;&nbsp;</td>
								
									<td  width="25%">
									
									
									<input type="hidden" name="estimateNo"  id="estimateNo" />
									<input type="hidden" name="listRescd"  id="listRescd" />
									<input type="hidden" name="listResName"  id="listResName" />
									<input type="hidden" name="listUnitPrice"  id="listUnitPrice" />
									<input type="hidden" name="listUom"  id="listUom" />
									<input type="hidden" name="listQuantity"  id="listQuantity" />
									<input type="hidden" name="listEstimateCost"  id="listEstimateCost" />
									<input type="hidden" name="materialCost"  id="materialCost" />
									<input type="hidden" name="wayleaves"  id="wayleaves" />
									
									<input type="hidden" name="transport"  id="transport" />
									<input type="hidden" name="labour"  id="labour" />
									<input type="hidden" name="subsistance"  id="subsistance" />
									<input type="hidden" name="contingencies"  id="contingencies" />
									<input type="hidden" name="overhead"  id="overhead" />
									<input type="hidden" name="otherCost"  id="otherCost" />
									<input type="hidden" name="totalConstructionCost"  id="totalConstructionCost" />
									<input type="hidden" name="rebateCost"  id="rebateCost" />
									<input type="hidden" name="totalcapitalCost"  id="totalcapitalCost" />
									<input type="hidden" name="totPages"  id="totPages" />
									
									<input type="hidden" name="otherCostType"  id="otherCostType" />
									
									<s:if test="%{costCenterNo=='520.20' || costCenterNo=='520.30' || costCenterNo=='521.00'  || costCenterNo=='521.20'  || costCenterNo=='521.40'  || costCenterNo=='521.10' || costCenterNo=='514.20' || costCenterNo=='521.10' || costCenterNo=='521.20' ||
																									costCenterNo=='521.30' || costCenterNo=='521.40' || costCenterNo=='521.50' || costCenterNo=='522.00'  ||
																									costCenterNo=='522.10' || costCenterNo=='522.20' ||
																									costCenterNo=='522.40' || costCenterNo=='522.50' || costCenterNo=='522.60' ||
																									costCenterNo=='523.10' || costCenterNo=='523.40' || costCenterNo=='523.00'  ||
																									costCenterNo=='523.60' || costCenterNo=='523.70' ||
																									costCenterNo=='524.10' || costCenterNo=='524.20' || costCenterNo=='524.00' ||
																									costCenterNo=='524.30' || costCenterNo=='524.40' || costCenterNo=='524.50' ||
																									costCenterNo=='525.10' || costCenterNo=='525.20' || costCenterNo=='525.30' || costCenterNo=='525.00'  ||
																									costCenterNo=='526.10' || costCenterNo=='526.20' || costCenterNo=='526.30' || costCenterNo=='526.40' || costCenterNo=='526.00'}">	
										<s:submit theme="simple" value="Print(A4)" method="PrintEstimateA4" id="btnprint1" ></s:submit>
									</s:if>
									<s:else>
											<s:submit theme="simple" value="Print(A4)" method="PrintEstimateA4" id="btnprint2" ></s:submit>	
											<s:submit theme="simple" value="Approval Report" method="PrintReviseApproval" id="btnprint3" ></s:submit>
											<s:submit theme="simple" value="Completion Report" method="PrintCompleteReport" id="btnprint4" ></s:submit>		
									</s:else>
									<applet codebase="../../PrintLib" code="standardEstimate.DetailEstimateApp" archive="PrintJar.jar" name="PIVApplet" width="1" height="1"  >
													</applet>
									<input type="button" value="Print Estimate(A3)" id="btnPrint" onclick="javascript:printingEstimate()" />
									<input type="button"" value="Print Summary Estimate(A3)" id="btnPrint" onclick="javascript:printingEstimateSummary()" />
									<s:submit theme="simple" value="Exit" method="close" id="btnClose" >
									</s:submit><input type="button"  value="Clear" onclick="clearFormDetails();"/></td>
									</tr>
							
									<tr>
											<td class="tdHeadings"></td>
											<s:if test="%{messageType=='ERROR'}">
											<td class="tdMsgStyle"><s:property value="errorMessage"></s:property></td>
											</s:if>
											<s:elseif test="%{messageType=='INFO'}">
											<td class="tdMsgStyleInfo"><s:property value="errorMessage"></s:property></td>
											</s:elseif>
											<s:elseif test="%{messageType=='DONE'}">
											<td class="tdMsgStyleDone"><s:property value="errorMessage"></s:property></td>
											</s:elseif>
											<td></td>
											<td></td>
											
									</tr>
									
								</table>
						</s:form>
						</td>
					</tr>
					 <tr>
						<td>
						
						</td>
					</tr>
					<tr class="tldFromContent1">
						<td>
						<div id="pegTree" style="width:25%;float: left">
						</div>
						<div id="addedPegInfo" style="display:block;width:75%">
							<!--  <table>
								<tr>
									<td>
										Quantity : <input type="text" name="itemquantity" id="itemquantity" value="" onchange="validateQuantity(this)"/>
									</td>
									<td>
									<input type="button" name="add" id="add" value="Add Items" onclick="addPegItems();"/>
									</td>
									<td>
									<input type="button" name="add" id="add" value="View Masters" onclick="viewMasterDetails();"/>
									</td>
								</tr>
							</table>-->
							<br>
							<br><br><br>
							<!-- <div style="width:50%;float: left">
					  		<table  class="tldFromContent1" id="pkgtable" align="left"  style="display:block;" border="1">
					  			<tr id="header1">
									<th></th><th><b>&nbsp;&nbsp;&nbsp;&nbsp;Description&nbsp;&nbsp;&nbsp;&nbsp;</b></th> <th><b>&nbsp;&nbsp;&nbsp;&nbsp;No of Items&nbsp;&nbsp;&nbsp;&nbsp;</b></th></tr>
					 			<tr id="linesecid"><td></td><td id="description"></td><td id="quantity"></td></tr>
					  
							</table>
							
							</div>
							<br><br><br><br><br><br>
							<div style="width:50%;float: left">

							<table  class="tldFromContent1" id="masterDetails" align="left"  style="display:block;" border="1">
					  			<tr id="header1">
									<th><b>&nbsp;&nbsp;Res Type&nbsp;&nbsp;</b></th> <th><b>&nbsp;&nbsp;Res CD&nbsp;&nbsp;</b></th><th><b>&nbsp;&nbsp;Res Name&nbsp;&nbsp;</b></th><th><b>&nbsp;&nbsp;Estimated Quantity&nbsp;&nbsp;</b></th></tr>
					 			<tr id="linesecid"><td></td><td id="resType"></td><td id="resCD"></td><td id="resName"></td><td id="estimatedQuantity"></td></tr>
					  
							</table>
							<div> -->
							<br>
							<br><br><br>
							
						</div>
						
						</td>
					</tr>
					<tr>
					<td></td>
				</tr>
				<tr><td></td></tr>
				<tr>
					 <tr class="tldFromContent1">
						<td>
						<table>
						<tr>
								<td>
									<a id="showLink1" href="javascript:show_OtherMaterials()">Add Materials</a> 
								</td>
								
								<td>
									<a id="showLink3" href="javascript:show_OtherResources()">Add Other Resources</a> 
								</td>
								<td>
									<a id="showLink2" href="javascript:show_NPLMaterials()">ADD NPL Materials</a>  
							</tr>
							<tr >
								<td colspan="3">
									<!--  <input type="button" name="new" id="new" value="Add New Estimate Entry" onclick="showAddJobInfo();"/>-->
									<table  class="tldFromContent1" id="estimateDetails"  style="display:block;" border="1"> 
							  			<tr id="header1">
											 <th><b>Resource CD&nbsp;&nbsp;</b></th><th><b>Resource Name&nbsp;&nbsp;</b></th><th><b>UOM&nbsp;&nbsp;</b></th><th><b>Unit Price&nbsp;&nbsp;</b></th><th><b>Estimated Quantity&nbsp;&nbsp;</b></th><th><b>Estimated Cost&nbsp;&nbsp;</b></th><th></th></tr>
							 			<tr id="linesecid"><td id="resCD"></td><td id="resName"></td><td id="estimatedQuantity"></td></tr>		
									</table>
								</td>
							</tr>	
							<tr>
								<td colspan="3">
								
								
									<div id="otherMatdiv" style="display:none">
										<table class="tldFromContent1" width="100%">							
											<tr>
												<td>
												<s:a id="addLink" href="javascript:add_materials('otherMat')">Add to Resource List</s:a>&nbsp;&nbsp;&nbsp;<a href="javascript:hide_OtherMaterials()">Hide List</a>
											  		<table id="otherMattable" align="center" border="1">
											  			<tr id="header2"><th></th> 
															<th>Resource Code</th><th>Resource Name</th> <th>UOM</th> <th>Unit Price</th></tr>
											 			<tr id="resourceid"><td></td><td id="resourceName"></td><td id="uom"></td><td id="unitPrice"></td><td id="estimatedCost"></td>
											  				<td id="totalcost"></td></tr>
											  
													</table>
												</td>
											</tr>
										</table>
							
									<s:a id="addLink" href="javascript:add_materials('otherMat')">Add to Resource List</s:a>&nbsp;&nbsp;&nbsp;<a href="javascript:hide_OtherMaterials()">Hide List</a>
									</div>
									<div id="nplMatdiv" style="display:none">
										<table class="tldFromContent1" width="100%">							
											<tr>
												<td>
												<s:a id="addLink" href="javascript:add_materials('NPL')">Add to Resource List</s:a>&nbsp;&nbsp;&nbsp;<a href="javascript:hide_NPLResources()">Hide List</a>
											  		<table id="NPLMaterialsTable" align="center" border="1">
											  			<tr id="header3"><th></th> 
															<th><b>Resource Code<b></th><th><b>Resource Name<b></th><th>UOM</th> <th>Unit Price</th></tr>
											 			<tr id="resourceCode1"><td></td><td id="resourceName1"></td><td id="UOM1"></td><td id="unitPrice1"></td>
											  				</tr>
											  
													</table>
												</td>
											</tr>
										</table>
							
									<s:a id="addLink" href="javascript:add_materials('NPL')">Add to Resource List</s:a>&nbsp;&nbsp;&nbsp;<a href="javascript:hide_NPLResources()">Hide List</a>
									</div>
					
								<div id="otherResourcesdiv" style="display:none">
										<table class="tldFromContent1" width="100%">							
											<tr>
												<td>
												<s:a id="addLink" href="javascript:add_materials('otherResource')">Add to Resource List</s:a>&nbsp;&nbsp;&nbsp;<a href="javascript:hide_OtherResources()">Hide List</a>
											  		<table id=otherResourceTable align="center" border="1">
											  			<tr id="header2"><th></th>
															<th><b>Resource Code<b></th><th><b>Resource Type<b></th><th><b>Resource Name<b></th><th>UOM</th> <th>Unit Price</th></tr>
											 			<tr id="resourceCode"><td></td><td id="resourceType"></td><td id="resourceName"></td><td id="UOM"></td><td id="unitPrice"></td>
											  				</tr>
											  
													</table>
												</td>
											</tr>
										</table>
							
									<s:a id="addLink" href="javascript:add_materials('otherResource')">Add to Resource List</s:a>&nbsp;&nbsp;&nbsp;<a href="javascript:hide_OtherResources()">Hide List</a>
									</div>
					
					
								</td>
								
							</tr>
							
							
						</table>
						
						</td>
					</tr>
					<tr>
						<td id="tdContent">
						
						</td>
					</tr>
					<tr>
						<td id="tdFooter">
						<table class="tblFooter" border="0" cellpadding="0"
							cellspacing="0">

							<tbody>
								<tr align="Center">
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

 