/**
 * created by chenxj
 */
$(function(){
	get_project_title();
});
//项目信息标题
function get_project_title(){
	var pro_id=$("#project_id").val();
	$.ajax({
		type : "POST",
		url : urlRootContext() + "/getProjectInfo",
		data : {"projectId":pro_id},
		dataType : "json",
		success : function(response) {
				$("#project_title").data("projectData", response);
			
			$("#project_title").empty();
			
			var str='<div class="my_h" >';
			str+='<h4>项目类型: <small>'+$("#project_type").val()+'</small></h4>';
			str+='<h4>项目状态: <small><img alt="" src="'+urlRootContext()+getProject_info_state(response.state)+'"></small></h4>';
			str+='<h4>计划起止时间: <small>'+trim_date(response.planBeginDate)+'&nbsp&nbsp/&nbsp&nbsp'+trim_date(response.planEndDate)+'</small></h4></div>';
			str+='<div class="my_h" >';
			str+='<h4>项目编号: <small>'+response.no+'</small></h4>';
			str+='<h4>项目优先级: <small>'+getProject_info_priority(response.priority)+'</small></h4>';
			str+='<h4 style="display: inline-table;">项目进度: <small style="float: right;">'+getProgress_bar(response.progress)+'</small></h4></div>';
			$("#project_title").append(str);
			
			$("#tbode_schedule").empty();
			var str2='<tr  class="warning">';
			str2+='<td><img alt="" src="'+urlRootContext()+getProject_info_state(response.state)+'"></td>';
			str2+='<td style="width:400px;">'+response.name+'</td>';
			str2+='<td>'+trim_date(response.planBeginDate)+'&nbsp&nbsp/&nbsp&nbsp'+trim_date(response.planEndDate)+'</td>';
			str2+='<td>'+trim_date(response.actualBeginDate)+'&nbsp&nbsp/&nbsp&nbsp'+trim_date(response.actualEndDate)+'</td>';
			str2+='<td>'+getProgress_bar(response.progress)+'</td></tr>';
			
			$("#tbode_schedule").append(str2);
			
			$("#date_p").text(trim_date(response.planBeginDate)+' / '+trim_date(response.planEndDate));
			$("#date_a").text(trim_date(response.actualBeginDate)+' / '+trim_date(response.actualEndDate))
			
		}
	});
	
}
var type;
var taskId;

/* table data start */
var PAGESIZE = 8;
var currentPage = 1;
var totalPage = 0;
var numberOfPages = 5;
var taskIdModify;
var options = {
	containerClass : "pagination",
	currentPage : currentPage, // 当前页数
	totalPages : totalPage, // 总页数
	size : "normal",
	alignment : "center",
	numberOfPages : numberOfPages,
	itemTexts : function(type, page, current) {
		switch (type) {
		case "first":
			return "第一页";
		case "prev":
			return "前一页";
		case "next":
			return "后一页";
		case "last":
			return "最后页";
		case "page":
			return page;
		}
	},
	onPageChanged : function(event, oldPage, newPage) {
	
		currentPage = newPage;
		
		buildTable('', newPage, PAGESIZE);// 默认每页最多6条
		reloadEvent();
	},
	onPageClicked : function(e, originalEvent, type, page) {

	}
}

var options2 = {
		containerClass : "pagination",
		currentPage : currentPage, // 当前页数
		totalPages : totalPage, // 总页数
		size : "normal",
		alignment : "center",
		numberOfPages : numberOfPages,
		itemTexts : function(type, page, current) {
			switch (type) {
			case "first":
				return "第一页";
			case "prev":
				return "前一页";
			case "next":
				return "后一页";
			case "last":
				return "最后页";
			case "page":
				return page;
			}
		},
		onPageChanged : function(event, oldPage, newPage) {
			
			currentPage = newPage;
			var reqData={"type":"1"};
			problem_no_List(JSON.stringify(reqData),newPage, PAGESIZE);
		},
	}
var options3 = {
		containerClass : "pagination",
		currentPage : currentPage, // 当前页数
		totalPages : totalPage, // 总页数
		size : "normal",
		alignment : "center",
		numberOfPages : numberOfPages,
		itemTexts : function(type, page, current) {
			switch (type) {
			case "first":
				return "第一页";
			case "prev":
				return "前一页";
			case "next":
				return "后一页";
			case "last":
				return "最后页";
			case "page":
				return page;
			}
		},
		onPageChanged : function(event, oldPage, newPage) {
			
			currentPage = newPage;
			var reqData={"type":"2"};
			problem_y_List(JSON.stringify(reqData),newPage, PAGESIZE);
		},
		onPageClicked : function(e, originalEvent, type, page) {

		}
	}
var options4 = {
		containerClass : "pagination",
		currentPage : currentPage, // 当前页数
		totalPages : totalPage, // 总页数
		size : "normal",
		alignment : "center",
		numberOfPages : numberOfPages,
		itemTexts : function(type, page, current) {
			switch (type) {
			case "first":
				return "第一页";
			case "prev":
				return "前一页";
			case "next":
				return "后一页";
			case "last":
				return "最后页";
			case "page":
				return page;
			}
		},
		onPageChanged : function(event, oldPage, newPage) {
			
			currentPage = newPage;
			var reqData={"commName":$("#commName").val()};
			get_unit(JSON.stringify(reqData),newPage, PAGESIZE);
		},
		onPageClicked : function(e, originalEvent, type, page) {

		}
	}
var options5 = {
		containerClass : "pagination",
		currentPage : currentPage, // 当前页数
		totalPages : totalPage, // 总页数
		size : "normal",
		alignment : "center",
		numberOfPages : numberOfPages,
		itemTexts : function(type, page, current) {
			switch (type) {
			case "first":
				return "第一页";
			case "prev":
				return "前一页";
			case "next":
				return "后一页";
			case "last":
				return "最后页";
			case "page":
				return page;
			}
		},
		onPageChanged : function(event, oldPage, newPage) {
			
			currentPage = newPage;
			var reqData={"commName":$("#commName").val()};
			pageList('',newPage, PAGESIZE);
		},
		onPageClicked : function(e, originalEvent, type, page) {

		}
	}

// 加载项目计划
$("#getProject_type").live('click', function() {
	/*
	 * 项目计划表单验证
	 */
	setDefaultValidator(accountFormValidator);
	buildTable('', 1, 8, $("#project_id").val());

});

// 生成表格
function buildTable(reqData, pageNumber, pageSize, id) {

	var url = urlRootContext() + "/get_project_task"; // 请求的网址

	var reqParams = {
		'reqData' : reqData,
		'pageNumber' : pageNumber,
		'pageSize' : pageSize,
		'id' : $("#project_id").val()
	};// 请求数据
	$(function() {
		$
				.ajax({
					type : "POST",
					url : url,
					data : reqParams,
					dataType : "json",
					success : function(response) {
						if (response.success) {
							totalPage = response.data.pages;
							options.totalPages = (totalPage == 0 ? 1
									: totalPage);
							options.currentPage = pageNumber;
							$('#bottomTab').bootstrapPaginator(options); // 重新设置总页面数目
							var dataList = response.data.dataList;
							$("#tableBody").empty();// 清空表格内容
							if (dataList.length > 0) {
								$(dataList)
										.each(
												function() {// 重新生成


													var str = '<tr id="'
															+ this.taskId
															+ '">' +

															'<td style="width: 300px;">' + this.name
															+ '</td>';

													str += '<td >'
															+ trim_date(this.planBeginDate);
													str += '&nbsp&nbsp/&nbsp&nbsp '
															+ trim_date(this.planEndDate)
															+ '</td>';

													str += '<td >'
															+ trim_date(this.actualBeginDate);
													str += ' &nbsp&nbsp/&nbsp&nbsp '
															+ trim_date(this.actualEndDate)
															+ '</td>'
															+'<td style="width: 100px;">'+getTask_state(this.state)+'</td>'
															+ '<td style="width: 300px;">'
															+ this.involvedDept
															+ '</td>';

													str += '<td><button type="button" class="btn btn-primary btn-outline btn-xs modify">修改</button><button type="button" id="deleteAccount" class="btn btn-primary btn-outline btn-xs delete">删除</button>'
															+ '</td></tr>';
													$("#tableBody").append(str);
													$("#" + this.taskId).data(
															"userDatas", this);
												});
								$(".i-checks").iCheck({
									checkboxClass : "icheckbox_square-green",
								});
								// 重载事件
								reloadEvent();
							} else {
								$("#tableBody")
										.append(
												'<tr><th colspan ="7"><center>查询无数据</center></th></tr>');
							}
						} else {
							swal(response.message);
						}
					},
					error : function(e) {
						
					}
				});
	});
}

/* table data end */

var selectedArr = new Array();

// 重载事件
function reloadEvent() {
	

	// 修改项目计划信息
	$("#tableBody td .modify").click(
			function(event) {
				taskId = $(this).parent().parent().attr("id");
				var userDatas = $("#" + taskId).data("userDatas");

				type = 2;// 修改
//				 $("#accountEditModal #name").attr("readonly",true);
				$("#accountEditModal .modal-title").html("修改项目计划");
				$("#accountEditModal #name").val(userDatas.name);
				$("#accountEditModal #weight").val(userDatas.weight);
				$("#accountEditModal #state").val(userDatas.state);
				$("#accountEditModal #listNo").val(userDatas.listNo);
				
				$("#accountEditModal #involvedDept")
						.val(userDatas.involvedDept);

				$("#accountEditModal #s_beginDate").val(
						trim_date(userDatas.actualBeginDate));
				$("#accountEditModal #s_endDate").val(
						trim_date(userDatas.actualEndDate));
				$("#accountEditModal #beginDate").val(
						trim_date(userDatas.planBeginDate));
				$("#accountEditModal #endDate").val(
						trim_date(userDatas.planEndDate));

				$("#accountEditModal #taskDescribe")
						.val(userDatas.taskDescribe);

				$("#accountEditModal").modal("show");
			});

}

// 新增项目计划
$("#add_window").click(function() {

	type = 1;// 新增
	 $("#accountEditModal #name").attr("readonly",false);
	$("#accountEditModal .modal-title").html("新增项目计划");

	$('#accountForm')[0].reset();

	$("#accountEditModal").modal("show");

});

// 删除
$("#deleteAccount")
		.live(
				"click",
				function() {
					taskId = $(this).parent().parent().attr("id");
					swal(
							{
								title : "确定删除选中项?",
								text : "你将删除选中的项目计划!",
								type : "warning",
								showCancelButton : true,
								confirmButtonColor : "#DD6B55",
								confirmButtonText : "是的，删除",
								cancelButtonText : "取消",
								closeOnConfirm : false
							},
							function() {
								$
										.ajax({
											type : "POST",
											url : urlRootContext()
													+ "/delete_project_task/",
											traditional : true,
											data : {
												"selectedArr" : selectedArr,
												"taskId" : taskId
											},
											dataType : "json",
											success : function(response) {
												if (response.success) {
													swal("已删除!",
															"你已删除选中的项目计划！",
															"success");
													currentPage = (selectedArr.length == ($("#tableBody tr ")
															.size())) ? currentPage - 1
															: currentPage;
													if(currentPage<1){
											     		currentPage=1;
											     	}
													buildTable("", currentPage,
															PAGESIZE,
															$("#project_id")
																	.val());
													reloadEvent();
												} else {
													swal(response.message);
												}
											},
											error : function(e) {
												swal("删除失败！", "", "error");
											}
										});
							});

				});

/*
 * 项目计划表单验证
 */
function accountFormValidator() {

	var e = "<i class='fa fa-times-circle'></i> ";
	$("#accountForm").validate({
		rules : {
			
			state : {
				isChoose : !0,

			},
			name : {
				required : !0,
			},

		},
		messages : {
			

			name : {
				required : e + "请输入项目名称！",
			},
		
			
			state : {
				isChoose : e + "请选择项目状态！",
			}
			
		},
		submitHandler : function(form) {
			saveTaskInfo(form);
		}
	});
}

/**
 * 保存项目计划
 */
var saveTaskInfo = function(form) {

	$.ajax({
		type : "post",
		url : urlRootContext() + "/save_project_task",
		traditional : true,
		data : /*
				 * { "type":type, $("#accountForm").serialize() }
				 */
		$.param({
			'type' : type,
			"taskId" : taskId,
			"projectId":$("#project_id").val()
		}) + '&' + $('#accountForm').serialize(),
		dataType : "json",
		success : function(data) {
			if (data.success) {
				swal({
					title : data.message,
					type : "success",
					confirmButtonColor : "#DD6B55",
					confirmButtonText : "确定",
					closeOnConfirm : true
				},
						function() {

							buildTable("", currentPage, PAGESIZE, $("#project_id").val());// 默认空白查全部

							$("#accountEditModal").modal("hide");
							
						});
			} else {
				swal(data.message);
			}
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			swal("失败")
		}
	});
}


// 修改项目信息
$("#edte_window ").click(
		function() {

			$.ajax({
				type : "post",
				url : urlRootContext() + "/getProjectInfo",
				data : {
					"projectId" : $("#project_id").val()
				},
				dataType : "json",
				success : function(userDatas) {
					if (userDatas != null) {
						
						$("#projectEditModal #name").attr("readonly", true);
						$("#projectEditModal .modal-title").html("修改项目信息");
						$("#projectEditModal #name").val(userDatas.name);
						$("#projectEditModal #no").val(userDatas.no);


						$("#projectEditModal #typeId").val(userDatas.typeId);
						$("#projectEditModal #state").val(userDatas.state);
						$("#projectEditModal #priority")
								.val(userDatas.priority);
						$("#projectEditModal #progress")
								.val(userDatas.progress);
						$("#projectEditModal #site").val(userDatas.site);
						
						$("#projectEditModal #respDept").val(userDatas.respDeptName);
						$("#projectEditModal #respDept_id").val(userDatas.respDept);
						$("#projectEditModal #ownerDept").val(userDatas.ownerDeptName);
						$("#projectEditModal #ownerDept_id").val(userDatas.ownerDept);
						$("#projectEditModal #deputyDept").val(userDatas.deputyDeptName);
						$("#projectEditModal #deputyDept_id").val(userDatas.deputyDept);
						$("#projectEditModal #investment").val(userDatas.investment);
						
						$("#projectEditModal #builderDept").val(
								userDatas.builderDept);
						$("#projectEditModal #supDept").val(userDatas.supDept);
						$("#projectEditModal #designDept").val(
								userDatas.designDept);
						$("#projectEditModal #investor")
								.val(userDatas.investor);
						$("#projectEditModal #gross").val(userDatas.gross);
						$("#projectEditModal #assets").val(userDatas.assets);
						$("#projectEditModal #address").val(userDatas.address);
						$("#projectEditModal #floorArea").val(
								userDatas.floorArea);
						$("#projectEditModal #coveredArea").val(
								userDatas.coveredArea);
						$("#projectEditModal #planArea")
								.val(userDatas.planArea);
						$("#projectEditModal #capacity")
								.val(userDatas.capacity);
						$("#projectEditModal #productType").val(
								userDatas.productType);
						$("#projectEditModal #annualProductValue").val(
								userDatas.annualProductValue);
						$("#projectEditModal #annualProductAmounr").val(
								userDatas.annualProductAmounr);
						$("#projectEditModal #annualSaleValue").val(
								userDatas.annualSaleValue);
						$("#projectEditModal #annualSaleAmount").val(
								userDatas.annualSaleAmount);
						$("#projectEditModal #annualRevenue").val(
								userDatas.annualRevenue);
						$("#projectEditModal #employees").val(
								userDatas.employees);
						$("#projectEditModal #acreProductValue").val(
								userDatas.acreProductValue);
						$("#projectEditModal #acreRevenue").val(
								userDatas.acreRevenue);
						$("#projectEditModal #acreAssets").val(
								userDatas.acreAssets);
						$("#projectEditModal #acreGross").val(
								userDatas.acreGross);
						$("#projectEditModal #electricity").val(
								userDatas.electricity);
						$("#projectEditModal #water").val(userDatas.water);
						$("#projectEditModal #note").val(userDatas.note);
						$("#projectEditModal #intro").val(userDatas.intro);

						$("#projectEditModal #p_beginDate").val(
								trim_date(userDatas.planBeginDate));
						$("#projectEditModal #p_endDate").val(
								trim_date(userDatas.planEndDate));
						$("#projectEditModal #ps_beginDate").val(
								trim_date(userDatas.actualBeginDate));
						$("#projectEditModal #ps_endDate").val(
								trim_date(userDatas.actualEndDate));

						$("#projectEditModal").modal("show");
					}
				},
				error : function() {
				}
			});

		});

/*
 * 编辑项目信息表单验证
 */
$("#getProject_project").live('click', function() {

	setDefaultValidator(projectFormValidator);

});
setDefaultValidator(projectFormValidator);
/*
 * 编辑项目信息表单验证
 */
function projectFormValidator() {

	var e = "<i class='fa fa-times-circle'></i> ";
	$("#projectForm").validate({
		rules : {
			
			typeId : {
				required : !0,

			},
			name : {
				required : !0,
				maxlength : 60
			},
			no : {
				required : !0,
				maxlength : 10
			},

		},
		messages : {
			

			typeId : {
				required : e + "请输入项目类型！",

			},
			name : {
				required : e + "请输入项目名称！",
				maxlength : e + "项目名称必须60个字符以下！"
			},
			no : {
				required : e + "请输入项目编号！",
				maxlength : e + "项目名称必须10个字符以下！"
			},

		},
		submitHandler : function(form) {
			saveProjectInfo(form);
		}
	});
}

/**
 * 保存项目信息
 */
var saveProjectInfo = function(form) {
	var projectId = $("#project_id").val()
	$.ajax({
		type : "post",
		url : urlRootContext() + "/save_project_info",
		traditional : true,
		data : $.param({
			'type' : 2,
			"id" : projectId
		}) + '&' + $('#projectForm').serialize(),
		dataType : "json",
		success : function(data) {
			if (data.success) {
				swal({
					title : data.message,
					type : "success",
					confirmButtonColor : "#DD6B55",
					confirmButtonText : "确定",
					closeOnConfirm : true
				}, function() {
					$("#projectEditModal").modal("hide");
					location.reload();
				});
			} else {
				swal(data.message);
			}
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			swal("失败")
		}
	});
}

//项目进度
$("#getPro_schedule").live('click',function(){
	
	//进度汇报表单验证
	setDefaultValidator(scheduleFormValidator);
	//进度动态分页
	pageList('',1,8);

	
});

//新增进度汇报
$("#to_window").live('click',function(){
	f_hide('s_f','attr');
	type = 1;// 新增
	$("#scheduleEditModal #name").attr("readonly",false);
	$("#scheduleEditModal .modal-title").html("进度汇报");

	$('#scheduleForm')[0].reset();
	var projectData = $("#project_title").data("projectData");
	//回显状态
	$("#scheduleEditModal #state").val(projectData.state);
	//回显进度
	$("#scheduleEditModal #progress").val(Math.floor(projectData.progress));
	//回显时间
	$("#scheduleEditModal #r_beginDate").val(
			trim_date(projectData.planBeginDate));
	$("#scheduleEditModal #r_endDate").val(
			trim_date(projectData.planEndDate));
	$("#scheduleEditModal #rs_beginDate").val(
			trim_date(projectData.actualBeginDate));
	$("#scheduleEditModal #rs_endDate").val(
			trim_date(projectData.actualEndDate));
	
	$("#scheduleEditModal").modal("show");
});
//进度汇报表单验证
function scheduleFormValidator(){
	var e = "<i class='fa fa-times-circle'></i> ";
	$("#scheduleForm").validate({
		rules : {
			
			progress : {
				required : !0,
			},
			state : {
				isChoose : !0,
			},
		
		},
		messages : {
			progress : {
				required : e + "请输入当前进度！",

			},
			state : {
				isChoose : e + "请选择项目状态！",

			},
		},
		submitHandler : function(form) {
			saveSchedule(form);
		}
	});
}

/**
 * 保存进度汇报
 */
var saveSchedule = function(form) {
	var le=$("#tb tr").length;

	var arr=new Array(le);
	for(var i=1;i<=le;i++){
		arr[i-1]='attr'+i;
	}

	$.ajaxFileUpload({
		secureuri: false, //一般设置为false
		fileElementId: ['attr1','attr2','attr3','attr4','attr5','attr6'], // 上传文件的id、name属性名
		type : "post",
		url : urlRootContext() + "/save_Schedule_info",
		data : {
			"projectId":$("#project_id").val(),"state":$("#scheduleForm #state option:selected").val(),
			"progress":$("#scheduleForm #progress").val(), "beginDate":$("#scheduleForm #r_beginDate").val(), 
			"endDate":$("#scheduleForm #r_endDate").val(), "s_beginDate":$("#scheduleForm #rs_beginDate").val(), 
			"s_endDate":$("#scheduleForm #rs_endDate").val(),"describes":$("#scheduleForm #describes").val()
			},
		dataType : "json",
		success : function(data) {
			if (data.success) {
				swal({
					title :'进度汇报成功',
					type : "success",
					confirmButtonColor : "#DD6B55",
					confirmButtonText : "确定",
					closeOnConfirm : true
				}, function() {
					$("#scheduleEditModal").modal("hide");
					pageList('',1,8);
					get_project_title();
					f_hide('s_f','attr');
					//刷新进度列表
					pageList('',1,8);
				});
			} else {
				f_hide('s_f','attr');
				swal(data.message);
			}
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			swal("失败")
		}
	});
}

//生成进度汇报表格
function pageList(reqData, pageNumber, pageSize,id) {

	var url = urlRootContext() + "/get_project_schedule"; // 请求的网址

	var reqParams = {
		'reqData' : reqData,
		'pageNumber' : pageNumber,
		'pageSize' : pageSize,"id":$("#project_id").val()
	};// 请求数据
	$(function() {
		$
				.ajax({
					type : "POST",
					url : url,
					data : reqParams,
					dataType : "json",
					success : function(response) {
						
							var dataList = response.dataList;
							
							$("#schedule_tableBody").empty();// 清空表格内容
							if (dataList==null||dataList=='undefined'||dataList==undefined) {
								$("#schedule_tableBody").append('<tr><th colspan ="7"><center>查询无数据</center></th></tr>');
							}else{
								totalPage = response.data.pages;
								options5.totalPages = (totalPage == 0 ? 1
										: totalPage);
								options5.currentPage = pageNumber;
								$('#schedule_bottomTab').bootstrapPaginator(options5); // 重新设置总页面数目
								
								
								$(dataList).each(function() {// 重新生成

													var str = '<tr id="'+ this.progressId+ '">';
													str += '<td >'+ this.modifyTime+'</td>';
													str+='<td>'+this.modifyPerson+'把项目进度修改为'+this.progress+'%</td>'
													str += '<td id="schedule_show"><button type="button" class="btn btn-primary btn-outline btn-xs delete"　>查看</button></td></tr>';
													$("#schedule_tableBody").append(str);
													$("#" + this.progressId).data(
															"progressDatas", this);
												});
								$(".i-checks").iCheck({
									checkboxClass : "icheckbox_square-green",
								});
								// 重载事件
								reloadEvent();
							} 
						
					},
					error : function(e) {
						
					}
				});
	});
}

//查看进度动态
$("#schedule_show").live('click',function(){
	var schedule_show = $(this).parent().attr("id");
	var progressDatas = $("#" + schedule_show).data("progressDatas");
	
	$("#show_scheduleEditModal #s_a_state").text(getProgress_state(progressDatas.state));
	$("#show_scheduleEditModal #s_a_progress").text(progressDatas.progress);
	$("#show_scheduleEditModal #s_a_describes").text(progressDatas.describes);
	//s_a_EndDate
	$("#show_scheduleEditModal #s_p_EndDate").text(get_date(progressDatas.planBeginDate)+" / "+get_date(progressDatas.planEndDate));
	$("#show_scheduleEditModal #s_a_EndDate").text(get_date(progressDatas.actualBeginDate)+" / "+get_date(progressDatas.actualEndDate));
	//回显图片
	$.ajax({
		type : "POST",
		url : urlRootContext()+"/get_progress_img",
		data : {"progressId":schedule_show},
		dataType : "json",
		success : function(dataList) {
			if (dataList==null||dataList=='undefined'||dataList==undefined) {return;}
			$("#s_a_according").empty();
			$(dataList).each(function() {
//				var str='<img src="'+urlRootContext()+this.progressAnnexPath+'"  class="img-responsive" alt="Cinque Terre" width="200" height="200" style="display:inline-block;*zoom:1;*display:inline;margin:20px">';
				
				var str='<div class="problem_details" id="example2-1">';
				str+='<img alt="Thumbnail One" width="200" height="200" src="'+urlRootContext()+this.progressAnnexPath+'" class="img-responsive" />';
				str+='</div>';
				$("#s_a_according").append(str);
				});
		},
		error:function(){}
	});
	
	$("#show_scheduleEditModal").modal("show");
});
//图片缩放

//问题窗口
$("#to_problem").live('click',function(){
	f_hide('p_f','attach');
//	var progress_type=get_task_p();
	
	//不再判断
	if(true){
		//查看有没有计划,新增问题
		problem_type=1;
		//清空表格
		$('#problemForm')[0].reset();
		$("#problemEditModal #title").attr("readonly",false);
		$("#problemEditModal .modal-title").html("汇报问题");
		$("#p_d").show();
		$("#p_img").empty();
		$("#p_img").hide();
		$("#problemEditModal").modal("show");
	}else{
		swal(
				{
					title : "没有可选择的项目计划",
					type : "success",
					confirmButtonColor : "#DD6B55",
					confirmButtonText : "确定",
					closeOnConfirm : true
				},function(){});
	}
	
});
//编辑问题图片img_modify
$("#problem_no_tableBody td .img_modify").live('click',function(){
	//打开窗口,回显图片
	var problemId = $(this).parent().parent().attr("id");
	$("#problemId").val(problemId);
	problem_img(problemId);
});
function problem_img(problemId){
	$.ajax({
		type : "POST",
		url : urlRootContext()+"/get_problem_img",
		data : {"problemId":problemId},
		dataType : "json",
		success : function(dataList) {
			
			if(dataList==''||dataList==null||dataList==undefined||dataList=='undefined'){
//				swal(
//						{
//							title : "没有图片可编辑",
//							type : "success",
//							confirmButtonColor : "#DD6B55",
//							confirmButtonText : "确定",
//							closeOnConfirm : true
//						},function(){});
				$("#problem_img").empty();
				$("#problem_img_detailsEditModal").modal("show");
			}else{
				$("#problem_img").empty();
				$(dataList).each(function() {
					
					var str='<div class="container" id="'+this.problemAnnexId+'">';
					str+='<div class="row clearfix">';
					str+='<div class="col-md-6 column">';
					str+='<img alt="Cinque Terre" width="304" height="236" src="'+urlRootContext()+this.problemAnnexPath+'?'+Math.random()+'" class="img-rounded" />';
					str+='</div><div class="col-md-6 column">';
					str+='<button type="button" class="btn btn-default btn-success modify">修改</button>';
					str+='<button type="button" class="btn btn-default btn-danger delete">删除</button>';
					str+='</div></div></div>';
					
					$("#problem_img").append(str);
					$("#" + this.problemAnnexId).data("problem_img", this);
				});
				$("#count_img").val(dataList.length);
				$("#problem_img_detailsEditModal").modal("show");
				
			}
		},
		error:function(){}
	});
}
//编辑图片
$("#problem_img_detailsEditModal .modify").live('click',function(){
	var img_id = $(this).parent().parent().parent().attr("id");
	var type=1;
	$("#edtimg").click();
	$("#edtimg").change(function(){
		p_save_img(type,img_id);
	});
});
//新增图片
$("#problem_img_detailsEditModal #insert_img").live('click',function(){
	//判断图片数量
	if($("#count_img").val()>6){
		//不能再增加
	}else{
		var type=3;
		$("#insertimg").click();
		$("#insertimg").change(function(){
			p_save_img(type);
		});
	}
});
//保存图片
function p_save_img(type,img_id,problemAnnexPath){
	var problemId=$("#problemId").val();
//	swal(type)
//	swal(img_id)
//	swal(problemId)
	$.ajaxFileUpload({
		secureuri: false, //一般设置为false
        fileElementId: ['edtimg','insertimg'], // 上传文件的id、name属性名
		type : "POST",
		url : urlRootContext()+"/modify_problem_img",
		data : {"problemId":problemId,"type":type,"problemAnnexId":img_id,"problemAnnexPath":problemAnnexPath},
		dataType : "json",
		success : function(dataList) {
			if(dataList.success=='edtimg'){
				problem_img(problemId);
			}else if(dataList.success=='delete'){
				problem_img(problemId);
			}else if(dataList.success=='insertimg'){
				problem_img(problemId);
			}
		},
		error:function(){}
	});
}
//删除图片
$("#problem_img_detailsEditModal .delete").live('click',function(){
	var img_id = $(this).parent().parent().parent().attr("id");
	var problem_img=$("#"+img_id).data("problem_img");

	var type=2;
	p_save_img(type,img_id,problem_img.problemAnnexPath);
});
//获取计划列表并判断
function get_task_p(){
	//获取计划列表get_progress
	var progress_type=true;
			$.ajax({
					type : "POST",
					url : urlRootContext() + "/get_progress",
					data : {"projectId":$("#project_id").val()},
					dataType : "json",
					success : function(dataList) {
						if (dataList==null||dataList=='undefined'||dataList==undefined||dataList=='') {
							//$("#get_progress").append('<option >--请选择--</option>');
							progress_type=false;
						}else{
							var str='';
							$("#get_progress").empty();
							$(dataList).each(function() {
								str+='<option value="'+this.taskId+'">'+this.name+'</option>';
							});
							
							$("#get_progress").append(str);
							
						}
					},
					error:function(){}
				});
			return progress_type;
			
}

$("#getPro_problem").live('click',function(){
	//项目问题表单验证
	setDefaultValidator(problemFormValidator);
	//列出所有项目下所有未解决的问题
	var reqData={"type":"1"};
	problem_no_List(JSON.stringify(reqData),1,8);
	
});
$("#p_y_window").live('click',function(){
	var reqData={"type":"2"};
	problem_y_List(JSON.stringify(reqData),1,8);
});
//分页
$("#p_no_list").live('click',function(){
	var reqData={"type":"1"};
	problem_no_List(JSON.stringify(reqData),1,8);
});
//生成未解决问题表格
function problem_no_List(reqData, pageNumber, pageSize,id) {
	var url = urlRootContext() + "/get_problem_no"; // 请求的网址
	var reqParams = {
		'reqData' : reqData,
		'pageNumber' : pageNumber,
		'pageSize' : pageSize,"id":$("#project_id").val()
	};// 请求数据
	$(function() {
		$.ajax({
					type : "POST",
					url : url,
					data : reqParams,
					dataType : "json",
					success : function(response) {
						if (response.success) {
							totalPage = response.data.pages;
							options2.totalPages = (totalPage == 0 ? 1
									: totalPage);
							options2.currentPage = pageNumber;
							$('#problem_no_bottomTab').bootstrapPaginator(options2); // 重新设置总页面数目
							
							var dataList = response.data.dataList;
							$("#problem_no_tableBody").empty();// 清空表格内容
							if (dataList==null||dataList=='undefined'||dataList==undefined||dataList.length<=0) {
								$("#problem_no_tableBody").append('<tr><th colspan ="7"><center>查询无数据</center></th></tr>');
							}else{
								
								$(dataList).each(function() {// 重新生成
													var str = '<tr id="'+ this.problemId+ '">';
													str += '<td class="p_details" style="width: 400px;"><a>'+ this.title+'</a></td>';
													str+='<td>'+this.user.usercname+'</td>'
													str += '<td >'+ this.createTime+'</td>';

													str += '<td><button type="button"　 class="btn btn-primary btn-outline btn-xs modify">编辑</button>'+
														'<button type="button"　id="p_n_dete" class="btn btn-primary btn-outline btn-xs delete">删除</button></td></tr>';
													$("#problem_no_tableBody").append(str);
													$("#" + this.problemId).data(
															"problem_noDatas", this);
													
												});
								$(".i-checks").iCheck({
									checkboxClass : "icheckbox_square-green",
								});
								// 重载事件
								reloadEvent1();
							} 
						}else{
							swal(response.massage)
						}
					},
					error : function(e) {
						
					}
				});
	});
}
//分页

//生成已解决问题表格
function problem_y_List(reqData, pageNumber, pageSize,id) {

	var url = urlRootContext() + "/get_problem_no"; // 请求的网址
	var reqParams = {
		'reqData' : reqData,
		'pageNumber' : pageNumber,
		'pageSize' : pageSize,"id":$("#project_id").val()
	};// 请求数据
	$(function() {
		$.ajax({
					type : "POST",
					url : url,
					data : reqParams,
					dataType : "json",
					success : function(response) {
						if (response.success) {
				
							totalPage = response.data.pages;
							options3.totalPages = (totalPage == 0 ? 1
									: totalPage);
							options3.currentPage = pageNumber;
							$('#problem_y_bottomTab').bootstrapPaginator(options3); // 重新设置总页面数目
							
							var dataList = response.data.dataList;
							$("#problem_y_tableBody").empty();// 清空表格内容
							if (dataList==null||dataList=='undefined'||dataList==undefined||dataList.length<=0) {
								$("#problem_y_tableBody").append('<tr><th colspan ="7"><center>查询无数据</center></th></tr>');
							}else{
								
								$(dataList).each(function() {// 重新生成

													var str = '<tr id="'+ this.problemId+ '">';
													str += '<td style="width: 400px;">'+ this.title+'</td>';
													str+='<td>'+this.user.usercname+'</td>'
													str += '<td >'+ this.createTime+'</td>';
													str += '<td><button type="button" class="btn btn-primary btn-outline btn-xs selelt">查看</button></td>';
													str+='</tr>';
													$("#problem_y_tableBody").append(str);
													$("#" + this.problemId).data(
													"problem_noDatas", this);
												});
								$(".i-checks").iCheck({
									checkboxClass : "icheckbox_square-green",
								});
								// 重载事件
								reloadEvent();
							} 
						}else{}
					},
					error : function(e) {
						
					}
				});
	});
}
//项目问题表单验证
function problemFormValidator(){
	var e = "<i class='fa fa-times-circle'></i> ";
	$("#problemForm").validate({
		rules : {
			
			title : {
				required : !0,
			},
		

		},
		messages : {
			
			title : {
				required : e + "请输入问题标题！",
			},

		},
		submitHandler : function(form) {
			saveProblem(form);
		}
	});
}

//保存问题
var saveProblem = function(form) {
	$.ajaxFileUpload({
		secureuri: false, //一般设置为false
        fileElementId: ['attach1','attach2','attach3','attach4','attach5','attach6'], // 上传文件的id、name属性名
		type : "post",
		url : urlRootContext() + "/save_problem_info",
		data :{
			"projectId":$("#project_id").val(),
//			"get_progress":$("#get_progress option:selected").val(),
			"problemId":$("#problemId").val(),
			"title":$("#title").val(),"describes":$("#p_describes").val(),
			"involvedDept":$("#p_involvedDept").val(),"solution":$("#solution").val(),
			"type":problem_type,"state":$("#problemEditModal input[name='solve']:checked").val()
		},
		dataType : "json",
		success : function(response) {
			
			if ("success"==response.save||"success"==response.update) {
				swal({
					title : "问题汇报成功",
					type : "success",
					confirmButtonColor : "#DD6B55",
					confirmButtonText : "确定",
					closeOnConfirm : true
				}, function() {
					$("#problemEditModal").modal("hide");
					var reqData={"type":"1"};
					problem_no_List(JSON.stringify(reqData),1,8);
					f_hide('p_f','attach');
					reloadEvent1();
				});
			} else {
				f_hide('p_f','attach');
				swal(response.massage);
			}
		},
		error : function() {
			swal("失败")
		}
	});
}

var problem_type=0;
//重载事件
function reloadEvent1(){
	
//修改项目问题
	$("#problem_no_tableBody td .modify").click(
			function(event) {
			
//				if(get_task_p()){}//获取计划并判断
					var problemId = $(this).parent().parent().attr("id");
					var problem_noDatas = $("#" + problemId).data("problem_noDatas");
					
					problem_type = 2;// 修改
					$("#problemEditModal #title").attr("readonly",true);
					$("#problemEditModal .modal-title").html("编辑汇报问题");
					$("#problemEditModal #title").val(problem_noDatas.title);
					$("#problemEditModal #get_progress").val(problem_noDatas.taskId);
					$("#problemEditModal #p_describes").val(problem_noDatas.describes);
					$("#problemEditModal #p_involvedDept").val(problem_noDatas.involvedDept);
					$("#problemEditModal #solution").val(problem_noDatas.solution);
					$("#problemEditModal #problemId").val(problem_noDatas.problemId);
					$("#problemEditModal input[name='solve'][value='"+problem_noDatas.state+"']").attr("checked",true);
					//回显文件路径,回显图片
					$("#p_d").hide();
					$("#p_img").show();
					$.ajax({
						type : "POST",
						url : urlRootContext()+"/get_problem_img",
						data : {"problemId":problemId},
						dataType : "json",
						success : function(dataList) {
							if (dataList==null||dataList=='undefined'||dataList==undefined) {return;}
							$("#p_img").empty();
							$(dataList).each(function() {
								var str='<div class="problem_details">';
								str+='<img alt="Cinque Terre" width="200" height="200" src="'+urlRootContext()+this.problemAnnexPath+'" class="img-responsive" />';
								str+='</div>';
								
								$("#p_img").append(str);
								});
						},
						error:function(){}
					});
					$("#problemEditModal").modal("show");
					
			});
	
//删除问题
	$("#problem_no_tableBody td .delete").click(function(event) {
		
		var problemId = $(this).parent().parent().attr("id");
	
		swal({
					title : "确定删除选中项?",
					text : "你将删除选中的项目问题!",
					type : "warning",
					showCancelButton : true,
					confirmButtonColor : "#DD6B55",
					confirmButtonText : "是的，删除",
					cancelButtonText : "取消",
					closeOnConfirm : false
				},
				function() {
					$.ajax({
								type : "POST",
								url : urlRootContext()+ "/delete_project_problem/",
								traditional : true,
								data : {
									"problemId" : problemId
								},
								dataType : "json",
								success : function(response) {
									if (response.success) {
										swal("已删除!","你已删除选中的项目计划！","success");
										var reqData={"type":"1"};
										problem_no_List(JSON.stringify(reqData),1,8);
										reloadEvent1();
								
								}else {
									swal(response.message);
								}
							}
					});
				});
	});

	//问题详情p_details
	$("#problem_no_tableBody tr .p_details").click(function(event) {
		$("#row_fluid").show();
		$("#problemEditModal .modal-title").html("项目问题详情");
		var problemId = $(this).parent().attr("id");
		var problem_noDatas=$("#"+problemId).data("problem_noDatas");
		$("#problem_detailsEditModal #p_d_title").text(problem_noDatas.title);
		$("#problem_detailsEditModal #p_d_name").text(problem_noDatas.user.usercname);
		$("#problem_detailsEditModal #p_d_center").text(problem_noDatas.describes);
		$("#problem_detailsEditModal #p_d_time").text(problem_noDatas.createTime);
		//p_d_time
		$("#problem_detailsEditModal #p_d_involvedDept").text(problem_noDatas.involvedDept);
		$("#problem_detailsEditModal #p_d_solution").text(problem_noDatas.solution);
		$("#problem_detailsEditModal").modal("show"); 
		$("#problem_detailsEditModal #prob_id").val(problemId);
		//加载评论
		get_commentList(problemId);
		//回显图片
		get_comment_img(problemId);
		
		

		
	});
}
//发表评论
$("#p_d_publish").live('click',function(){
	if($("#p_d_comment").val()==''){
		swal("请输入评论")
		return;
	}else{
		//保存评论
		var problemId=$("#problem_detailsEditModal #prob_id").val();
		$.ajax({
			type : "POST",
			url : urlRootContext()+"/save_problem_comment",
			data : {"problemId":problemId,"content":$("#p_d_comment").val()},
			dataType : "json",
			success : function(data) {
				if (data.success) {
					swal({
						title : data.message,
						type : "success",
						confirmButtonColor : "#DD6B55",
						confirmButtonText : "确定",
						closeOnConfirm : true
					}, function() {
						$("#p_d_comment").val('')
						get_commentList(problemId);
					});
			}else{
				swal(data.message);
			}
				
			},
			error:function(){}
		});
	}
});

//查看已解决问题详情
$("#problem_y_tableBody tr .selelt").live('click',function() {
	//span12
	$("#row_fluid").hide();
	$("#problemEditModal .modal-title").html("项目问题详情");
	var problemId = $(this).parent().parent().attr("id");
	var problem_noDatas=$("#"+problemId).data("problem_noDatas");
	$("#problem_detailsEditModal #p_d_title").text(problem_noDatas.title);
	$("#problem_detailsEditModal #p_d_name").text(problem_noDatas.user.usercname);
	$("#problem_detailsEditModal #p_d_center").text(problem_noDatas.describes);
	$("#problem_detailsEditModal #p_d_time").text(problem_noDatas.createTime);
	//p_d_time
	$("#problem_detailsEditModal #p_d_involvedDept").text(problem_noDatas.involvedDept);
	$("#problem_detailsEditModal #p_d_solution").text(problem_noDatas.solution);
	$("#problem_detailsEditModal").modal("show");
	get_commentList(problemId);
	//回显图片
	get_comment_img(problemId);
});	
//回显图片
function get_comment_img(problemId){
	$.ajax({
		type : "POST",
		url : urlRootContext()+"/get_problem_img",
		data : {"problemId":problemId},
		dataType : "json",
		success : function(dataList) {
			if (dataList==null||dataList=='undefined'||dataList==undefined) {return;}
			$("#p_d_according").empty();
			$(dataList).each(function() {
				var str='<div class="problem_details">';
				str+='<img alt="Cinque Terre" width="200" height="200" src="'+urlRootContext()+this.problemAnnexPath+'" class="img-responsive" />';
				str+='</div>';
				
				$("#p_d_according").append(str);
			});
		},
		error:function(){}
	});
}
//评论列表
function get_commentList(problemId){
	$.ajax({
		type : "POST",
		url : urlRootContext()+"/get_problem_comment",
		data : {"problemId":problemId},
		dataType : "json",
		success : function(response) {
			var dataList = response.data.dataList;
			$("#p_d_com").empty();// 清空表格内容
			if (dataList.length > 0) {
				$(dataList).each(function() {
					
					var str='<div class="row-fluid" style="margin-bottom: 14px;">';
					str+='<div class="span6" style="width: 55px;height: 55px;">';
					if(this.user.headImg==null||this.user.headImg==''||this.user.headImg==undefined||this.user.headImg=='undefined'){
						str+='<img alt="140x140" src="'+urlRootContext()+'/img/u36.png" class="img-circle img-responsive " />';
					}else{
						str+='<img style="width: 55px;height: 55px;" alt="140x140" src="'+urlRootContext()+this.user.headImg+'" class="img-responsive img-circle"/>';
					}
					str+='</div>';
					str+='<div class="span6" style="line-height: 21px;">';
					str+='<div>'+this.user.usercname+'</div>';
					str+='<div class="c_time" title="'+this.createTime+'">'+this.createDate+'</div>';
					str+='<div>'+this.content+'</div>';
					str+='</div></div>';
					$("#p_d_com").append(str);
				});
				//$("#p_d_com .c_time").timeago();
			}
		},
		error:function(){}
	});
}

//删除项目
$("#p_delete").live('click',function(){
	var projectId=$("#project_id").val();
	swal({
				title : "确定删除选中项?",
				text : "你将删除选中的项目!",
				type : "warning",
				showCancelButton : true,
				confirmButtonColor : "#DD6B55",
				confirmButtonText : "是的，删除",
				cancelButtonText : "取消",
				closeOnConfirm : false
			},
			function() {
				$.ajax({
					type : "POST",
					url : urlRootContext()+"/project_delete",
					data : {"projectId":projectId},
					dataType : "json",
					success : function(response) {
						if (response.success) {
							swal("已删除!","你已删除选中的项目！","success");
							//跳到项目列表project_info_management
							location.href=urlRootContext()+'/project_info_management'; 
						}else{
							swal(response.message);
						}
					},
					error:function(){}
				});
			});
	
});

//动态文件上传
$(function(){
	f_hide('s_f','attr');
	f_hide('p_f','attach');
})
//隐藏并清空
function f_hide(p,id){
	for(var i=1;i<=6;i++){
		$("#"+p+i).hide();
		$("#"+id+i).val('');
		$("#"+p+i+id+i ).val('');
	}
}
//动态增加
function f_add(p,id){
	for(var i=1;i<=6;i++){
		var v=$("#"+id+i).val();
		if(v==null||v==''||v==undefined||v=='undefined'){
			$("#"+id+i).click();
			$("#"+p+i).show();
			break;
		}
	}
}
//给文本值
$("#scheduleEditModal #s_d .s_i").live('change',function(){
	var p=$(this).parent().attr("id");
	var v=$(this).attr("id");
	var s=$("#"+v).val();
	s=s.replace('C:\\fakepath\\','');
	$("#"+p+v).val(s);
});
$("#problemEditModal #p_d .s_i").live('change',function(){
	var p=$(this).parent().attr("id");
	var v=$(this).attr("id");
	var s=$("#"+v).val();
	s=s.replace('C:\\fakepath\\','');
	$("#"+p+v).val(s);
});
//增加文件
$("#scheduleEditModal #s_a").live('click',function(){
	f_add('s_f','attr');
});
//删除文件
$("#scheduleEditModal #s_d .s_d").live('click',function(){
	var p=$(this).parent().attr("id");
	$("#"+p +" input").val('');
	$("#"+p).hide();
});
//增加文件
$("#problemEditModal #p_a").live('click',function(){
	f_add('p_f','attach');
});
//删除文件
$("#problemEditModal #p_d .p_d").live('click',function(){
	var p=$(this).parent().attr("id");
	$("#"+p +" input").val('');
	$("#"+p).hide();
});
//img-responsive  img_a
//$("#show_scheduleEditModal .s_p .problem_details").live('click',function(){
//
//	var width = $(this).width();
//	var height = $(this).height();
//    if(width<=200)
//    {
//        $(this).width(width*4);
//        $(this).height(height*4);
//    }
//    else if(width>=200)
//    {
//        $(this).width(width/4);
//        $(this).height(height/4);
//    }
//
//});
//问题详情图片缩放

//$("#problem_detailsEditModal #p_d_according .problem_details").live('click',function(){
//
//	var width = $(this).width();
//	var height = $(this).height();
//	
//    if(width<=200)
//    {
//        $(this).width(width*4);
//        $(this).height(height*4);
//    }
//    else if(width>=200)
//    {
//        $(this).width(width/4);
//        $(this).height(height/4);
//    }
//
//});
//图片缩放

//添加单位  
$("#projectEditModal  .a_unit").live('click',function(){
	//获取项目单位列表
//	$("#projectEditModal").modal("hide");
	$("#problem_unit_detailsEditModal").modal("show");
	var a=$(this).parent().find("input").attr("id");
	$("#commvalue").val(a);
	get_unit('',1,8);
});
$("#get_unitId").live('click',function(){
	var id=$(this).parent().attr("id");
	var unitData=$("#"+id).data("unitData");
	var b=$("#commvalue").val();
	var t=/_id/;
	if(t.test(b)){
		$("#"+b).val(unitData.commonDeptId);
		b=b.replace('_id','');
		$("#"+b).val(unitData.name);
	}else{
		$("#"+b).val(unitData.name);
		b=b+'_id';
		$("#"+b).val(unitData.commonDeptId);
	}
	$("#problem_unit_detailsEditModal").modal("hide");
});
$('#problem_unit_detailsEditModal').on('hide.bs.modal', function () {
	  // 执行一些动作...
	$("#commName").val('');
//	$("#projectEditModal").modal("show");
	$('#projectEditModal').css({'overflow-y':'scroll'});
	})
//查询单位列表
$("#problem_unit_detailsEditModal .unit_f").live('click',function(){

	//获取项目单位列表
	var reqData={"commName":$("#commName").val()};
	get_unit(JSON.stringify(reqData),1, 8);
	
});
//单位列表
function get_unit(reqData,pageNumber,pageSize,id) {
	
	 var url = urlRootContext()+"/get_project_unit"; //请求的网址
    var reqParams = {'reqData':reqData, 'pageNumber':pageNumber,'pageSize':pageSize,'id':id};//请求数据
    $(function () {
    	  $.ajax({
    	        type:"POST",
    	        url:url,
    	        data:reqParams,
    	        dataType:"json",
    	        success: function(response){
    	            if(response.success) {
    	            	totalPage = response.data.pages;
    	            	options4.totalPages=(totalPage==0?1:totalPage);
    	    			options4.currentPage=pageNumber;
						 $('#u_bottomTab').bootstrapPaginator(options4); //重新设置总页面数目
						 var dataList = response.data.dataList;
						 $("#u_tableBody").empty();//清空表格内容
						 if (dataList.length > 0 ) {
						     $(dataList).each(function(){//重新生成
						    	 var option = "";
						    	 $(this.residentialQuarters).each(function(){
						    		 option = option + '<option value="'+this.commonDeptId+'">'+this.rqName+'</option>';
						    	 });
						    	 
						         $("#u_tableBody").append('<tr id="'+ this.commonDeptId +'">'+
//						            		'<td ><div class="checkbox i-checks checkSingle"><label><input type="checkbox" value="'+ this.commonDeptId +'" name="accountInfo"> <i></i></label></div></td>'+
						            		'<td style="width: 300px;">' + this.name + '</td>'+
						            		'<td style="width: 150px;">' + this.principal + '</td>'+
//						            		'<td style="width: 100px;">' + this.phone + '</td>'+
//						            		'<td style="width: 250px;">' + this.address + '</td>'+
											'<td style="width: 100px;" id="get_unitId"><button type="button" class="btn btn-primary btn-outline btn-xs modify">选择</button>'+
											'</td></tr>');
						        $("#"+this.commonDeptId).data("unitData",this);
						     	 });  
						     	$(".i-checks").iCheck({
									checkboxClass : "icheckbox_square-green",
								});
						     	//重载事件
						     	reloadEvent();
						    } else {             	            	
						     	$("#u_tableBody").append('<tr><th colspan ="7"><center>查询无数据</center></th></tr>');
						    }
					}else{
						 swal(response.message);
					}
				},
				error: function(e){
    	           console.error("查询失败:" + e);
    	        }
    	    });
      });
}
$("#progress").blur(function(){
	var t=/^(\d{1,2}|100)$/;
	var s=$("#progress").val();
	if(!t.test(s)){
		$("#progress").val('');
	}
});
