<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="include_tags.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">


<title>广州市番禺区现代产业基地项目管理系统 - 账户信息管理</title>
<meta name="keywords" content="门禁,考勤,安防">
<meta name="description" content="广州市番禺区现代产业基地项目管理系统 - 账户信息管理">

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
							Final Inspection Report</h1>
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
					style="margin-bottom: 30px;">
					<ul class="nav nav-tabs">
						<li class="active" id="getProject_project"><a
							href="#panel-913368" data-toggle="tab">GENERAL - EXECUTIVE
								SUMMARY SECTION</a></li>
						<li id="getProject_type"><a href="#panel-419303"
							data-toggle="tab">GENERAL VIEW</a></li>
						<li id="getPro_schedule"><a href="#panel-419304"
							data-toggle="tab">WORKMANSHIP AUDIT</a></li>
						<li id="getPro_problem"><a href="#panel-419305"
							data-toggle="tab">MEASUREMENTS AUDIT</a></li>
						<li id="getPro_problem"><a href="#panel-419306"
							data-toggle="tab">FABRIC, TRIM, ACCESSORYS, TAGS</a></li>
						<li id="getPro_problem"><a href="#panel-419307"
							data-toggle="tab">PACKING(incl.photo decumentation)</a></li>
					</ul>

					<div class="tab-content">
						<div class="tab-pane active" id="panel-913368">
							<table class="table t_titil" style="">
								<tbody>
									<tr class="success">
										<td style="width: 90%;">GENERAL - EXECUTIVE SUMMARY
											SECTION</td>
									</tr>
								</tbody>
							</table>
							<div>
								<div>
									<div class="my_h">
										<h4>
											Order No: <small>10027022</small>
										</h4>
										<h4>
											Article No: <small>2038785</small>
										</h4>
										<h4>
											Name of Inspector: <small id="date_p">linxue</small>
										</h4>
										<h4>
											Ship QTY: <small>7412PCS</small>
										</h4>
										<h4>
											Supplier\Vendor: <small>GUANGDONG TEXTILES
												IMP.&EXP.CO.LTD</small>
										</h4>
										<h4>
											Factory: <small>Top Fame Garmets Co LTD</small>
										</h4>
										<h4>
											Product Description: <small>LW-woven pants ss</small>
										</h4>
										<h4>
											Material Composition: <small>97%cotton3%elastane</small>
										</h4>
									</div>
									<div class="my_h">
										<h4>
											Inspection Date: <small>20.02.2017</small>
										</h4>
										<h4>
											Type of Inspection: <small>Final Inspection</small>
										</h4>
										<h4>
											Order QTY: <small id="date_a">8285PCS</small>
										</h4>
										<h4>
											Sorted out QTY: <small>-873pcs(-10.5%)</small>
										</h4>
										<h4>
											Sorted out Lot No:
											<div class="input-group">
												<select><option>Sea</option>
													<option>Air</option></select>
											</div>
										</h4>
										<h4>
											Ship Mode: <small></small>
										</h4>
										<h4>
											Partial Shipment: <small>${project.investor }</small>
										</h4>
										<h4>
											PPS Approved with Comment: <small><fmt:formatNumber
													groupingUsed="false" value="${project.investment }"
													maxFractionDigits="2" />
												<p class="p_unit">万元</p></small>
										</h4>
									</div>
								</div>
								<div style="width: 80%; clear: both;" class="my_h">
									<h4>
										Additional reference: <input type="checkbox" name="reference">Approved
										PPS <input type="checkbox" name="reference" id="reference-2">Tech
										File <input type="checkbox" name="reference" id="reference-2">Packing
										List <input type="checkbox" name="reference" id="reference-2">Colour
										swatches (SF) <input type="checkbox" name="reference"
											id="reference-2">Trim Cards <input type="checkbox"
											name="reference" id="reference-2">PO Copy
									</h4>
								</div>
								<div class="my_h" style="margin-top: 40px;">
									<h1 style="font-weight: 700; font-size: 22px; display: inline;">
										Final Inspection Report</h1>
									<!-- Table -->
									<table class="table">
										<thead>
											<tr>
												<th></th>
												<th>PASS</th>
												<th>FAIL</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Workmanship</td>
												<td><input type="checkbox" checked></td>
												<td><input type="checkbox"></td>
											</tr>
											<tr>
												<td>Measurement</td>
												<td><input type="checkbox" checked></td>
												<td><input type="checkbox"></td>
											</tr>
											<tr>
												<td>Packing</td>
												<td><input type="checkbox" checked></td>
												<td><input type="checkbox"></td>
											</tr>
											<tr>
												<td>Wash test</td>
												<td><input type="checkbox" checked></td>
												<td><input type="checkbox"></td>
											</tr>
										</tbody>
									</table>
									<h4>
										OVERALL RESULT: <input type="checkbox" name="reference">PASS
										<input type="checkbox" name="reference">FAIL <input
											type="checkbox" name="reference">RE-CHECK
									</h4>
									<h4>
										Factory representative's name and title: <input type="text"
											name="" value="Fan yan wu">
									</h4>
									<h4>
										Inspector's name/title (block letters): <input type="text"
											value="linxue">
									</h4>
								</div>
							</div>
						</div>
						<div class="tab-pane" id="panel-419303">
							<table class="table t_titil" style="">
								<tbody>
									<tr class="success">
										<td style="width: 90%;">GENERAL VIEW</td>
									</tr>
								</tbody>
							</table>
							<div class="my_h" style="width: 80%; clear: both;" id="img1">
								<%-- <div class="row">
									<div class="col-md-2">
										<div class="thumbnail">
											<img src="${ctx }/img/export/side1.png">
											<div class="caption">
												<h3 style="text-align: center;">缩略图标签</h3>
											</div>
										</div>
									</div>
									<div class="col-md-2">
										<div class="thumbnail">
											<img src="${ctx }/img/export/side2.png">
											<div class="caption">
												<h3 style="text-align: center;">缩略图标签</h3>
											</div>
										</div>
									</div>
									<div class="col-md-2">
										<div class="thumbnail">
											<img src="${ctx }/img/export/side3.png">
											<div class="caption">
												<h3 style="text-align: center;">缩略图标签</h3>
											</div>
										</div>
									</div>
									<div class="col-md-2">
										<div class="thumbnail">
											<img src="${ctx }/img/export/side4.png">
											<div class="caption">
												<h3 style="text-align: center;">缩略图标签</h3>
											</div>
										</div>
									</div>
									<div class="col-md-2">
										<div class="thumbnail">
											<img src="${ctx }/img/export/side5.png">
											<div class="caption">
												<h3 style="text-align: center;">缩略图标签</h3>
											</div>
										</div>
									</div>
									<div class="col-md-2">
										<div class="thumbnail">
											<img src="${ctx }/img/export/side6.png">
											<div class="caption">
												<h3 style="text-align: center;">缩略图标签</h3>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-2">
										<div class="thumbnail">
											<img src="${ctx }/img/export/side1.png">
											<div class="caption">
												<h3 style="text-align: center;">缩略图标签</h3>
											</div>
										</div>
									</div>
									<div class="col-md-2">
										<div class="thumbnail">
											<img src="${ctx }/img/export/side3.png">
											<div class="caption">
												<h3 style="text-align: center;">缩略图标签</h3>
											</div>
										</div>
									</div>
								</div> --%>
							</div>
						</div>
                        <div class="tab-pane" id="panel-419304">
                            <table class="table t_titil" style="">
                                <tbody>
                                    <tr class="success">
                                        <td style="width: 90%;">WORKMANSHIP AUDIT</td>
                                    </tr>
                                </tbody>
                            </table>
                            <!-- 项目进度内容 -->

                            <table class="table table-bordered" style="margin-left: 20px; height: 70px;">
                                <thead>
                                    <tr class="active">
                                        <td colspan="3" rowspan="2">Inspection Standard:BS 6001/Din40080/Iso 2895</td>
                                        <td colspan="3" >defects</td>
                                    </tr>
                                    <tr>
										<td>critical</td>
                                        <td>major</td>
                                        <td>minor</td>
									</tr>
                                </thead>
                                <tbody id="tbode_schedule">
	                                <tr>
										<td>sampling plan</td>
										<td>general</td>
										<td>AQL</td>
										<td>0</td>
										<td>2.5</td>
										<td>4.0</td>
	                                </tr>
	                                <tr>
										<td>sampling size</td>
										<td>200</td>
										<td>pcs</td>
										<td>0</td>
										<td>2.5</td>
										<td>4.0</td>
	                                </tr>
	                                <tr>
										<td>inspection level</td>
										<td>II</td>
										<td>MAX allowed</td>
										<td>0</td>
										<td>9</td>
										<td>0</td>
	                                </tr>
                                </tbody>
                            </table>
                            
                            <table class="table table-bordered" style="margin-left: 20px; height: 70px;">
                                <thead>
                                    <tr class="active">
                                        <td>color</td>
                                        <td>defect description- workmanship</td>
                                        <td>decision of RQC for improvement</td>
                                        <td>major</td>
                                        <td>minor</td>
                                    </tr>
                                </thead>
                                <tbody id="tbode_schedule">
	                                <tr>
										<td>light rose</td>
										<td>blot</td>
										<td></td>
										<td>1</td>
										<td>2</td>
	                                </tr>
	                                <tr>
										<td></td>
										<td>broken stiching</td>
										<td></td>
										<td>1</td>
										<td>2</td>
	                                </tr>
	                                <tr>
										<td></td>
										<td>waisband is unsymmertic for left and right</td>
										<td></td>
										<td>1</td>
										<td>2</td>
	                                </tr>
	                                <tr>
										<td></td>
										<td>care label is stiching wrong</td>
										<td></td>
										<td>1</td>
										<td>2</td>
	                                </tr>
	                                <tr>
										<td></td>
										<td>the seam allowance of back pocket is visible</td>
										<td></td>
										<td>1</td>
										<td>2</td>
	                                </tr>
	                                <tr>
										<td>QTY</td>
										<td>Funciton test</td>
										<td></td>
										<td>1</td>
										<td>2</td>
	                                </tr>
                                </tbody>
                            </table>

                            <table class="table t_titil" style="">
                                <tbody>
                                    <tr class="success">
                                        <td style="width: 90%;">Defect Picture</td>
                                    </tr>
                                </tbody>
                            </table>

                            <div class="my_h" style="width: 80%; clear: both;"  id="img2">
                            	<%-- <div class="row">
									<div class="col-md-2">
										<div class="thumbnail">
											<img src="${ctx }/img/export/side1.png">
											<div class="caption">
												<h3 style="text-align: center;">unsymmetric for</h3>
											</div>
										</div>
									</div>
									<div class="col-md-2">
										<div class="thumbnail">
											<img src="${ctx }/img/export/side2.png">
											<div class="caption">
												<h3 style="text-align: center;">blot</h3>
											</div>
										</div>
									</div>
									<div class="col-md-2">
										<div class="thumbnail">
											<img src="${ctx }/img/export/side3.png">
											<div class="caption">
												<h3 style="text-align: center;">stitching wrong</h3>
											</div>
										</div>
									</div>
									<div class="col-md-2">
										<div class="thumbnail">
											<img src="${ctx }/img/export/side4.png">
											<div class="caption">
												<h3 style="text-align: center;">blot</h3>
											</div>
										</div>
									</div>
									<div class="col-md-2">
										<div class="thumbnail">
											<img src="${ctx }/img/export/side5.png">
											<div class="caption">
												<h3 style="text-align: center;">sticker size</h3>
											</div>
										</div>
									</div>
									<div class="col-md-2">
										<div class="thumbnail">
											<img src="${ctx }/img/export/side6.png">
											<div class="caption">
												<h3 style="text-align: center;">blot</h3>
											</div>
										</div>
									</div>
								</div> --%>
								<p>Remarks</p>
								<p><textarea rows="10" cols="80"></textarea></p>
							</div>
                        </div>
                        <div class="tab-pane" id="panel-419305">
                            <table class="table t_titil" style="">
                                <tbody>
                                    <tr class="success">
                                        <td style="width: 90%;">MEASUREMENTS AUDIT</td>
                                </tbody>
                            </table>
                            <!-- 项目问题内容 -->
                            <table class="table table-bordered" style="margin-left: 20px; height: 70px;">
                                <thead>
                                    <tr class="active">
                                        <td>defect description-MEASUREMENTS</td>
                                        <td>decision of RQC for improvement</td>
                                        <td>colour/part</td>
                                        <td>colour/part</td>
                                    </tr>
                                </thead>
                                <tbody id="tbode_schedule">
	                                <tr>
										<td>the measurement of hip need improve</td>
										<td>rturn the jeans for repair</td>
										<td></td>
										<td></td>
	                                </tr>
	                                <tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
	                                </tr>
	                                <tr>
										<td></td>
										<td>total defects found</td>
										<td></td>
										<td></td>
	                                </tr>
	                                <tr>
										<td></td>
										<td>total dcefects allowed</td>
										<td></td>
										<td></td>
	                                </tr>
                                </tbody>
                            </table>
                            <div style="width: 80%; clear: both;" class="my_h">
								<h4>
									MEASUREMENTS: <input type="checkbox" name="tolerance">within tolerance<input type="checkbox" name="tolerance">out of tolerance
								</h4>
							</div>
							<table class="table t_titil" style="">
                                <tbody>
                                    <tr class="success">
                                        <td style="width: 90%;">Defect Picture</td>
                                    </tr>
                                </tbody>
                            </table>

                            <div class="my_h" style="width: 80%; clear: both;">
                            	<div class="row">
									<div class="col-md-3">
										<div class="thumbnail">
											<img src="${ctx }/img/export/side1.png" style="height:220px;width:100%;">
											<div class="caption">
												<h3 style="text-align: center;">stitching wrong</h3>
											</div>
										</div>
									</div>
									<div class="col-md-3">
										<div class="thumbnail">
											<img src="${ctx }/img/export/side2.png" style="height:220px;width:100%;">
											<div class="caption">
												<h3 style="text-align: center;">blot</h3>
											</div>
										</div>
									</div>
									<div class="col-md-3">
										<div class="thumbnail">
											<img src="${ctx }/img/export/side3.png" style="height:220px;width:100%;">
											<div class="caption">
												<h3 style="text-align: center;">sticker size</h3>
											</div>
										</div>
									</div>
									<div class="col-md-3">
										<div class="thumbnail">
											<img src="${ctx }/img/export/side4.png" style="height:220px;width:100%;">
											<div class="caption">
												<h3 style="text-align: center;">Weighting</h3>
											</div>
										</div>
									</div>
								</div>
								<p>Remarks</p>
								<p><textarea rows="10" cols="80"></textarea></p>
							</div>
                        </div>
                        <div class="tab-pane" id="panel-419306">
                            <table class="table t_titil" style="">
                                <tbody>
                                    <tr class="success">
                                        <td style="width: 90%;">FABRIC, TRIM, ACCESSORYS, TAGS</td>
                                </tbody>
                            </table>
                            <!-- 项目问题内容 -->
                            <table class="table table-bordered" style="margin-left: 20px; height: 70px;">
                                <thead>
                                    <tr class="active">
                                        <td></td>
                                        <td>OK</td>
                                        <td>NOT OK</td>
                                        <td></td>
                                        <td>OK</td>
                                        <td>NOT OK</td>
                                        <td></td>
                                        <td>OK</td>
                                        <td>NOT OK</td>
                                    </tr>
                                </thead>
                                <tbody id="tbode_schedule">
	                                <tr>
										<td>Fabric colours：</td>
										<td>√</td>
										<td></td>
										<td>main/size label</td>
										<td></td>
										<td></td>
										<td>button/zipper</td>
										<td>√</td>
										<td></td>
	                                </tr>
	                                <tr>
										<td>Fabric hand feel/tension</td>
										<td>√</td>
										<td></td>
										<td>care/content label</td>
										<td></td>
										<td></td>
										<td>snap/rivet</td>
										<td>√</td>
										<td></td>
	                                </tr>
	                                <tr>
										<td>Fabric apperance</td>
										<td>√</td>
										<td></td>
										<td>Embroidery</td>
										<td></td>
										<td></td>
										<td>Hangtag</td>
										<td>√</td>
										<td></td>
	                                </tr>
	                                <tr>
										<td>Printing </td>
										<td>√</td>
										<td></td>
										<td>Interlining</td>
										<td></td>
										<td></td>
										<td>Hanger</td>
										<td>√</td>
										<td></td>
	                                </tr>
	                                <tr>
										<td>Elastic colours </td>
										<td>√</td>
										<td></td>
										<td>thread colours</td>
										<td></td>
										<td></td>
										<td>In-House Test</td>
										<td>√</td>
										<td></td>
	                                </tr>
                                </tbody>
                            </table>
                            
							<table class="table t_titil" style="">
                                <tbody>
                                    <tr class="success">
                                        <td style="width: 90%;">Defect Picture</td>
                                    </tr>
                                </tbody>
                            </table>

                            <div class="my_h" style="width: 80%; clear: both;">
                            	<div class="row">
									<div class="col-md-3">
										<div class="thumbnail">
											<img src="${ctx }/img/export/side1.png" style="height:220px;width:100%;">
											<div class="caption">
												<h3 style="text-align: center;">Carton shipping Mark</h3>
											</div>
										</div>
									</div>
									<div class="col-md-3">
										<div class="thumbnail">
											<img src="${ctx }/img/export/side2.png" style="height:220px;width:100%;">
											<div class="caption">
												<h3 style="text-align: center;">Master Carton Mark</h3>
											</div>
										</div>
									</div>
									<div class="col-md-3">
										<div class="thumbnail">
											<img src="${ctx }/img/export/side3.png" style="height:220px;width:100%;">
											<div class="caption">
												<h3 style="text-align: center;">garment humidity</h3>
											</div>
										</div>
									</div>
								</div>
								<p>Remarks</p>
								<p><textarea rows="10" cols="80"></textarea></p>
							</div>
                        </div>
                        <div class="tab-pane" id="panel-419307">
                            <table class="table t_titil" style="">
                                <tbody>
                                    <tr class="success">
                                        <td style="width: 90%;">PACKING(incl.photo decumentation)</td>
                                </tbody>
                            </table>
                            <!-- 项目问题内容 -->
                            <table class="table table-bordered" style="margin-left: 20px; height: 70px;">
                                <thead>
                                    <tr class="active">
                                        <td></td>
                                        <td>NKD-SHOPS</td>
                                        <td>ONLINE SHOP</td>
                                    </tr>
                                </thead>
                                <tbody id="tbode_schedule">
	                                <tr>
										<td>Total cartons</td>
										<td>269</td>
										<td>11</td>
	                                </tr>
	                                <tr>
										<td>Dimension of carton</td>
										<td>58*39*28*/58*38*20</td>
										<td>58*39*20</td>
	                                </tr>
	                                <tr>
										<td>carton weight(Gross/Net)</td>
										<td>13kg/12kg</td>
										<td>13kg/12kg</td>
	                                </tr>
	                                <tr>
										<td>shopping mark </td>
										<td>√</td>
										<td></td>
	                                </tr>
                                </tbody>
                            </table>
                            <div class="my_h" style="width: 80%; clear: both;">
								<p>Remarks</p>
								<p><textarea rows="10" cols="80"></textarea></p>
							</div>
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
			
			getImgs("img1","1");
			getImgs("img2","2");
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