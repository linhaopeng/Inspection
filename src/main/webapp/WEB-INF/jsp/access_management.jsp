<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="include_tags.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

   <title>街坊邻里后台管理系统 - 门口机管理</title>
    <meta name="keywords" content="门禁,安防">
    <meta name="description" content="街坊邻里后台管理系统 - 门口机管理">

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
		}
	</style>
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content white-bg page-heading">
        <div class="row">
            <div class="col-sm-12">
            	<div class="ibox-title">
			        <ol class="breadcrumb" style="margin-left: 0px;">
			        	<li>
			               <small>小区内部管理</small>
			            </li>
			            <li>
			               <strong>门口机管理</strong>
			            </li>
			        </ol>
			    </div>
                <div class="text-center animated fadeInRightBig form-horizontal" id="accessDiv">
                    <div class="form-group">
                    	<div class="col-sm-12 text-left">
	                         <button type="button" class="btn btn-w-m btn-outline btn-info">所有门禁数据下载</button>
                        </div> 
                    </div>
					<div class="ibox-content">

						<table
							class="footable table table-stripped toggle-arrow-tiny text-left" id="accessRules"
							data-page-size="8">
							<thead>
								<tr>
									<th>
										<div class="checkbox i-checks checkAll">
											<label><input type="checkbox" value=""> <i></i></label>
										</div>
									</th>
									<th>设备ID</th>
									<th>设备名称</th>
									<th>安装地址</th>
									<th>安装公司</th>
									<th>设备状态</th>
									<th>操作</th>
									<th>授权</th>
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
    <!-- 模态窗口 -->
	<div class="modal inmodal" id="accessInfoEditModal" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog">
				<form class="modal-content animated fadeInDown" id="accessInfoForm">
					<div class="modal-header" style="padding: 10px;">
						<button type="button" class="close" data-dismiss="modal" style="margin: 10px 15px 0px 0px;">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h6 class="modal-title">编辑门口机信息</h6>
					</div>
					<div class="modal-body">
						<div class="form-group">
						    <label for="deviceId">设备ID：</label>
						    <input type="text" class="form-control" id="deviceId" name="deviceId" placeholder="" maxlength="20" readonly="readonly">
						  </div>
						  <div class="form-group">
						    <label for="deviceName">设备名称：</label>
						    <input type="text" class="form-control" id="deviceName" name="deviceName" placeholder="请输入设备名称" maxlength="20">
						  </div>
						  <div class="form-group">
						    <label for="installedPosition">安装位置：</label>
						    <button type="button" class="btn btn-primary btn-sm" id="menuBtn" style="position: relative;left: 68%;bottom: 5px;" onclick="showMenu(); return false;">选择安装地址</button>
						    <input type="text" class="form-control" id="installedPosition" name="installedPosition" placeholder="请选择安装地址" readonly="readonly" onclick="showMenu();" >
						    <div id="menuContent" class="menuContent" style="display:none; position: absolute;">
								<ul id="positionTree" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
							</div>
						  </div>
						  <div class="form-group">
						    <label for="isBuzzing">告警时是否启动蜂鸣器：</label>
						    <select class="form-control" name="isBuzzing" id="isBuzzing">
		                        <option value="0">不启动</option>
		                        <option value="1">启动</option>
	                        </select>
						  </div>
						  <div class="form-group">
						    <label for="lockActionTime">开锁动作时间（秒）：</label>
		                    <input type="text" class="form-control" id="lockActionTime" name="lockActionTime" maxlength="10" onkeyup="value=value.replace(/[^\d{1,}\d{1,}|\d{1,}]/g,'')" >
						  </div>
						  <div class="form-group">
						    <label for="openTimeout">门开超时报警（秒）：</label>
		                    <input type="text" class="form-control" id="openTimeout" name="openTimeout" maxlength="10" onkeyup="value=value.replace(/[^\d{1,}\d{1,}|\d{1,}]/g,'')" >
						  </div>
						  <div class="form-group">
						    <label for="pressInterval">连续按房号键启动预警的时间间隔（秒）：</label>
		                    <input type="text" class="form-control" id="pressInterval" name="pressInterval" maxlength="10" onkeyup="value=value.replace(/[^\d{1,}\d{1,}|\d{1,}]/g,'')" >
						  </div>
						  <div class="form-group">
						    <label for="pressNumber">连续按房号键启动预警的按键次数（次）：</label>
		                    <input type="text" class="form-control" id="pressNumber" name="pressNumber" maxlength="10" onkeyup="value=value.replace(/[^\d{1,}\d{1,}|\d{1,}]/g,'')" >
						  </div>
						  <div class="form-group">
						    <label for="cardReader">读卡器：</label>
						    <select class="form-control" name="cardReader" id="cardReader">
		                        <option value="0">自动检测</option>
		                        <option value="1">Wiegand 26</option>
		                        <option value="2">Wiegand 32</option>
	                        </select>
						  </div>
						  <div class="form-group">
						    <label for="pilotLight">告警时是否启动蜂鸣器：</label>
						    <select class="form-control" name="pilotLight" id="pilotLight">
		                        <option value="0">阴极</option>
		                        <option value="1">阳极</option>
	                        </select>
						  </div>
						  <div class="form-group">
						    <label for="readInterval">读卡间隔（秒）：</label>
		                    <input type="text" class="form-control" id="readInterval" name="readInterval" maxlength="10" onkeyup="value=value.replace(/[^\d{1,}\d{1,}|\d{1,}]/g,'')" >
						  </div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-white" data-dismiss="modal" id="closeAccessInfoForm">关闭</button>
						<button type="submit" class="btn btn-primary" id="confirmAccessInfoForm">提交保存</button>
					</div>
				</form>
			</div>
		</div>
    <script src="${ctx  }/js/jquery.min.js?v=2.1.4"></script>
    <script src="${ctx  }/js/jquery-migrate-1.1.0.min.js"></script>
    <script src="${ctx  }/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="${ctx  }/js/content.min.js?v=1.0.0"></script>
    <script src="${ctx  }/js/plugins/iCheck/icheck.min.js"></script>
    <script src="${ctx  }/js/plugins/bootstrap-paginator/bootstrap-paginator.min.js"></script>
    <script src="${ctx  }/js/plugins/sweetalert/sweetalert.min.js"></script>
    <script src="${ctx  }/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="${ctx  }/js/plugins/validate/messages_zh.min.js"></script>
    <script src="${ctx  }/js/system/formValidator.js"></script>
    <script src="${ctx  }/js/jquery.cookie.js"></script>
    <script src="${ctx  }/js/plugins/ztree/jquery.ztree.core.js"></script>
	<script src="${ctx  }/js/plugins/ztree/jquery.ztree.excheck.js"></script>
<!--	<script src="${ctx  }/js/plugins/ztree/jquery.ztree.exedit.js"></script>-->
	<script src="${ctx  }/js/system/base.js"></script>
	<script src="${ctx  }/js/system/access_management.js"></script>
	<script>
		$(document).ready(function() {
			$(".i-checks").iCheck({
				checkboxClass : "icheckbox_square-green",
				radioClass : "iradio_square-green",
			});
		});
	</script>
</body>

</html>