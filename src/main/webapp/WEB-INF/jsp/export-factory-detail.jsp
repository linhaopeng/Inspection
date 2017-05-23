<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="include_tags.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">


<title>Inspection - Factory Audit Report</title>
<meta name="keywords" content="门禁,考勤,安防">
<meta name="description" content="Inspection - Factory Audit Report">

<link rel="shortcut icon" href="favicon.ico">
<link href="${ctx  }/css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="${ctx  }/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
<link href="${ctx  }/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
<link href="${ctx  }/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="${ctx  }/css/animate.min.css" rel="stylesheet">
<link href="${ctx  }/css/style.min.css?v=4.0.0" rel="stylesheet">
<base target="_blank">
<link
	href="${ctx  }/css/plugins/bootstrap-paginator/bootstrap-paginator.css"
	rel="stylesheet">
<!-- Sweet Alert -->
<link href="${ctx  }/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">
<link href="${ctx  }/css/system/custom-list.css" rel="stylesheet">
<link href="${ctx  }/css/system/getDatas.css" rel="stylesheet">
<!-- 图片 -->
<style type="text/css">
ul.ztree {
	margin-top: 10px;
	/* border: 1px solid #617775; */
	background: #f0f6e4;
	width: 220px;
	height: 360px;
	overflow-y: scroll;
	overflow-x: auto;
}

select {
	width: 198px;
	font-size: 15px;
	background-color: #FFF;
	background-image: none;
	border: 1px solid #e5e6e7;
	border-radius: 1px;
	color: inherit;
	display: block;
	padding: 6px 12px;
}

.col-sm-9 h4 small {
	font-size: 15px;
	margin-left: 10px;
}

.p_unit {
	width: 50px;
	height: 20px;
	display: inline;
	margin-left: 10px;
	font-weight: 700;
}

input.form-control {
	width: 70%;
	display: inline;
}

.form-group label {
	display: block;
}

.s_p {
	display: inline;
	width: 200px;
}

.s_p p {
	display: inline;
}

.problem_details {
	margin: 10px 10px 10px 10px;
	width: 200px;
	height: 200px;
	display: inline-table;
}

.form-group {
	height: 81px;
	margin-bottom: 0px;
}

h4 small {
	line-height: 26px;
}

.t_titil {
	margin-left: 20px;
	height: 51px;
	font-size: 18px
}

body {
	overflow: auto !important;
}

.modal {
	overflow: auto !important;
}

.mytable{
	margin-left: 20px;
	width: 90%;
	border-collapse:separate; 
	border-spacing:10px;
}

select {
	border:1px solid #2f4050;
	padding: 3px 12px;
}

</style>

</head>

<body class="gray-bg">
	<input type="hidden" id="project_id" name="project_id"
		value="${project.projectId }">
	<input type="hidden" id="project_type" name="project_type"
		value="${project.typeId }">
	<div class="container-fluid">
		<div class="row-fluid">

			<div class="col-sm-9"
				style="width: 100%; margin-bottom: 20px; font-size: 14px; position: relative">

				<div class="container-head clearfix"
					style="margin-left: inherit; width: 98%">
					<div class="page-header " style="float: left; width: 80%;">
						<h1 style="font-weight: 700; font-size: 22px; display: inline;">
							Factory Audit Report</h1>
					</div>
					<div style="float: right">
						<div style="margin-right: 30px; margin-top: 20px; width: 120px;">
							<button type="button" class="btn btn-primary"
								onclick="history.go(-1)">Back</button>
							<button type="button" class="btn btn-primary"
								onclick="alert('success')">Save</button>
						</div>
					</div>
				</div>
				<div class="tabbable" id="tabs-285036"
					style="margin-top: 30px; margin-bottom: 30px;">
					<ul class="nav nav-tabs">
						<li class="active" id="getProject_project"><a
							href="#panel-913368" data-toggle="tab">A. SUPPLIER INFORMATION</a></li>
						<li id="getProject_type"><a href="#panel-419303"
							data-toggle="tab">B. FACTORY</a></li>
						<li id="getPro_schedule"><a href="#panel-419304"
							data-toggle="tab">C. Final Summary</a></li>
					</ul>

					<div class="tab-content">
						<div class="tab-pane active" id="panel-913368">
							<table class="table t_titil" style="">
								<tbody>
									<tr class="success">
										<td style="width: 90%;">PROFILE &amp; CONTACT DETAILS</td>
									</tr>
								</tbody>
							</table>
							<table class="mytable">
								<tr>
									<td style="padding-left:10px; width:15%;">Supplier name</td>
									<td style="width:30%;"><input value="Guangdong Textiles Imp.&amp;Exp.CO.LTD." readOnly disabled style="width:90%"></td>
									<td style="width:15%;">Supplier number</td>
									<td style="width:30%;"><input value="13457" readOnly disabled style="width:90%"></td>
								</tr>
								<tr>
									<td style="padding-left:10px; width:15%;">Supplier address</td>
									<td colspan="3" style="width:65%;"><input value="7/F,No.168 Xiao Bei Road,Guangzhou,P.R.China" readOnly disabled style="width:96%"></td>
								</tr>
								<tr>
									<td style="padding-left:10px; width:15%;">Factory name（Chinese）</td>
									<td style="width:30%;"><input value="广东省纺织品进出口股份有限公司" readOnly disabled style="width:90%"></td>
									<td style="width:15%;">Factory name（English）</td>
									<td style="width:30%;"><input value="Guangdong Textiles Imp.&amp;Exp.CO.LTD." readOnly disabled style="width:90%"></td>
								</tr>
								<tr>
									<td style="padding-left:10px; width:15%;">Factory address</td>
									<td colspan="3" style="width:65%;"><input value="7/F,No.168 Xiao Bei Road,Guangzhou,P.R.China" readOnly disabled style="width:96%"></td>
								</tr>		
								<tr>
									<td style="padding-left:10px; width:15%;">Province/City</td>
									<td style="width:30%;"><input value="GUANGDONG" readOnly disabled style="width:90%"></td>
									<td style="width:15%;">Contact person(Supplier)</td>
									<td style="width:30%;"><input value="huangjn" style="width:90%"></td>
								</tr>
								<tr>
									<td style="padding-left:10px; width:15%;">Phone(Supplier)</td>
									<td style="width:30%;"><input value="020-83558988" style="width:90%"></td>
									<td style="width:15%;">Email (Supplier)</td>
									<td style="width:30%;"><input value="huangjn@gdtex.com" style="width:90%"></td>
								</tr>
								<tr>
									<td style="padding-left:10px; width:15%;">Contact person(Factory)</td>
									<td style="width:30%;"><input value="iceroy" style="width:90%"></td>
									<td style="width:15%;">Phone(Factory)</td>
									<td style="width:30%;"><input value="020-83558988" style="width:90%"></td>
								</tr>
								<tr>
									<td style="padding-left:10px; width:15%;">Email(Factory)</td>
									<td style="width:30%;"><input value="iceroy@foxmial.com" style="width:90%"></td>
									<td style="width:15%;">Type of Audit</td>
									<td style="width:30%;"><select style="width:90%"><option>FE</option><option>RE FE</option></select></td>
								</tr>
							</table>
							<table class="table t_titil" style="">
								<tbody>
									<tr class="success">
										<td style="width: 90%;">COMPANY INFORMATION</td>
									</tr>
								</tbody>
							</table>
							<table class="mytable">
								<tr>
									<td style="padding-left:10px; width:15%;">Year company founded</td>
									<td style="width:30%;"><input value="1949" readOnly disabled style="width:90%"></td>
									<td style="width:15%;">Sales p/a (USD)</td>
									<td style="width:30%;"><input value="1500000000" readOnly disabled style="width:90%"></td>
								</tr>
								<tr>
									<td style="padding-left:10px; width:15%;">Main customers and % estimate</td>
									<td style="width:30%;">
										<table style="width:90%;"  border="1" cellspacing="0" cellpadding="0" >
											<tr>
												<td>Target Store</td>
												<td>10%</td>
											</tr>
											<tr>
												<td>BRU/TOYS "R"US</td>
												<td>3%</td>
											</tr>
											<tr>
												<td>OTTO</td>
												<td>2.5%</td>
											</tr>
										</table>
									</td>
									<td style="width:15%;">Main customers and % estimate</td>
									<td style="width:30%;">
										<table style="width:90%;"  border="1" cellspacing="0" cellpadding="0" >
											<tr>
												<td>America</td>
												<td>33%</td>
											</tr>
											<tr>
												<td>EU</td>
												<td>21%</td>
											</tr>
											<tr>
												<td>Southeast Asia</td>
												<td>8%</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td style="padding-left:10px; width:15%;">PDM / CAD System</td>
									<td style="width:30%;"><select style="width:90%"><option>YES-CAD</option><option>YES-PDM</option><option>NO</option></select></td>
									<td style="width:15%;"> </td>
									<td style="width:30%;"> </td>
								</tr>
								<tr>
									<td style="padding-left:10px; width:15%;">Management skills</td>
									<td style="width:30%;"><select style="width:90%"><option>1</option><option>2</option><option>3</option></select></td>
									<td style="width:15%;">Management language skills</td>
									<td style="width:30%;"><select style="width:90%"><option>1</option><option selected>2</option><option>3</option></select></td>
								</tr>
							</table>
							<table class="table t_titil" style="">
								<tbody>
									<tr class="success">
										<td style="width: 90%;">CERTIFICATES</td>
									</tr>
								</tbody>
							</table>
							<table class="mytable">
								<tr>
									<td style="padding-left:10px; width:15%;">ISO 9000 Certification</td>
									<td style="width:30%;"><select style="width:90%"><option>YES</option><option>NO</option></select></td>
									<td style="width:15%;">Oeko Tex 100</td>
									<td style="width:30%;"><select style="width:90%"><option>YES</option><option>NO</option></select></td>
								</tr>
								<tr>
									<td style="padding-left:10px; width:15%;">VFI Social Audit</td>
									<td style="width:30%;"><select style="width:90%"><option>YES</option><option selected>NO</option></select></td>
									<td style="width:15%;">SA 8000 Certificate</td>
									<td style="width:30%;"><select style="width:90%"><option>YES</option><option>NO</option></select></td>
								</tr>
								<tr>
									<td style="padding-left:10px; width:15%;">BSCI Audit</td>
									<td style="width:30%;"><select style="width:90%"><option>YES</option><option>NO</option></select></td>
									<td style="width:15%;">OHSAS 18001</td>
									<td style="width:30%;"><select style="width:90%"><option>YES</option><option selected>NO</option></select></td>
								</tr>
								<tr>
									<td style="padding-left:10px; width:15%;">WRAP</td>
									<td style="width:30%;"><select style="width:90%"><option>YES</option><option>NO</option></select></td>
									<td style="width:15%;">SEDEX</td>
									<td style="width:30%;"><select style="width:90%"><option>YES</option><option selected>NO</option></select></td>
								</tr>
							</table>
						</div>
						<div class="tab-pane" id="panel-419303">
							<table class="table t_titil" style="">
								<tbody>
									<tr class="success">
										<td style="width: 90%;">GENERAL VIEW</td>
									</tr>
								</tbody>
							</table>
							<div class="my_h" style="width: 80%; clear: both;" id="img_view">
								
							</div>
							<table class="table t_titil" style="">
								<tbody>
									<tr class="success">
										<td style="width: 90%;">Non-Compliances</td>
									</tr>
								</tbody>
							</table>
							<div class="my_h" style="width: 80%; clear: both;" id="img_non">
								
							</div>
							<table class="table t_titil" style="">
								<tbody>
									<tr class="success">
										<td style="width: 90%;">PROOF OF NC CLOSURE</td>
									</tr>
								</tbody>
							</table>
							<div class="my_h" style="width: 80%; clear: both;" id="img_proof">
								
							</div>
							<table class="table t_titil" style="">
								<tbody>
									<tr class="success">
										<td style="width: 90%;">FACTORY CAPABILITIES</td>
									</tr>
								</tbody>
							</table>
							<table  class="table table-bordered" style="margin-left: 20px; height: 70px;" >
								<tr>
									<td> </td>
									<td>YES/No</td>
									<td>Quality1-5 Grading</td>
									<td>Number of machines(If applicable)</td>
								</tr>
								<tr>
									<td>Printing-Screen</td>
									<td>YES</td>
									<td>1</td>
									<td>10</td>
								</tr>
								<tr>
									<td>Printing-Potary</td>
									<td>YES</td>
									<td>2</td>
									<td>9</td>
								</tr>
								<tr>
									<td>Embroidery-Hand</td>
									<td>YES</td>
									<td>3</td>
									<td>9</td>
								</tr>
								<tr>
									<td>Embroidery-Machine</td>
									<td>NO</td>
									<td>4</td>
									<td>9</td>
								</tr>
								<tr>
									<td>Washing Plant-Auto</td>
									<td>NO</td>
									<td>5</td>
									<td>9</td>
								</tr>
								<tr>
									<td>Warehouse-Fabric</td>
									<td>YES</td>
									<td>4</td>
									<td>9</td>
								</tr>
								<tr>
									<td>Warehouse-Trimmings /Accessories</td>
									<td>YES</td>
									<td>4</td>
									<td>8</td>
								</tr>
								<tr>
									<td>Cutting</td>
									<td>NO</td>
									<td>3</td>
									<td>8</td>
								</tr>
								<tr>
									<td>Sewing</td>
									<td>NO</td>
									<td>2</td>
									<td>8</td>
								</tr>
								<tr>
									<td>Needle detector available in functioning condition</td>
									<td>YES</td>
									<td>1</td>
									<td>8</td>
								</tr>
								<tr>
									<td>Finishing-Pressing</td>
									<td>YES</td>
									<td>2</td>
									<td>7</td>
								</tr>
								<tr>
									<td>Packing</td>
									<td>YES</td>
									<td>2</td>
									<td>7</td>
								</tr>
								<tr>
									<td>Embroidery-Machine</td>
									<td>NO</td>
									<td>3</td>
									<td>10</td>
								</tr>
							</table>
							<div class="my_h" style="width: 80%; clear: both;">
								<p>Remarks</p>
								<p><textarea rows="5" cols="120"></textarea></p>
							</div>
							<table class="table t_titil" style="">
								<tbody>
									<tr class="success">
										<td style="width: 90%;">PERSONELL</td>
									</tr>
								</tbody>
							</table>
							<table  class="table table-bordered" style="margin-left: 20px; height: 70px;" >
								<tr>
									<td> </td>
									<td>Number Of Staff</td>
									<td>Skill level (1-5 Grading)</td>
								</tr>
								<tr>
									<td>Production staff-full time</td>
									<td>1000</td>
									<td>2</td>
								</tr>
								<tr>
									<td>Production staff-temporary workers</td>
									<td>200</td>
									<td>1</td>
								</tr>
								<tr>
									<td>Production development staff</td>
									<td>200</td>
									<td>1</td>
								</tr>
							</table>
							<div class="my_h" style="width: 80%; clear: both;">
								<p>Remarks</p>
								<p><textarea rows="5" cols="120"></textarea></p>
							</div>
							<table class="table t_titil" style="">
								<tbody>
									<tr class="success">
										<td style="width: 90%;">Warehouse</td>
									</tr>
								</tbody>
							</table>
							<table  class="table table-bordered" style="margin-left: 20px; height: 70px;" >
								<tr>
									<td> </td>
									<td>Quality 1-5 Grading</td>
									<td>Number of machines (If applicable)</td>
								</tr>
								<tr>
									<td>Spaciousness</td>
									<td>2</td>
									<td>100</td>
								</tr>
								<tr>
									<td>Lighting</td>
									<td>3</td>
									<td>300</td>
								</tr>
								<tr>
									<td>Ventilation</td>
									<td>2</td>
									<td>200</td>
								</tr>
								<tr>
									<td>Cleanliness</td>
									<td>2</td>
									<td>400</td>
								</tr>
								<tr>
									<td>Stacking / Storage</td>
									<td>2</td>
									<td>600</td>
								</tr>
								<tr>
									<td>Order details /sample available</td>
									<td>5</td>
									<td>800</td>
								</tr>
							</table>
							<div class="my_h" style="width: 80%; clear: both;">
								<p>Remarks</p>
								<p><textarea rows="5" cols="120"></textarea></p>
							</div>
							<table class="table t_titil" style="">
								<tbody>
									<tr class="success">
										<td style="width: 90%;">Cutting</td>
									</tr>
								</tbody>
							</table>
							<table  class="table table-bordered" style="margin-left: 20px; height: 70px;" >
								<tr>
									<td> </td>
									<td>Quality 1-5 Grading</td>
									<td>Number of machines (If applicable)</td>
								</tr>
								<tr>
									<td>Spaciousness</td>
									<td>2</td>
									<td>10</td>
								</tr>
								<tr>
									<td>Lighting</td>
									<td>3</td>
									<td>30</td>
								</tr>
								<tr>
									<td>Ventilation</td>
									<td>2</td>
									<td>20</td>
								</tr>
								<tr>
									<td>Cleanliness</td>
									<td>2</td>
									<td>400</td>
								</tr>
								<tr>
									<td>Stacking / Storage</td>
									<td>2</td>
									<td>60</td>
								</tr>
								<tr>
									<td>Order details /sample available</td>
									<td>5</td>
									<td>80</td>
								</tr>
								<tr>
									<td>Records</td>
									<td>5</td>
									<td>80</td>
								</tr>
								<tr>
									<td>Fabric inspection -Before cutting</td>
									<td>5</td>
									<td>80</td>
								</tr>
								<tr>
									<td>Fabric inspection -After cutting</td>
									<td>5</td>
									<td>80</td>
								</tr>
								<tr>
									<td>Fabric cutting</td>
									<td>5</td>
									<td>80</td>
								</tr>
								<tr>
									<td>Band Knife</td>
									<td>5</td>
									<td>80</td>
								</tr>
							</table>
							<div class="my_h" style="width: 80%; clear: both;">
								<p>Remarks</p>
								<p><textarea rows="5" cols="120"></textarea></p>
							</div>
							<table class="table t_titil" style="">
								<tbody>
									<tr class="success">
										<td style="width: 90%;">Sewing area</td>
									</tr>
								</tbody>
							</table>
							<table  class="table table-bordered" style="margin-left: 20px; height: 70px;" >
								<tr>
									<td> </td>
									<td>Quality 1-5 Grading</td>
									<td>Number of machines (If applicable)</td>
								</tr>
								<tr>
									<td>Spaciousness</td>
									<td>2</td>
									<td>10</td>
								</tr>
								<tr>
									<td>Lighting</td>
									<td>3</td>
									<td>30</td>
								</tr>
								<tr>
									<td>Ventilation</td>
									<td>2</td>
									<td>20</td>
								</tr>
								<tr>
									<td>Cleanliness</td>
									<td>2</td>
									<td>400</td>
								</tr>
								<tr>
									<td>Stacking / Storage</td>
									<td>2</td>
									<td>60</td>
								</tr>
								<tr>
									<td>Order details /sample available</td>
									<td>5</td>
									<td>80</td>
								</tr>
								<tr>
									<td>QC inspection areas /identification</td>
									<td>5</td>
									<td>80</td>
								</tr>
								<tr>
									<td>Fabric inspection -Before cutting</td>
									<td>5</td>
									<td>80</td>
								</tr>
								<tr>
									<td>Fabric inspection -After cutting</td>
									<td>5</td>
									<td>80</td>
								</tr>
								<tr>
									<td>Fabric cutting</td>
									<td>5</td>
									<td>80</td>
								</tr>
								<tr>
									<td>Band Knife</td>
									<td>5</td>
									<td>80</td>
								</tr>
							</table>
							<div class="my_h" style="width: 80%; clear: both;">
								<p>Remarks</p>
								<p><textarea rows="5" cols="120"></textarea></p>
							</div>
							
							<table class="table t_titil" style="">
								<tbody>
									<tr class="success">
										<td style="width: 90%;">Packaging &amp; Finishing</td>
									</tr>
								</tbody>
							</table>
							<table  class="table table-bordered" style="margin-left: 20px; height: 70px;" >
								<tr>
									<td> </td>
									<td>1</td>
									<td>2</td>
									<td>3</td>
									<td>4</td>
									<td>5</td>
								</tr>
								<tr>
									<td>Spaciousness</td>
									<td>x</td>
									<td> </td>
									<td> </td>
									<td> </td>
									<td> </td>
								</tr>
								<tr>
									<td>Lighting</td>
									<td> </td>
									<td>x</td>
									<td> </td>
									<td> </td>
									<td> </td>
								</tr>
								<tr>
									<td>Ventilation</td>
									<td> </td>
									<td> </td>
									<td>x</td>
									<td> </td>
									<td> </td>
								</tr>
								<tr>
									<td>Cleanliness</td>
									<td> </td>
									<td> </td>
									<td>x</td>
									<td> </td>
									<td> </td>
								</tr>
								<tr>
									<td>Stacking / Storage</td>
									<td> </td>
									<td> </td>
									<td> </td>
									<td>x</td>
									<td> </td>
								</tr>
								<tr>
									<td>Order details /sample available</td>
									<td> </td>
									<td> </td>
									<td> </td>
									<td>x</td>
									<td> </td>
								</tr>
								<tr>
									<td>QC inspection areas /identification</td>
									<td> </td>
									<td> </td>
									<td> </td>
									<td> </td>
									<td>x</td>
								</tr>
								<tr>
									<td>Fabric inspection -Before cutting</td>
									<td> </td>
									<td> </td>
									<td> </td>
									<td> </td>
									<td>x</td>
								</tr>
								<tr>
									<td>Fabric inspection -After cutting</td>
									<td> </td>
									<td>x</td>
									<td> </td>
									<td> </td>
									<td> </td>
								</tr>
								<tr>
									<td>Fabric cutting</td>
									<td> </td>
									<td> </td>
									<td> </td>
									<td>x</td>
									<td> </td>
								</tr>
								<tr>
									<td>Band Knife</td>
									<td> </td>
									<td> </td>
									<td>x</td>
									<td> </td>
									<td> </td>
								</tr>
							</table>
							<div class="my_h" style="width: 80%; clear: both;">
								<p>Remarks</p>
								<p><textarea rows="5" cols="120"></textarea></p>
							</div>
							<table class="table t_titil" style="">
								<tbody>
									<tr class="success">
										<td style="width: 90%;">QA &amp; QC</td>
									</tr>
								</tbody>
							</table>
							<table  class="table table-bordered" style="margin-left: 20px; height: 70px;" >
								<tr>
									<td> </td>
									<td>YES</td>
									<td>NO</td>
								</tr>
								<tr>
									<td>Inspection in each department</td>
									<td>x</td>
									<td> </td>
								</tr>
								<tr>
									<td>Inspection standards available</td>
									<td> </td>
									<td>x</td>
								</tr>
								<tr>
									<td>Ventilation</td>
									<td> </td>
									<td>x</td>
								</tr>
								<tr>
									<td>Cleanliness</td>
									<td>x</td>
									<td> </td>
								</tr>
								<tr>
									<td>Stacking / Storage</td>
									<td> </td>
									<td>x</td>
								</tr>
								<tr>
									<td>Order details /sample available</td>
									<td> </td>
									<td>x</td>
								</tr>
								<tr>
									<td>QC inspection areas /identification</td>
									<td> </td>
									<td> </td>
								</tr>
								<tr>
									<td>Fabric inspection -Before cutting</td>
									<td> </td>
									<td>x</td>
								</tr>
								<tr>
									<td>Fabric inspection -After cutting</td>
									<td> </td>
									<td>x</td>
								</tr>
								<tr>
									<td>Fabric cutting</td>
									<td>x</td>
									<td> </td>
								</tr>
								<tr>
									<td>Band Knife</td>
									<td> </td>
									<td>x</td>
								</tr>
							</table>
							<div class="my_h" style="width: 80%; clear: both;">
								<p>Remarks</p>
								<p><textarea rows="5" cols="120"></textarea></p>
							</div>
							<table class="table t_titil" style="">
								<tbody>
									<tr class="success">
										<td style="width: 90%;">Technical</td>
									</tr>
								</tbody>
							</table>
							<table  class="table table-bordered" style="margin-left: 20px; height: 70px;" >
								<tr>
									<td> </td>
									<td>YES</td>
									<td>NO</td>
								</tr>
								<tr>
									<td>Garment technicans available regarding quailty audits</td>
									<td>x</td>
									<td> </td>
								</tr>
								<tr>
									<td>Lab tests done in house -wash</td>
									<td> </td>
									<td>x</td>
								</tr>
								<tr>
									<td>Lab tests done in house -rubbing</td>
									<td> </td>
									<td>x</td>
								</tr>
								<tr>
									<td>Lab tests done in house -elasticty</td>
									<td>x</td>
									<td> </td>
								</tr>
								<tr>
									<td>Lab tests done in house -wight</td>
									<td> </td>
									<td>x</td>
								</tr>
								<tr>
									<td>Order details /sample available</td>
									<td> </td>
									<td>x</td>
								</tr>
								<tr>
									<td>QC inspection areas /identification</td>
									<td> </td>
									<td> </td>
								</tr>
								<tr>
									<td>Fabric inspection -Before cutting</td>
									<td> </td>
									<td>x</td>
								</tr>
							</table>
							<div class="my_h" style="width: 80%; clear: both;">
								<p>Remarks</p>
								<p><textarea rows="5" cols="120"></textarea></p>
							</div>
							<table class="table t_titil" style="">
								<tbody>
									<tr class="success">
										<td style="width: 90%;">Environment, Human Rights, Safety</td>
									</tr>
								</tbody>
							</table>
							<table  class="table table-bordered" style="margin-left: 20px; height: 70px;" >
								<tr>
									<td> </td>
									<td>YES</td>
									<td>NO</td>
								</tr>
								<tr>
									<td>Establishment respects the Human Rights of each employee/worker</td>
									<td>x</td>
									<td> </td>
								</tr>
								<tr>
									<td>Age verification system available and implemented (copy of birth certifcate,national ID card,age verification from medical institution)</td>
									<td> </td>
									<td>x</td>
								</tr>
								<tr>
									<td>Minimun wage paid to all workers as per legal requirement and wage grade</td>
									<td> </td>
									<td>x</td>
								</tr>
								<tr>
									<td>Salary Sheets and Time Cards of last two months available for review</td>
									<td>x</td>
									<td> </td>
								</tr>
								<tr>
									<td>Lab tests done in house -wight</td>
									<td> </td>
									<td>x</td>
								</tr>
								<tr>
									<td>Order details /sample available</td>
									<td> </td>
									<td>x</td>
								</tr>
								<tr>
									<td>QC inspection areas /identification</td>
									<td> </td>
									<td> </td>
								</tr>
								<tr>
									<td>Fabric inspection -Before cutting</td>
									<td> </td>
									<td>x</td>
								</tr>
							</table>
							<div class="my_h" style="width: 80%; clear: both;">
								<p>Remarks</p>
								<p><textarea rows="5" cols="120"></textarea></p>
							</div>
						</div>
                        <div class="tab-pane" id="panel-419304">
                            <table class="table t_titil" style="">
								<tbody>
									<tr class="success">
										<td style="width: 90%;">Final Summary</td>
									</tr>
								</tbody>
							</table>
							<table class="mytable">
								<tr>
									<td style="width:15%;">Total Score</td>
									<td style="width:30%;"><input value="85"  style="width:90%"></td>
									<td style="width:10%;padding-left: 20px;">Grade</td>
									<td style="width:30%;"><input value="GOOD" readOnly disabled style="width:90%;background-color: #dff0d8;border: 0;"></td>
								</tr>
								<tr>
									<td style="width:15%;">Approved as supplier</td>
									<td style="width:30%;"><select style="width:90%"><option>YES</option><option>NO</option></select></td>
								</tr>
							</table>
							<div class="my_h" style="width: 80%; clear: both;">
								<p>Overall Remarks</p>
								<p><textarea rows="5" cols="120"></textarea></p>
							</div>
							<table class="table t_titil" style="">
								<tbody>
									<tr class="success">
										<td style="width: 90%;">Corrective Action Planning</td>
									</tr>
								</tbody>
							</table>
							<table  class="table table-bordered" style="margin-left: 20px; height: 70px;" >
								<tr style="text-align: center;background-color: #e6e399">
									<td>Root Causes Identified</td>
									<td>Corrective/Preventive Actions</td>
									<td>Expected Completion Date</td>
									<td>Responsiable Person</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
							</table>
                        </div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="${ctx  }/js/jquery.min.js?v=2.1.4"></script>
	<script src="${ctx  }/js/jquery-migrate-1.1.0.min.js"></script>
	<script src="${ctx  }/js/bootstrap.min.js?v=3.3.5"></script>
	<script src="${ctx  }/js/content.min.js?v=1.0.0"></script>
	<script src="${ctx  }/js/mapUtil.js"></script>
	<script src="${ctx  }/js/jquery.cookie.js"></script>
	<script src="${ctx  }/js/plugins/validate/jquery.validate.min.js"></script>
	<script src="${ctx  }/js/plugins/validate/messages_zh.min.js"></script>
	<script src="${ctx  }/js/system/formValidator.js"></script>
	<script src="${ctx  }/js/plugins/iCheck/icheck.min.js"></script>
	<script
		src="${ctx  }/js/plugins/bootstrap-paginator/bootstrap-paginator.min.js"></script>
	<script src="${ctx  }/js/plugins/sweetalert/sweetalert.min.js"></script>
	<script src="${ctx  }/js/ajaxfileupload.js"></script>
	<script src="${ctx  }/js/plugins/ztree/jquery.ztree.core.js"></script>
	<script src="${ctx  }/js/plugins/ztree/jquery.ztree.excheck.js"></script>
	<script src="${ctx  }/js/plugins/ztree/jquery.ztree.exedit.js"></script>
	<script src="${ctx  }/js/system/getDatas.js"></script>
	<script src="${ctx  }/My97DatePicker/WdatePicker.js"></script>
	<script src="${ctx  }/js/system/base.js"></script>
	<script type="text/javascript">
		$(function() {
			
			getImgs("img_view","3");
			getImgs("img_non","4");
			getImgs("img_proof","5");
			function getImgs(id,type){
				var imgs = $("#"+id);
				$.ajax({
				    url:'${ctx}/upload/export/getExportByType',
				    type:'POST', //GET
				    timeout:5000,    //超时时间
				    dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
				    data:{
				    	type:type
				    },
				    beforeSend:function(xhr){
				        console.log(xhr)
				        console.log('发送前')
				    },
				    success:function(data,textStatus,jqXHR){
				    	var html = "";
				    	html+="<div class=\"row\">";
						
				    	for(var i=0;i<data.length;i++){
				    		if(i%4 == 0){
				    			html+="</div>";
				    			html+="<div class=\"row\">";
				    			html+="<div class=\"col-md-3\">";
								html+="	<div class=\"thumbnail\">";
								html+="		<img style=\"height:220px;width:100%;\" src=\"${ctx }/upload/"+data[i].img+"\">";
								html+="		<div class=\"caption\">";
								html+="			<h3 style=\"text-align: center;\">"+data[i].description+"</h3>";
								html+="		</div>";
								html+="	</div>";
								html+="</div>";
				    		}else{
				    			html+="<div class=\"col-md-3\">";
								html+="<div class=\"thumbnail\">";
								html+="		<img style=\"height:220px;width:100%;\" src=\"${ctx }/upload/"+data[i].img+"\">";
								html+="		<div class=\"caption\">";
								html+="			<h3 style=\"text-align: center;\">"+data[i].description+"</h3>";
								html+="		</div>";
								html+="	</div>";
								html+="</div>";
				    		}
				    	}
				    	html+="</div>";
				    	imgs.html(html);
				    },
				    error:function(xhr,textStatus){
				        console.log('错误')
				        console.log(xhr)
				        console.log(textStatus)
				    },
				    complete:function(){
				        console.log('结束')
				    }
				});
			}
		});
	</script>
</body>

</html>