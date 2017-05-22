<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="include_tags.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

   <title>街坊邻里后台管理系统 - 需求管理</title>
    <meta name="keywords" content="门禁,安防">
    <meta name="description" content="街坊邻里后台管理系统 - 需求管理">

    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="${ctx  }/css/bootstrap-responsive.min.css" rel="stylesheet">
    <link href="${ctx  }/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="${ctx  }/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
	<link href="${ctx  }/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="${ctx  }/css/animate.min.css" rel="stylesheet">
    <link href="${ctx  }/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
    <link href="${ctx  }/css/plugins/bootstrap-paginator/bootstrap-paginator.css" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="${ctx  }/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="${ctx  }/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
    

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content white-bg page-heading" id="feedbacksDiv">
        <div class="row">
            <div class="col-sm-12">
            	<div class="ibox-title">
			        <!-- <ol class="breadcrumb">
			            <li>
			               <strong>需求管理</strong>
			            </li>
			        </ol> -->
			    </div>
                <div class="text-left animated fadeInRightBig form-horizontal">
                	<div class="form-group" style="margin-left: 15px;">
                		<div class="form-inline col-sm-2">
                			<div class="form-group">
 		                		 <label for="isRead">阅读状态：</label>
		                         <select class="form-control" name="isRead" id="isRead">
	                                 <option value="">--所有--</option>
	                                 <option value="0">未读</option>
	                                 <option value="1">已读</option>
	                             </select>
		                    </div>
		                </div>
		                <div class="form-inline col-sm-6">
		                	<label for="start">提出时间：</label>
		                	<div class="input-daterange input-group" id="datepicker">
							    <input type="text" class="input-sm form-control" name="start" id="start"/>
							    <span class="input-group-addon">~</span>
							    <input type="text" class="input-sm form-control" name="end" id="end"/>
							</div>
		                </div>
                    </div>
                	<div class="form-group" id="queryForm"  style="margin-left: 15px;">
                		<div class="form-inline col-sm-2">
                			<div class="form-group">
 		                		 <label for="handleType">处理类型：</label>
		                         <select class="form-control" name="handleType" id="handleType">
	                                 <option value="">--所有--</option>
	                                 <option value="0">废弃</option>
	                                 <option value="1">采纳</option>
	                                 <option value="2">奖励</option>
	                             </select>
		                    </div>
		                </div>
                		<div class="form-inline col-sm-4">
                			<div class="form-group">
		                         <label for="fbContent">&nbsp;&nbsp;&nbsp;&nbsp;需求描述：</label>
		                         <input type="text" class="form-control" id="fbContent" name="fbContent" >
		                    </div>
		                </div>
                         <div class="col-sm-3">
	                         <button type="button" class="btn btn-w-m btn-primary" id="queryButton">查询</button>
                        </div> 
                    </div>
					<div class="ibox-content table-responsive">

						<table class="table table-stripped toggle-arrow-tiny text-center" id="accountInfos">
							<thead>
								<tr>
									<th class="text-center">NO</th>
									<th class="text-center">需求描述</th>
									<th class="text-center">用户</th>
									<th class="text-center">提出时间</th>
									<th class="text-center">阅读状态</th>
									<th class="text-center">处理类型</th>
									<th class="text-center">操作</th>
								</tr>
							</thead>
							<tbody id="tableBody">
							</tbody>
							<tfoot>
								<tr>
									<td colspan="9" class="text-center" >
										<!-- 底部分页按钮 -->
										<div id="bottomTab"></div>
									</td>
								</tr>
							</tfoot>
						</table>

					</div>
				</div>
            </div>
        </div>
    </div>
    
    <script src="${ctx  }/js/jquery.min.js?v=2.1.4"></script>
    <script src="${ctx  }/js/jquery-migrate-1.1.0.min.js"></script>
    <script src="${ctx  }/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="${ctx  }/js/content.min.js?v=1.0.0"></script>
    <script src="${ctx  }/js/plugins/iCheck/icheck.min.js"></script>
    <script src="${ctx  }/js/plugins/bootstrap-paginator/bootstrap-paginator.min.js"></script>
    <script src="${ctx  }/js/plugins/sweetalert/sweetalert.min.js"></script>
    <script src="${ctx  }/js/plugins/datapicker/bootstrap-datepicker.js"></script>
	<script>
		$(document).ready(function() {
			$(".i-checks").iCheck({
				checkboxClass : "icheckbox_square-green",
				radioClass : "iradio_square-green",
			});
			$("#feedbacksDiv .input-daterange").datepicker({
			    format: "yyyy-mm-dd",
			    startView: -1,
			    todayBtn: "linked",
			    clearBtn: true,
			    autoclose: true,
			    todayHighlight: true
			});
			
			$("#start").change(function(){
				//alert($("#start").val());
			});
		});
	</script>
	<script src="${ctx  }/js/system/base.js"></script>
	<script src="${ctx  }/js/system/requirement_management.js"></script>
</body>

</html>