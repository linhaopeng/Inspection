<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="include_tags.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    

   <title>广州市番禺区现代产业基地项目管理系统 - 项目信息管理</title>
    <meta name="keywords" content="门禁,考勤,安防">
    <meta name="description" content="广州市番禺区现代产业基地项目管理系统 - 项目信息信息管理">

    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="${ctx  }/css/bootstrap-responsive.min.css" rel="stylesheet">
    <link href="${ctx  }/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="${ctx  }/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
	<link href="${ctx  }/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="${ctx  }/css/animate.min.css" rel="stylesheet">
    <link href="${ctx  }/css/style.min.css?v=4.0.0" rel="stylesheet">
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
		
		   select  {
		    width: 225px;
		    font-size: 15px;
		    background-color: #FFF;
		    background-image: none;
		    border: 1px solid #e5e6e7;
		    border-radius: 1px;
		    color: inherit;
		    display: block;
		    padding: 6px 12px;
		    width: 70%;
    		display: inline;
		}
		input.form-control{
		    width: 70%;
		    display: inline;
		    
		}
		.p_unit{
		width: 50px;
	    height: 20px;
	    display: inline;
  		margin-left: 10px;
  		font-weight: 700;
		}
		.form-group label{
		display: block;
		}
		.pro_i{
		height: 90px;
		}
		.form-group{    height: 81px;margin-bottom: 0px;}
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
										项目列表
									</h1>
								</div>
							</div>
						</div>
					</div>
					
			
			    
			   
                <div class="text-center animated fadeInRightBig form-horizontal">
                	<div class="form-group" id="queryForm">
                   
                    
                    
                        <div style="margin-bottom: 10px;display: table;">
                        			<div class="see_a" style="margin-top: 5px;">项目类型:</div>
                        			<div class="see_b">
									     <select id="p_typeId" name="p_typeId">
									     <option value="">全部</option>
									     	<c:forEach var="type" items="${typeList }" varStatus="s">
					                           <option value="${type.typeId }">${type.name }</option>
				                        	</c:forEach>
									     </select>  
                        			</div>
                        			<div class="see_a" style="margin-top: 5px;">项目名称:</div>
                        			<div class="see_b">
                        				<input type="text" class="form-control" id="projectName" name="projectName" placeholder="请输入项目名称">
                        			</div>
                        			<div class="see_a" style="margin-top: 5px;">项目编号:</div>
                        			<div class="see_b">
                        				<input type="text" class="form-control" id="projectNo" name="projectNo" placeholder="请输入项目编号">
                        			</div>
                        			<div style="width: 200px; display: inline;"><button type="button" class="btn btn-primary" id="getQuery" onclick="getQuery()">查询</button></div>
                        			<div style="width: 200px; display: inline;margin-left: 20px;">
	                        			<button type="button" class="btn btn-w-m btn-success" id="addAccount">新增</button>
                        			</div>
                        			
                        		</div>
					<div class="ibox-content table-responsive">
							<div style="margin-right: 80px;text-align: right;height: 30px;">
									项目状态说明: 
										<img alt="" src="${ctx }/img/d1.jpg">:严重问题
										<img alt="" src="${ctx }/img/d2.jpg">:已滞后
										<img alt="" src="${ctx }/img/d3.jpg">:正常
									</div>
		
						<table class="table table-stripped toggle-arrow-tiny text-left table-hover" id="accountnnnnInfos">
							<thead>
								<tr>
									
									<th>项目状态</th>
									<th>项目名称</th>
									<th>项目编号</th>
									<th>项目类型</th>
									<th>项目优先级</th>
									<th>计划起止时间</th>
									<th>项目进度</th>
							</thead>
							<tbody id="tableBody">
							</tbody>
							<tfoot>
								<tr>
									<td colspan="7" class="text-center" >
										
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
			aria-hidden="true" >
			<div class="modal-dialog">
				<form class="modal-content animated fadeInDown" id="accountForm" style="width: 800px;    font-size: 15px;">
					<div class="modal-header" style="padding: 10px;">
						<button type="button" class="close" data-dismiss="modal" style="margin: 10px 15px 0px 0px;">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h6 class="modal-title">修改项目信息</h6>
					</div>
					<div class="modal-body">
					<div class="form-group pro_i" style="margin-left: 10px;">
						    <label for="name">项目名称：</label>
						    <input type="text" class="form-control" id="name" name="name" placeholder="请输入项目名称" style="width: 78%;" maxlength="60">
						  </div>
						  <div>
						  <div class="form-group pro_i" style="width:45%;float:left;    margin-left: 10px;">
						    <label for="no">项目编号：</label>
						    <input type="text" class="form-control" id="no" name="no" placeholder="请输入项目编号" maxlength="10">
						  </div>
						<div class="form-group pro_i" style="width:45%;float:left;    margin-left: 10px;">
						    <label for="typeId">项目类型：</label>
						     <div>
							     <select id="typeId" name="typeId">
							     <option value="-1">－请选择－</option>
							     	<c:forEach var="type" items="${typeList }" varStatus="s">
			                           <option value="${type.typeId }">${type.name }</option>
		                        	</c:forEach>
							     </select>  
						     </div>
						  </div>
						  </div>
						  
						  
						
						  <div class="form-group pro_i" style="width:45%;float:left;margin-left: 10px;">
						    <label for="state">项目状态：</label>
						    <!-- <input type="text" class="form-control" id="state" name="state" placeholder="请输入项目状态"> -->
						     <div>
							    <select name="state" id="state" >
							    	<option value="-1">－请选择－</option>
							    	<option value="3">正常</option>
							    	<option value="2">已滞后</option>
							    	<option value="1">严重问题</option>
							    	
							    </select>
						    </div>
						  </div>
						  <div class="form-group pro_i" style="width:45%;float:left; margin-left: 10px;"">
						    <label for="priority">优先级：</label>
						    <!-- <input type="text" class="form-control" id="priority" name="priority" placeholder="请输入优先级"> -->
						     <div>
							    <select name="priority" id="priority" >
							    	<option value="-1">－请选择－</option>
							    	<option value="1">极高</option>
							    	<option value="2">高</option>
							    	<option value="3">中</option>
							    	<option value="4">低</option>
							    </select>
						    </div>
						  </div>
						<!-- <div class="form-group">
		                    <label for="remark">备注：</label>
		                    <textarea class="form-control" rows="3" cols="50" name="remark" id="remark" ></textarea>
		                </div> -->
		                 <div class="form-group " style="width:45%;float:left; margin-left: 10px;"">
						    <label for="beginDate">计划开始时间：</label>
						    <input type="text" class="form-control" id="beginDate" name="beginDate" readonly="readonly"   onClick="WdatePicker()"  
						    onFocus="var endDate=$dp.$('endDate');WdatePicker({onpicked:function(){endDate.focus();},maxDate:'#F{$dp.$D(\'endDate\')}'})"/>

						  </div>
						  <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="endDate">计划结束时间：</label>
						    <input type="text" class="form-control" id="endDate" name="endDate" readonly="readonly"  onClick="WdatePicker()" 
						    onFocus="WdatePicker({minDate:'#F{$dp.$D(\'beginDate\')}'})"/>
						  </div>
						  <div class="form-group" style="width:45%;float:left; margin-left: 10px;"">
						    <label for="s_beginDate">实际开始时间：</label>
						    <input type="text" class="form-control" id="s_beginDate" name="s_beginDate" readonly="readonly"   onClick="WdatePicker()" 
						    onFocus="var endDate=$dp.$('s_endDate');WdatePicker({onpicked:function(){endDate.focus();},maxDate:'#F{$dp.$D(\'s_endDate\')}'})"/>

						  </div>
						  <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="s_endDate">实际结束时间：</label>
						    <input type="text" class="form-control" id="s_endDate" name="s_endDate" readonly="readonly"  onClick="WdatePicker()" 
						     onFocus="WdatePicker({minDate:'#F{$dp.$D(\'s_beginDate\')}'})"/>
						  </div>
						  <!--ietdh  -->
						  <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="respDept">负责单位：</label>
						    <input type="text" class="form-control" id="respDept" name="respDept"  maxlength="60" readonly="readonly"/><p class="p_unit a_unit" ><button type="button" class="btn btn-primary btn-outline btn-xs ">选择单位</button></p>
						    <input type="hidden" id="respDept_id" name="respDept_id">
						  </div>
						  <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="deputyDept">代建单位：</label>
						    <input type="text" class="form-control" id="deputyDept" name="deputyDept" maxlength="60" readonly="readonly"/><p class="p_unit a_unit" ><button type="button" class="btn btn-primary btn-outline btn-xs ">选择单位</button></p>
						    <input type="hidden" id="deputyDept_id" name="deputyDept_id">
						  </div>
						  <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="ownerDept">业主单位：</label>
						    <input type="text" class="form-control" id="ownerDept" name="ownerDept"  maxlength="60" readonly="readonly"/><p class="p_unit a_unit" ><button type="button" class="btn btn-primary btn-outline btn-xs ">选择单位</button></p>
						    <input type="hidden" id="ownerDept_id" name="ownerDept_id">
						  </div>
						  <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="supDept">监理单位：</label>
						    <input type="text" class="form-control" id="supDept" name="supDept"  maxlength="60"/>
						  </div>
						  <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="builderDept">施工单位：</label>
						    <input type="text" class="form-control" id="builderDept" name="builderDept"  maxlength="60"/>
						  </div>
						  <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="designDept">设计单位：</label>
						    <input type="text" class="form-control" id="designDept" name="designDept" maxlength="60" />
						  </div>
						  <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="investor">投资主体：</label>
						    <input type="text" class="form-control" id="investor" name="investor"  maxlength="60"/>
						  </div>
						  <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="investment">计划投资：</label>
						    <input type="text" class="form-control num-test" id="investment" name="investment"  onkeyup="value=value.replace(/[^\d.]/g,'')" maxlength="14" />
						    <p class="p_unit">万元</p>
						  </div>
						  <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="gross">投资总额：</label>
						    <input type="text" class="form-control num-test" id="gross" name="gross"  onkeyup="value=value.replace(/[^\d.]/g,'')" maxlength="14" />
						    <p class="p_unit">万元</p>
						  </div>
						   <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="assets">注册资本：</label>
						    <input type="text" class="form-control num-test" id="assets" name="assets" onkeyup="value=value.replace(/[^\d.]/g,'')" maxlength="14"/><p class="p_unit">万元</p>
						  </div>
						   <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="address">注册地址：</label>
						    <input type="text" class="form-control" id="address" name="address"  maxlength="60"/>
						  </div>
						   <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="floorArea">占地面积：</label>
						    <input type="text" class="form-control num-test" id="floorArea" name="floorArea" onkeyup="value=value.replace(/[^\d.]/g,'')" maxlength=14"/><p class="p_unit">亩</p>
						  </div>
						   <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="coveredArea">建筑面积：</label>
						    <input type="text" class="form-control num-test" id="coveredArea" name="coveredArea" onkeyup="value=value.replace(/[^\d.]/g,'')" maxlength=14"/><p class="p_unit">平方米</p>
						  </div>
						   <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="planArea">规划面积：</label>
						    <input type="text" class="form-control num-test" id="planArea" name="planArea" onkeyup="value=value.replace(/[^\d.]/g,'')" maxlength=14"/><p class="p_unit">亩</p>
						  </div>
						   <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="capacity">产能：</label>
						    <input type="text" class="form-control" id="capacity" name="capacity"  maxlength="20"/>
						  </div>
						   
						   <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="productType">产品类型：</label>
						    <input type="text" class="form-control" id="productType" name="productType" maxlength="60" />
						  </div>
						   <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="annualProductValue">年产值：</label>
						    <input type="text" class="form-control num-test" id="annualProductValue" name="annualProductValue" maxlength="14" onkeyup="value=value.replace(/[^\d.]/g,'')"/><p class="p_unit">万元</p>
						  </div>
						   <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="annualProductAmounr">年产量：</label>
						    <input type="text" class="form-control" id="annualProductAmounr" name="annualProductAmounr" maxlength="10" />
						  </div>
						   <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="annualSaleValue">年销售额：</label>
						    <input type="text" class="form-control num-test" id="annualSaleValue" name="annualSaleValue" maxlength="14" onkeyup="value=value.replace(/[^\d.]/g,'')"/><p class="p_unit">万元</p>
						  </div>
						   <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="annualSaleAmount">年销售量：</label>
						    <input type="text" class="form-control" id="annualSaleAmount" name="annualSaleAmount" maxlength="10" />
						  </div>
						   <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="annualRevenue">年税收：</label>
						    <input type="text" class="form-control num-test" id="annualRevenue" name="annualRevenue" onkeyup="value=value.replace(/[^\d.]/g,'')" maxlength="14"/><p class="p_unit">万元</p>
						  </div>
						   <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="employees">员工人数：</label>
						    <input type="text" class="form-control" id="employees" name="employees"  onkeyup="value=value.replace(/\D/gi,'')" maxlength="8"/><p class="p_unit">人</p>
						  </div>
						   <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="acreProductValue">每亩年产值：</label>
						    <input type="text" class="form-control num-test" id="acreProductValue" name="acreProductValue" onkeyup="value=value.replace(/[^\d.]/g,'')" maxlength="14"/><p class="p_unit">万元</p>
						  </div>
						   <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="acreRevenue">每亩年纳税：</label>
						    <input type="text" class="form-control num-test" id="acreRevenue" name="acreRevenue" onkeyup="value=value.replace(/[^\d.]/g,'')" maxlength="14"/><p class="p_unit">万元</p>
						  </div>
						   <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="acreAssets">每亩注册资本：</label>
						    <input type="text" class="form-control num-test" id="acreAssets" name="acreAssets"  onkeyup="value=value.replace(/[^\d.]/g,'')" maxlength="14"/><p class="p_unit">万元</p>
						  </div>
						  <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="acreGross">每亩投资额：</label>
						    <input type="text" class="form-control num-test" id="acreGross" name="acreGross"  onkeyup="value=value.replace(/[^\d.]/g,'')" maxlength="14"/><p class="p_unit">万元</p>
						  </div>
						  <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="electricity">用电负荷：</label>
						    <input type="text" class="form-control num-test" id="electricity" name="electricity" onkeyup="value=value.replace(/[^\d.]/g,'')" maxlength="14"/><p class="p_unit">KVA</p>
						  </div>
						   <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="water">用水负荷：</label>
						    <input type="text" class="form-control num-test" id="water" name="water"  onkeyup="value=value.replace(/[^\d.]/g,'')" maxlength="14"/><p class="p_unit">吨/天</p>
						  </div>
						  
						  
						   <div class="form-group" style="margin-left: 10px;clear: both;">
						    <label for="site">项目选址：</label>
						    <input type="text" class="form-control" id="site" name="site" maxlength="60"  placeholder="请输入项目选址">
						  </div>
		                <div class="form-group" style="margin-left: 10px;height: 115px;">
						    <label for="intro">项目简介：</label>
						    <textarea class="form-control" rows="3" cols="50" name="intro" id="intro" ></textarea>
						  </div>
						  <div class="form-group" style="margin-left: 10px;height: 115px;">
						    <label for="note">项目备注：</label>
						    <textarea class="form-control" rows="3" cols="50" name="note" id="note" ></textarea>
						  </div>
						 
						 
						  
						  
						  
		                
		                 
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-white" data-dismiss="modal" id="closeAccountInfoForm">关闭</button>
						<button type="submit" class="btn btn-primary" id="confirmAccountInfoForm">提交保存</button>
					</div>
				</form>
			</div>
		</div>
		
		
		
		<!-- 选择单位模态窗口 -->
			<div class="modal fade" id="problem_unit_detailsEditModal" tabindex="-1" role="dialog" 
			   aria-labelledby="myModalLabel" aria-hidden="true">
			   <div class="modal-dialog">
			      <div class="modal-content">
			         <div class="modal-header">
			            <button type="button" class="close" 
			               data-dismiss="modal" aria-hidden="true">
			                  &times;
			            </button>
			            <h4 class="modal-title" style="text-align: center;">项目单位列表</h4>
			         </div>
			         <div class="modal-body">
			            	
			            	<div style="margin-bottom: 10px;">
                        			<div class="see_a">单位名称:</div>
                        			<div class="see_b">
                        				<input type="text" class="form-control" id="commName" name="commName" placeholder="请输入单位名称">
                        			</div>
                        			<div><button type="button" class="btn btn-primary unit_f">查询</button></div>
                        		</div>
				
						<input type="hidden" id="commvalue">

						<table class="table"　style="margin: 20px 0px 0px 0px;">
							<thead>
								<tr>
									
									<th>单位名称</th>
									<th>单位负责人</th>
									<!-- <th>联系电话</th>
									<th>单位地址</th> -->
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="u_tableBody">
							</tbody>
							<tfoot>
								<tr>
									<td colspan="9" class="text-center" >
										<div id="u_bottomTab"></div>
									</td>
								</tr>
							</tfoot>
						</table>

				

			         </div>
			         <div class="modal-footer">
			            <button type="button" class="btn btn-default" 
			               data-dismiss="modal">关闭
			            </button>
			         </div>
			      </div>
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
	<script src="${ctx  }/My97DatePicker/WdatePicker.js"></script>
	<script>
		$(document).ready(function() {
			$(".i-checks").iCheck({
				checkboxClass : "icheckbox_square-green",
				radioClass : "iradio_square-green",
			});
			
			
		});
		
		function getQuery(){
    	
	    	var reqData= {"typeId":$("#p_typeId option:selected").val(),"name":$("#projectName").val(),"no":$("#projectNo").val()}; //取内容
	    	buildTable(JSON.stringify(reqData),1,8);
	    }
    	$("#p_typeId").change(function(){
    		getQuery();
    	});
    	
    	$(function(){
   		 $("#intro").keyup(function(){
   			   var len = $(this).val().length;
   			   if(len > 1000){
   			    $(this).val($(this).val().substring(0,1000));
   			   }
   			  
   			  /*  var num = 140 - len;
   			   $("#word").text(num); */
   			  });
   		$("#note").keyup(function(){
			   var len = $(this).val().length;
			   if(len > 190){
			    $(this).val($(this).val().substring(0, 190));
			   }
			  
			  /*  var num = 140 - len;
			   $("#word").text(num); */
			  });
   	});
   		$(".num-test").live('blur',function(){
   			
   			var id=$(this).attr("id");
				var v=$("#"+id).val();
				var t=/^[0-9]+(\.[0-9]{1,2})?$/;
				if(v==''){return;}
				if(!t.test(v)){
					//$("#"+id).val('');
					swal("只能输入整数或两位的小数!");
					$(this).focus();
				}
		});
	</script>
	<script src="${ctx  }/js/system/base.js"></script>
	<script src="${ctx  }/js/system/project_info_management.js"></script>
	<script src="${ctx  }/js/system/getDatas.js"></script>
</body>

</html>