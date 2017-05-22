<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="include_tags.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

   <title>街坊邻里后台管理系统 - 物业人员管理</title>
    <meta name="keywords" content="门禁,安防">
    <meta name="description" content="街坊邻里后台管理系统 - 物业人员管理">

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
    <link href="${ctx  }/css/system/custom-list.css" rel="stylesheet">
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content white-bg page-heading">
        <div class="row">
            <div class="col-sm-12">
            	<div class="ibox-title">
			    </div>
			    <input type="hidden" id="companyId" value="${company.id }">
                <div class="text-left animated fadeInRightBig form-horizontal">
                	<div class="form-group">
                		<div class="form-inline col-sm-3">
                			<div class="form-group">
		                         <label for="personnelNameValue">人员姓名：</label>
		                         <input type="text" class="form-control" id="personnelNameValue" name="personnelNameValue" >
		                    </div>
		                </div>
		                <div class="form-inline col-sm-3">
                			<div class="form-group">
		                         <label for="personnelPhoneValue">手机：</label>
		                         <input type="text" class="form-control" id="personnelPhoneValue"name="personnelPhoneValue" >
		                    </div>
		                </div>
                    </div>
                    <div class="form-group">
                    	<div class="form-inline col-sm-3">
                			<div class="form-group">
 		                		 <label class="personnelTypeValue">人员类型：</label>
		                         <select class="form-control" name="personnelTypeValue" id="personnelTypeValue">
	                                 <option value="0">--所有--</option>
	                                 <option value="1">物业经理</option>
	                                 <option value="2">物业管理员</option>
	                                 <option value="3">物业操作员</option>
	                                 <option value="4">小区管理员</option>
	                                 <option value="5">小区操作员</option>
	                                 <option value="6">保洁人员</option>
	                             </select>
			                 </div>
		                </div>
		                <div class="form-inline col-sm-2 text-right">
                			<div class="form-group">
		                         <button type="button" class="btn btn-w-m btn-primary" id="queryButton">查询</button>
		                    </div>
		                </div>
                    </div>
                    <div class="form-group">
                    	<div class="col-sm-12 text-left">
	                         <button type="button" class="btn btn-w-m btn-success" id="addPropertyPersonnel">新增</button>
	                         <button type="button" class="btn btn-w-m btn-danger" id="deletePropertyPersonnel">删除</button>
	                         <button type="button" class="btn btn-w-m btn-info excelImport_btn" >批量导入物业人员</button>
	                         <input type="file" id="property_personnel_file" name="propertyPersonnels" style="display: none;">
	                         <button type="button" class="btn btn-w-m btn-dafault cancelImport_btn" style="display:none;">取消</button>
	                         <a href="${ctx }/excelImport/propertyPersonnelExcel2003Temp.do">
	                         	<button type="button" class="btn btn-outline btn-info">导入模板下载</button>
	                         </a> 
                        </div> 
                    </div>
					<div class="ibox-content">
						<table
							class="footable table table-stripped toggle-arrow-tiny text-left"
							data-page-size="8" id="propertyPersonnelTable">
							<thead>
								<tr>
									<th data-sort-ignore="true">
										<div class="checkbox i-checks checkAll" >
											<label><input type="checkbox" value=""> <i></i></label>
										</div>
									</th>
									<th>人员姓名</th>
									<th>手机号</th>
									<th>身份证号</th>
									<th>用户类型</th>
									<th>RFID卡号</th>
									<th data-sort-ignore="true">操作</th>
								</tr>
							</thead>
							<tbody id="tableBody">
							</tbody>
							<tfoot>
								<tr>
									<td colspan="7" class="text-center" >
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
	<div class="modal inmodal" id="propertyPersonnelEditModal" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog">
				<form class="modal-content animated fadeInDown" id="propertyPersonnelForm">
					<div class="modal-header" style="padding: 10px;">
						<button type="button" class="close" data-dismiss="modal" style="margin: 10px 15px 0px 0px;">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h6 class="modal-title">新增物业人员</h6>
					</div>
					<div class="modal-body">
						<div class="form-group">
						    <label for="personnelName">人员姓名：</label>
						    <input type="text" class="form-control" id="personnelName" name="personnelName" placeholder="请输入人员姓名" maxlength="20">
						  </div>
						  <div class="form-group">
						    <label for="personnelPhone">手机号：</label>
						    <input type="text" class="form-control" id="personnelPhone" name="personnelPhone" placeholder="请输入手机号" maxlength="20">
						  </div>
						  <div class="form-group">
						    <label for="personnelIdentityNum">身份证号码：</label>
						    <input type="text" class="form-control" id="personnelIdentityNum" name="personnelIdentityNum" placeholder="请输入身份证号码" maxlength="20">
						  </div>
						  <div class="form-group">
							<label for="personnelType">人员类型：</label>
							    <select class="form-control" id="personnelType" name="personnelType">
	                                 <option value="1">物业经理</option>
	                                 <option value="2">物业管理员</option>
	                                 <option value="3">物业操作员</option>
	                                 <option value="4">小区管理员</option>
	                                 <option value="5">小区操作员</option>
	                                 <option value="6">保洁人员</option>
		                       </select>
						  </div>
						  <!-- <div class="form-group">
						    <label for="residentialQuarter">所属小区：</label>
						    <button type="button" class="btn btn-primary btn-sm" style="position: relative;left: 68%;bottom: 5px;" data-toggle="modal" data-target="#residentialQuarterModal" id="getResidentialQuarter">选择所属小区</button>
	                         <input type="text" class="form-control" id="residentialQuarter" name="residentialQuarter" placeholder="请选择所属小区" readonly="readonly">
						  </div> -->
						  <div class="form-group custom-list">
								<label for="">管理小区：</label>
								<button type="button" class="btn btn-primary btn-sm" style="position: relative;left: 70%;bottom: 5px;" data-toggle="modal" data-target="#residentialQuarterModal" id="getEmployee">新增管理小区</button>
								<ul class="form-control text-left" id="managedRq">
									<li>
										<div><span>xx小区</span><span class="pull-right" id="" name=""><i class="fa fa-close fa-lg"></i></span></div>
									</li>
								</ul>
						  </div>
						  <div class="form-group">
						    <label for="rfidCard">RFID卡号：</label>
						    <button type="button" class="btn btn-danger btn-sm" style="position: relative;left: 54%;bottom: 5px;" id="clearRfidCard">清除RFID卡</button>
						    <button type="button" class="btn btn-primary btn-sm" style="position: relative;left: 54%;bottom: 5px;" data-toggle="modal" data-target="#rfidCardModal" id="getRfidCards">选择RFID卡</button>
	                         <input type="text" class="form-control" id="rfidCard" name="rfidCard" placeholder="请选择RFID卡" readonly="readonly">
						  </div>
						  <div class="form-group">
						  	<div class="form-inline">
	                			<div class="form-group">
							    	<label for="sex">性别：</label>
							    	<div class="radio i-checks">
										<label><input type="radio" value="1" name="sex"> 
											<i></i>男</label>
										<label><input type="radio" value="2" name="sex">
											<i></i>女</label>
										<label><input type="radio" value="0" name="sex" checked="checked">
											<i></i>未知</label>
									</div>
								</div>
							</div>
						  </div>
						  <div class="form-group">
						    <label for="birthday">出生年月：</label>
						    <input type="text" class="form-control input-append date" id="birthday" name="birthday" placeholder="请选择出生年月" readonly="readonly">
						  </div>
						  <div class="form-group">
						    <label for="address">家庭住址：</label>
						    <input type="text" class="form-control" id="address" name="address" placeholder="请输入家庭住址">
						  </div>
						  <div class="form-group">
						  	<div class="form-inline">
	                			<div class="form-group">
							    	<label for="personnelStatus">人员状态：</label>
							    	<div class="radio i-checks">
										<label><input type="radio" value="1" name="personnelStatus" checked="checked"> 
											<i></i>在职</label>
										<label><input type="radio" value="2" name="personnelStatus">
											<i></i>离职</label>
									</div>
								</div>
							</div>
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
												<div class="checkbox i-checks checkAll">
													<label><input type="checkbox" value=""> <i></i></label>
												</div>
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
		<!-- 模态窗口 -->
	<div class="modal inmodal" id="rfidCardModal" tabindex="-1" role="dialog"
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
										<label for="rfidCardId">RFID卡号：</label> 
										<input type="text" class="form-control" id="rfidCardId" name="rfidCardId">
										<button type="button" class="btn btn-primary" id="queryRfidCard">查询</button>
									</div>
								</div>
							</div>
							<div class="form-group">
								<table
									class="footable table table-stripped toggle-arrow-tiny text-center" 
									style="border:1px solid #E0D8D8;" id="rfidCardTable">
									<thead>
										<tr>
											<th data-sort-ignore="true">
												
											</th>
											<th class="text-center">RFID卡号</th>
										</tr>
									</thead>
									<tbody id="tableBody">
									</tbody>
									<tfoot>
										<tr>
											<td colspan="2" class="text-center" >
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
						<button type="button" class="btn btn-white" data-dismiss="modal" id="closeRfidCard">关闭</button>
						<button type="button" class="btn btn-primary" id="confirmRfidCard">确定</button>
					</div>
				</div>
			</div>
		</div>
    <script src="${ctx  }/js/jquery.min.js?v=2.1.4"></script>
    <script src="${ctx  }/js/jquery-migrate-1.1.0.min.js"></script>
    <script src="${ctx  }/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="${ctx  }/js/content.min.js?v=1.0.0"></script>
    <script src="${ctx  }/js/mapUtil.js"></script>
    <script src="${ctx  }/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="${ctx  }/js/plugins/validate/messages_zh.min.js"></script>
    <script src="${ctx  }/js/system/formValidator.js"></script>
    <script src="${ctx  }/js/system/arrayToJson.js"></script>
    <script src="${ctx  }/js/plugins/iCheck/icheck.min.js"></script>
    <script src="${ctx  }/js/plugins/bootstrap-paginator/bootstrap-paginator.min.js"></script>
    <script src="${ctx  }/js/plugins/sweetalert/sweetalert.min.js"></script>
	<script src="${ctx  }/js/ajaxfileupload.js"></script>
	<script src="${ctx  }/js/plugins/datapicker/bootstrap-datepicker.js"></script>
	<script src="${ctx  }/js/system/base.js"></script>
	<script src="${ctx  }/js/system/property_personnel_management.js"></script>
	<script>
		$(document).ready(function() {
			$(".i-checks").iCheck({
				checkboxClass : "icheckbox_square-green",
				radioClass : "iradio_square-green",
			});
			
			var nowDate = new Date();
			
			$("#propertyPersonnelEditModal #birthday").datepicker({
			    format: "yyyy-mm-dd",
			    startView: -1,
			   /*  todayBtn: "linked", */
			    clearBtn: true,
			    autoclose: true,
			    /* startDate: nowDate, */
			    todayHighlight: true
			});
		});
	</script>
</body>

</html>