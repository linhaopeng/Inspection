<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="include_tags.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

   <title>街坊邻里后台管理系统 - 开门记录管理</title>
    <meta name="keywords" content="门禁,安防">
    <meta name="description" content="街坊邻里后台管理系统 - 开门记录管理">

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
    <link href="${ctx  }/css/plugins/ztree/metroStyle/metroStyle.css" rel="stylesheet" type="text/css">
    
    <style type="text/css">
		ul.ztree {
			margin-top: 10px;
			border: 1px solid #617775;
			background: #f0f6e4;
			width: 220px;
			height: 360px;
			overflow-y: scroll;
			overflow-x: auto;
			z-index:999;
		}
	</style>

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content white-bg page-heading" id="feedbacksDiv">
        <div class="row">
            <div class="col-sm-12">
            	<div class="ibox-title">
			        <!-- <ol class="breadcrumb">
			            <li>
			               <strong>开门记录管理</strong>
			            </li>
			        </ol> -->
			    </div>
                <div class="animated fadeInRightBig form-horizontal">
                	<div class="form-group" style="margin-left: 0;">
                		<div class="form-inline col-sm-3">
                			<div class="form-group">
 		                		 <label for="openMethod">开门方式：</label>
		                         <select class="form-control" name="openMethod" id="openMethod">
	                                 <option value="0">--所有--</option>
	                                 <option value="1">蓝牙开门</option>
	                                 <option value="2">密码开门</option>
	                                 <option value="3">RFID卡开门</option>
	                                 <option value="4">APP远程开门</option>
	                                 <option value="5">管理中心远程开门</option>
	                                 <option value="6">出门按钮开门</option>
	                                 <option value="7">电话开门（按*或#键）</option>
	                             </select>
		                    </div>
		                </div>
		                <div class="form-inline col-sm-4">
                			<div class="form-group">
 		                		 <label for="apartmentUnit">楼栋单元：</label>
 		                		 <div class="input-group">
			                         <input type="text" class="form-control" id="apartmentUnit" name="apartmentUnit" onclick="showMenu();" readonly="readonly">
			                         <div class="input-group-addon" style="cursor: pointer;" id="clearApartmentUnit">X</div>
 		                		 </div>
		                         <div id="menuContent" class="menuContent" style="display:none; position: absolute;">
									<ul id="positionTree" class="ztree" style="position: absolute;margin-top:0; width:180px; height: 300px;"></ul>
								</div>
		                    </div>
		                </div>
                    </div>
                	<div class="form-group" id="queryForm"  style="margin-left: 0;">
                		<div class="form-inline col-sm-3">
                			<div class="form-group">
 		                		 <label for="deviceId">设备ID：</label>
		                         <input type="text" class="form-control" id="deviceId" name="deviceId" >
		                    </div>
		                </div>
                		<div class="form-inline col-sm-3">
                			<div class="form-group">
		                         <label for="userName">用户姓名：</label>
		                         <input type="text" class="form-control" id="userName" name="userName" >
		                    </div>
		                </div>
                    </div>
                    <div class="form-group" >
		                <div class="form-inline col-sm-6">
		                	<label for="start">开门时间：</label>
		                	<div class="input-daterange input-group" id="datepicker">
							    <input type="text" class="input-sm form-control" name="start" id="start"/>
							    <span class="input-group-addon">~</span>
							    <input type="text" class="input-sm form-control" name="end" id="end"/>
							</div>
		                </div>
		                <div class="col-sm-3">
	                         <button type="button" class="btn btn-w-m btn-primary" id="queryButton">查询</button>
                        </div> 
                    </div>
                    <div class="form-group">
                    	<div class="col-sm-12 text-left" style="padding-top:5px">
	                         <button type="button" class="btn btn-outline btn-info excelExport_btn">导出数据</button>
                        </div> 
                    </div>
					<div class="ibox-content table-responsive">

						<table class="table table-stripped toggle-arrow-tiny text-center" id="openRecords">
							<thead>
								<tr>
									<th class="text-center">NO</th>
									<th class="text-center">设备ID</th>
									<th class="text-center">设备名称</th>
									<th class="text-center">楼栋</th>
									<th class="text-center">单元</th>
									<th class="text-center">开门时间</th>
									<th class="text-center">开门方式</th>
									<th class="text-center">RFID卡</th>
									<th class="text-center">用户姓名</th>
									<th class="text-center">用户手机号</th>
								</tr>
							</thead>
							<tbody id="tableBody">
							</tbody>
							<tfoot>
								<tr>
									<td colspan="10" class="text-center" >
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
    <script src="${ctx  }/js/jquery.cookie.js"></script>
    <script src="${ctx  }/js/plugins/ztree/jquery.ztree.core.js"></script>
	<script src="${ctx  }/js/plugins/ztree/jquery.ztree.excheck.js"></script>
<!--	<script src="${ctx  }/js/plugins/ztree/jquery.ztree.exedit.js"></script>-->
	<script src="${ctx  }/js/system/date_utils.js"></script>
	<script src="${ctx  }/js/system/base.js"></script>
	<script src="${ctx  }/js/system/open_record_management.js"></script>
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
			
		});
	</script>
</body>

</html>