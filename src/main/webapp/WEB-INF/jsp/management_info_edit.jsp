<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="include_tags.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

   <title>指尖门禁后台管理系统 - 管理单位信息维护</title>
    <meta name="keywords" content="门禁,考勤,安防">
    <meta name="description" content="指尖门禁后台管理系统 - 管理单位信息维护">

    <link rel="shortcut icon" href="favicon.ico"> <link href="${ctx  }/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="${ctx  }/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="${ctx  }/css/animate.min.css" rel="stylesheet">
    <link href="${ctx  }/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content white-bg page-heading">
        <div class="row">
            <div class="col-sm-12">
            	<div class="ibox-title">
			        <ol class="breadcrumb">
			            <li>
			               <small>管理单位</small>
			            </li>
			            <li>
			               <small>管理单位信息</small>
			            </li>
			            <li>
			               <strong>管理单位信息维护</strong>
			            </li>
			        </ol>
			    </div>
                <div class="text-left animated fadeInRightBig form-horizontal" style="margin-left: 30px;">
                	<div class="form-group">
                		<div class="form-inline col-sm-3">
                			<div class="form-group">
		                         <label for="">企业账号：</label>
		                         <input type="text" class="form-control" id="">
		                    </div>
		                </div>
		            </div>
		            <div class="form-group">
		                <div class="form-inline col-sm-3">
		                    <div class="form-group">
		                         <label for="companyName">管理单位名称：</label>
		                         <input type="text" class="form-control" id="companyName">
                			</div>
                		</div>
                    </div>
                    <div class="form-group">
                		<div class="form-inline col-sm-3">
                			<div class="form-group">
		                         <label for="">法人代表：</label>
		                         <input type="text" class="form-control" id="">
		                    </div>
		                </div>
		            </div>
		            <div class="form-group">
                		<div class="form-inline col-sm-3">
                			<div class="form-group">
		                         <label for="">行政区域：</label>
		                         <input type="text" class="form-control" id="">
		                    </div>
		                </div>
		            </div>
		            <div class="form-group">
                		<div class="form-inline col-sm-3">
                			<div class="form-group">
		                         <label for="">&nbsp;&nbsp;&nbsp;联系人：</label>
		                         <input type="text" class="form-control" id="">
		                    </div>
		                </div>
		            </div>
		            <div class="form-group">
                		<div class="form-inline col-sm-3">
                			<div class="form-group">
		                         <label for="">联系电话：</label>
		                         <input type="tel" class="form-control" id="">
		                    </div>
		                </div>
		            </div>
		            <div class="form-group">
                		<div class="form-inline col-sm-3">
                			<div class="form-group">
		                         <label for="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;传真：</label>
		                         <input type="text" class="form-control" id="">
		                    </div>
		                </div>
		            </div>
		            <div class="form-group">
                		<div class="form-inline col-sm-3">
                			<div class="form-group">
		                         <label for="">公司地址：</label>
		                         <input type="text" class="form-control" id="">
		                    </div>
		                </div>
		            </div>
		            <div class="form-group">
                		<div class="form-inline col-sm-3">
                			<div class="form-group">
		                         <label for="">公司网址：</label>
		                         <input type="url" class="form-control" id="">
		                    </div>
		                </div>
		            </div>
		            <div class="form-group">
                		<div class="form-inline col-sm-12">
                			<div class="form-group">
		                         <label for="">公司简介：</label>
		                         <textarea class="form-control" rows="3" cols="50"></textarea>
		                    </div>
		                </div>
		            </div>
		            <div class="hr-line-dashed"></div>
                    <div class="form-group">
                    	<div class="col-sm-3 text-center">
	                         <button type="button" class="btn btn-w-m btn-outline btn-info">保存</button>
	                         <button type="button" class="btn btn-w-m btn-outline btn-danger">返回</button>
                        </div> 
                    </div>
				</div>
            </div>
        </div>
    </div>
    <script src="${ctx  }/js/jquery.min.js?v=2.1.4"></script>
    <script src="${ctx  }/js/jquery-migrate-1.1.0.min.js"></script>
    <script src="${ctx  }/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="${ctx  }/js/content.min.js?v=1.0.0"></script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>

</html>