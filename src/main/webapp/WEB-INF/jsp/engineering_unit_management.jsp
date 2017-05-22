<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="include_tags.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

   <title>街坊邻里后台管理系统 - 工程单位管理</title>
    <meta name="keywords" content="门禁,安防">
    <meta name="description" content="街坊邻里后台管理系统 - 工程单位管理">

    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="${ctx  }/css/bootstrap-responsive.min.css" rel="stylesheet">
    <link href="${ctx  }/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="${ctx  }/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
	<link href="${ctx  }/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="${ctx  }/css/animate.min.css" rel="stylesheet">
    <link href="${ctx  }/css/style.min.css?v=4.0.0" rel="stylesheet">
    <link href="${ctx  }/css/plugins/bootstrap-paginator/bootstrap-paginator.css" rel="stylesheet">
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
			    </div>
                <div class="text-center animated fadeInRightBig form-horizontal">
                	<div class="form-group">
                		 <div class="form-inline col-sm-4">
                			<div class="form-group">
		                         <label for="companyNameValue">工程单位名称：</label>
		                         <input type="text" class="form-control" id="companyNameValue" name="companyNameValue" >
		                    </div>
		                 </div>
		                 <div class="form-inline col-sm-4 col-sm-offset-1">
                			<div class="form-group">
		                         <label for="ownedAreaValue">所属区域：</label>
		                         <input type="text" class="form-control" id="ownedAreaValue" name="ownedAreaValue" readonly="readonly">
		                    </div>
		                 </div>
                    </div>
                    <div class="form-group">
                         <div class="form-inline col-sm-4">
                			<div class="form-group">
		                         <label for="companyAddressValue">工程单位地址：</label>
		                         <input type="text" class="form-control" id="companyAddressValue" name="companyAddressValue" >
		                    </div>
		                 </div>
                         <button type="button" class="btn btn-w-m btn-primary multi_btn" id="queryCompany" >查询</button>
                    </div>
                    <div class="form-group">
                    	<div class="col-sm-12 text-left">
	                         <button type="button" class="btn btn-w-m btn-success" id="addCompany" >新增</button>
	                         <button type="button" class="btn btn-w-m btn-danger" id="deleteCompany">删除</button>
	                         <button type="button" class="btn btn-w-m btn-info excelImport_btn">批量导入工程单位</button>
	                         <input type="file" id="engineerUnits_file" name="engineerUnits" style="display: none;">
	                         <button type="button" class="btn btn-w-m btn-dafault cancelImport_btn" style="display:none;">取消</button>
	                         <a href="${ctx }/excelImport/engineerUnitsExcel2003Temp.do">
	                         	<button type="button" class="btn btn-outline btn-info">导入模板下载</button>
	                         </a> 
                        </div> 
                    </div>
					<div class="ibox-content">
						<table class="footable table table-stripped toggle-arrow-tiny text-left"
							data-page-size="8" id="engineeringTable" >
							<thead>
								<tr>
									<th data-sort-ignore="true">
										<div class="checkbox i-checks checkAll">
											<label><input type="checkbox" value=""> <i></i></label>
										</div>
									</th>
									<th>企业账号</th>
									<th>工程单位名称</th>
									<th>法人代表</th>
									<th>行政区域</th>
									<th>联系人</th>
									<th>联系电话</th>
									<th>地址</th>
									<th data-sort-ignore="true">操作</th>
								</tr>
							</thead>
							<tbody id="tableBody">
							</tbody>
							<tfoot>
								<tr>
									<td colspan="9">
										<ul class="pagination pull-right"></ul>
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
	<div class="modal inmodal" id="companyEditModal" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog">
				<form class="modal-content animated fadeInDown" id="companyForm">
					<div class="modal-header" style="padding: 10px;">
						<button type="button" class="close" data-dismiss="modal" style="margin: 10px 15px 0px 0px;">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h6 class="modal-title">新增工程单位</h6>
					</div>
					<div class="modal-body">
						<div class="form-group">
						    <label for="companyNum">企业账号：</label>
						    <input type="text" class="form-control" id="companyNum" name="companyNum" placeholder="请输入企业账号" readonly="readonly">
						  </div>
						  <div class="form-group">
						    <label for="companyName">工程单位名称：</label>
						    <input type="text" class="form-control" id="companyName" name="companyName" placeholder="请输入工程单位名称">
						  </div>
						  <div class="form-group">
						    <label for="legalPerson">法人代表：</label>
						    <input type="text" class="form-control" id="legalPerson" name="legalPerson" placeholder="请输入法人代表">
						  </div>
						  <div class="form-group">
						    <label for="ownedArea">行政区域：</label>
						    <input type="text" class="form-control" id="ownedArea" name="ownedArea" placeholder="请选择行政区域" readonly="readonly">
						  </div>
						  <div class="form-group">
						    <label for="contactPerson">联系人：</label>
						    <input type="text" class="form-control" id="contactPerson" name="contactPerson" placeholder="请输入联系人">
						  </div>
						  <div class="form-group">
						    <label for="contact">联系电话：</label>
						    <input type="text" class="form-control" id="contact" name="contact" placeholder="请输入联系电话">
						  </div>
						  <div class="form-group">
						    <label for="fax">传真：</label>
						    <input type="text" class="form-control" id="fax" name="fax" placeholder="请输入传真">
						  </div>
						  <div class="form-group">
						    <label for="address">公司地址：</label>
						    <input type="text" class="form-control" id="address" name="address" placeholder="请输入公司地址">
						  </div>
						  <div class="form-group">
						    <label for="website">公司网址：</label>
						    <input type="text" class="form-control" id="website" name="website" placeholder="请输入公司网址">
						  </div>
						<div class="form-group">
		                    <label for="description">公司简介：</label>
		                    <textarea class="form-control" rows="3" cols="50" name="description" id="description" placeholder="请输入公司简介" ></textarea>
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
    <script src="${ctx  }/js/mapUtil.js"></script>
    <script src="${ctx  }/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="${ctx  }/js/plugins/validate/messages_zh.min.js"></script>
    <script src="${ctx  }/js/system/formValidator.js"></script>
    <script src="${ctx  }/js/plugins/iCheck/icheck.min.js"></script>
    <script src="${ctx  }/js/plugins/bootstrap-paginator/bootstrap-paginator.min.js"></script>
    <script src="${ctx  }/js/plugins/sweetalert/sweetalert.min.js"></script>
	<script src="${ctx  }/js/ajaxfileupload.js"></script>
	<script src="${ctx  }/js/plugins/city-cascade/Popt.js"></script>
	<script src="${ctx  }/js/plugins/city-cascade/cityJson.js"></script>
	<script src="${ctx  }/js/plugins/city-cascade/citySet.js"></script>
	<script src="${ctx  }/js/system/base.js"></script>
	<script src="${ctx  }/js/system/engineering_unit_management.js"></script>
	
	<script>
		$(document).ready(function() {
			$(".i-checks").iCheck({
				checkboxClass : "icheckbox_square-green",
				radioClass : "iradio_square-green",
			});
			$("#ownedAreaValue").click(function (e) {
				SelCity(this,e);
			});
			$("#ownedArea").click(function (e) {
				SelCity(this,e);
			});
		});
	</script>
	
</html>