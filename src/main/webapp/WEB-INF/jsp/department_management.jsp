<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="include_tags.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

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
    <div class="wrapper wrapper-content white-bg page-heading" id="accountInfoDiv">
        <div class="row">
        <div class="col-sm-3">
				<div class="ibox-title">
					<strong> 部门列表</strong>
			    </div>
				<!-- <button type="button" class="btn btn-primary btn-sm" id="menuBtn" style="position: relative;left: 20%;bottom: 5px;">刷新</button> -->
				<input type="text" class="form-control" id="department" name="department" placeholder="请选择部门" readonly="readonly" onclick="showMenu();" >
				<div id="" class="" style="">
					<ul id="departmentTree" class="ztree" style="margin-top:0; width:100%; height: 100%;"></ul>
				</div>
			</div>
            <div class="col-sm-9">
            	<div class="ibox-title">
			        <ol class="breadcrumb">
			            <li>
			               <small>账户管理</small>
			            </li>
			            <li>
			               <strong>账户信息管理</strong>
			            </li>
			        </ol>
			    </div>
			    <%-- <input type="hidden" id="companyId" value="${company.id }"/>
			    <input type="hidden" id="companyType" value="${company.companyType }"/> --%>
                <div class="text-center animated fadeInRightBig form-horizontal">
                	<div class="form-group" id="queryForm">
                		<%-- <div class="form-inline col-sm-3">
                			<!-- <div class="form-group">
		                         <label for="userName">用户名：</label>
		                         <input type="text" class="form-control" id="userName">
		                    </div> -->
		                </div>
		                <c:if test="${company.companyType == 1 }">
			                <div class="form-inline col-sm-3">
			                    <div class="form-group">
			                         <label for="companyName">企业名称：</label>
			                         <input type="text" class="form-control" id="companyName">
	                			</div>
	                		</div>
		                </c:if>
                         <div class="col-sm-4">
	                         <button type="button" class="btn btn-w-m btn-primary" id="queryButton">查询</button>
                        </div> 
                    </div> --%>
                    <div class="form-group">
                    	<div class="col-sm-12 text-left">
	                         <button type="button" class="btn btn-w-m btn-success" id="addAccount">新增</button>
	                         <button type="button" class="btn btn-w-m btn-danger" id="deleteAccount">删除</button>
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
									<th>部门名称</th>
									<th>部门描述</th>
									
									<th>操作</th>
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
						    <label for="departmentName">部门名：</label>
						    <input type="text" class="form-control" id="departmentName" name="departmentName" placeholder="请输入部门名">
						  </div>
						  <div class="form-group">
						    <label for="describe">描述：</label>
						    <textarea class="form-control" rows="3" cols="50" name="describe" id="describe" ></textarea>
						  </div>
						  <div class="form-group">
						    <label for="levels">等级：</label>
						    <!-- <input type="password" class="form-control" id="password" name="password" placeholder="请输入等级"> -->
						    <div>
							    <select name="levels" id="levels" >
							    	<option value="1">等级1</option>
							    	<option value="2">等级2</option>
							    	<option value="3">等级3</option>
							    	<option value="4">等级4</option>
							    	<option value="5">等级5</option>
							    </select>
						    </div>
						  </div>
						 
						  
						<!--  <div class="form-group">
						  	<div class="form-inline">
	                			<div class="form-group">
							    	<label for="sex">性别：</label>
							    	<div class="radio i-checks">
										<label><input type="radio" value="1" name="sex" id = "sex"> 
											<i></i>男</label>
										<label><input type="radio" value="2" name="sex">
											<i></i>女</label>
										<label><input type="radio" value="0" name="sex" checked="checked">
											<i></i>未知</label>
									</div>
								</div>
							</div>
						  </div> -->
						  <div class="form-group">
						    <label for="createdBy">创建人：</label>
						    <input type="text" class="form-control" id="createdBy" name="createdBy" value="${user.username}" readonly="readonly">
						  </div>
						 <!--  <div class="form-group">
						    <label for="email">邮箱：</label>
						    <input type="text" class="form-control" id="email" name="email" placeholder="请输入电子邮箱">
						  </div>
						<div class="form-group">
		                    <label for="remark">备注：</label>
		                    <textarea class="form-control" rows="3" cols="50" name="remark" id="remark" ></textarea>
		                </div>
		                 <div class="form-group">
						    <label for="priority">优先级：</label>
						    <input type="text" class="form-control" id="priority" name="priority" placeholder="请输入优先级">
						  </div> -->
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
	<!-- <div class="modal inmodal" id="modifyPasswordModal" tabindex="-1" role="dialog"
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
						    <label for="loginPassword">登陆密码：</label>
						    <input type="password" class="form-control" id="loginPassword" name="loginPassword" placeholder="请输入您的登陆密码">
						  </div>
						  <div class="form-group">
						    <label for="newPassword">新密码：</label>
						    <input type="password" class="form-control" id="newPassword" name="newPassword" placeholder="请输入新密码">
						  </div>
						  <div class="form-group">
						    <label for="confirmNewPassword">确认新密码：</label>
						    <input type="password" class="form-control" id="confirmNewPassword" name="confirmNewPassword" placeholder="请输入确认密码">
						  </div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-white" data-dismiss="modal" id="closePasswordForm">关闭</button>
						<button type="submit" class="btn btn-primary" id="confirmPasswordForm">提交修改</button>
					</div>
				</form>
			</div>
		</div> -->
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
	<script src="${ctx  }/js/system/department_management.js"></script>
</body>

</html>