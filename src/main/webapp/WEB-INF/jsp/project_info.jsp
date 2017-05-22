<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="include_tags.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    

   <title>广州市番禺区现代产业基地项目管理系统 - 账户信息管理</title>
    <meta name="keywords" content="门禁,考勤,安防">
    <meta name="description" content="广州市番禺区现代产业基地项目管理系统 - 账户信息管理">

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
    <link href="${ctx  }/css/system/custom-list.css" rel="stylesheet">
    <link href="${ctx  }/css/system/getDatas.css" rel="stylesheet">
	<!-- 图片 -->
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
		    width: 198px;
		    font-size: 15px;
		    background-color: #FFF;
		    background-image: none;
		    border: 1px solid #e5e6e7;
		    border-radius: 1px;
		    color: inherit;
		    display: block;
		    padding: 6px 12px;
		}
		.col-sm-9 h4 small {
		    font-size: 15px;
		    margin-left: 10px;
		}
		.p_unit{
		width: 50px;
	    height: 20px;
	    display: inline;
  		margin-left: 10px;
  		font-weight: 700;
		}
		input.form-control{
		    width: 70%;
		    display: inline;
		    
		}
		.form-group label{
		display: block;
		}
		.s_p {
		    display: inline;
		    width: 200px;
		}
		.s_p p{
		    display: inline;
		    
		}
		
		.problem_details{    
			margin: 10px 10px 10px 10px;
		    width: 200px;
		    height: 200px;
		    display: inline-table;
		}
		.form-group{    height: 81px;margin-bottom: 0px;}
		h4 small{line-height: 26px;}
		.t_titil{margin-left: 20px;height: 51px;    font-size: 18px}
		body{ overflow: auto !important;} .modal{ overflow: auto !important;} 
	</style>
	
</head>

<body class="gray-bg">
			<input type="hidden" id="project_id" name="project_id" value="${project.projectId }">
			<input type="hidden" id="project_type" name="project_type" value="${project.typeId }">
	<div class="container-fluid">
	<div class="row-fluid">
		
				 <div class="col-sm-9" style="width: 100%;margin-bottom: 20px;margin-left: 20px;font-size: 14px;position:relative">
					
					<div class="container-head clearfix" style=" margin-left: inherit;width:98%">
							<div class="page-header " style="float:left;width: 80%;">
									<h1 style="font-weight: 700;font-size: 22px;display: inline;">
										${project.name }
									</h1>
						    </div>
						    <div style="float:right">
				 			   <div style="margin-right: 30px; margin-top:20px;width: 120px;">
								  <button type="button" class="btn btn-primary" id="p_delete">删除</button>
								  <button type="button" class="btn btn-primary" onclick="history.go(-1)">返回</button>
							   </div>
							</div>
					</div>
			
			<div class="row-fluid"  style=" margin-top: 30px;  margin-bottom: 30px;">
			<div id="project_title"></div>
			
			
			</div>
			<div class="tabbable" id="tabs-285036"  style=" margin-top: 30px;  margin-bottom: 30px;">
				<ul class="nav nav-tabs">
					<li class="active" id="getProject_project">
						 <a href="#panel-913368" data-toggle="tab">项目信息</a>
					</li>
					<li id="getProject_type">
						 <a href="#panel-419303" data-toggle="tab">项目计划</a>
					</li>
					<li  id="getPro_schedule">
						 <a href="#panel-419304" data-toggle="tab">项目进度</a>
					</li>
					<li id="getPro_problem">
						 <a href="#panel-419305" data-toggle="tab">项目问题</a>
					</li>
				</ul>
				
				
				
				
				<div class="tab-content">
					<div class="tab-pane active" id="panel-913368">
						<p>
						<table class="table t_titil" style="">
						   <tbody>
						      <tr  class="success">
						         <td style="    width: 90%;">项目基本信息</td>
						         <td><button type="button" class="btn btn-w-m btn-success" id="edte_window">编辑</button></td>
						      </tr>
						   </tbody>
						</table>
						<div >
						<div>
							<div  class="my_h">
								<h4>项目名称: <small>${project.name }</small></h4>
								<h4>项目类型: <small>${project.typeId }</small></h4>
								<h4>项目状态: <small >
								
								<c:if test="${project.state==1 }">
									<img alt="" src="${ctx }/img/d1.jpg">
								</c:if>
								<c:if test="${project.state==2 }">
									<img alt="" src="${ctx }/img/d2.jpg">
								</c:if>
								<c:if test="${project.state==3 }">
									<img alt="" src="${ctx }/img/d3.jpg">
								</c:if>
								</small></h4>
								<h4>计划起止时间: <small id="date_p">
								<fmt:formatDate value="${project.planBeginDate }" pattern="yyyy-MM-dd"/>
								&nbsp&nbsp/&nbsp&nbsp
								<fmt:formatDate value="${project.planEndDate }" pattern="yyyy-MM-dd"/>
								</small></h4>
								<h4>项目选址: <small>${project.site }</small></h4>
								<h4>业主单位: <small>${project.ownerDeptName }</small></h4>
								<h4>施工单位: <small>${project.builderDept }</small></h4>
								<h4>设计单位: <small>${project.designDept }</small></h4>
								<h4>投资总额: <small><fmt:formatNumber groupingUsed="false"  value="${project.gross }" maxFractionDigits="2"/><p class="p_unit"> 万元</p></small></h4>
								<h4>注册地址: <small>${project.address }</small></h4>
								<h4>建筑面积: <small><fmt:formatNumber groupingUsed="false"  value="${project.coveredArea }" maxFractionDigits="2"/><p class="p_unit"> 平方米</p></small></h4>
								<h4>产能: <small>${project.capacity }</small></h4>
								<h4>年产值: <small><fmt:formatNumber groupingUsed="false"  value="${project.annualProductValue }" maxFractionDigits="2"/><p class="p_unit"> 万元</p></small></h4>
								<h4>年销售额: <small><fmt:formatNumber groupingUsed="false"  value="${project.annualSaleValue }" maxFractionDigits="2"/><p class="p_unit"> 万元</p></small></h4>
								<h4>年税收: <small><fmt:formatNumber groupingUsed="false"  value="${project.annualRevenue }" maxFractionDigits="2"/><p class="p_unit"> 万元</p></small></h4>
								<h4>每亩年产值: <small><fmt:formatNumber groupingUsed="false"  value="${project.acreProductValue }" maxFractionDigits="2"/><p class="p_unit"> 万元</p></small></h4>
								<h4>每亩注册资本: <small><fmt:formatNumber groupingUsed="false"  value="${project.acreAssets }" maxFractionDigits="2"/><p class="p_unit"> 万元</p></small></h4>
								<h4>用电负荷: <small><fmt:formatNumber groupingUsed="false"  value="${project.electricity }" maxFractionDigits="2"/><p class="p_unit"> KVA</p></small></h4>
								
								
							</div>
							<div  class="my_h">
								<h4>项目编号: <small>${project.no }</small></h4>
								<h4>项目优先级: <small>
								<c:if test="${project.priority==1 }">
									极高
								</c:if>
								<c:if test="${project.priority==2 }">
									高
								</c:if>
								<c:if test="${project.priority==3 }">
									中
								</c:if>
								<c:if test="${project.priority==4 }">
									低
								</c:if>
												</small></h4>
								<h4>实际起止时间: <small id="date_a">
								
								
									<fmt:formatDate value="${project.actualBeginDate }" pattern="yyyy-MM-dd"/>
									&nbsp&nbsp/&nbsp&nbsp
									<fmt:formatDate value="${project.actualEndDate }" pattern="yyyy-MM-dd"/>
							
								</small></h4>
								<h4>负责单位: <small>${project.respDeptName }</small></h4>
								<h4>代建单位: <small>${project.deputyDeptName }</small></h4>
								<h4>监理单位: <small>${project.supDept }</small></h4>
								<h4>投资主体: <small>${project.investor }</small></h4>
								<h4>计划投资: <small><fmt:formatNumber groupingUsed="false"  value="${project.investment }" maxFractionDigits="2"/><p class="p_unit"> 万元</p></small></h4>
								<h4>注册资本: <small><fmt:formatNumber groupingUsed="false"  value="${project.assets }" maxFractionDigits="2"/><p class="p_unit"> 万元</p></small></h4>
								<h4>占地面积: <small><fmt:formatNumber groupingUsed="false"  value="${project.floorArea }" maxFractionDigits="2"/><p class="p_unit"> 亩</p></small></h4>
								<h4>规划面积: <small><fmt:formatNumber groupingUsed="false"  value="${project.planArea }" maxFractionDigits="2"/><p class="p_unit"> 亩</p></small></h4>
								<h4>产品类型: <small>${project.productType }</small></h4>
								<h4>年产量: <small>${project.annualProductAmounr }</small></h4>
								<h4>年销售量: <small>${project.annualSaleAmount }</small></h4>
								<h4>员工人数: <small>${project.employees }<p class="p_unit"> 人</p></small></h4>
								<h4>每亩年纳税: <small><fmt:formatNumber groupingUsed="false"  value="${project.acreRevenue }" maxFractionDigits="2"/><p class="p_unit"> 万元</p></small></h4>
								<h4>每亩投资额: <small><fmt:formatNumber groupingUsed="false"  value="${project.acreGross }" maxFractionDigits="2"/><p class="p_unit"> 万元</p></small></h4>
								<h4>用水负荷: <small><fmt:formatNumber groupingUsed="false"  value="${project.water }" maxFractionDigits="2"/><p class="p_unit"> 吨/天</p></small></h4>
							</div>
						</div >
							<div style="width: 80%; clear: both;" class="my_h">
								<h4>项目备注: <small>${project.note }</small></h4>
							</div>
							<div style=" width: 80%;clear: both;" class="my_h">
								<h4>项目简介: <small>${project.intro }</small></h4>
							</div>
							</div>
						</p>
					</div>
					<div class="tab-pane" id="panel-419303">
						<p>
						
						<table class="table t_titil" style="">
						   <tbody>
						      <tr  class="success">
						         <td style="    width: 90%;">项目计划</td>
						         <td><%-- <img alt="" src="${ctx }/img/u139.gif"> --%><button type="button" class="btn btn-w-m btn-success" id="add_window">新增</button></td>
						      </tr>
						   </tbody>
						</table>
							

						<!-- 项目计划内容 -->
						<table class="table table-stripped toggle-arrow-tiny text-left" id="accountInfos" style="margin-left: 20px;">
							<thead>
								<tr>
									
									
									<th>任务名称</th>
									<th>计划起止时间</th>
									<th>实际起止时间</th>
									<th>任务状态</th>
									<th>涉及单位</th>
									<th>操作</th>
							</thead>
							<tbody id="tableBody">
							</tbody>
							<tfoot>
								<tr>
									<td colspan="9" class="text-center" >
										<!-- 底部分页按钮 -->
										<div id="bottomTab"></div>
									</td>
								</tr>
							</tfoot>
						</table>

						</p>
					</div>
					<div class="tab-pane" id="panel-419304">
						<p>
							<table class="table t_titil" style="">
						   <tbody>
						      <tr  class="success">
						         <td style="    width: 90%;">项目进度</td>
						         <td><button type="button" class="btn btn-w-m btn-success" id="to_window">进度汇报</button></td>
						      </tr>
						   </tbody>
						</table>
						<!-- 项目进度内容 -->
						
						<table class="table" style="margin-left: 20px;height: 70px;   ">
							<thead>
							<tr  class="active">
						         <td>状态</td>
						         <td>项目名</td>
						         <td>计划起止时间</td>
						         <td>实际起止时间</td>
						         <td>项目进度</td>
						        
						      </tr>
							</thead >
						   <tbody id="tbode_schedule">
						   
						   </tbody>
						</table>
						
						</p>
						
						<table class="table t_titil" style="">
						   <tbody>
						      <tr  class="success">
						         <td style="    width: 80%;">进度动态</td>
						         
						      </tr>
						   </tbody>
						</table>
						
						<!-- 进度动态分页 -->
						<table class="table table-stripped toggle-arrow-tiny text-left" id="schedule_Infos" style="text-align: center;width: 70%;margin-left: 30px;">
							
							<tbody id="schedule_tableBody">
							</tbody>
							<tfoot>
								<tr>
									<td colspan="9" class="text-center" >
										<div id="schedule_bottomTab"></div>
									</td>
								</tr>
							</tfoot>
						</table>
						
					</div>
					<div class="tab-pane" id="panel-419305">
						<p>
							<table class="table t_titil" style="">
						   <tbody>
						      <tr  class="success">
						         <td style="    width: 90%;">项目问题</td>
						         <td id="to_problem"><button type="button" class="btn btn-w-m btn-success">问题上报</button></td>
						      </tr>
						   </tbody>
						</table>
						<!-- 项目问题内容 -->
							<div class="container-fluid"　style=" margin-top: 30px;  margin-bottom: 30px;">
								<div class="row-fluid">
									<div class="span12">
										<div class="tabbable" id="tabs-40000">
											<ul class="nav nav-tabs">
												<li class="active" id="p_no_list">
													<a href="#panel-80000" data-toggle="tab">未解决</a>
												</li>
												<li id="p_y_window">
													<a href="#panel-60000" data-toggle="tab">已解决</a>
												</li>
											</ul>
											<div class="tab-content" style="margin-left: 40px;">
												<div class="tab-pane active" id="panel-80000">
													<p>
														<!-- 问题未解决分页 -->
													<table class="table table-stripped toggle-arrow-tiny text-left"  style="text-align: center;width: 70%;">
														<thead>
														<tr  class="active">
													         <td>问题标题</td>
													         <td>上报人</td>
													         <td>上报时间</td>
													         <td>操作</td>
													        
													      </tr>
														</thead >
														<tbody id="problem_no_tableBody">
														</tbody>
														<tfoot>
															<tr>
																<td colspan="9" class="text-center" >
																	
																	<div id="problem_no_bottomTab"></div>
																</td>
															</tr>
														</tfoot>
													</table>
													</p>
												</div>
												<div class="tab-pane" id="panel-60000">
													<p>
														
														<!-- 问题已解决分页 -->
													<table class="table table-stripped toggle-arrow-tiny text-left"  style="text-align: center;width: 70%;">
														<thead>
														<tr  class="active">
													         <td>问题标题</td>
													         <td>上报人</td>
													         <td>上报时间</td>
													         <td>操作</td>
													        
													      </tr>
														</thead >
														<tbody id="problem_y_tableBody">
														</tbody>
														<tfoot>
															<tr>
																<td colspan="9" class="text-center" >
																
																	<div id="problem_y_bottomTab"></div>
																</td>
															</tr>
														</tfoot>
													</table>
													</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						
						
						
						
						</p>
					</div>
				</div>
			</div>
			</div>
		</div>
	</div>
</div>

 <!-- 项目计划模态窗口 -->
<div class="modal inmodal" id="accountEditModal" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog">
				<form class="modal-content animated fadeInDown" id="accountForm">
				
				 
						  
					<div class="modal-header" style="padding: 10px;">
						<button type="button" class="close" data-dismiss="modal" style="margin: 10px 15px 0px 0px;">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h6 class="modal-title">修改项目计划</h6>
					</div>
				<div class="modal-body">
					
						<div class="form-group" style="   margin-left: 20px;">
							    <label for="name">项目计划名：</label>
							    <input type="text" class="form-control" id="name" name="name" placeholder="请输入任务名称" maxlength="60">
						</div>
						<%-- <div class="form-group" style="width: 45%;   float: left;">
						    <label for="weight">权重：</label>
						   <!--  <input type="text" class="form-control" id="weight" name="weight" placeholder="请输入权重"> -->
						    <select id="weight" name="weight">
						    <c:forEach begin="0" end="100"  var="we" step="10">
						    	<option value="${we }">${we }%</option>
						    </c:forEach>
						    </select>
						  </div> --%>
						  <div class="form-group" style="width: 45%;  margin-left: 20px;">
						    <label for="state">任务状态：</label>
						    <div  >
							    <select name="state" id="state" style="width: 70%; ">
							    	<option value="-1">－请选择－</option>
							    	<option value="1">项目未开始</option>
							    	<option value="2">项目进行中</option>
							    	<option value="3">已滞后</option>
							    	<option value="4">严重问题</option>
							    	<option value="5">已取消</option>
							    	<option value="6">已完成</option>
							    </select>
						    </div>
						  </div>
						  
						  <div class="form-group" style="width:45%;float:left;margin-left: 20px;clear: both;">
						    <label for="beginDate">计划开始时间：</label>
						    <input type="text" class="form-control" id="beginDate" name="beginDate" readonly="readonly"   onClick="WdatePicker()" 
						     onFocus="var endDate=$dp.$('endDate');WdatePicker({onpicked:function(){endDate.focus();},maxDate:'#F{$dp.$D(\'endDate\')}'})"/>

						  </div>
						  <div class="form-group" style="width:45%;float:left;    margin-left: 20px;" >
						    <label for="endDate">计划结束时间：</label>
						    <input type="text" class="form-control" id="endDate" name="endDate" readonly="readonly"  onClick="WdatePicker()" 
						     onFocus="WdatePicker({minDate:'#F{$dp.$D(\'beginDate\')}'})"/>
						  </div>
						  <div class="form-group" style="width:45%;float:left;margin-left: 20px;">
						    <label for="s_beginDate">实际开始时间：</label>
						    <input type="text" class="form-control" id="s_beginDate" name="s_beginDate" readonly="readonly"   onClick="WdatePicker()" 
						    onFocus="var endDate=$dp.$('s_endDate');WdatePicker({onpicked:function(){endDate.focus();},maxDate:'#F{$dp.$D(\'s_endDate\')}'})"/>

						  </div>
						  <div class="form-group" style="width:45%;float:left;    margin-left: 20px;" >
						    <label for="s_endDate">实际结束时间：</label>
						    <input type="text" class="form-control" id="s_endDate" name="s_endDate" readonly="readonly"  onClick="WdatePicker()" 
						    onFocus="WdatePicker({minDate:'#F{$dp.$D(\'s_beginDate\')}'})"/>
						  </div>
						   <div class="form-group" style="    clear: both;margin-left: 20px;">
						    <label for="involvedDept">涉及单位：</label>
						    <input type="text" class="form-control" id="involvedDept" name="involvedDept" placeholder="请输入涉及单位" maxlength="60">
						  </div>
						<div class="form-group" style="    clear: both;margin-left: 20px;height: 115px;">
		                    <label for="taskDescribe">任务描述：</label>
		                    <textarea class="form-control" rows="3" cols="50" name="taskDescribe" id="taskDescribe" ></textarea>
		                </div>
		                
		                <div class="form-group" style="margin-left: 20px;">
						    <label for="listNo">序号：</label>
						    <input type="text" class="form-control" id="listNo" name="listNo" placeholder="请输入序号" maxlength="5" onkeyup="value=value.replace(/\D/gi,'')">
						  </div>
						  
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-white" data-dismiss="modal" id="closeAccountInfoForm">关闭</button>
						<button type="submit" class="btn btn-primary" id="confirmAccountInfoForm">提交保存</button>
					</div>
				</form>
			</div>
		</div>
		
		
		<!-- 项目信息模态窗口 -->
		
		<div class="modal inmodal" id="projectEditModal" tabindex="-1" role="dialog"
			aria-hidden="true" >
			<div class="modal-dialog">
				<form class="modal-content animated fadeInDown" id="projectForm" style="width: 800px;    font-size: 15px;">
					<div class="modal-header" style="padding: 10px;">
						<button type="button" class="close" data-dismiss="modal" style="margin: 10px 15px 0px 0px;">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h6 class="modal-title">修改项目信息</h6>
					</div>
					<div class="modal-body">
					<div class="form-group" style="margin-left: 10px;">
						    <label for="name">项目名称：</label>
						    <input type="text" class="form-control" id="name" name="name" placeholder="请输入项目名称" maxlength="60">
						  </div>
						  <div>
						  <div class="form-group" style="width:45%;float:left;    margin-left: 10px;">
						    <label for="no">项目编号：</label>
						    <input type="text" class="form-control" id="no" name="no" placeholder="请输入项目编号" maxlength="10">
						  </div>
						<div class="form-group" style="width:45%;float:left;    margin-left: 10px;">
						    <label for="typeId">项目类型：</label>
						     <div>
							     <select id="typeId" name="typeId">
							     	<c:forEach var="type" items="${typeList }" varStatus="s">
			                           <option value="${type.typeId }">${type.name }</option>
		                        	</c:forEach>
							     </select>  
						     </div>
						  </div>
						  </div>
						  
						  
						
						  <div class="form-group" style="width:45%;float:left;margin-left: 10px;">
						    <label for="state">项目状态：</label>
						    <!-- <input type="text" class="form-control" id="state" name="state" placeholder="请输入项目状态"> -->
						     <div>
							    <select name="state" id="state" >
							    	<option value="1">严重问题</option>
							    	<option value="2">滞后</option>
							    	<option value="3">正常</option>
							    	
							    </select>
						    </div>
						  </div>
						  <div class="form-group" style="width:45%;float:left; margin-left: 10px;"">
						    <label for="priority">优先级：</label>
						    <!-- <input type="text" class="form-control" id="priority" name="priority" placeholder="请输入优先级"> -->
						     <div>
							    <select name="priority" id="priority" >
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
		                 <div class="form-group" style="width:45%;float:left; margin-left: 10px;">
						    <label for="p_beginDate">计划开始时间：</label>
						    <input type="text" class="form-control" id="p_beginDate" name="p_beginDate" readonly="readonly"   onClick="WdatePicker()" 
						    	onFocus="var endDate=$dp.$('p_endDate');WdatePicker({onpicked:function(){endDate.focus();},maxDate:'#F{$dp.$D(\'p_endDate\')}'})"/>

						  </div>
						  <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="p_endDate">计划结束时间：</label>
						    <input type="text" class="form-control" id="p_endDate" name="p_endDate" readonly="readonly"  onClick="WdatePicker()" 
						    onFocus="WdatePicker({minDate:'#F{$dp.$D(\'p_beginDate\')}'})"/>
						  </div>
						  <div class="form-group" style="width:45%;float:left; margin-left: 10px;">
						    <label for="ps_beginDate">实际开始时间：</label>
						    <input type="text" class="form-control" id="ps_beginDate" name="ps_beginDate" readonly="readonly"   onClick="WdatePicker()" 
						    	onFocus="var endDate=$dp.$('ps_endDate');WdatePicker({onpicked:function(){endDate.focus();},maxDate:'#F{$dp.$D(\'ps_endDate\')}'})"/>

						  </div>
						  <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="ps_endDate">实际结束时间：</label>
						    <input type="text" class="form-control" id="ps_endDate" name="ps_endDate" readonly="readonly"  onClick="WdatePicker()" 
						    onFocus="WdatePicker({minDate:'#F{$dp.$D(\'ps_beginDate\')}'})"/>
						  </div>
						  <!--ietdh  -->
						  <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="respDept">负责单位：</label>					    <input type="text" class="form-control" id="respDept" name="respDept" maxlength="60" readonly="readonly"/><p class="p_unit a_unit" ><button type="button" class="btn btn-primary btn-outline btn-xs ">选择单位</button></p>
						   <input type="hidden" id="respDept_id" name="respDept_id">
						  </div>
						  <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="deputyDept">代建单位：</label>
						    <input type="text" class="form-control" id="deputyDept" name="deputyDept" readonly="readonly"  maxlength="60"/><p class="p_unit a_unit" ><button type="button" class="btn btn-primary btn-outline btn-xs ">选择单位</button></p>
						  <input type="hidden" id="deputyDept_id" name="deputyDept_id">
						  </div>
						  <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="ownerDept">业主单位：</label>
						    <input type="text" class="form-control" id="ownerDept" name="ownerDept" readonly="readonly"  maxlength="60"/><p class="p_unit a_unit" ><button type="button" class="btn btn-primary btn-outline btn-xs ">选择单位</button></p>
						   <input type="hidden" id="ownerDept_id" name="ownerDept_id">
						  </div>
						  <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="supDept">监理单位：</label>
						    <input type="text" class="form-control" id="supDept" name="supDept" maxlength="60" />
						  </div>
						  <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="builderDept">施工单位：</label>
						    <input type="text" class="form-control" id="builderDept" name="builderDept" maxlength="60" />
						  </div>
						  <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="designDept">设计单位：</label>
						    <input type="text" class="form-control" id="designDept" name="designDept" maxlength="60"  />
						  </div>
						  <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="investor">投资主体：</label>
						    <input type="text" class="form-control" id="investor" name="investor" maxlength="60" />
						  </div>
						   <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="investment">计划投资：</label>
						    <input type="text" class="form-control num-test" id="investment" name="investment"  onkeyup="value=value.replace(/[^\d.]/g,'')" maxlength="14" />
						    <p class="p_unit">万元</p>
						  </div>
						
						  <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="gross">投资总额：</label>
						    
						    <input type="text" class="form-control num-test" id="gross" name="gross"  onkeyup="value=value.replace(/[^\d.]/g,'')"  maxlength="14"/><p class="p_unit">万元</p>
						   
						    
						  </div>
						   <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="assets">注册资本：</label>
						    <input type="text" class="form-control num-test" id="assets" name="assets" onkeyup="value=value.replace(/[^\d.]/g,'')" maxlength="14"/><p class="p_unit">万元</p>
						  </div>
						   <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="address">注册地址：</label>
						    <input type="text" class="form-control" id="address" name="address" maxlength="60" />
						  </div>
						   <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="floorArea">占地面积：</label>
						    <input type="text" class="form-control num-test" id="floorArea" name="floorArea" onkeyup="value=value.replace(/[^\d.]/g,'')" maxlength="14"/><p class="p_unit">亩</p>
						  </div>
						   <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="coveredArea">建筑面积：</label>
						    <input type="text" class="form-control num-test" id="coveredArea" name="coveredArea" onkeyup="value=value.replace(/[^\d.]/g,'')" maxlength="14"/><p class="p_unit">平方米</p>
						  </div>
						   <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="planArea">规划面积：</label>
						    <input type="text" class="form-control num-test" id="planArea" name="planArea" onkeyup="value=value.replace(/[^\d.]/g,'')" maxlength="14"/><p class="p_unit">亩</p>
						  </div>
						   <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="capacity">产能：</label>
						    <input type="text" class="form-control" id="capacity" name="capacity" maxlength="20" />
						  </div>
						   
						   <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="productType">产品类型：</label>
						    <input type="text" class="form-control" id="productType" name="productType"  maxlength="60"/>
						  </div>
						   <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="annualProductValue">年产值：</label>
						    <input type="text" class="form-control num-test" id="annualProductValue" name="annualProductValue"  onkeyup="value=value.replace(/[^\d.]/g,'')" maxlength="14"/><p class="p_unit">万元</p>
						  </div>
						   <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="annualProductAmounr">年产量：</label>
						    <input type="text" class="form-control" id="annualProductAmounr" name="annualProductAmounr" maxlength="60" />
						  </div>
						   <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="annualSaleValue">年销售额：</label>
						    <input type="text" class="form-control num-test" id="annualSaleValue" name="annualSaleValue"  onkeyup="value=value.replace(/[^\d.]/g,'')" maxlength="14"/><p class="p_unit">万元</p>
						  </div>
						   <div class="form-group" style="width:45%;float:left;    margin-left: 10px;" >
						    <label for="annualSaleAmount">年销售量：</label>
						    <input type="text" class="form-control" id="annualSaleAmount" name="annualSaleAmount"  maxlength="60"/>
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
						    <input type="text" class="form-control" id="site" name="site"   placeholder="请输入项目选址" maxlength="60">
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
						<button  class="btn btn-w-m btn-success" id="seaveInfoForm">提交保存</button>
					</div>
				</form>
			</div>
		</div>
		
		<!-- 模态窗口 -->
		
		 <!-- 进度汇报模态窗口 -->
		<div class="modal inmodal" id="scheduleEditModal" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog">
				<form class="modal-content animated fadeInDown" id="scheduleForm" enctype="multipart/form-data">
				
				 
						  
					<div class="modal-header" style="padding: 10px;">
						<button type="button" class="close" data-dismiss="modal" style="margin: 10px 15px 0px 0px;">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h6 class="modal-title">进度汇报</h6>
					</div>
				<div class="modal-body">
					
						<div class="form-group" style="   margin-left: 20px;">
							    <label for="name">项目名：</label>
							    <input type="text" class="form-control" value="${project.name }" readonly="readonly">
						</div>
						
						  <div class="form-group" style="width: 45%; float: left; margin-left: 20px;">
						    <label for="state">项目状态：</label>
						    <div  >
							    <select name="state" id="state" style="width: 70%;display: inline; ">
							    	<option value="-1">－请选择－</option>
							    	<option value="3">正常</option>
							    	<option value="2">已滞后</option>
							    	<option value="1">严重问题</option>
							    	
							    </select>
						    </div>
						  </div>
						  <div class="form-group" style="width: 45%;  float: left; margin-left: 20px;">
						    <label for="progress">项目进度：</label>
						    <input type="text" class="form-control" id="progress" name="progress" placeholder="请输入任务进度" maxlength="3" onkeyup="value=value.replace(/\D/gi,'')"><p class="p_unit">%</p>
						  </div>
						  
						  <div class="form-group" style="width:45%;float:left;margin-left: 20px;"">
						    <label for="r_beginDate">计划开始时间：</label>
						    <input type="text" class="form-control" id="r_beginDate" name="r_beginDate" readonly="readonly"   onClick="WdatePicker()" 
						    	onFocus="var endDate=$dp.$('r_endDate');WdatePicker({onpicked:function(){endDate.focus();},maxDate:'#F{$dp.$D(\'r_endDate\')}'})"/>

						  </div>
						  <div class="form-group" style="width:45%;float:left;    margin-left: 20px;" >
						    <label for="r_endDate">计划结束时间：</label>
						    <input type="text" class="form-control" id="r_endDate" name="r_endDate" readonly="readonly"  onClick="WdatePicker()" 
						    onFocus="WdatePicker({minDate:'#F{$dp.$D(\'r_beginDate\')}'})"/>
						  </div>
						  <div class="form-group" style="width:45%;float:left;margin-left: 20px;">
						    <label for="rs_beginDate">实际开始时间：</label>
						    <input type="text" class="form-control" id="rs_beginDate" name="rs_beginDate" readonly="readonly"   onClick="WdatePicker()" 
						    onFocus="var endDate=$dp.$('rs_endDate');WdatePicker({onpicked:function(){endDate.focus();},maxDate:'#F{$dp.$D(\'rs_endDate\')}'})"/>

						  </div>
						  <div class="form-group" style="width:45%;float:left;    margin-left: 20px;" >
						    <label for="rs_endDate">实际结束时间：</label>
						    <input type="text" class="form-control" id="rs_endDate" name="rs_endDate" readonly="readonly"  onClick="WdatePicker()" 
						    onFocus="WdatePicker({minDate:'#F{$dp.$D(\'rs_beginDate\')}'})"/>
						  </div>
						   <div class="" style="clear: both;margin-left: 20px;margin-bottom: 10px;" id="s_d">
						    <label for="involvedDept">进度依据：</label>
						    <div>
							    <button type="button" class="btn btn-primary" id="s_a">添加附件</button>
						    </div>
						    <div id="s_f1" style="position:relative">
						        <input type="text" class="form-control"  id="s_f1attr1" readonly="readonly"/>
							    <input type="file" class="form-control s_i" id="attr1" name="attr1" style="display:none" accept="image/*"/><button  type="button" class="btn btn-primary s_d">删除</button>
						    </div>
						    <div id="s_f2">
						        <input type="text" class="form-control"  id="s_f2attr2" readonly="readonly"/>
							    <input type="file" class="form-control s_i" id="attr2" name="attr2"  style="display:none" accept="image/*"/><button  type="button" class="btn btn-primary s_d">删除</button>
						    </div>
						    <div id="s_f3">
						        <input type="text" class="form-control" id="s_f3attr3" readonly="readonly" />
							    <input type="file" class="form-control s_i" id="attr3" name="attr3"  style="display:none" accept="image/*"/><button  type="button" class="btn btn-primary s_d">删除</button>
						    </div>
						    <div id="s_f4">
						        <input type="text" class="form-control" id="s_f4attr4" readonly="readonly" />
							    <input type="file" class="form-control s_i" id="attr4" name="attr4"  style="display:none" accept="image/*"/><button  type="button" class="btn btn-primary s_d">删除</button>
						    </div>
						    <div id="s_f5">
						        <input type="text" class="form-control" id="s_f5attr5"  readonly="readonly"/>
							    <input type="file" class="form-control s_i" id="attr5" name="attr5"  style="display:none" accept="image/*"/><button  type="button" class="btn btn-primary s_d">删除</button>
						    </div>
						    <div id="s_f6">
						        <input type="text" class="form-control" id="s_f6attr6"  readonly="readonly"/>
							    <input type="file" class="form-control s_i" id="attr6" name="attr6" style="display:none"  accept="image/*"/><button  type="button" class="btn btn-primary s_d">删除</button>
						    </div>
						    <!-- <input type="button" value="增加" onclick="additem('tb')"/><br/>
 							<table cellspacing="0" id="tb" style="width:400px"></table> -->
						  </div>
						<div class="form-group" style="clear: both;margin-left: 20px;height: 110px;">
		                    <label for="describes">进度描述：</label>
		                    <textarea class="form-control" rows="3" cols="50" name="describes" id="describes" ></textarea>
		                </div>
		                
					<div class="modal-footer">
						<button type="button" class="btn btn-white" data-dismiss="modal" id="closeAccountInfoForm">关闭</button>
						<button type="submit" class="btn btn-primary" id="confirmAccountInfoForm">提交保存</button>
					</div>
				</form>
			</div>
		</div>
		<!-- 模态窗口 -->
		
		
		
		 <!--查看 进度模态窗口 -->
		<div class="modal inmodal" id="show_scheduleEditModal" tabindex="-1" role="dialog" 
			aria-hidden="true">
			<div class="modal-dialog">
				<form class="modal-content animated fadeInDown" id="show_scheduleForm" style="width: 800px;">
				
				 
						  
					<div class="modal-header" style="padding: 10px;">
						<button type="button" class="close" data-dismiss="modal" style="margin: 10px 15px 0px 0px;">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h6 class="modal-title">项目进度详情</h6>
					</div>
					<div style="font-size: 18px;margin-left: 40px;line-height:40px;margin-top: 30px;margin-bottom: 40px;margin-right: 40px;">
						<div>项目名称:<div class="s_p"> ${project.name }</div></div> 
						<div>计划起止时间: <div class="s_p"><p id="s_p_BeginDate" style=""></p><p id="s_p_EndDate">
								<fmt:formatDate value="${project.planBeginDate }" pattern="yyyy年MM月dd日"/>
									&nbsp&nbsp/&nbsp&nbsp
								<fmt:formatDate value="${project.planEndDate }" pattern="yyyy年MM月dd日"/>
						</p></div></div>
						<div>实际起止时间: <div class="s_p"><p id="s_a_BeginDate"><p id="s_a_EndDate">
								<fmt:formatDate value="${project.actualBeginDate }" pattern="yyyy年MM月dd日"/>
								&nbsp&nbsp/&nbsp&nbsp
								<fmt:formatDate value="${project.actualEndDate }" pattern="yyyy年MM月dd日"/>
						</p></p></div></div>
						<div>项目状态: <div class="s_p"><p id="s_a_state"></p></div></div>
						<div>项目进度: <div class="s_p"><p id="s_a_progress"></p> %</div></div>
						<div>
						    <div>进度依据:</div> 
						    <div class="s_p"> 
						        <p id="s_a_according">
						  
						        </p></div></div>
						<div>进度描述: <div class="s_p"><p id="s_a_describes" ></p></div></div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-white" data-dismiss="modal" >关闭</button>
					</div>
				</form>
			</div>
		</div>
		
		<!-- 问题上报模态窗口 -->
		<div class="modal inmodal" id="problemEditModal" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog">
				<form class="modal-content animated fadeInDown" id="problemForm" enctype="multipart/form-data" style="width: 800px;">
				
				 
						  
					<div class="modal-header" style="padding: 10px;">
						<button type="button" class="close" data-dismiss="modal" style="margin: 10px 15px 0px 0px;">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h6 class="modal-title">任务问题上报</h6>
					</div>
				<div class="modal-body">
					<input type="hidden" id="problemId" name="problemId" >
						
						 <!--  <div class="form-group" style="width: 45%; float: left; margin-left: 20px;">
						    <label for="get_progress">所属任务：</label>
						    <div >
							    <select name="get_progress" id="get_progress" style="width: 70%;display: inline; ">
							    	
							    </select>
						    </div>
						  </div> -->
						   <div class="form-group" style="width: 90%; float: left; margin-left: 20px;">
						    <label for="get_progress">项目名：</label>
						    <div >
							   <input type="text" class="form-control" value="${project.name  }" readonly="readonly" >
						    </div>
						  </div>
						  <div class="form-group" style="width: 91%;clear: both; margin-left: 20px;">
						    <label for="title">问题标题：</label>
						    <input type="text" class="form-control" id="title" name="title" placeholder="请输入问题标题" maxlength="60">
						  </div>
						 
						  <div class="" style="width: 70%;clear: both; margin-left: 20px;">
						    <label for="solve">问题状态：</label>
						    <div class="radio">
							   <label>
							      <input type="radio" name="solve" id="solve" style="margin-top: 3px;"
							         value="1" checked> 未解决
							   </label>
							    <label>
							      <input type="radio" name="solve" id="solve" style="margin-top: 3px;"
							         value="2">
							         已解决
							   </label>
							</div>
							
						  </div>
						
	
   
						  	
					
						
						<div class="form-group" style="clear: both;margin-left: 20px;height: 110px;">
		                    <label for="p_describes">问题描述：</label>
		                    <textarea class="form-control" rows="3" cols="50" name="p_describes" id="p_describes" ></textarea>
		                </div>
		                
		                <div class="" style="float: left; margin-left: 20px;margin-bottom: 10px;width: 79%;" id="p_d">
						    <label for="attach1">问题说明：</label>
						    <div>
							    <button type="button" class="btn btn-primary" id="p_a">添加附件</button>
						    </div>
						    <div id="p_f1">
						    	<input type="text" class="form-control"  id="p_f1attach1" readonly="readonly"/>
							    <input type="file" class="form-control s_i" id="attach1" name="attach1" style="display:none" accept="image/*" /><button  type="button" class="btn btn-primary p_d">删除</button>
						    </div>
						    <div id="p_f2">
						    <input type="text" class="form-control"  id="p_f2attach2" readonly="readonly"/>
							    <input type="file" class="form-control s_i" id="attach2" name="attach2" style="display:none"  accept="image/*" /><button  type="button" class="btn btn-primary p_d">删除</button>
						    </div>
						    <div id="p_f3">
						    <input type="text" class="form-control"  id="p_f3attach3" readonly="readonly"/>
							    <input type="file" class="form-control s_i" id="attach3" name="attach3" style="display:none"  accept="image/*" /><button  type="button" class="btn btn-primary p_d">删除</button>
						    </div>
						    <div id="p_f4">
						    <input type="text" class="form-control"  id="p_f4attach4" readonly="readonly"/>
							    <input type="file" class="form-control s_i" id="attach4" name="attach4" style="display:none"  accept="image/*" /><button  type="button" class="btn btn-primary p_d">删除</button>
						    </div>
						    <div id="p_f5">
						    <input type="text" class="form-control"  id="p_f5attach5" readonly="readonly"/>
							    <input type="file" class="form-control s_i" id="attach5" name="attach5" style="display:none" accept="image/*"  /><button  type="button" class="btn btn-primary p_d">删除</button>
						    </div>
						    <div id="p_f6">
						    <input type="text" class="form-control"  id="p_f6attach6" readonly="readonly"/>
							    <input type="file" class="form-control s_i" id="attach6" name="attach6" style="display:none"  accept="image/*" /><button  type="button" class="btn btn-primary p_d">删除</button>
						    </div>
						   
						  </div>
						  
						  <div id="p_img" style="margin-left: 20px;"></div>
						  
						   <div class="form-group" style="width:91%;clear: both; margin-left: 20px;">
						    <label for="p_involvedDept">涉及单位：</label>
						    <input type="text" class="form-control" id="p_involvedDept" name="p_involvedDept" placeholder="请输入涉及单位" maxlength="60">
						  </div>
						  
					
						  
						   <div class="form-group" style="clear: both;margin-left: 20px;height: 110px;">
		                    <label for="solution">解决建议：</label>
		                    <textarea class="form-control" rows="3" cols="50" name="solution" id="solution" ></textarea>
		                </div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-white" data-dismiss="modal" >关闭</button>
						<button type="submit" class="btn btn-primary" >提交保存</button>
					</div>
				</form>
			</div>
		</div>
		<!-- 模态窗口 -->	
		
		<!-- 问题详情模态窗口 -->
		<div class="modal inmodal" id="problem_detailsEditModal" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog">
				<form class="modal-content animated fadeInDown" id="problem_detailsForm" enctype="multipart/form-data" style="    width: 800px;">
				
					<div class="modal-header" style="padding: 10px;">
						<button type="button" class="close" data-dismiss="modal" style="margin: 10px 15px 0px 0px;">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h6 class="modal-title">任务问题详情</h6>
					</div>
			<input type="hidden" id="prob_id">
					<div class="container-fluid" style="font-size: 18px;line-height: 30Px;margin: 25px 25px 25px 25px;">
						<div class="row-fluid">
							<div class="span12">
								<h4 class="text-center" id="p_d_title" style="font-size: 22px;">
									
								</h4>
								<div class="text-center" style="text-align: center">
									<div style="display: inline;margin-right: 23px;" id="p_d_name"></div><div style="display: inline;" id="p_d_time"></div>
								</div>
								<p class="text-center" >
									<div id="p_d_center"></div>
								</p>
								<div class="row-fluid" id="p_d_according">
									
								</div>
								<blockquote>
									<p>
										涉及单位:
									</p> <div id="p_d_involvedDept"> </div>
								</blockquote>
								<blockquote>
									<p>
										解决建议:
									</p> <div id="p_d_solution"> </div>
								</blockquote>
								<div class="row-fluid" id="row_fluid">
									<div class="span12">
									<div class="form-group" style="height: 142px;">
									    <label for="p_d_comment">评论:</label>
									    <textarea class="form-control" rows="4" id="p_d_comment" placeholder="请输入评论"></textarea>
									  </div>
									  <div id="p_d_publish"><button type="button" class="btn btn-primary" style="margin-left: 625px;">发表</button></div>
									</div>
								</div>
								<div style="background-color: gainsboro;margin-top: 10px;">评论列表:</div>
								<div class="container-fluid"  id="p_d_com" style="font-size: 15px;margin-top: 30px;">
									
								</div>
								
							</div>
						</div>
					</div>
				
		
					<div class="modal-footer">
						<button type="button" class="btn btn-white" data-dismiss="modal" >关闭</button>
					</div>
				</form>
			</div>
		</div>
		
	
<!-- 编辑问题图片模态窗口 -->
		<div class="modal inmodal" id="problem_img_detailsEditModal" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog">
				<form class="modal-content animated fadeInDown" id="problem_img_detailsForm" enctype="multipart/form-data" style="    width: 800px;">
				
					<div class="modal-header" style="padding: 10px;">
						<button type="button" class="close" data-dismiss="modal" style="margin: 10px 15px 0px 0px;">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h6 class="modal-title">图片编辑</h6>
					</div>
					
							<div id="problem_img" style="width: 90%;margin: 20px 20px 20px 20px;display: inherit;"></div>
							<input type="file" id="edtimg" name="edtimg" style="display: none;">
							<input type="file" id="insertimg" name="insertimg" style="display: none;">
							<input type="hidden" id="problemId" name="problemId">
							<input type="hidden" id="count_img" name="count_img">
					<div class="modal-footer">
						<button type="button" class="btn btn-w-m btn-success" id="insert_img">新增图片</button>
						<button type="button" class="btn btn-white" data-dismiss="modal" >关闭</button>
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
	<script src="${ctx  }/js/system/getDatas.js"></script>
	<script src="${ctx  }/My97DatePicker/WdatePicker.js"></script>
	<script>
		$(document).ready(function() {
			$(".i-checks").iCheck({
				checkboxClass : "icheckbox_square-green",
				radioClass : "iradio_square-green",
			});
		});
		$(function(){
			$("#taskDescribe").keyup(function(){
				   var len = $(this).val().length;
				   if(len > 190){
				    $(this).val($(this).val().substring(0,190));
				   }
				  
				  /*  var num = 140 - len;
				   $("#word").text(num); */
				  });
			$("#intro").keyup(function(){
				   var len = $(this).val().length;
				   if(len > 1000){
				    $(this).val($(this).val().substring(0,1000));
				   }
				  });
			$("#note").keyup(function(){
				   var len = $(this).val().length;
				   if(len > 190){
				    $(this).val($(this).val().substring(0,190));
				   }
				  });
			$("#describes").keyup(function(){
				   var len = $(this).val().length;
				   if(len > 490){
				    $(this).val($(this).val().substring(0, 490));
				   }
				  });
			$("#p_describes").keyup(function(){
				   var len = $(this).val().length;
				   if(len > 490){
				    $(this).val($(this).val().substring(0, 490));
				   }
				  });
			$("#solution").keyup(function(){
				   var len = $(this).val().length;
				   if(len > 490 ){
				    $(this).val($(this).val().substring(0, 490));
				   }
				  });
			$("#p_d_comment").keyup(function(){
				   var len = $(this).val().length;
				   if(len > 190){
				    $(this).val($(this).val().substring(0,190));
				   }
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
	<script src="${ctx  }/js/system/project_info.js"></script>
	
</body>

</html>