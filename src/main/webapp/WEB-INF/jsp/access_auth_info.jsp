<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="include_tags.jsp" %>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>指尖门禁后台管理系统 - 门禁授权</title>
<meta name="keywords" content="门禁,考勤,安防">
<meta name="description" content="指尖门禁后台管理系统 - 门禁授权">

<link rel="shortcut icon" href="favicon.ico">
<link href="${ctx  }/css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="${ctx  }/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
<link href="${ctx  }/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
<link href="${ctx  }/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="${ctx  }/css/animate.min.css" rel="stylesheet">
<link href="${ctx  }/css/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet">
<link href="${ctx  }/css/style.min.css?v=4.0.0" rel="stylesheet">
<link href="${ctx  }/css/system/access_auth.css" rel="stylesheet">
<link href="${ctx  }/css/plugins/bootstrap-paginator/bootstrap-paginator.css" rel="stylesheet">
<!-- Sweet Alert -->
<link href="${ctx  }/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

<base target="_blank">
</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content white-bg page-heading">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox-title">
					<ol class="breadcrumb">
						<li><small>企业内部管理</small></li>
						<li><small>门禁管理</small></li>
						<li><small>门禁授权管理</small></li>
						<c:choose>
							<c:when test="${authNum == 1 }">
								<li>
									<strong>单门授权
										<c:if test="${type == 1 }">新增</c:if>
										<c:if test="${type == 2 }">修改</c:if>
									</strong>
								</li>
							</c:when>
							<c:when test="${authNum == 2 }">
								<li>
									<strong>多门授权
										<c:if test="${type == 1 }">新增</c:if>
									</strong>
								</li>
							</c:when>
						</c:choose>
					</ol>
				</div>
				<input type="hidden" id="authNum" value="${authNum }"/>
				<input type="hidden" id="authTypeValue" value="${authType }"/>
				<input type="hidden" id="type" value="${type }"/>
				<input type="hidden" id="deviceId" value="${deviceId }"/>
				<input type="hidden" id="companyId" value="${companyId }"/>
				<input type="hidden" id="openMethodValue" value="${openMethod }"/>
				<input type="hidden" id="authId" value="${authId }"/>
				<form class="text-left animated fadeInRightBig form-horizontal" id="accessAuthForm"
					style="margin-left: 20px;margin-top: 20px;">
					<div class="form-group">
						<div class="form-inline col-sm-12">
							<div class="form-group">
								<label for="doorName">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;门的名称：</label>
								<label id="doorName" name="doorName">${doorName }</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="form-inline col-sm-12">
							<div class="form-group">
								<label for="startDate">授权开始日期：</label> 
								<input type="text" class="form-control input-append date input-datetime" id="startDate" name="startDate" value="${startAuthorization }" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="form-inline col-sm-12">
							<div class="form-group">
								<label for="endDate">授权截止日期：</label> 
								<input type="text" class="form-control input-datetime" id="endDate" name="endDate" value="${endAuthorization }" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="form-group" id="openMethod">
						<div class="form-inline col-sm-12">
							<div class="form-group">
								<label for="openMethod">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;开门方式：</label>
								<ul style="display: inline-table;">
									<li>
										<div class="checkbox i-checks">
											<label><input type="checkbox" value="1"
												name="openMethod"> <i></i>蓝牙</label> <!-- <span class="badge">14</span> -->
										</div>
									</li>
									<li>
										<div class="checkbox i-checks">
											<label><input type="checkbox" value="2"
												name="openMethod"> <i></i>密码</label> <!-- <span class="badge">14</span> -->
										</div>
									</li>
									<li>
										<div class="checkbox i-checks">
											<label><input type="checkbox" value="3"
												name="openMethod"> <i></i>RFID卡</label>
										</div>
									</li>
									<li>
										<div class="checkbox i-checks">
											<label><input type="checkbox" value="4"
												name="openMethod"> <i></i>蓝牙+密码</label>
										</div>
									</li>
									<li>
										<div class="checkbox i-checks">
											<label><input type="checkbox" value="5"
												name="openMethod"> <i></i>RFID卡+密码</label>
										</div>
									</li>
									<li>
										<div class="checkbox i-checks">
											<label><input type="checkbox" value="6"
												name="openMethod"> <i></i>蓝牙+RFID卡</label>
										</div>
									</li>
									<li>
										<div class="checkbox i-checks">
											<label><input type="checkbox" value="7"
												name="openMethod"> <i></i>蓝牙+密码+RFID卡</label>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="form-group" id="authDiv">
						<div class="form-inline col-sm-12">
							<div class="form-group">
								<label for="authType">授权类型：</label>
								<div class="radio i-checks">
									<label><input type="radio" value="1" name="authType"
										checked="checked" style=""> <i></i>按公司组织</label>
								</div>
								<div class="radio i-checks">
									<label><input type="radio" value="2" name="authType">
										<i></i>按用户</label>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group" id="authDiv1" style="display:block;">
						<div class="form-inline col-sm-12">
							<div class="form-group">
								<label for="">按公司组织授权：</label>
								<ul class="text-left " style="display: inline-table;">
									<c:forEach var="accessUserAuth" items="${accessUserAuths }">
										<c:choose>
											<c:when test="${accessUserAuth.authType == 1 && empty accessUserAuth.deptId }">
												<li>
													<div><span>全公司</span><span class="pull-right" id="authDiv1_0" name="0"><i class="fa fa-close fa-lg"></i></span></div>
												</li>
											</c:when>
											<c:when test="${accessUserAuth.authType == 1 && !empty accessUserAuth.deptId }">
												<li>
													<div><span>${accessUserAuth.deptName }</span><span class="pull-right" id="authDiv1_${accessUserAuth.deptId }" name="${accessUserAuth.deptId }"><i class="fa fa-close fa-lg"></i></span></div>
												</li>
											</c:when>
										</c:choose>
									</c:forEach>
								</ul>
								<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#companyOrgModal" id="getCompanyOrg">设置</button>
							</div>
						</div>
					</div>
					<div class="form-group" id="authDiv2" style="display:none;">
						<div class="form-inline col-sm-12">
							<div class="form-group">
								<label for="">按用户授权：</label>
								<ul class="text-left "  style="display: inline-table;">
									<c:forEach var="accessUserAuth" items="${accessUserAuths }">
										<c:if test="${accessUserAuth.authType == 2 && !empty accessUserAuth.employeeId }">
											<li>
												<div><span>${accessUserAuth.employeeName }</span><span class="pull-right" id="authDiv2_${accessUserAuth.employeeId }" name="${accessUserAuth.employeeId }"><i class="fa fa-close fa-lg"></i></span></div>
											</li>
										</c:if>
									</c:forEach>
								</ul>
								<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#employeeModal" id="getEmployee">设置</button>
							</div>
						</div>
					</div>
					<div class="hr-line-dashed"></div>
                    <div class="form-group">
                    	<div class="col-sm-5 text-center">
	                         <button type="button" class="btn btn-w-m btn-outline btn-danger" id="cancel">返回</button>
	                         <button type="button" class="btn btn-w-m btn-info" id="save" onclick="saveAccessAuthInfo();">保存</button>
                        </div> 
                    </div>
				</form>
			</div>
		</div>
	</div>
	
	<!-- 模态窗口 -->
	<div class="modal inmodal" id="companyOrgModal" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content animated flipInY">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="text-center form-horizontal">
							<div class="form-group">

								<table
									class="footable table table-stripped toggle-arrow-tiny text-left" 
									style="border:1px solid #E0D8D8;" 
									data-page-size="5" id="companyOrgTable">
									<thead>
										<tr>
											<th data-sort-ignore="true">
												<div class="checkbox i-checks checkAll">
													<label><input type="checkbox" value=""> <i></i></label>
												</div>
											</th>
											<th>部门组织</th>
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
						<button type="button" class="btn btn-white" data-dismiss="modal" id="closeSelectedCompanyOrg">关闭</button>
						<button type="button" class="btn btn-primary" id="selectedCompanyOrg">确定</button>
					</div>
				</div>
			</div>
		</div>
		
	<!-- 模态窗口 -->
	<div class="modal inmodal" id="employeeModal" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content animated flipInY">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="text-center form-horizontal">
							<div class="form-group text-left">
								<div class="form-inline col-sm-12">
									<div class="form-group">
										<label for="employeeName">员工姓名：</label> 
										<input type="text" class="form-control" id="employeeName" name="employeeName">
										<label for="phone">手机号：</label> 
										<input type="text" class="form-control" id="phone" name="phone">
									</div>
								</div>
							</div>
							<div class="form-group text-left">
								<div class="form-inline col-sm-12">
									<div class="form-group">
										<label for="department">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;部门：</label> 
										<select class="form-control" id="department" name="department">
											<option value="">--所有--</option>
											<c:forEach var="department" items="${departments }">
				                                 <option value="${department.id }">${department.deptName }</option>
											</c:forEach>
			                             </select>
										
										<button type="button" class="btn btn-primary" id="selectEmployee">查询</button>
									</div>
								</div>
							</div>
							<div class="form-group">

								<table
									class="footable table table-stripped toggle-arrow-tiny text-left" 
									style="border:1px solid #E0D8D8;" 
									data-page-size="5" id="employeeTable">
									<thead>
										<tr>
											<th data-sort-ignore="true">
												<div class="checkbox i-checks checkAll">
													<label><input type="checkbox" value=""> <i></i></label>
												</div>
											</th>
											<th>员工编号</th>
											<th>员工姓名</th>
											<th>手机号</th>
											<th>部门</th>
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
						<button type="button" class="btn btn-white" data-dismiss="modal" id="closeSelectedEmployee">关闭</button>
						<button type="button" class="btn btn-primary" id="selectedEmployee">确定</button>
					</div>
				</div>
			</div>
		</div>
	<script src="${ctx  }/js/jquery.min.js?v=2.1.4"></script>
	<script src="${ctx  }/js/jquery-migrate-1.1.0.min.js"></script>
	<script src="${ctx  }/js/bootstrap.min.js?v=3.3.5"></script>
	<script src="${ctx  }/js/content.min.js?v=1.0.0"></script>
	<script src="${ctx  }/js/plugins/iCheck/icheck.min.js"></script>
	<script src="${ctx  }/js/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
	<script src="${ctx  }/js/plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
	<script src="${ctx  }/js/plugins/bootstrap-paginator/bootstrap-paginator.min.js"></script>
	<script src="${ctx  }/js/plugins/sweetalert/sweetalert.min.js"></script>
	<script>
		$(document).ready(function() {
			$(".i-checks").iCheck({
				checkboxClass : "icheckbox_square-green",
				radioClass : "iradio_square-green",
			});
			var nowDate = new Date();
			
			$("#accessAuthForm .input-datetime").datetimepicker({
			    pickerPosition:"bottom-right",
			    format: "yyyy-mm-dd hh:ii",
			    autoclose: true,
			    todayBtn:"linked",
			    language:"zh-CN",
			    startDate: nowDate,
			    todayHighlight: true 
			});
			
		});
		
	</script>
	<script src="${ctx  }/js/system/base.js"></script>
	<script src="${ctx  }/js/system/access_auth.js"></script>
</body>
</html>
