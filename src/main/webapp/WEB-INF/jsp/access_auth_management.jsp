<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="include_tags.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

   <title>街坊邻里后台管理系统 - 门禁授权管理</title>
    <meta name="keywords" content="门禁,考勤,安防">
    <meta name="description" content="街坊邻里后台管理系统 - 门禁授权管理">

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
    <link href="${ctx  }/css/plugins/clockpicker/clockpicker.css" rel="stylesheet">
    <link href="${ctx  }/css/plugins/ztree/metroStyle/metroStyle.css" rel="stylesheet" type="text/css">
    <link href="${ctx  }/css/system/custom-list.css" rel="stylesheet">

	<style type="text/css">
		ul.ztree {
			margin-top: 10px;
			border: 1px solid #617775;
			background: #f0f6e4;
			width: 220px;
			height: 360px;
			overflow-y: scroll;
			overflow-x: auto;
			x-index: 99999;
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
			               <small>门口机管理</small>
			            </li>
			            <li>
			               <strong>门禁授权管理</strong>
			            </li>
			        </ol>
			    </div>
                <div class="text-center animated fadeInRightBig form-horizontal">
                	<div class="form-group">
                		 <div class="form-inline col-sm-3">
                			<div class="form-group">
		                         <label for="deviceId">&nbsp;&nbsp;&nbsp;&nbsp;设备ID：</label>
		                         <input type="text" class="form-control" id="deviceId" name="deviceId" readonly="readonly" value="${accessInfo.deviceId }">
		                    </div>
		                 </div>
		                 <div class="form-inline col-sm-3">
                			<div class="form-group">
		                         <label for="deviceName">设备名称：</label>
		                         <input type="text" class="form-control" id="deviceName" name="deviceName" readonly="readonly" value="${accessInfo.deviceName}">
		                    </div>
		                 </div>
                    </div>
                    <div class="form-group">
                         <div class="form-inline col-sm-3">
                			<div class="form-group">
		                         <label for="installedCompany">安装公司：</label>
		                         <input type="text" class="form-control" id="installedCompany" name="installedCompany" readonly="readonly" value="${accessInfo.installedCompanyName}">
		                    </div>
		                 </div>
		                 <div class="form-inline col-sm-3">
                			<div class="form-group">
		                         <label for="installedPosition">安装位置：</label>
		                         <input type="text" class="form-control" id="installedPosition" name="installedPosition" readonly="readonly" value="${accessInfo.description}">
		                    </div>
		                 </div>
                    </div>
                    <div class="form-group">
                    	<div class="col-sm-12 text-left">
	                         <button type="button" class="btn btn-w-m btn-success" id="addAccessAuth">新增授权</button>
	                         <button type="button" class="btn btn-w-m btn-danger" id="deleteAccessAuth">删除授权</button>
	                         <button type="button" class="btn btn-outline btn-info">门禁数据下载</button>
                        </div> 
                    </div>
					<div class="ibox-content">

						<table class="footable table table-stripped toggle-arrow-tiny text-left" id="accessAuths"
							data-page-size="8">
							<thead>
								<tr>
									<th data-sort-ignore="true">
										<div class="checkbox i-checks checkAll">
											<label><input type="checkbox" value=""> <i></i></label>
										</div>
									</th>
									<th>授权开始日期</th>
									<th>授权截止日期</th>
									<th>开门方式</th>
									<th>开门次数</th>
									<th>被授权用户</th>
									<th>授权记录时间</th>
									<th>授权者</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="tableBody">
							</tbody>
							<tfoot>
								<tr>
									<td colspan="9" class="text-left" >
										<label style="color:green;"><i class="fa fa-info-circle"></i>开门方式：1-蓝牙，2-密码，3-RFID卡， 4- APP远程开门，5-管理中心远程开门，6-出门按钮，7-电话开门（按*或#键）</label>
									</td>
								</tr>
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
	<div class="modal inmodal" id="accessAuthEditModal" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog">
				<form class="modal-content animated fadeInDown" id="accessAuthForm">
					<div class="modal-header" style="padding: 10px;">
						<button type="button" class="close" data-dismiss="modal" style="margin: 10px 15px 0px 0px;">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h6 class="modal-title">新增门口机授权</h6>
					</div>
					<div class="modal-body">
						<div class="form-group">
						    <label for="deviceIdValue">设备ID：</label>
						    <input type="text" class="form-control" id="deviceIdValue" name="deviceIdValue" placeholder="" maxlength="20" readonly="readonly">
						  </div>
						  <div class="form-group">
						    <label for="deviceNameValue">设备名称：</label>
						    <input type="text" class="form-control" id="deviceNameValue" name="deviceNameValue" placeholder="" maxlength="20" readonly="readonly">
						  </div>
						  <div class="form-group">
						    <div class="form-inline">
								<div class="form-group">
								    <label for="startDate">授权开始日期：</label> 
									<input type="text" class="form-control input-datetime" id="startDate" name="startDate" placeholder="请选择开始日期" readonly="readonly">
									<input type="text" class="form-control input-clockpicker" id="startTime" name="startTime" placeholder="开始时间" readonly="readonly" style="width: 100px;">
								</div>
							</div>
						  </div>
						  <div class="form-group">
						    <div class="form-inline">
								<div class="form-group">
								    <label for="endDate">授权截止日期：</label> 
									<input type="text" class="form-control input-datetime" id="endDate" name="endDate" placeholder="请选择截止日期" readonly="readonly">
									<input type="text" class="form-control input-clockpicker" id="endTime" name="endTime" placeholder="截止时间" readonly="readonly" style="width: 100px;">
								</div>
							</div>
						  </div>
						  <div class="form-group">
						    <div class="form-inline">
								<div class="form-group">
									<label for="openCount">授权开门次数：</label>
									<div class="radio i-checks">
										<label>
											<input type="radio" value="0" name="openCount"checked="checked" style="" class="clockpicker"> 
											<i></i>无限次
										</label>
									</div>
									<div class="radio i-checks">
										<label>
											<input type="radio" value="1" name="openCount">
											<i></i>有限次
										</label>
									</div>
									<input type="text" class="form-control" id="openCount" name="openCount" placeholder="开门次数" maxlength="4">
								</div>
							</div>
						  </div>
						  <div class="form-group">
						    	<div class="form-inline">
									<div class="form-group">
								    	<label for="openMethod">开门方式：</label>
										<div class="checkbox i-checks">
											<label><input type="checkbox" value="1"
												name="openMethod"> <i></i>蓝牙开门</label> &nbsp;&nbsp;&nbsp;
										</div>
										<div class="checkbox i-checks">
											<label><input type="checkbox" value="2"
												name="openMethod"> <i></i>密码开门</label> &nbsp;&nbsp;&nbsp;
										</div>
										<div class="checkbox i-checks">
											<label><input type="checkbox" value="3"
												name="openMethod"> <i></i>RFID卡开门</label> &nbsp;&nbsp;&nbsp;
										</div>
										<div class="checkbox i-checks">
											<label><input type="checkbox" value="4"
												name="openMethod"> <i></i>APP远程开门</label>
										</div>
									</div>
								</div>
						  </div>
						  <div class="form-group custom-list">
							<label for="">按用户授权：</label>
							<button type="button" class="btn btn-primary btn-sm" style="position: relative;left: 70%;bottom: 5px;" data-toggle="modal" data-target="#residentialQuarterUserModal" id="getUser">设置</button>
							<ul class="form-control text-left" id="managedRqUser">
								<li>
									<div><span>xx小马卡龙</span><span class="pull-right" id="" name=""><i class="fa fa-close fa-lg"></i></span></div>
								</li>
							</ul>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-white" data-dismiss="modal" id="closeAccessInfoForm">关闭</button>
						<button type="submit" class="btn btn-primary" id="confirmAccessInfoForm">提交保存</button>
					</div>
				</form>
			</div>
		</div>
		<!-- 模态窗口 -->
	<div class="modal inmodal" id="residentialQuarterUserModal" tabindex="-1" role="dialog"
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
										<label class="userType">用户类型：</label>
				                         <select class="form-control" name="userType" id="userType">
			                                 <option value="">--所有--</option>
				                         	 <optgroup label="小区住户">
				                                 <option value="rf1">户主</option>
				                                 <option value="rf2">家庭成员</option>
				                                 <option value="rf3">临时租户</option>
				                                 <option value="rf4">朋友</option>
				                                 <option value="rf5">访客</option>
				                         	 </optgroup>
			                                 <optgroup label="物业人员">
				                                 <option value="pp1">物业经理</option>
				                                 <option value="pp2">物业管理员</option>
				                                 <option value="pp3">物业操作员</option>
				                                 <option value="pp4">小区管理员</option>
				                                 <option value="pp5">小区操作员</option>
				                                 <option value="pp6">保洁人员</option>
			                                 </optgroup>
			                             </select>
										<label for="phone">手机号码：</label> 
										<input type="text" class="form-control" id="phone" name="phone">
									</div>
								</div>
							</div>
							<div class="form-group text-left">
								<div class="form-inline col-sm-12">
									<div class="form-group">
										<label for="apartUnitHouse">楼栋-单元-门牌号：</label> 
										<input type="text" class="form-control" id="apartUnitHouse" name="apartUnitHouse" readonly="readonly" onclick="showMenu();">
									    <div id="menuContent" class="menuContent" style="display:none; position: absolute;">
											<ul id="positionTree" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
										</div>
										<button type="button" class="btn btn-primary" id="queryRQUser">查询</button>
									</div>
								</div>
							</div>
							<div class="form-group">
								<table class="footable table table-stripped toggle-arrow-tiny text-left" 
									style="border:1px solid #E0D8D8;" id="rqUserTable">
									<thead>
										<tr>
											<th data-sort-ignore="true">
												<div class="checkbox i-checks checkAllUser">
													<label><input type="checkbox" value=""> <i></i></label>
												</div>
											</th>
											<th>姓名</th>
											<th>手机号</th>
											<th>用户类型</th>
											<th>楼栋-单元-门牌号</th>
										</tr>
									</thead>
									<tbody id="tableBody">
									</tbody>
									<tfoot>
										<tr>
											<td colspan="5" class="text-center" >
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
						<button type="button" class="btn btn-white" data-dismiss="modal" id="closeRQUser">关闭</button>
						<button type="button" class="btn btn-primary" id="confirmRQUser">确定</button>
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
    <script src="${ctx  }/js/mapUtil.js"></script>
    <script src="${ctx  }/js/jquery.cookie.js"></script>
    <script src="${ctx  }/js/system/date_utils.js"></script>
    <script src="${ctx  }/js/plugins/ztree/jquery.ztree.core.js"></script>
	<script src="${ctx  }/js/plugins/ztree/jquery.ztree.excheck.js"></script>
<!--	<script src="${ctx  }/js/plugins/ztree/jquery.ztree.exedit.js"></script>-->
    <script src="${ctx  }/js/plugins/datapicker/bootstrap-datepicker.js"></script>
    <script src="${ctx  }/js/plugins/clockpicker/clockpicker.js"></script>
	<script>
		$(document).ready(function() {
			$(".i-checks").iCheck({
				checkboxClass : "icheckbox_square-green",
				radioClass : "iradio_square-green",
			});
			$("#accessAuthEditModal .input-datetime").datepicker({
			    format: "yyyy-mm-dd",
			    startView: -1,
			    todayBtn: "linked",
			    startDate: new Date(),
			    clearBtn: true,
			    autoclose: true,
			    todayHighlight: true
			}).on("hide", function(event){
				event.stopPropagation();//防止事件冒泡
			});
			$("#accessAuthEditModal .input-clockpicker").clockpicker({
				placement: 'right',
				/* donetext: '完成', */
				autoclose: true,
			    'default': "now"
			});
			
		});
	</script>
	<script src="${ctx  }/js/system/base.js"></script>
	<script src="${ctx  }/js/system/access_auth_management.js"></script>
</body>

</html>