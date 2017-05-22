<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="include_tags.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

   <title>街坊邻里后台管理系统 - 视听记录管理</title>
    <meta name="keywords" content="门禁,安防">
    <meta name="description" content="街坊邻里后台管理系统 - 视听记录管理">

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
    <%-- <link href="${ctx  }/css/plugins/ztree/metroStyle/metroStyle.css" rel="stylesheet" type="text/css"> --%>
    <link href="${ctx  }/css/plugins/plyr/plyr.css" rel="stylesheet" >
    <link href="${ctx  }/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet" />
    
    <style type="text/css">
		ul.ztree {
			margin-top: 10px;
			border: 1px solid #617775;
			background: #f0f6e4;
			width: 220px;
			height: 360px;
			overflow-y: scroll;
			overflow-x: auto;
			z-index:999;
		}
	</style>

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content white-bg page-heading" id="feedbacksDiv">
        <div class="row">
            <div class="col-sm-12">
            	<div class="ibox-title">
			        <!-- <ol class="breadcrumb">
			            <li>
			               <strong>视听记录管理</strong>
			            </li>
			        </ol> -->
			    </div>
                <div class="animated fadeInRightBig form-horizontal">
                	<div class="form-group" style="margin-left: 0;">
                		<div class="form-inline col-sm-3">
                			<div class="form-group">
 		                		 <label for="avType">视听类型：</label>
		                         <select class="form-control" name="avType" id="avType">
	                                 <option value="0">--所有--</option>
	                                 <option value="1">语音</option>
	                                 <option value="2">视频</option>
	                                 <option value="3">留言</option>
	                             </select>
		                    </div>
		                </div>
		                <div class="form-inline col-sm-6">
		                	<label for="start">开始时间：</label>
		                	<div class="input-daterange input-group" id="datepicker">
							    <input type="text" class="input-sm form-control" name="start" id="start"/>
							    <span class="input-group-addon">~</span>
							    <input type="text" class="input-sm form-control" name="end" id="end"/>
							</div>
		                </div>
                    </div>
                	<div class="form-group" id="queryForm"  style="margin-left: 0;">
                		<div class="form-inline col-sm-3">
                			<div class="form-group">
 		                		 <label for="fromDevice">发起设备：</label>
		                         <input type="text" class="form-control" id="fromDevice" name="fromDevice" >
		                    </div>
		                </div>
                		<div class="form-inline col-sm-3">
                			<div class="form-group">
		                         <label for="toDevice">接受设备：</label>
		                         <input type="text" class="form-control" id="toDevice" name="toDevice" >
		                    </div>
		                </div>
		                <div class="col-sm-3">
	                         <button type="button" class="btn btn-w-m btn-primary" id="queryButton">查询</button>
                        </div>
                    </div>
                    <div class="form-group">
                    	<div class="col-sm-12 text-left" style="padding-top:5px">
	                         <button type="button" class="btn btn-outline btn-info excelExport_btn">导出数据</button>
                        </div> 
                    </div>
					<div class="ibox-content table-responsive">

						<table class="table table-stripped toggle-arrow-tiny text-center" id="avRecords">
							<thead>
								<tr>
									<th class="text-center">NO</th>
									<th class="text-center">发起设备</th>
									<th class="text-center">接受设备</th>
									<th class="text-center">开始时间</th>
									<th class="text-center">结束时间</th>
									<th class="text-center">视听类型</th>
									<th class="text-center">视听时长(秒)</th>
									<th class="text-center">操作</th>
								</tr>
							</thead>
							<tbody id="tableBody">
							</tbody>
							<tfoot>
								<tr>
									<td colspan="8" class="text-center" >
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
	<div class="modal inmodal" id="resourceModal" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog">
				<form class="modal-content animated fadeInDown" id="resourceForm">
					<div class="modal-header" style="padding: 10px;">
						<button type="button" class="close" data-dismiss="modal" style="margin: 10px 15px 0px 0px;">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h6 class="modal-title">视听资源</h6>
					</div>
					<div class="modal-body">
						<div style="margin-bottom: 15px;">
							<a href="http://127.0.0.1:8888/image_record/IMG_2016060712032748.png" class="fancybox-button" data-rel="fancybox-button">
								<img alt="" src="http://127.0.0.1:8888/image_record/IMG_2016060712032748.png" style="width:20% ; border-radius: 4px;">
							</a>
						</div>
						 <div class="player">
                            <audio controls>
                               	<!-- Audio files -->
                                <!-- <source src="http://music.baidu.com/cms/app/muplayer/test_mp3/1.mp3" type="audio/mp3"> -->

                                <!-- Fallback for browsers that don't support the <audio> element -->
                               	 <!-- 您的浏览器不支持在线播放，请<a href="http://music.baidu.com/cms/app/muplayer/test_mp3/1.mp3">下载</a> -->
                            </audio>
                        </div>
					</div>
					<!-- <div class="modal-footer">
						<button type="button" class="btn btn-white" data-dismiss="modal" id="closeDeviceForm">关闭</button>
						<button type="submit" class="btn btn-primary" id="confirmDeviceForm">提交保存</button>
					</div> -->
				</form>
			</div>
		</div>
		<!-- 模态窗口 -->
	<script src="${ctx  }/js/system/base.js"></script>
	<script>
		(function (d, u) {
			var a = new XMLHttpRequest(),
			b = d.body;
			if ("withCredentials" in a) {
				a.open("GET", u, true);
				a.send();
				a.onload = function () {
					var c = d.createElement("div");
					c.setAttribute("hidden", "");
					c.innerHTML = a.responseText;
					b.insertBefore(c, b.childNodes[0])
				}
			}
		})(document, urlRootContext()+"/css/plugins/plyr/sprite.svg");
    </script>
    <script src="${ctx  }/js/plugins/plyr/plyr.js"></script>
    <script>
        /* plyr.setup(); */
        var player = plyr.setup('.player')[0];
    </script>
    <script src="${ctx  }/js/jquery.min.js?v=2.1.4"></script>
    <script src="${ctx  }/js/jquery-migrate-1.1.0.min.js"></script>
    <script src="${ctx  }/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="${ctx  }/js/content.min.js?v=1.0.0"></script>
    <script src="${ctx  }/js/plugins/iCheck/icheck.min.js"></script>
    <script src="${ctx  }/js/plugins/bootstrap-paginator/bootstrap-paginator.min.js"></script>
    <script src="${ctx  }/js/plugins/sweetalert/sweetalert.min.js"></script>
    <script src="${ctx  }/js/plugins/datapicker/bootstrap-datepicker.js"></script>
    <script src="${ctx  }/js/jquery.cookie.js"></script>
    <%-- <script src="${ctx  }/js/plugins/ztree/jquery.ztree.core.js"></script>
	<script src="${ctx  }/js/plugins/ztree/jquery.ztree.excheck.js"></script> --%>
<!--	<script src="${ctx  }/js/plugins/ztree/jquery.ztree.exedit.js"></script>-->
	<script src="${ctx  }/js/system/date_utils.js"></script>
	<script src="${ctx  }/plugins/fancybox/source/jquery.fancybox.pack.js"></script>
	<script src="${ctx  }/js/system/av_record_management.js"></script>
	<script>
		$(document).ready(function() {
			$(".i-checks").iCheck({
				checkboxClass : "icheckbox_square-green",
				radioClass : "iradio_square-green",
			});
			$("#feedbacksDiv .input-daterange").datepicker({
			    format: "yyyy-mm-dd",
			    startView: -1,
			    todayBtn: "linked",
			    clearBtn: true,
			    autoclose: true,
			    todayHighlight: true
			});
			
		});
	</script>
</body>

</html>