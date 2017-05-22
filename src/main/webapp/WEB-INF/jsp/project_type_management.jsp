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
	</style>
	
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content white-bg page-heading" id="accountInfoDiv">
        <div class="row">
        	
            <div class="col-sm-9" style="width: 100%;margin-bottom: 20px;margin-left: 30px;font-size: 14px;">
            	
				<div class="container" style="    margin-left: inherit;">
						<div class="row clearfix">
							<div class="col-md-12 column">
								<div class="page-header">
									<h1 style="font-weight: 700;font-size: 22px;">
										项目类型管理
									</h1>
								</div>
							</div>
						</div>
					</div>
			    
                <div class="text-center animated fadeInRightBig form-horizontal">
                	<div class="form-group" id="queryForm">
                    <div class="form-group" style="margin-left: 30px;">
                    	<div class="col-sm-12 text-left">
	                         <button type="button" class="btn btn-w-m btn-success" id="addAccount">新增</button>
	                         <button type="button" class="btn btn-w-m btn-danger" id="deleteAccount">删除</button>
                        </div> 
                    </div>
                    
                    <div style="margin-bottom: 10px;">
                        			
                        			<div class="see_a">类型名称:</div>
                        			<div class="see_b">
                        				<input type="text" class="form-control" id="typeName" name="typeName" placeholder="请输入类型名称" >
                        			</div>
                        			
                        			<div><button type="button" class="btn btn-primary" id="getQuery" onclick="getQuery()">查询</button></div>
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
									<th>类型代码</th>
									<th>类型名称</th>
									<th>类型描述</th>
									
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
						<h6 class="modal-title">修改项目类型</h6>
					</div>
				<div class="modal-body">
					
						<!-- <div class="form-group">
							    <label for="parentTypeId">父类型ID：</label>
							    <input type="text" class="form-control" id="parentTypeId" name="parentTypeId" placeholder="请输入父类型ID">
						</div> -->
						<div class="form-group">
						    <label for="code">项目类型编码：</label>
						    <input type="text" class="form-control" id="code" name="code" placeholder="请输入类型编码" maxlength="3">
						  </div>
						  <div class="form-group">
						    <label for="name">项目类型名称：</label>
						    <input type="text" class="form-control" id="name" name="name" placeholder="请输入类型名称" maxlength="30">
						  </div>
						  
						<div class="form-group">
		                    <label for="description">类型描述：</label>
		                    <textarea class="form-control" rows="3" cols="50"  name="description" id="description" ></textarea>
		                </div>
		                 <div class="form-group">
						    <label for="listNo">显示序号：</label>
						    <input type="text" class="form-control" id="listNo" name="listNo" placeholder="请输入显示序号"  onkeyup="this.value=this.value.replace(/\D/g,'')" maxlength="10">
						  </div>
						  <div class="form-group" style="display: none;">
						    <label for="creator">创建人：</label>
						    <input type="text" class="form-control" id="creator" name="creator" value="${user.username }" readonly="readonly" placeholder="请输入创建人">
						  </div>
						 
						 <!-- <div class="form-group">
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
						 
						 
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-white" data-dismiss="modal" id="closeAccountInfoForm">关闭</button>
						<button type="submit" class="btn btn-primary" id="confirmAccountInfoForm">提交保存</button>
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
		function getQuery(){
    	
	    	var reqData= {"name":$("#typeName").val()}; //取内容
	    	buildTable(JSON.stringify(reqData),1,8);
	    }
    	$("#p_typeId").change(function(){
    		getQuery();
    	});
    	$(function(){
    		 $("#description").keyup(function(){
    			   var len = $(this).val().length;
    			   if(len > 50){
    			    $(this).val($(this).val().substring(0,50));
    			   }
    			  
    			  /*  var num = 140 - len;
    			   $("#word").text(num); */
    			  });
    	});
    	
	</script>
	<script src="${ctx  }/js/system/base.js"></script>
	<script src="${ctx  }/js/system/project_type_management.js"></script>
</body>

</html>