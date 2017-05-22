<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="include_tags.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

   <title>街坊邻里后台管理系统 - RFID卡管理</title>
    <meta name="keywords" content="门禁,安防">
    <meta name="description" content="街坊邻里后台管理系统 - RFID卡管理">

    <link rel="shortcut icon" href="favicon.ico"> <link href="${ctx  }/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="${ctx  }/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
	<link href="${ctx  }/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="${ctx  }/css/animate.min.css" rel="stylesheet">
    <link href="${ctx  }/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content white-bg page-heading">
        <div class="row">
            <div class="col-sm-12">
            	<div class="ibox-title">
			        <ol class="breadcrumb">
			        </ol>
			    </div>
                <div class="text-center animated fadeInRightBig form-horizontal">
                    <div class="form-group">
                    	 <div class="form-inline col-sm-3">
                			<div class="form-group">
		                         <label for="IDNum">ID号：</label>
		                         <input type="text" class="form-control" id="cardId">
		                    </div>
		                 </div>
                         <div class="form-inline col-sm-3">
                			<div class="form-group">
		                         <label for="personnelName">住户姓名：</label>
		                         <input type="text" class="form-control" id="personnelName">
		                    </div>
		                 </div>
                         <button type="button" class="btn btn-w-m btn-primary search_btn" id="queryButton">查询</button>
                    </div>
                    <div class="form-group">
                    	<div class="col-sm-12 text-left">
	                         <button type="button" class="btn btn-w-m btn-danger delete_btn">删除</button>
	                         <button type="button" class="btn btn-w-m btn-info excelImport_btn">批量导入ID号</button> 
	                         <input type="file" id="rfidCards_file" name="rfidCards" style="display: none;">
	                         <button type="button" class="btn btn-w-m btn-dafault cancelImport_btn" style="display:none;">取消</button>
	                         
	                         <a href='${ctx}/excelImport/rfidCardsTemp.do'>
	                          <button type="button" class="btn btn-outline btn-info">导出数据模板</button>
	                         </a>
                        </div> 
                    </div>
					<div class="col-sm-5">

						<table
							class="footable table table-stripped toggle-arrow-tiny text-left"
							style="border:1px solid #E0D8D8;" 
							data-page-size="8">
							<thead>
								<tr>
									<th data-sort-ignore="true">
										<div class="checkbox i-checks checkAll">
											<label><input type="checkbox" value=""> <i></i></label>
										</div>
									</th>
									<th>ID号</th>
									<th>持卡人</th>
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
        </div>
    </div>
   <script src="${ctx  }/js/jquery.min.js?v=2.1.4"></script>
    <script src="${ctx  }/js/jquery-migrate-1.1.0.min.js"></script>
    <script src="${ctx  }/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="${ctx  }/js/content.min.js?v=1.0.0"></script>
    <%-- <script src="${ctx  }/js/mapUtil.js"></script>
    <script src="${ctx  }/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="${ctx  }/js/plugins/validate/messages_zh.min.js"></script>
    <script src="${ctx  }/js/system/formValidator.js"></script>
    <script src="${ctx  }/js/system/arrayToJson.js"></script> --%>
    <script src="${ctx  }/js/plugins/iCheck/icheck.min.js"></script>
    <script src="${ctx  }/js/plugins/bootstrap-paginator/bootstrap-paginator.min.js"></script>
    <script src="${ctx  }/js/plugins/sweetalert/sweetalert.min.js"></script>
	<script src="${ctx  }/js/ajaxfileupload.js"></script>
	<script src="${ctx  }/js/plugins/datapicker/bootstrap-datepicker.js"></script>
	<script src="${ctx  }/js/system/base.js"></script>
	<script src="${ctx  }/js/system/rfid_card_management.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".i-checks").iCheck({
				checkboxClass : "icheckbox_square-green",
				radioClass : "iradio_square-green",
			});
		});
	</script>
    
    
</body>

</html>