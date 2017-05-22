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
.f_a{
	width: 216px;
    display: inline;
    margin-right: 20px;
}
.f_s{
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

			<div class="col-sm-9"
				style="width: 100%;margin-bottom: 20px;margin-left: 30px;font-size: 14px;">

				<div class="container" style="    margin-left: inherit;">
					<div class="row clearfix">
						<div class="col-md-12 column">
							<div class="page-header">
								<h1 style="font-weight: 700;font-size: 22px;">项目信息查询</h1>
							</div>
						</div>
					</div>
				</div>

				<div class="text-center animated fadeInRightBig form-horizontal">


					
					<form class="fadeInDown">
						<div class="form-inline f_s">
						<div class="f_a">
						<label	>项目类型:</label>
								
									     <select id="p_typeId" name="p_typeId" class="f_a input-small form-control" style="width: 195px;">
									     <option value="">全部</option>
									     	<c:forEach var="type" items="${typeList }" varStatus="s">
					                           <option value="${type.typeId }">${type.name }</option>
				                        	</c:forEach>
									     </select>  
                        			

						</div>
						<div class="f_a">
						<label >项目名称:</label>
						<input	type="text" id="name" name="name" class="input-small form-control" placeholder="请输入项目名称" > 
						</div>
						<div class="f_a">
						<label>项目编号:</label>
						<input	type="text" id="no" name="no" class="input-small form-control" placeholder="请输入项目编号"> 
						</div>
						</div>
						<div class="form-inline f_s">
						<div class="f_a">
						<label	>投资主体:</label>
						<input type="text" id="investor" name="investor" class="input-small form-control" placeholder="请输入投资主体" > 
						</div>
						<div class="f_a" style="margin-left: 30px;">
										<select id="select_a" name="select_a" class=" input-small form-control" style="width: 195px;">
									     <option value="investment">计划投资</option>
									     <option value="assets">注册资本</option>
									     <option value="annualProductValue">年产值</option>
									     <option value="annualRevenue">年纳税</option>	
									     <option value="acreAssets">每亩注册资本</option>
									     </select>  
						</div>
						<div class="f_a">
										<select id="select_b" name="select_b" class=" input-small form-control" style="width: 98px;">
									     <option value="1">大于</option>
									     <option value="2">等于</option>
									     <option value="3">小于</option>
									     </select>  
						</div>
						<div class="f_a input-append">
						<input type="text" id="s_value" name="s_value" class="input-small form-control" placeholder="请输入数值" onkeyup="value=value.replace(/\D/gi,'')" maxlength="10" ><span class="add-on btn" id="dele_i"><img alt="" src="${ctx }/img/del_1.png"></span>
						</div>
						<div class="f_a" id="getQuery">
							<button type="button" class="btn btn-primary" 
								>查询</button>
						</div>
						</div>
					
					</form>
					<div class="ibox-content table-responsive">

						<table class="table table-stripped  text-left table-hover " >
							<thead>
								<tr>
									<th>项目名称</th>
									<th>投资主体</th>
									<th>
									<table><tr><td>计划投资</td></tr><tr><td>(万元)</td></tr></table>
									</th>
									<th>
									<table><tr><td>占地面积</td></tr><tr><td>(亩)</td></tr></table>
									</th>
									<th>
									<table><tr><td>注册资本</td></tr><tr><td>(万元)</td></tr></table>
									</th>
									<th>
									<table><tr><td>每亩</td></tr><tr><td>注册资本</td></tr><tr><td>(万元)</td></tr></table>
									</th>
									<th>
									<table><tr><td>预计</td></tr><tr><td>年产值</td></tr><tr><td>(万元)</td></tr></table>
									</th>
									<th>
									<table><tr><td>预计</td></tr><tr><td>每亩年产值</td></tr><tr><td>(万元)</td></tr></table>
									</th>
									<th>
									<table><tr><td>预计</td></tr><tr><td>年纳税</td></tr><tr><td>(万元)</td></tr></table>
									</th>
									<th>
										<table><tr><td>预计</td></tr><tr><td>每亩年纳税</td></tr><tr><td>(万元)</td></tr></table>
									</th>
									<th>员工人数</th>
								</tr>
							</thead>
							<tbody id="tableBody">
							</tbody>
							<tfoot>
								<tr>
									<td colspan="11" class="text-center">
										
										<div id="bottomTab"></div>
									</td>
								</tr>
							</tfoot>
						</table>

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
		<script>
			$(document).ready(function() {
				$(".i-checks").iCheck({
					checkboxClass : "icheckbox_square-green",
					radioClass : "iradio_square-green",
				});
			});
			
		</script>
		<script src="${ctx  }/js/system/base.js"></script>
		<script src="${ctx  }/js/system/getDatas.js"></script>
		<script src="${ctx  }/js/system/project_info_show.js"></script>
</body>

</html>