<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="include_tags.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

   <title>街坊邻里后台管理系统 - 小区管理</title>
    <meta name="keywords" content="门禁,安防">
    <meta name="description" content="街坊邻里后台管理系统 - 小区管理">

    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="${ctx  }/css/bootstrap-responsive.min.css" rel="stylesheet">
    <link href="${ctx  }/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="${ctx  }/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
	<link href="${ctx  }/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="${ctx  }/css/animate.min.css" rel="stylesheet">
    <link href="${ctx  }/css/plugins/city-cascade/city-cascade.css" rel="stylesheet">
    <link href="${ctx  }/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
    <link href="${ctx  }/css/plugins/bootstrap-paginator/bootstrap-paginator.css" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="${ctx  }/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <%-- <link href="${ctx  }/css/plugins/datapicker/datepicker3.css" rel="stylesheet"> --%>
    <%-- <link href="${ctx  }/css/system/custom-list.css" rel="stylesheet"> --%>
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content white-bg page-heading">
        <div class="row">
            <div class="col-sm-12">
            	<div class="ibox-title">
			    </div>
			    <input type="hidden" id="companyId" value="${company.id }">
                <div class="text-left animated fadeInRightBig form-horizontal">
                	<div class="form-group">
                		<div class="form-inline col-sm-4">
                			<div class="form-group">
		                         <label for="rqNameValue" style="margin-left: 15px;">小区名称：</label>
		                         <input type="text" class="form-control" id="rqNameValue" name="rqNameValue" >
		                    </div>
		                </div>
		                <div class="form-inline col-sm-3">
                			<div class="form-group">
		                         <label for="rqAddressValue">小区地址：</label>
		                         <input type="text" class="form-control" id="rqAddressValue"name="rqAddressValue" >
		                    </div>
		                </div>
		                <div class="form-inline col-sm-2 text-right">
                			<div class="form-group">
		                         <button type="button" class="btn btn-w-m btn-primary" id="queryButton">查询</button>
		                    </div>
		                </div>
                    </div>
                    <div class="form-group">
                    	<div class="col-sm-12 text-left">
	                         <button type="button" class="btn btn-w-m btn-success" id="addResidentialQuarter">新增</button>
	                         <button type="button" class="btn btn-w-m btn-danger" id="deleteResidentialQuarter">删除</button>
	                         <button type="button" class="btn btn-w-m btn-info excelImport_btn" >批量导入物业人员</button>
	                         <input type="file" id="residential_quarter_file" name="ResidentialQuarters" style="display: none;">
	                         <button type="button" class="btn btn-w-m btn-dafault cancelImport_btn" style="display:none;">取消</button>
	                         <a href="${ctx }/excelImport/residentialQuarterExcel2003Temp.do">
	                         	<button type="button" class="btn btn-outline btn-info">导入模板下载</button>
	                         </a> 
                        </div> 
                    </div>
					<div class="ibox-content">
						<table
							class="footable table table-stripped toggle-arrow-tiny text-left"
							data-page-size="8" id="residentialQuarterTable">
							<thead>
								<tr>
									<th data-sort-ignore="true">
										<div class="checkbox i-checks checkAll" >
											<label><input type="checkbox" value=""> <i></i></label>
										</div>
									</th>
									<th>小区名称</th>
									<th>物业公司</th>
									<th>联系电话</th>
									<th>所属区域</th>
									<th>小区地址</th>
									<th data-sort-ignore="true">操作</th>
								</tr>
							</thead>
							<tbody id="tableBody">
							</tbody>
							<tfoot>
								<tr>
									<td colspan="7" class="text-center" >
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
	<div class="modal inmodal" id="residentialQuarterEditModal" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog">
				<form class="modal-content animated fadeInDown" id="residentialQuarterForm">
					<div class="modal-header" style="padding: 10px;">
						<button type="button" class="close" data-dismiss="modal" style="margin: 10px 15px 0px 0px;">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h6 class="modal-title">新增小区</h6>
					</div>
					<div class="modal-body">
						<div class="form-group">
						    <label for="rqName">小区名称：</label>
						    <input type="text" class="form-control" id="rqName" name="rqName" placeholder="请输入小区名称" maxlength="20">
						  </div>
						  <div class="form-group">
						    <label for="companyName">物业公司：</label>
						    <input type="text" class="form-control" id="companyName" name="companyName" value="${company.companyName }" placeholder="请输入物业公司名称" readonly="readonly">
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
						<button type="button" class="btn btn-white" data-dismiss="modal" id="closeResidentialQuarterForm">关闭</button>
						<button type="submit" class="btn btn-primary" id="confirmResidentialQuarterForm">提交保存</button>
					</div>
				</form>
			</div>
		</div>
    <script src="${ctx  }/js/jquery.min.js?v=2.1.4"></script>
    <script src="${ctx  }/js/jquery-migrate-1.1.0.min.js"></script>
    <script src="${ctx  }/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="${ctx  }/js/content.min.js?v=1.0.0"></script>
    <script src="${ctx  }/js/mapUtil.js"></script>
    <script src="${ctx  }/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="${ctx  }/js/plugins/validate/messages_zh.min.js"></script>
    <script src="${ctx  }/js/system/formValidator.js"></script>
    <script src="${ctx  }/js/system/arrayToJson.js"></script>
    <script src="${ctx  }/js/plugins/iCheck/icheck.min.js"></script>
    <script src="${ctx  }/js/plugins/bootstrap-paginator/bootstrap-paginator.min.js"></script>
    <script src="${ctx  }/js/plugins/sweetalert/sweetalert.min.js"></script>
	<script src="${ctx  }/js/ajaxfileupload.js"></script>
	<%-- <script src="${ctx  }/js/plugins/datapicker/bootstrap-datepicker.js"></script> --%>
	<script src="${ctx  }/js/jquery.cookie.js"></script>
    <script src="${ctx  }/js/plugins/city-cascade/Popt.js"></script>
	<script src="${ctx  }/js/plugins/city-cascade/cityJson.js"></script>
	<script src="${ctx  }/js/plugins/city-cascade/citySet.js"></script>
	<script src="${ctx  }/js/system/base.js"></script>
	<script src="${ctx  }/js/system/rq_management.js"></script>
	<script>
		$(document).ready(function() {
			$(".i-checks").iCheck({
				checkboxClass : "icheckbox_square-green",
				radioClass : "iradio_square-green",
			});
			
		});
	</script>
</body>

</html>