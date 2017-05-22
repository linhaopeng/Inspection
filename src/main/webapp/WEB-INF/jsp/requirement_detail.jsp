<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="include_tags.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

   <title>街坊邻里后台管理系统 - 需求详情</title>
    <meta name="keywords" content="门禁,安防">
    <meta name="description" content="街坊邻里后台管理系统 - 需求详情">

    <link rel="shortcut icon" href="favicon.ico"> <link href="${ctx  }/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="${ctx  }/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="${ctx  }/css/animate.min.css" rel="stylesheet">
	<link href="${ctx  }/css/plugins/iCheck/custom.css" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="${ctx  }/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="${ctx  }/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet" />
    <link href="${ctx  }/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content white-bg page-heading" >
        <div class="row">
            <div class="col-sm-12">
            	<div class="ibox-title">
			        <ol class="breadcrumb">
			            <!-- <li>
			               <small>需求管理</small>
			            </li> -->
					    <li>
					       <strong>需求详情</strong>
					    </li>
			        </ol>
			    </div>
			    <input type="hidden" id="feedbackId" value="${feedback.id }">
			    <input type="hidden" id="handleType" value="${feedback.handleType }">
                <form class="text-left animated fadeInRightBig form-horizontal" style="margin-left: 30px;" id="feedbackForm" >
                	<div class="form-group">
                		<div class="form-inline col-sm-12">
                			<div class="form-group">
		                         <label for="">需求描述：</label>
		                         <textarea class="form-control" rows="5" cols="50" readonly="readonly">${feedback.content }</textarea>
		                    </div>
		                </div>
		            </div>
		            <div class="form-group">
                		<div class="form-inline col-sm-5">
                			<div class="form-group">
		                         <label for="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户：</label>
		                         ${feedback.userName }
		                    </div>
		                </div>
		            </div>
		            <div class="form-group">
                		<div class="form-inline col-sm-5">
                			<div class="form-group">
		                         <label for="">提出日期：</label>
		                         ${feedback.createdTime }
		                    </div>
		                </div>
		            </div>
		            <div class="form-group">
                		<div class="form-inline col-sm-12">
                			<div class="form-group">
		                         <label for="">需求图片：</label>
		                         <c:forEach var="headImg" items="${headImgs }" varStatus="s">
		                         	<a href="${headImgsUrl }${headImg }" class="fancybox-button" data-rel="fancybox-button"><img src="${headImgsUrl }${headImg }" alt="" width="20%"></a>
		                         </c:forEach>
		                    </div>
		                </div>
		            </div>
		            <div class="form-group">
                		<div class="form-inline col-sm-5">
                			<div class="form-group">
		                         <label for="handleTypeRadio">处理类型：</label>
		                         <div class="radio i-checks" >
									<label><input type="radio" value="0" name="handleTypeRadio" id="radio0"> <i></i>废弃</label>
								 </div>
								 <div class="radio i-checks" >
									<label><input type="radio" value="1" name="handleTypeRadio" id="radio1"> <i></i>采纳</label>
								 </div>
								 <div class="radio i-checks" >
									<label><input type="radio" value="2" name="handleTypeRadio" id="radio2"> <i></i>奖励</label>
								 </div>
		                    </div>
		                </div>
		            </div>
		            <div class="form-group">
                		<div class="form-inline col-sm-5">
                			<div class="form-group">
		                         <label for="handleTypeRadio">需求评分：</label>
		                         <span id="star"></span>
		                    </div>
		                </div>
		            </div>
		            
		            <div class="form-group">
                		<div class="form-inline col-sm-12">
                			<div class="form-group">
		                         <label for="remark">回复信息：</label>
		                         <textarea class="form-control" rows="5" cols="50" name="replyContent" id="replyContent" >${feedback.replyContent }</textarea>
		                    </div>
		                </div>
		            </div>
		            <div class="hr-line-dashed"></div>
                    <div class="form-group">
                    	<div class="col-sm-5 text-center">
	                         <button type="button" class="btn btn-w-m btn-outline btn-danger" id="cancel">返回</button>
	                         <button type="button" class="btn btn-w-m btn-info" id="save">保存</button>
                        </div> 
                    </div>
				</form>
            </div>
        </div>

	</div>
    <script src="${ctx  }/js/jquery.min.js?v=2.1.4"></script>
    <script src="${ctx  }/js/jquery-migrate-1.1.0.min.js"></script>
    <script src="${ctx  }/js/jquery.params.js"></script>
    <script src="${ctx  }/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="${ctx  }/js/content.min.js?v=1.0.0"></script>
    <script src="${ctx  }/js/plugins/sweetalert/sweetalert.min.js"></script>
    <script src="${ctx  }/plugins/fancybox/source/jquery.fancybox.pack.js"></script>
    <script src="${ctx  }/js/plugins/raty/jquery.raty.min.js"></script>
    <script src="${ctx  }/js/plugins/iCheck/icheck.min.js"></script>
	<script>
		var fbScore = 0;
	
		$(document).ready(function() {
			$(".i-checks").iCheck({
				checkboxClass : "icheckbox_square-green",
				radioClass : "iradio_square-green",
			});
			
			$("#star").raty({
				starOff: "${ctx  }/js/plugins/raty/img/star-off.png",
				starOn: "${ctx  }/js/plugins/raty/img/star-on.png",
				cancel: true,
				cancelOff: "${ctx  }/js/plugins/raty/img/cancel-off.png",
				cancelOn : "${ctx  }/js/plugins/raty/img/cancel-on.png",
				score: "${feedback.score }",
				click: function(score, evt) {
					 fbScore = (score == null? 0:score);
				}
			});
		});
	</script>
	<script src="${ctx  }/js/system/base.js"></script>
    <script src="${ctx  }/js/system/requirement_detail.js"></script>
</body>

</html>