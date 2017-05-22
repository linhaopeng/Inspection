<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="include_tags.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>广州市番禺区现代产业基地项目管理系统 - 项目信息查询</title>
<meta name="keywords" content="门禁,考勤,安防">
<meta name="description" content="广州市番禺区现代产业基地项目管理系统 - 项目信息查询">

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
				style="width: 100%; margin-bottom: 20px; margin-left: 30px; font-size: 14px;">

				<div class="container" style="margin-left: inherit;">
					<div class="row clearfix">
						<div class="col-md-12 column">
							<div class="page-header">
								<h1 style="font-weight: 700; font-size: 22px;">Order List</h1>
							</div>
						</div>
					</div>
				</div>

				<div class="text-center animated fadeInRightBig form-horizontal">
					<form class="fadeInDown">
						<div class="form-inline f_s">
							<div class="f_a" id="getQuery">
								<button type="button" class="btn btn-primary">Pre-production Meeting</button>
							</div>
							<div class="f_a" id="getQuery">
								<button type="button" class="btn btn-primary">Create In-Line Inspetion</button>
							</div>
							<div class="f_a" id="getQuery">
								<button type="button" class="btn btn-primary">Create Final Inspetion</button>
							</div>
						</div>

					</form>
					<div class="ibox-content table-responsive">

						<table class="table table-stripped  text-left table-hover ">
							<thead>
								<tr>
									<th><input type="checkbox"></th>
									<th>Order No</th>
									<th>Supplier/Vendor</th>
									<th>Order Qty</th>
									<th>Order Date</th>
									<th>
										<table>
											<tr>
												<td>In-Line Inspetion</td>
											</tr>
											<tr>
												<td>Date(Plan)</td>
											</tr>
										</table>
									</th>
									<th>
										<table>
											<tr>
												<td>Final Inspetion </td>
											</tr>
											<tr>
												<td>Date(Plan)</td>
											</tr>
										</table>
									</th>
								</tr>
							</thead>
							<tbody id="tableBody">
								<tr>
									<td><input type="checkbox"></td>
									<td>10027022</td>
									<td>GUANGDONG TEXTILES</td>
									<td>10000</td>
									<td>20.05.2016</td>
									<td>20.11.2016</td>
									<td>20.02.2017</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>10027023</td>
									<td>Wisdom Fashion International</td>
									<td>20000</td>
									<td>20.05.2016</td>
									<td>20.11.2016</td>
									<td>20.02.2017</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>10027024</td>
									<td>Zhuyan Fashion International</td>
									<td>9000</td>
									<td>20.05.2016</td>
									<td>20.11.2016</td>
									<td>20.02.2017</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>10027025</td>
									<td>Guangzhou Baoju Fashion</td>
									<td>10000</td>
									<td>20.05.2016</td>
									<td>20.11.2016</td>
									<td>20.02.2017</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>10027026</td>
									<td>Beautiful Fashion International</td>
									<td>30000</td>
									<td>20.05.2016</td>
									<td>20.11.2016</td>
									<td>20.02.2017</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>10027027</td>
									<td>GUANGDONG TEXTILES</td>
									<td>40000</td>
									<td>20.05.2016</td>
									<td>20.11.2016</td>
									<td>20.02.2017</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>10027028</td>
									<td>GUANGDONG TEXTILES</td>
									<td>10020</td>
									<td>20.05.2016</td>
									<td>20.11.2016</td>
									<td>20.02.2017</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>10027029</td>
									<td>GUANGDONG TEXTILES</td>
									<td>13000</td>
									<td>20.05.2016</td>
									<td>20.11.2016</td>
									<td>20.02.2017</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>10027030</td>
									<td>GUANGDONG TEXTILES</td>
									<td>50000</td>
									<td>20.05.2016</td>
									<td>20.11.2016</td>
									<td>20.02.2017</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>10027031</td>
									<td>GUANGDONG TEXTILES</td>
									<td>10000</td>
									<td>20.05.2016</td>
									<td>20.11.2016</td>
									<td>20.02.2017</td>
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

</body>

</html>