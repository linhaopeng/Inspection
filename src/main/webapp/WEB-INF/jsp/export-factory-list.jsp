<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="include_tags.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>Inspection - Factory Audit Application Form</title>
<meta name="keywords" content="门禁,考勤,安防">
<meta name="description" content="Inspection - Factory Audit Application Form">

<link rel="shortcut icon" href="favicon.ico">
<link href="${ctx  }/css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="${ctx  }/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
<link href="${ctx  }/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
<link href="${ctx  }/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="${ctx  }/css/animate.min.css" rel="stylesheet">
<link href="${ctx  }/css/style.min.css?v=4.0.0" rel="stylesheet">
<!-- <base target="_blank"> -->
<link
	href="${ctx  }/css/plugins/bootstrap-paginator/bootstrap-paginator.css"
	rel="stylesheet">
<!-- Sweet Alert -->
<link href="${ctx  }/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">
<link href="${ctx  }/css/system/custom-list.css" rel="stylesheet">
<link href="${ctx  }/css/system/getDatas.css" rel="stylesheet">

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

.f_a {
	width: 216px;
	display: inline;
	margin-right: 20px;
}

.f_s {
	height: 45px;
	text-align: left;
	margin-left: 40px;
}
</style>

</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content white-bg page-heading"
		id="accountInfoDiv">
		<div class="row">

			<div class="col-sm-12"
				style="width: 100%; font-size: 14px;">

				<div class="container" style="margin-left: inherit;">
					<div class="row clearfix">
						<div class="col-md-12 column">
							<div class="page-header">
								<h1 style="font-weight: 700; font-size: 22px;">Factory Audit List</h1>
							</div>
						</div>
					</div>
				</div>

				<div class="text-center animated fadeInRightBig form-horizontal">
					<form class="fadeInDown">
						<div class="form-inline f_s">
							<div class="f_a" id="getQuery">
								<button type="button" class="btn btn-primary" id="createAuditTask">Create Audit Task</button>
							</div>
						</div>
					</form>
					<div class="ibox-content table-responsive">

						<table class="table table-stripped  text-left table-hover ">
							<thead>
								<tr>
									<th><input type="checkbox"></th>
									<th>Supplier Number</th>
									<th>Factory Name (Chinese)</th>
									<th>Factory Name (English)</th>
									<th>Contact Person (Supplier)</th>
									<th>Status</th>
									<th>Suggested Audit Date</th>
									<th>Audit Report</th>
								</tr>
							</thead>
							<tbody id="tableBody">
								<tr>
									<td><input type="checkbox"></td>
									<td>13465</td>
									<td>广东省纺织品进出口股份有限公司</td>
									<td>Guangdong Textiles Imp.&Exp.CO.LTD.</td>
									<td>huangjn</td>
									<td>Finished</td>
									<td>20.09.2017</td>
									<td><a href="${ctx }/export_factory_detail?id=1">Factory Audit Report</a></td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>13458</td>
									<td>广东省家具股份有限公司</td>
									<td>Guangdong Textiles Imp.&Exp.CO.LTD.</td>
									<td>wangxu</td>
									<td>Doing</td>
									<td>20.08.2017</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>13459</td>
									<td>广东省羊毛进出口股份有限公司</td>
									<td>Guangdong Wool CO.LTD.</td>
									<td>lixy</td>
									<td>Doing</td>
									<td>20.07.2017</td>
									<td>&nbsp;</a></td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>13560</td>
									<td>广东省手机配件股份有限公司</td>
									<td>Guangdong Phone accessories CO.LTD.</td>
									<td>wengxt</td>
									<td>To be started</td>
									<td>20.06.2017</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>13461</td>
									<td>广东省服饰用品股份有限公司</td>
									<td>Guangdong Clothing CO.LTD.</td>
									<td>linhp</td>
									<td>Finished</td>
									<td>20.05.2017</td>
									<td><a href="${ctx }/export_factory_detail?id=1">Factory Audit Report</a></td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>13462</td>
									<td>广东省印刷股份有限公司</td>
									<td>Guangdong Printing Imp.&Exp.CO.LTD.</td>
									<td>chenxt</td>
									<td>To be started</td>
									<td>20.04.2017</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>13463</td>
									<td>广东省毛织品进出口股份有限公司</td>
									<td>Guangdong Wool CO.LTD.</td>
									<td>chenlf</td>
									<td>Finished</td>
									<td>20.03.2017</td>
									<td><a href="${ctx }/export_factory_detail?id=1">Factory Audit Report</a></td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>13464</td>
									<td>广东省雷达接收股份有限公司</td>
									<td>Guangdong RadarReception Imp.&Exp.CO.LTD.</td>
									<td>fangde</td>
									<td>To be started</td>
									<td>20.02.2017</td>
									<td>&nbsp;</td>
								</tr>
								
							</tbody>
							<tfoot>
								<tr>
									<td colspan="11" class="text-center">

										<div id="bottomTab">
											<nav aria-label="Page navigation">
												<ul class="pagination">
													<li  class="active"><a href="#">1</a></li>
													<li><a href="#">2</a></li>
													<li><a href="#">3</a></li>
													<li><a href="#">4</a></li>
													<li><a href="#">5</a></li>
													<li><a href="#" aria-label="Next"> <span
															aria-hidden="true">&raquo;</span>
													</a></li>
												</ul>
											</nav>
										</div>
									</td>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal inmodal" id="companyEditModal" tabindex="-1" role="dialog"
			aria-hidden="true">
		<div class="modal-dialog">
			<form class="modal-content animated fadeInDown" id="accessInfoForm">
				<div class="modal-header" style="padding: 10px;">
					<button type="button" class="close" data-dismiss="modal" style="margin: 10px 15px 0px 0px;">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h6 class="modal-title">Factory Audit Application Form</h6>
				</div>
				<div class="modal-body">
					<div class="form-group">
					    <label for="deviceId">Supplier：</label>
					    <select class="form-control" name="cardReader" id="cardReader">
	                        <option value="0">Guangdong Textiles Imp.&Exp.CO.LTD.</option>
	                        <option value="1">Wisdom Fashion International</option>
	                        <option value="2">Zhuyan Fashion International</option>
                        </select>
					  </div>
					  <div class="form-group">
					    <label for="deviceName">Supplier number：</label>
					    <input type="text" class="form-control" id="deviceName" name="deviceName" value="13457" maxlength="20">
					  </div>
					  <div class="form-group">
					    <label for="installedPosition">Supplier address：</label>
					    <input type="text" class="form-control" id="deviceName" name="deviceName" value="7/F,No.168 Xiao Bei Road,Guangzhou,P.R.China" maxlength="20">
					  </div>
					  <div class="form-group">
					    <label for="isBuzzing">Factory name（Chinese）：</label>
					    <input type="text" class="form-control" id="deviceName" name="deviceName" value="广东省纺织品进出口股份有限公司" maxlength="20">
					  </div>
					  <div class="form-group">
					    <label for="lockActionTime">Factory name（English）：</label>
	                    <input type="text" class="form-control" id="lockActionTime" name="lockActionTime" maxlength="10" value="Guangdong Textiles Imp.&Exp.CO.LTD." >
					  </div>
					  <div class="form-group">
					    <label for="openTimeout">Factory address：</label>
	                    <input type="text" class="form-control" id="openTimeout" name="openTimeout" maxlength="10" value="7/F,No.168 Xiao Bei Road,Guangzhou,P.R.China">
					  </div>
					  <div class="form-group">
					    <label for="pressInterval">Province/City：</label>
	                    <input type="text" class="form-control" id="pressInterval" name="pressInterval" maxlength="10" value="GUANGDONG" >
					  </div>
					  <div class="form-group">
					    <label for="pressNumber">Contact person(Supplier)：</label>
	                    <input type="text" class="form-control" id="pressNumber" name="pressNumber" maxlength="10" value="huangjn" >
					  </div>
					  <div class="form-group">
					    <label for="cardReader">Phone(Supplier)：</label>
	                    <input type="text" class="form-control" id="pressNumber" name="pressNumber" maxlength="10" value="020-83558988" >
					  </div>
					  <div class="form-group">
					    <label for="pilotLight">Email (Supplier)：</label>
	                    <input type="text" class="form-control" id="pressNumber" name="pressNumber" maxlength="10" value="huangjn@gdtex.com" >
					    
					  </div>
					  <div class="form-group">
					    <label for="readInterval">Contact person(Factory)：</label>
	                    <input type="text" class="form-control" id="readInterval" name="readInterval" maxlength="10" value="iceroy" >
					  </div>
					  <div class="form-group">
					    <label for="readInterval">Phone(Factory)：</label>
	                    <input type="text" class="form-control" id="readInterval" name="readInterval" maxlength="10" value="020-83558988" >
					  </div>
					  <div class="form-group">
					    <label for="readInterval">Email(Factory)：</label>
	                    <input type="text" class="form-control" id="readInterval" name="readInterval" maxlength="10" value="iceroy@foxmial.com" >
					  </div>
					  <div class="form-group">
					    <label for="readInterval">Type of Audit：</label>
	                    <select class="form-control" name="pilotLight" id="pilotLight">
	                        <option value="0">FE</option>
	                        <option value="1">RE FE</option>
                        </select>
					  </div>
					  <div class="form-group">
					    <label for="readInterval">Suggested audit date：</label>
	                    <input type="text" class="form-control" id="readInterval" name="readInterval" maxlength="10" value="2017/5/23" >
					  </div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal" id="closeAccessInfoForm">Close</button>
					<button type="submit" class="btn btn-primary" id="confirmAccessInfoForm">Submit</button>
				</div>
			</form>
		</div>
	</div>
</body>
<script src="${ctx  }/js/jquery.min.js?v=2.1.4"></script>
	<script src="${ctx  }/js/jquery-migrate-1.1.0.min.js"></script>
	<script src="${ctx  }/js/bootstrap.min.js?v=3.3.5"></script>
	<script src="${ctx  }/js/content.min.js?v=1.0.0"></script>
	<script src="${ctx  }/js/plugins/iCheck/icheck.min.js"></script>
	<script src="${ctx  }/js/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
	<script src="${ctx  }/js/plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
	<script src="${ctx  }/js/plugins/bootstrap-paginator/bootstrap-paginator.min.js"></script>
	<script src="${ctx  }/js/plugins/sweetalert/sweetalert.min.js"></script>
	<script src="${ctx  }/js/system/base.js"></script>
<script type="text/javascript">
$(function(){
	
	$("#createAuditTask").click(function(){
		$("#companyEditModal").modal("show");
	});
	
});
</script>
</html>