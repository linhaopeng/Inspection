<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="include_tags.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>个人资料</title>

    <meta name="description" content="个人资料">

    <!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="favicon.ico">
    <link href="${ctx  }/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="${ctx  }/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="${ctx  }/css/animate.min.css" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="${ctx  }/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="${ctx  }/css/style.min.css?v=4.0.0" rel="stylesheet">
    <style type="text/css">
    .container{
    line-height: 45px;
    font-size: 23px;
    /* text-align: center; */
    margin-top: 60px;
    width: 570px;
        margin-left: 400px;
    }
    
    
    </style>
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
  
  
  <div>
  <form action="" enctype="multipart/form-data">
  	<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column" >
			<h3 class="text-center" style="font-size: 40px;margin-bottom: 30px;">
				个人资料
			</h3>
			<div class="row clearfix">
				<div class="col-md-6 column" >
				头像:
				</div>
				<input type="file" name="head_img2" id="head_img2" style="display: none;" accept="image/*" >
				<div class="col-md-6 column" style="width: 200px;height: 200px;" id="img_show2">
				<c:if test="${empty user.headImg }">
					<img  src="${ctx }/img/head_img/default_img.jpg" class="img-responsive" alt="Cinque Terre" />
				</c:if>
				<c:if test="${!empty user.headImg }">
					<img alt="80x80" src="${ctx }${user.headImg }" class="img-responsive" alt="Cinque Terre" />
				</c:if>
				</div>
			</div>
			<div class="row clearfix">
				<div class="col-md-6 column">
				用户名:
				</div>
				<div class="col-md-6 column">
				${user.username }
				</div>
			</div>
			<div class="row clearfix">
				<div class="col-md-6 column">
				真实姓名:
				</div>
				<div class="col-md-6 column">
				${user.usercname }
				</div>
			</div>
			<div class="row clearfix">
				<div class="col-md-6 column">
				姓别:
				</div>
				<div class="col-md-6 column">
				
				<c:if test="${user.sex==1 }">男</c:if>
				<c:if test="${user.sex==2 }">女</c:if>
				</div>
			</div>
			<div class="row clearfix">
				<div class="col-md-6 column">
				手机号:
				</div>
				<div class="col-md-6 column">
				${user.phone }
				</div>
			</div>
			<div class="row clearfix">
				<div class="col-md-6 column">
				邮箱:
				</div>
				<div class="col-md-6 column">
				${user.email }
				</div>
			</div>
			<div class="row clearfix">
				<div class="col-md-6 column">
				
				</div>
				<div class="col-md-6 column">
				<!-- <button type="button" class="btn btn-primary">修改个人资料</button> -->
				</div>
			</div>
		</div>
	</div>
</div>
  </form>
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
						    <input type="text" class="form-control" id="username" name="username" placeholder="请输入用户名">
						  </div>
						  <div class="form-group">
						    <label for="usercname">姓名：</label>
						    <input type="text" class="form-control" id="usercname" name="usercname" placeholder="请输入姓名">
						  </div>
						  <div class="form-group">
						    <label for="password">密码：</label>
						    <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
						  </div>
						  <div class="form-group">
						    <label for="confirmPassword">确认密码：</label>
						    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="请输入确认密码">
						  </div>
						  
						 <div class="form-group">
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
						  </div>
						  <div class="form-group">
						    <label for="phone">电话：</label>
						    <input type="text" class="form-control" id="phone" name="phone" placeholder="请输入电话号码">
						  </div>
						  <div class="form-group">
						    <label for="email">邮箱：</label>
						    <input type="text" class="form-control" id="email" name="email" placeholder="请输入电子邮箱">
						  </div>
						<!-- <div class="form-group">
		                    <label for="remark">备注：</label>
		                    <textarea class="form-control" rows="3" cols="50" name="remark" id="remark" ></textarea>
		                </div> -->
		                 <div class="form-group">
						    <label for="priority">优先级：</label>
						    <input type="text" class="form-control" id="priority" name="priority" placeholder="请输入优先级">
						  </div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-white" data-dismiss="modal" id="closeAccountInfoForm">关闭</button>
						<button type="submit" class="btn btn-primary" id="confirmAccountInfoForm">提交保存</button>
					</div>
				</form>
			</div>
		</div>
  
  
    <%-- <script src="${ctx  }/js/jquery.min.js?v=2.1.4"></script> --%>
    <script src="${ctx  }/js/jquery-1.12.4.js"></script>
    <script src="${ctx  }/js/jquery-migrate-1.1.0.min.js"></script>
    <script src="${ctx  }/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="${ctx  }/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${ctx  }/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="${ctx  }/js/plugins/layer/layer.min.js"></script>
    <script type="text/javascript" src="${ctx  }/js/contabs.min.js"></script>
    <script src="${ctx  }/js/plugins/pace/pace.min.js"></script>
    <%-- <script src="${ctx  }/js/plugins/sweetalert/sweetalert.min.js"></script> --%>
    <script src="${ctx  }/js/jquery.cookie.js"></script>
    <script src="${ctx  }/js/system/base.js"></script>
    <script src="${ctx  }/js/system/index.js"></script>
    <script src="${ctx  }/js/hplus.min.js?v=4.0.0"></script>
    <script src="${ctx  }/js/ajaxfileupload.js"></script>
    <script src="${ctx  }/js/system/personalData.js"></script>
</body>

</html>