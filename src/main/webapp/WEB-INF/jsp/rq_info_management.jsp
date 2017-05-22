<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="include_tags.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

   <title>街坊邻里后台管理系统 - 小区信息管理</title>
    <meta name="keywords" content="门禁,安防">
    <meta name="description" content="指尖门禁后台管理系统 - 小区信息管理">

    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="${ctx  }/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="${ctx  }/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="${ctx  }/css/animate.min.css" rel="stylesheet">
    <link href="${ctx  }/css/style.min.css?v=4.0.0" rel="stylesheet">
    <link href="${ctx  }/css/plugins/city-cascade/city-cascade.css" rel="stylesheet">
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
			            <li>
			               <strong>小区信息</strong>
			            </li>
			        </ol>
			    </div>
                <div class="ibox float-e-margins">
                    <div class="ibox-content no-padding">
                        <ul class="list-group" id="rqInfo">
                            <li class="list-group-item">
		                		<p>小区名称：<span id="rqNameValue"></span></p>
			                </li>
			                <li class="list-group-item">
			                    <p>物业公司：<span id="companyNameValue"></span></p>
			                </li>
			                <li class="list-group-item">
			                    <p>联系电话：<span id="contactValue"></span></p>
			                </li>
			                <li class="list-group-item">
			                    <p>所属区域：<span id="ownedAreaValue"></span></p>
			                </li>
			                <li class="list-group-item">
			                    <p>小区地址：<span id="rqAddressValue"></span></p>
			                </li>
			                <li class="list-group-item">
			                    <p>小区简介：<span id="rqDescriptionValue"></span></p>
			                </li>
                            <li class="list-group-item">
                                <p><button type="button" class="btn btn-outline btn-info btn-sm btn-w-m modifyRqInfo">修改</button></p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 模态窗口 -->
	<div class="modal inmodal" id="rqInfoEditModal" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog">
				<form class="modal-content animated fadeInDown" id="rqInfoForm">
					<div class="modal-header" style="padding: 10px;">
						<button type="button" class="close" data-dismiss="modal" style="margin: 10px 15px 0px 0px;">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h6 class="modal-title">修改小区信息</h6>
					</div>
					<div class="modal-body">
						<div class="form-group">
						    <label for="rqName">小区名称：</label>
						    <input type="text" class="form-control" id="rqName" name="rqName" placeholder="请输入小区名称" maxlength="20">
						  </div>
						  <div class="form-group">
						    <label for="companyName">物业公司：</label>
						    <input type="text" class="form-control" id="companyName" name="companyName" placeholder="请输入物业公司名称" readonly="readonly">
						  </div>
						  <div class="form-group">
						    <label for="contact">联系电话：</label>
						    <input type="text" class="form-control" id="contact" name="contact" placeholder="请输入联系电话">
						  </div>
						  <div class="form-group">
						    <label for="ownedArea">所属区域：</label>
						    <input type="text" class="form-control" id="ownedArea" name="ownedArea" placeholder="请选择所属区域" readonly="readonly">
						  </div>
						  <div class="form-group">
						    <label for="rqAddress">小区地址：</label>
						    <input type="text" class="form-control" id="rqAddress" name="rqAddress" placeholder="请输入小区地址" maxlength="50">
						  </div>
						<div class="form-group">
		                    <label for="rqDescription">小区简介：</label>
		                    <textarea class="form-control" rows="3" cols="50" name="rqDescription" id="rqDescription" placeholder="请输入小区简介" ></textarea>
		                </div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-white" data-dismiss="modal" id="closeCompanyForm">关闭</button>
						<button type="submit" class="btn btn-primary" id="confirmCompanyForm">提交保存</button>
					</div>
				</form>
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
    <script src="${ctx  }/js/jquery.cookie.js"></script>
    <script src="${ctx  }/js/plugins/city-cascade/Popt.js"></script>
	<script src="${ctx  }/js/plugins/city-cascade/cityJson.js"></script>
	<script src="${ctx  }/js/plugins/city-cascade/citySet.js"></script>
    <script src="${ctx  }/js/system/base.js"></script>
    <script src="${ctx  }/js/system/rq_info_management.js"></script>
</body>

</html>