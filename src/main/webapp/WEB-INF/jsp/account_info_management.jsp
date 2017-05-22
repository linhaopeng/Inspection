<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="include_tags.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

   <title>广州市番禺区现代产业基地项目管理系统 - 账户信息管理</title>
    <meta name="keywords" content="门禁,考勤,安防">
    <meta name="description" content="广州市番禺区现代产业基地项目管理系统 - 账户信息管理">

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
    <link href="${ctx  }/css/system/custom-list.css" rel="stylesheet">

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
<input type="hidden" id="user_name" value="${user.username }">

    <div class="wrapper wrapper-content white-bg page-heading" id="accountInfoDiv">
        <div class="row">
        	<!-- <div class="col-sm-3">
				<label for="apartUnitHouse">公司-部门-职位：</label> 
				<input type="text" class="form-control" id="department" name="department" readonly="readonly" onclick="showMenu();">
				<div id="menuContent" class="menuContent" style="display:none; position: absolute;">
					<ul id="departmentTree" class="ztree"  style="margin-top:0; width:100%; height: 100%;"></ul>
				</div>
			</div> -->
            <div class="col-sm-9">
            
            
	 
			   <div class="container" style="    margin-left: inherit;">
						<div class="row clearfix">
							<div class="col-md-12 column">
								<div class="page-header">
									<h1 style="font-weight: 700;font-size: 22px;">
										User Info Management
									</h1>
								</div>
							</div>
						</div>
					</div>
			   
			    <input type="hidden" id="companyType" value="${company.companyType }"/> 
                <div class="text-center animated fadeInRightBig form-horizontal">
                	<div class="form-group" id="queryForm" style="margin-left: 20px;">
                    <div class="form-group">
                    	<div class="col-sm-12 text-left">
	                         <button type="button" class="btn btn-w-m btn-success" id="addAccount">Add</button>
	                         <button type="button" class="btn btn-w-m btn-danger" id="deleteAccount">Delete</button>
                        </div> 
                    </div>
					<div class="ibox-content table-responsive">

						<table class="table table-stripped toggle-arrow-tiny text-left" id="accountInfos">
							<thead>
								<tr>
									<th data-sort-ignore="true">
										<div class="checkbox i-checks checkAll">
											<label><input type="checkbox" value=""> <i></i></label>
										</div>
									</th>
									<th>Account</th>
									<th>Username</th>
									<th>Sex</th>
									<th>Phone</th>
									<th>Email</th>
									<th>Operator</th>
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
	<div class="modal inmodal" id="accountEditModal" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog">
				<form class="modal-content animated fadeInDown" id="accountForm">
					<div class="modal-header" style="padding: 10px;">
						<button type="button" class="close" data-dismiss="modal" style="margin: 10px 15px 0px 0px;">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h6 class="modal-title">修改账号</h6>
					</div>
					<div class="modal-body">
						<div class="form-group">
						    <label for="username">用户名：</label>
						    <input type="text" class="form-control" id="username" name="username" placeholder="请输入用户名" maxlength="20" onkeyup="this.value=this.value.replace(/\W/g,'')">
						  </div>
						  <div class="form-group">
						    <label for="usercname">姓名：</label>
						    <input type="text" class="form-control" id="usercname" name="usercname" placeholder="请输入姓名" maxlength="20">
						  </div>
						  <div class="form-group">
						    <label for="password">密码：</label>
						    <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码" maxlength="20">
						  </div>
						  <div class="form-group">
						    <label for="confirmPassword">确认密码：</label>
						    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="请输入确认密码" maxlength="20">
						  </div>
						  <!-- <div class="form-group">
						    <label for="role">角色：</label>
						    <select class="form-control" id="role" name="role" >
	                         </select>
						  </div> -->
						 <div class="form-group">
						  	<div class="form-inline">
	                			<div class="form-group">
							    	<label for="sex">性别：</label>
							    	<div class="radio i-checks">
										<label><input type="radio" value="1" name="sex" id = "sex" checked="checked"> 
											<i></i>男</label>
										<label><input type="radio" value="2" name="sex">
											<i></i>女</label>
										
									</div>
								</div>
							</div>
						  </div>
						  <div class="form-group">
						    <label for="phone">手机号码：</label>
						    <input type="text" class="form-control" id="phone" name="phone" placeholder="请输入手机号码号码" maxlength="30">
						  </div>
						  <div class="form-group">
						    <label for="email">邮箱：</label>
						    <input type="text" class="form-control" id="email" name="email" placeholder="请输入电子邮箱" maxlength="30">
						  </div>
						<!-- <div class="form-group">
		                    <label for="remark">备注：</label>
		                    <textarea class="form-control" rows="3" cols="50" name="remark" id="remark" ></textarea>
		                </div> -->
		                <div class="form-group">
						    <label for="power">用户角色：</label>
						    <select class="form-control" id="power" name="power"> 
					        </select> 
						 </div>
		                 <div class="form-group">
						    <label for="priority">优先级：</label>
						    <input type="text" class="form-control" id="priority"  name="priority" placeholder="请输入优先级" maxlength="10" onkeyup="this.value=this.value.replace(/\D/g,'')">
						 </div>
						 
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-white" data-dismiss="modal" id="closeAccountInfoForm">关闭</button>
						<button type="submit" class="btn btn-primary" id="confirmAccountInfoForm">提交保存</button>
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
		<!-- 模态窗口 - 修改密码  -->
	<div class="modal inmodal" id="modifyPasswordModal" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog">
				<form class="modal-content animated fadeInDown" id="passwordForm">
					<div class="modal-header" style="padding: 10px;">
						<button type="button" class="close" data-dismiss="modal" style="margin: 10px 15px 0px 0px;">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h6 class="modal-title">修改账号密码</h6>
					</div>
					<div class="modal-body">
						<div class="form-group">
						    <label for="modifyUsername">用户名：</label>
						    <input type="text" class="form-control" id="modifyUsername" name="modifyUsername" readonly="readonly">
						  </div>
						  <div class="form-group">
						    <label for="loginPassword">登录密码：</label>
						    <input type="password" class="form-control" id="loginPassword" name="loginPassword" placeholder="请输入您的登录密码" maxlength="20">
						  </div>
						  <div class="form-group">
						    <label for="newPassword">新密码：</label>
						    <input type="password" class="form-control" id="newPassword" name="newPassword" placeholder="请输入新密码" maxlength="20">
						  </div>
						  <div class="form-group">
						    <label for="confirmNewPassword">确认新密码：</label>
						    <input type="password" class="form-control" id="confirmNewPassword" name="confirmNewPassword" placeholder="请输入确认密码" maxlength="20">
						  </div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-white" data-dismiss="modal" id="closePasswordForm">关闭</button>
						<button type="submit" class="btn btn-primary" id="confirmPasswordForm">提交修改</button>
					</div>
				</form>
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
	<script>
		$(document).ready(function() {
			$(".i-checks").iCheck({
				checkboxClass : "icheckbox_square-green",
				radioClass : "iradio_square-green",
			});
		});
	</script>
	<script src="${ctx  }/js/system/base.js"></script>
	<script src="${ctx  }/js/system/account_info_management.js"></script>
</body>

</html>