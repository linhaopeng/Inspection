<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="include_tags.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

   <title>街坊邻里台管理系统 - 修改密码</title>
    <meta name="keywords" content="门禁,安防">
    <meta name="description" content="街坊邻里后台管理系统 - 修改密码">

    <link rel="shortcut icon" href="favicon.ico"> <link href="${ctx  }/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="${ctx  }/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="${ctx  }/css/animate.min.css" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="${ctx  }/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="${ctx  }/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content white-bg page-heading">
        <div class="row">
            <div class="col-sm-12">
            	<div class="ibox-title">
			    </div>
                <form class="text-center animated fadeInRightBig form-horizontal" id="passwordForm">
                    <div class="form-group">
                         <label class="col-sm-2 control-label">请输入新密码：</label>
                         <div class="col-sm-2">
                             <input type="password" class="form-control" id="password" name="password" maxlength="20">
                         </div>
                    </div>
                    <div class="form-group">
                         <label class="col-sm-2 control-label">请再次输入新密码：</label>
                         <div class="col-sm-2">
                             <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" maxlength="20">
                         </div>
                    </div>
                    <div class="form-group">
                    	<div class="col-sm-4 text-right">
	                         <button type="submit" class="btn btn-outline btn-success">提交保存</button>
                        </div> 
                    </div>
				</form>
            </div>
        </div>
    </div>
    
    <!-- 模态窗口 -->
	<div class="modal inmodal" id="validationModal" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="false"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content animated fadeInDown">
					<div class="modal-header">
					</div>
					<div class="modal-body">
						<div class="text-center form-horizontal">
							<div class="form-group">
								<div class="form-inline col-sm-9">
									<div class="form-group">
										<label for="companyName">请输入您的登陆密码：</label> 
										<input type="password" class="form-control" id="loginPassword" name="loginPassword">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="validateUser">确定</button>
					</div>
				</div>
			</div>
		</div>
    <script src="${ctx  }/js/jquery.min.js?v=2.1.4"></script>
    <script src="${ctx  }/js/jquery-migrate-1.1.0.min.js"></script>
    <script src="${ctx  }/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="${ctx  }/js/content.min.js?v=1.0.0"></script>
    <script src="${ctx  }/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="${ctx  }/js/plugins/validate/messages_zh.min.js"></script>
    <script src="${ctx  }/js/system/formValidator.js"></script>
    <script src="${ctx  }/js/plugins/sweetalert/sweetalert.min.js"></script>
    <script type="text/javascript">
	    $(function(){
	    	
	    });
    </script>
    <script src="${ctx  }/js/system/base.js"></script>
    <script src="${ctx  }/js/system/modify_password.js"></script>
</body>

</html>