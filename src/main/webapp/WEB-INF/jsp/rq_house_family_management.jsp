<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="include_tags.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

   <title>街坊邻里后台管理系统 - 小区房屋住户管理</title>
    <meta name="keywords" content="门禁,安防">
    <meta name="description" content="街坊邻里后台管理系统 - 小区房屋住户管理">

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
			/* border: 1px solid #617775; */
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
        	<div class="col-sm-3">
				<div class="ibox-title">
					<strong>小区房屋列表</strong>
			    </div>
				<!-- <button type="button" class="btn btn-primary btn-sm" id="menuBtn" style="position: relative;left: 20%;bottom: 5px;">刷新</button> -->
				<input type="text" class="form-control" id="apartment" name="apartment" placeholder="选择的部门" readonly="readonly" onclick="showMenu();" >
				<div id="" class="" style="">
					<ul id="apartmentTree" class="ztree" style="margin-top:0; width:100%; height: 100%;"></ul>
				</div>
			</div>
            <div class="col-sm-9">
            	<div class="ibox-title">
            		<strong>小区住户列表</strong>
			    </div>
                <div class="text-left animated fadeInRightBig form-horizontal">
                	<div class="form-group">
                		<div class="form-inline col-sm-4" style="margin-left: 15px;">
                			<div class="form-group">
		                         <label for="residentialQuarterValue">住户姓名：</label>
		                         <input type="text" class="form-control" id="residentialQuarterValue">
		                    </div>
		                </div>
		                <div class="form-inline col-sm-4" style="margin-left: 15px;">
                			<div class="form-group">
		                         <label for="residentialQuarterValue">单元：</label>
		                         <input type="text" class="form-control" id="residentialQuarterValue">
		                    </div>
		                </div>
                    </div>
                    <div class="form-group">
                		<div class="form-inline col-sm-4" style="margin-left: 15px;">
                			<div class="form-group">
		                         <label for="residentialQuarterValue">手机号：</label>
		                         <input type="text" class="form-control" id="residentialQuarterValue">
		                    </div>
		                </div>
		                <div class="form-inline col-sm-4" style="margin-left: 15px;">
                			<div class="form-group">
		                         <label for="residentialQuarterValue">楼栋：</label>
		                         <input type="text" class="form-control" id="residentialQuarterValue">
		                    </div>
		                </div>
                    </div>
                    <div class="form-group">
                    	<div class="form-inline col-sm-4" style="margin-left: 15px;">
                			<div class="form-group">
 		                		 <label for="onlineStatus">住户类型：</label>
		                         <select class="form-control" name="onlineStatus" id="onlineStatus">
                                 <option value="0">--所有--</option>
                                 <option value="1">户主</option>
                                 <option value="2">家庭成员</option>
                                 <option value="3">临时租户</option>
                             </select>
		                    </div>
		                </div>
		                <div class="form-inline col-sm-4" style="margin-left: 15px;">
                			<div class="form-group">
		                         <label for="residentialQuarterValue">门牌号：</label>
		                         <input type="text" class="form-control" id="residentialQuarterValue">
		                    </div>
		                </div>
		                <div class="form-inline text-right">
                			<div class="form-group">
		                         <button type="button" class="btn btn-w-m btn-primary" id="queryButton">查询</button>
		                    </div>
		                </div>
                    </div>
                    <div class="form-group">
                    	<div class="col-sm-9 text-left">
	                         <button type="button" class="btn btn-w-m btn-success" id="addDevice">新增</button>
	                         <button type="button" class="btn btn-w-m btn-danger" id="deleteDevice">删除</button>
	                         <button type="button" class="btn btn-w-m btn-info excelImport_btn" >批量导入设备</button>
	                         <input type="file" id="devices_file" name="devices" style="display: none;">
	                         <button type="button" class="btn btn-w-m btn-dafault cancelImport_btn" style="display:none;">取消</button>
	                         <a href="${ctx }/excelImport/deviceExcel2003Temp.do">
	                         	<button type="button" class="btn btn-outline btn-info">导入模板下载</button>
	                         </a> 
                        </div> 
                    </div>
					<div class="ibox-content">
						<table
							class="footable table table-stripped toggle-arrow-tiny text-left"
							data-page-size="8" id="deviceTable">
							<thead>
								<tr>
									<th data-sort-ignore="true">
										<div class="checkbox i-checks checkAll" >
											<label><input type="checkbox" value=""> <i></i></label>
										</div>
									</th>
									<th>住户姓名</th>
									<th>住户类型</th>
									<th>手机号</th>
									<th>身份证号</th>
									<th>楼房号</th>
									<th data-sort-ignore="true">操作</th>
								</tr>
							</thead>
							<tbody id="tableBody">
							</tbody>
							<tfoot>
								<tr>
									<td colspan="11" class="text-center" >
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
	<div class="modal inmodal" id="deviceEditModal" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog">
				<form class="modal-content animated fadeInDown" id="deviceForm">
					<div class="modal-header" style="padding: 10px;">
						<button type="button" class="close" data-dismiss="modal" style="margin: 10px 15px 0px 0px;">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h6 class="modal-title">新增设备</h6>
					</div>
					<div class="modal-body">
						<div style="border-bottom: 1px dashed #e7eaec;margin-bottom: 5px;"><label for="">门禁设备信息</label></div>
						<div class="form-group">
						    <label for="deviceId">设备ID：</label>
						    <input type="text" class="form-control" id="deviceId" name="deviceId" placeholder="请输入设备ID" maxlength="12">
						  </div>
						  <div class="form-group">
						    <label for="deviceName">设备名称：</label>
						    <input type="text" class="form-control" id="deviceName" name="deviceName" placeholder="请输入设备名称" maxlength="20">
						  </div>
						  <div class="form-group">
						    <label for="bluetoothMac">蓝牙MAC：</label>
						    <input type="text" class="form-control" id="bluetoothMac" name="bluetoothMac" placeholder="请输入蓝牙MAC" maxlength="20">
						  </div>
						  <c:if test="${company.companyType == 1 }">
							  <div class="form-group">
							    <label for="installedCompany">安装公司：</label>
							    <select class="form-control" id="installedCompany" name="installedCompany">
		                            <!-- <option value="1">启用</option>
		                            <option value="0">停用</option> -->
		                         </select>
							  </div>
						  </c:if>
						  <div class="form-group">
						    <label for="residentialQuarter">所属小区：</label>
						    <button type="button" class="btn btn-primary btn-sm" style="position: relative;left: 68%;bottom: 5px;" data-toggle="modal" data-target="#residentialQuarterModal" id="getResidentialQuarter">选择所属小区</button>
	                         <input type="text" class="form-control" id="residentialQuarter" name="residentialQuarter" placeholder="请选择安装地址" readonly="readonly">
						  </div>
						  <div class="form-group">
						    <label for="installedPosition">安装地址：</label>
						    <button type="button" class="btn btn-primary btn-sm" id="menuBtn" style="position: relative;left: 68%;bottom: 5px;" onclick="showMenu(); return false;">选择安装地址</button>
						    <input type="text" class="form-control" id="installedPosition" name="installedPosition" placeholder="请选择安装地址" readonly="readonly" onclick="showMenu();" >
						    <div id="menuContent" class="menuContent" style="display:none; position: absolute;">
								<ul id="positionTree" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
							</div>
						  </div>
						  <div class="form-group">
						    <label for="voltage">电压：</label>
						    <input type="text" class="form-control" id="voltage" name="voltage" placeholder="请输入电压" onkeyup="value=value.replace(/[^\d{1,}\d{1,}|\d{1,}]/g,'')" maxlength="6">
						  </div>
						  <div class="form-group">
						    <label for="electricity">电流：</label>
						    <input type="text" class="form-control" id="electricity" name="electricity" placeholder="请输入电流" onkeyup="value=value.replace(/[^\d{1,}\d{1,}|\d{1,}]/g,'')" maxlength="6">
						  </div>
						  <div style="border-bottom: 1px dashed #e7eaec;margin-bottom: 5px;"><label for="">平板设备信息</label></div>
						  <div class="form-group">
						    <label for="tabletIemi">IEMI(设备出厂序列号)：</label>
						    <input type="text" class="form-control" id="tabletIemi" name="tabletIemi" placeholder="请输入公司地址">
						  </div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-white" data-dismiss="modal" id="closeDeviceForm">关闭</button>
						<button type="submit" class="btn btn-primary" id="confirmDeviceForm">提交保存</button>
					</div>
				</form>
			</div>
		</div>
		<!-- 模态窗口 -->
	<div class="modal inmodal" id="residentialQuarterModal" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content animated fadeInDown">
					<div class="modal-header" style="padding: 10px;">
						<button type="button" class="close" data-dismiss="modal" style="margin: 10px 15px 0px 0px;">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="text-center form-horizontal">
							<div class="form-group text-left">
								<div class="form-inline col-sm-12">
									<div class="form-group">
										<label for="rqName">小区名称：</label> 
										<input type="text" class="form-control" id="rqName" name="rqName">
										<label for="rqAddress">小区地址：</label> 
										<input type="text" class="form-control" id="rqAddress" name="rqAddress">
										<button type="button" class="btn btn-primary" id="queryRQ">查询</button>
									</div>
								</div>
							</div>
							<div class="form-group">
								<table
									class="footable table table-stripped toggle-arrow-tiny text-left" 
									style="border:1px solid #E0D8D8;" id="rqTable">
									<thead>
										<tr>
											<th data-sort-ignore="true">
												
											</th>
											<th>小区名称</th>
											<th>小区地址</th>
										</tr>
									</thead>
									<tbody id="tableBody">
									</tbody>
									<tfoot>
										<tr>
											<td colspan="3" class="text-center" >
												<!-- 底部分页按钮 -->
												<div id="bottomTab"></div>
											</td>
										</tr>
									</tfoot>
								</table>

							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-white" data-dismiss="modal" id="closeRQ">关闭</button>
						<button type="button" class="btn btn-primary" id="confirmRQ">确定</button>
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
    <script src="${ctx  }/js/plugins/bootstrap-paginator/bootstrap-paginator.min.js"></script>
    <script src="${ctx  }/js/plugins/sweetalert/sweetalert.min.js"></script>
	<script src="${ctx  }/js/ajaxfileupload.js"></script>
	<script src="${ctx  }/js/plugins/ztree/jquery.ztree.core.js"></script>
	<script src="${ctx  }/js/plugins/ztree/jquery.ztree.excheck.js"></script>
	<script src="${ctx  }/js/plugins/ztree/jquery.ztree.exedit.js"></script>
	<script src="${ctx  }/js/system/base.js"></script>
	<script src="${ctx  }/js/system/rq_house_family_management.js"></script>
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