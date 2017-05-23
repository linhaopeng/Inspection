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
								<h1 style="font-weight: 700; font-size: 22px;">Factory List</h1>
							</div>
						</div>
					</div>
				</div>

				<div class="text-center animated fadeInRightBig form-horizontal">
					<form class="fadeInDown">
						<div class="form-inline f_s">
							<div class="f_a" id="getQuery">
								<button type="button" class="btn btn-primary">Create Factory </button>
							</div>
						</div>
					</form>
					<div class="ibox-content table-responsive">

						<table class="table table-stripped  text-left table-hover ">
							<thead>
								<tr>
									<th><input type="checkbox"></th>
									<th>Supplier number</th>
									<th>Factory name（Chinese）</th>
									<th>Factory name（English）</th>
									<th>Contact person(Supplier)</th>
									<th>Phone(Supplier)</th>
									<th>Suggested audit date</th>
									<th>Report</th>
								</tr>
							</thead>
							<tbody id="tableBody">
								<tr>
									<td><input type="checkbox"></td>
									<td>13465</td>
									<td>广东省纺织品进出口股份有限公司</td>
									<td>Guangdong Textiles Imp.&Exp.CO.LTD.</td>
									<td>huangjn</td>
									<td>020-83558988</td>
									<td>20.09.2017</td>
									<td><a href="${ctx }/export_factory_detail?id=1">In-line Factory Report</a></td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>13458</td>
									<td>广东省家具股份有限公司</td>
									<td>Guangdong Textiles Imp.&Exp.CO.LTD.</td>
									<td>wangxu</td>
									<td>020-83558977</td>
									<td>20.08.2017</td>
									<td><a href="${ctx }/export_factory_detail?id=1">In-line Factory Report</a></td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>13459</td>
									<td>广东省羊毛进出口股份有限公司</td>
									<td>Guangdong Wool CO.LTD.</td>
									<td>lixy</td>
									<td>020-83558966</td>
									<td>20.07.2017</td>
									<td><a href="${ctx }/export_factory_detail?id=1">Final Factory Report</a></td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>13560</td>
									<td>广东省手机配件股份有限公司</td>
									<td>Guangdong Phone accessories CO.LTD.</td>
									<td>wengxt</td>
									<td>020-83558955</td>
									<td>20.06.2017</td>
									<td><a href="${ctx }/export_factory_detail?id=1">Final Factory Report</a></td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>13461</td>
									<td>广东省服饰用品股份有限公司</td>
									<td>Guangdong Clothing CO.LTD.</td>
									<td>linhp</td>
									<td>020-83558944</td>
									<td>20.05.2017</td>
									<td><a href="${ctx }/export_factory_detail?id=1">Final Factory Report</a></td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>13462</td>
									<td>广东省印刷股份有限公司</td>
									<td>Guangdong Printing Imp.&Exp.CO.LTD.</td>
									<td>chenxt</td>
									<td>020-83558933</td>
									<td>20.04.2017</td>
									<td><a href="${ctx }/export_factory_detail?id=1">In-line Factory Report</a></td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>13463</td>
									<td>广东省毛织品进出口股份有限公司</td>
									<td>Guangdong Wool CO.LTD.</td>
									<td>chenlf</td>
									<td>020-83558922</td>
									<td>20.03.2017</td>
									<td><a href="${ctx }/export_factory_detail?id=1">In-line Factory Report</a></td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>13464</td>
									<td>广东省雷达接收股份有限公司</td>
									<td>Guangdong RadarReception Imp.&Exp.CO.LTD.</td>
									<td>fangde</td>
									<td>020-83558911</td>
									<td>20.02.2017</td>
									<td><a href="${ctx }/export_factory_detail?id=1">In-line Factory Report</a></td>
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
</body>

</html>