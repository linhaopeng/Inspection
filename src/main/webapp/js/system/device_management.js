/**
 * created by chenxj
 */

var deviceId;
var type;
var residentialQuarterId;
var residentialQuarterName;

/*table data start*/
var PAGESIZE = 8;
var currentPage = 1;
var totalPage = 0;
var numberOfPages = 5;
var options = {  
			containerClass:"pagination",
		    currentPage: currentPage,  //当前页数
		    totalPages: totalPage,  //总页数
		    size:"normal",  
		    alignment:"center",  
		    numberOfPages: numberOfPages,
		    itemTexts: function (type, page, current) {  
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
		                return  page;  
		        }                 
		    },
			onPageChanged: function (event, oldPage, newPage) {  
				var reqData= {"onlineStatus":$("#onlineStatus").val(),
						"residentialQuarter":$("#residentialQuarterValue").val(),"minVoltage":$("#minVoltage").val(),
						"maxVoltage":$("#maxVoltage").val(),"minElectricity":$("#minElectricity").val(),
						"maxElectricity":$("#maxElectricity").val()}; //取内容
		    	currentPage = newPage;
		    	buildTable(JSON.stringify(reqData),newPage,PAGESIZE);//默认每页最多6条
	 		   	$('.checkAll').iCheck('uncheck');//取消全选
	 		   	selectedArr.splice(0,selectedArr.length);//清空数组
	 		   	reloadEvent();
			},  
		    onPageClicked: function (e, originalEvent, type, page) {  
		    	
		    }  
		} 	

//生成表格
function buildTable(reqData,pageNumber,pageSize) {
	 var url = urlRootContext()+"/get_devices"; //请求的网址
     var reqParams = {'reqData':reqData, 'pageNumber':pageNumber,'pageSize':pageSize};//请求数据
     $(function () {   
     	  $.ajax({
     	        type:"POST",
     	        url:url,
     	        data:reqParams,
     	        async:false,
     	        dataType:"json",
     	        success: function(response){
     	            if(response.success) {
     	            	 totalPage = response.data.pages;
     	            	 options.totalPages=(totalPage==0?1:totalPage);
     	    			 options.currentPage=pageNumber;
						 $('#bottomTab').bootstrapPaginator(options); //重新设置总页面数目
						 var dataList = response.data.dataList;
						 $("#tableBody").empty();//清空表格内容
						 if (dataList.length > 0 ) {
						     $(dataList).each(function(){//重新生成
						            $("#tableBody").append('<tr id="'+ this.deviceId +'">'+
						            		'<td ><div class="checkbox i-checks checkSingle"><label><input type="checkbox" value="'+ this.deviceId +'" name="deviceIds"> <i></i></label></div></td>'+
						            		'<td >' + this.deviceId + '</td>'+
						            		'<td >' + this.deviceName + '</td>'+
						            		'<td >' + this.description + '</td>'+
						            		'<td >' + this.residentialQuarterName + '</td>'+
						            		'<td >' + (this.deviceStatus == 0?"离线":"在线") + '</td>'+
						            		'<td >' + this.voltage + '</td>'+
						            		'<td >' + this.electricity + '</td>'+
						            		'<td >' + this.tabletIemi + '</td>'+
						            		'<td >' + (this.tabletStatus == 0?"离线":"在线") + '</td>'+
						            		'<td ><button type="button" class="btn btn-primary btn-outline btn-xs editDevice">编辑</button>'+
											'</td></tr>');
						            $("#" + this.deviceId).data("device",this);//绑定数据
						     	 });  
						     
							     $(".i-checks").iCheck({
										checkboxClass : "icheckbox_square-green",
									});
						     	//重载事件
						     	reloadEvent();
						    } else {             	            	
						     	$("#tableBody").append('<tr><th colspan ="11"><center>查询无数据</center></th></tr>');
						    }
					}else{
						 alert(response.message);
					}
				},
				error: function(e){
     	           console.error("查询失败:" + e);
     	        }
     	    });
       });
}

//渲染完就执行
$(function() {
	
	buildTable("",1,PAGESIZE);//默认空白查全部
	
    //创建结算规则
    $("#queryButton").bind("click",function(){
    	var reqData= {"onlineStatus":$("#onlineStatus").val(),
				"residentialQuarter":$("#residentialQuarterValue").val(),"minVoltage":$("#minVoltage").val(),
				"maxVoltage":$("#maxVoltage").val(),"minElectricity":$("#minElectricity").val(),
				"maxElectricity":$("#maxElectricity").val()}; //取内容
    	currentPage = 1;
    	buildTable(JSON.stringify(reqData),currentPage,PAGESIZE);//默认每页最多6条
    });
});

/*table data end*/

var selectedArr=new Array();

//重载事件
function reloadEvent(){
	$(".i-checks").iCheck({
		checkboxClass : "icheckbox_square-green",
		radioClass : "iradio_square-green"
	});
	//全选、反选
	$("#deviceTable .checkAll").on("ifClicked",function(event){
		var len = $("#deviceTable #tableBody").find("input[type=checkbox]").length;
		var i = $("#deviceTable #tableBody").find("input[type=checkbox]:checked").length;
		if(i == len){
			$("#deviceTable #tableBody").find("input[type=checkbox]").iCheck("uncheck");
		}else{
			$("#deviceTable #tableBody").find("input[type=checkbox]").iCheck("check");
		}
	});
	
	//单选
	$("#deviceTable .checkSingle input").on('ifChecked', function(event) {
		if(true == $(this).is(':checked')){
			selectedArr.push($(this).val());//将所有选中的值添加进数组
			var len = $("#deviceTable #tableBody").find("input[type=checkbox]").length;
			var i = $("#deviceTable #tableBody").find("input[type=checkbox]:checked").length;
			if(len == i){
				$("#deviceTable .checkAll").iCheck("check");
			}
		}
	});
	
	$("#deviceTable .checkSingle input").on('ifUnchecked', function(event) {
		if(false == $(this).is(':checked')){
			selectedArr.splice($.inArray($(this).val(),selectedArr),1);//将所有选中的值从数组中删除
			var i = $("#deviceTable #tableBody").find("input[type=checkbox]:checked").length;
			var len = $("#deviceTable #tableBody").find("input[type=checkbox]").length;
			if(i != len){
				$("#deviceTable .checkAll").iCheck("uncheck");
			}
		}
	});
	
	//编辑设备信息
	$("#deviceTable #tableBody td .editDevice").click(function(event){
		type = 2;//修改
		$("#deviceForm .modal-title").html("编辑设备");
		var deviceId = $(this).parent().parent().attr("id");
		var deviceInfo = $("#"+deviceId).data("device");
		console.info(deviceInfo);
		console.warn(deviceInfo.installedCompanyId);
		$("#deviceEditModal #deviceId").val(deviceInfo.deviceId);
		$("#deviceEditModal #deviceName").val(deviceInfo.deviceName);
		$("#deviceEditModal #bluetoothMac").val(deviceInfo.bluetoothMac);
		$("#deviceEditModal #installedCompany").val(deviceInfo.installedCompanyId);
		$("#deviceEditModal #residentialQuarter").val(deviceInfo.residentialQuarterName);
		$("#deviceEditModal #installedPosition").val(deviceInfo.description);
		$("#deviceEditModal #residentialQuarter").data("residentialQuarter",deviceInfo.residentialQuarterId);
		$("#deviceEditModal #installedPosition").data("installedPosition",deviceInfo.apartmentId);
		$("#deviceEditModal #voltage").val(deviceInfo.voltage);
		$("#deviceEditModal #electricity").val(deviceInfo.electricity);
		$("#deviceEditModal #tabletIemi").val(deviceInfo.tabletIemi);
		$("#deviceEditModal").modal("show");
	});
}

$("#deviceEditModal").on('shown.bs.modal', function () {
  // 执行一些动作...
	getCompanyList();
})

//新增设备
$("#addDevice").click(function(){
	type = 1;//新增
	$("#deviceForm .modal-title").html("新增设备");
	$("#deviceEditModal #deviceId").val("");
	$("#deviceEditModal #deviceName").val("");
	$("#deviceEditModal #bluetoothMac").val("");
	$("#deviceEditModal #residentialQuarter").val("");
	$("#deviceEditModal #installedPosition").val("");
	$("#deviceEditModal #residentialQuarter").data("residentialQuarter","");
	$("#deviceEditModal #installedPosition").data("installedPosition","");
	$("#deviceEditModal #voltage").val("");
	$("#deviceEditModal #electricity").val("");
	$("#deviceEditModal #tabletIemi").val("");
	$("#deviceEditModal").modal("show");
});

//删除设备
$("#deleteDevice").click(function(){
	if(selectedArr.length != 0){
		swal({
			title : "确定删除选中项?",
			text : "你将删除选中的设备!",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#DD6B55",
			confirmButtonText : "是的，删除",
			cancelButtonText: "取消",
			closeOnConfirm : false
		}, function() {
			$.ajax({
     	        type:"POST",
     	        url:urlRootContext()+"/delete_device",
     	        traditional:true,
     	        data:{"selectedArr":selectedArr},
     	        async:false,
     	        dataType:"json",
     	        success: function(response){
     	            if(response.success) {
     	            	swal("已删除!", "你已删除选中的设备！", "success");
     	            	var reqData= {"onlineStatus":$("#onlineStatus").val(),
     							"residentialQuarter":$("#residentialQuarterValue").val(),"minVoltage":$("#minVoltage").val(),
     							"maxVoltage":$("#maxVoltage").val(),"minElectricity":$("#minElectricity").val(),
     							"maxElectricity":$("#maxElectricity").val()}; //取内容
     	            	buildTable(JSON.stringify(reqData),(currentPage == totalPage && currentPage != 1)? currentPage-1:currentPage,PAGESIZE);//默认每页最多6条
     	            	currentPage = currentPage - 1 ;
     	            	$('.checkAll').iCheck('uncheck');
     	            	selectedArr.splice(0,selectedArr.length);//清空数组
     	            	reloadEvent();
					}else{
						swal(response.message);
					}
				},
				error: function(e){
					 swal("删除失败！", "", "error");
     	        }
     	    });
		});
	}else{
		swal("请选择要删除的项!");
	}
});

/**管理小区模态框start */
/*table data start*/
var PAGESIZE1 = 5;
var currentPage1 = 1;
var totalPage1 = 0;
var numberOfPages1 = 5;
var options1 = {  
			containerClass:"pagination",
		    currentPage: currentPage1,  //当前页数
		    totalPages: totalPage1,  //总页数
		    size:"normal",  
		    alignment:"center",  
		    numberOfPages: numberOfPages1,
		    itemTexts: function (type, page, current) {  
		        switch (type) {  
		            case "first":  
		                return "<<";  
		            case "prev":  
		                return "<";  
		            case "next":  
		                return ">";  
		            case "last":  
		                return ">>";  
		            case "page":  
		                return  page;  
		        }                 
		    },
			onPageChanged: function (event, oldPage, newPage) {  
				var reqData= {"companyId":companyId}; //取内容
		    	currentPage1 = newPage;
		    	buildRQTable(JSON.stringify(reqData),newPage,PAGESIZE1);//默认每页最多6条
			},  
		    onPageClicked: function (e, originalEvent, type, page) {  
		    	
		    }  
		} 	

//生成表格
function buildRQTable(reqData,pageNumber,pageSize) {
	 var url = urlRootContext()+"/get_residential_quarter_list"; //请求的网址
     var reqParams = {'reqData':reqData, 'pageNumber':pageNumber,'pageSize':pageSize};//请求数据
     $(function () {   
     	  $.ajax({
     	        type:"POST",
     	        url:url,
     	        data:reqParams,
     	        async:false,
     	        dataType:"json",
     	        success: function(response){
     	            if(response.success) {
     	            	 totalPage1 = response.data.pages;
     	            	 options1.totalPages=(totalPage1==0?1:totalPage1);
     	    			 options1.currentPage=pageNumber;
						 $('#rqTable #bottomTab').bootstrapPaginator(options1); //重新设置总页面数目
						 var dataList = response.data.dataList;
						 $("#rqTable #tableBody").empty();//清空表格内容
						 if (dataList.length > 0 ) {
						     $(dataList).each(function(){//重新生成
						            $("#rqTable #tableBody").append('<tr id="'+this.id+'">'+
						            		'<td>'+
							        			'<div class="radio i-checks checkSingle" >'+
							        				'<label><input type="radio" value="'+this.id+'" name="residentialQuarters"> <i></i></label>'+
							        			'</div>'+
							        		'</td>'+
							        		'<td>'+this.rqName+'</td>'+
							        		'<td>'+this.ownedArea+this.rqAddress+'</td>'+
							        	'</tr>');
						     	 });  
						     
						     	//重载事件
						     	reloadEvent1();
						    } else {             	            	
						     	$("#rqTable #tableBody").append('<tr><th colspan ="3"><center>查询无数据</center></th></tr>');
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

//重载事件
function reloadEvent1(){
	$("#rqTable .i-checks").iCheck({
		checkboxClass : "icheckbox_square-green",
		radioClass : "iradio_square-green"
	});
	
	$('#'+residentialQuarterId).iCheck('check');//选
	
	$('#rqTable .checkSingle input').on('ifChecked', function(event){ //ifCreated 事件应该在插件初始化之前绑定 
		residentialQuarterId = $(this).val();
		residentialQuarterName = $(this).parent().parent().parent().parent().next().html();
	}); 
}

/*
 * 模态框事件
 */
$('#residentialQuarterModal').on('show.bs.modal', function () {
	residentialQuarterId = $("#residentialQuarter").data("residentialQuarter");
	$('#'+residentialQuarterId).iCheck('check');//选
	$("#rqName").val("");
	$("#rqAddress").val("")
	var reqData= {"rqName":$("#rqName").val(),"rqAddress":$("#rqAddress").val()}; //取内容
	currentPage1 = 1;
	buildRQTable(JSON.stringify(reqData),currentPage1,PAGESIZE1);//默认每页最多6条
	
});
$('#residentialQuarterModal').on('hide.bs.modal', function () {
	$('#deviceEditModal').css("overflow","scroll");
});

$("#queryRQ").click(function(){
	var reqData= {"rqName":$("#rqName").val(),"rqAddress":$("#rqAddress").val()}; //取内容
	currentPage1 = 1;
	buildRQTable(JSON.stringify(reqData),currentPage1,PAGESIZE1);//默认每页最多6条
});

$("#confirmRQ").click(function(){
	$("#residentialQuarter").data("residentialQuarter",residentialQuarterId);
	$("#residentialQuarter").val(residentialQuarterName);
	$('#residentialQuarterModal').modal("hide");
});

/**管理小区模态框 end*/

//获取安装公司列表
function getCompanyList(){
	$.ajax({
	        type:"GET",
	        url:urlRootContext()+"/get_company_list",
	        data:"companyType=2",//工程公司
	        dataType:"json",
	        async:false,
	        success: function(response){
	            if(response.success) {
	            	var dataList = response.data;
					 $("#installedCompany").empty();//清空表格内容
					 if (dataList.length > 0 ) {
					     $(dataList).each(function(){//重新生成
					         $("#installedCompany").append('<option value="'+this.id+'" class="companyType_'+this.companyType+'" >'+this.companyName+'</option>');
					     	 });  
					    }
			}else{
				 swal(response.message);
			}
		},
		error: function(e){
			 swal("获取安装公司列表失败！", "", "error");
	        }
	    });
}

/**
 * 表单验证 保存设备信息
 */
setDefaultValidator(deviceFormValidator);

function deviceFormValidator(){
	var e = "<i class='fa fa-times-circle'></i> ";
	$("#deviceForm").validate({
		rules : {
			deviceId : {
				required : !0,
				minlength : 1,
				maxlength : 12
			},
			deviceName : {
				required : !0,
				minlength : 1,
				maxlength : 20
			},
			installedCompany : {
				required : !0
			},
			residentialQuarter : {
				required : !0
			},
			installedPosition : {
				required : !0
			},
			voltage : {
				required : !0
			},
			electricity : {
				required : !0
			}
		},
		messages : {
			deviceId : {
				required : e + "请输入设备ID！",
				minlength : e + "设备ID必须1个字符以上！",
				maxlength : e + "设备ID必须12个字符以下！"
			},
			deviceName : {
				required : e + "请输入设备名称！",
				minlength : e + "设备名称必须1个字符以上！",
				maxlength : e + "设备名称必须20个字符以下！"
			},
			installedCompany : {
				required : e + "请选择安装公司！"
			},
			residentialQuarter : {
				required : e + "请选择所属小区！"
			},
			installedPosition : {
				required : e + "请选择安装地址！"
			},
			voltage : {
				required : e + "请输入额定电压！"
			},
			electricity : {
				required : e + "请输入额定电流！"
			}
		},
		submitHandler: function (form){
			saveDeviceInfo(form);
        }  
	});
}

var saveDeviceInfo = function(form){
	console.log("submit!");
    $.ajax({
		type:"post",
		url:urlRootContext()+"/save_device_info?type="+type+"&residentialQuarterId="+$("#residentialQuarter").data("residentialQuarter")
		+"&apartmentId="+$("#installedPosition").data("installedPosition"),
		traditional:true,
	    data:$(form).serialize(),
		dataType:"json",
		success:function(data){
			if(data.success){
				swal({
					title : data.message,
					type : "success",
					confirmButtonColor : "#DD6B55",
					confirmButtonText : "确定",
					closeOnConfirm : true
				}, function() {
					if(type == 1){
						buildTable("",1,PAGESIZE);//默认空白查全部
					}else if(type == 2){
						var reqData= {"onlineStatus":$("#onlineStatus").val(),
								"residentialQuarter":$("#residentialQuarterValue").val(),"minVoltage":$("#minVoltage").val(),
								"maxVoltage":$("#maxVoltage").val(),"minElectricity":$("#minElectricity").val(),
								"maxElectricity":$("#maxElectricity").val()}; //取内容
     	            	buildTable(JSON.stringify(reqData),currentPage,PAGESIZE);//默认每页最多6条
					}
					$("#deviceEditModal").modal("hide");
				});
			}else{
				swal(data.message);
			}
		},
		error:function (XMLHttpRequest, textStatus, errorThrown) {
			// 通常 textStatus 和 errorThrown 之中
			// 只有一个会包含信息
			this; // 调用本次AJAX请求时传递的options参数
			console.warn(XMLHttpRequest+"\n"+textStatus+"\n"+errorThrown);
		}
	});
}

/**设备批导*/
$(".excelImport_btn").click(function(){
	var _this = $(this);
	var bool = _this.hasClass("btn-info");
	if(bool){//选择文件
		$("#devices_file").trigger("click");
		//每次选择文件的时候都重新绑定一次change事件
		$("#devices_file").change(function(data){//导入的input
			var _btn = $(".excelImport_btn")
			_btn.removeClass("btn-info");
			_btn.addClass("btn-primary");
			_btn.text("导入");
			$(".cancelImport_btn").show(100);
		});
	} else {//上传
			$.ajaxFileUpload({
				url:urlRootContext()+"/excelImport/devices.do",
				fileElementId:"devices_file",
				type:"POST",
				dataType:"JSON",
				success:function(data) {
					var reg = /<pre.+?>(.+)<\/pre>/g;  
					var result = data.match(reg);  
					data = RegExp.$1;
					var json = eval('('+data+')');
					if(json.success){
						var list = json.data;
						swal("导入成功，本次共计导入：\n"+list.length+"条记录！");
						buildTable("",1,PAGESIZE);//简单的按当前条件刷新下记录
					} else {
						swal(json.message);
					}
					
					$(".cancelImport_btn").trigger("click");//上传后，不管成功与否，隐藏取消框
				},
				error:function(data){
					swal("上传时，网络错误了！");
				}
			});
	}
});

$(".cancelImport_btn").click(function(data){//取消导入
	$(this).hide(100);
	var _btn = $(".excelImport_btn");
	_btn.removeClass("btn-primary");
	_btn.addClass("btn-info");
	_btn.text("批量导入设备");
	var obj = document.getElementById("devices_file");
	obj.value="";
	obj.outerHTML = obj.outerHTML;
});

/** ztree start*/
var dataList;
var setting = {
	check : {
		enable : true,
		chkStyle : "radio",
		radioType : "all"
	},
	view : {
		dblClickExpand : false,
		showIcon: false
	},
	data : {
		simpleData : {
			enable : true,
			idKey : "id",
			pIdKey : "pid",
			rootPId:null
		}
	},
	/*async : {
		autoParam : [],
		contentType : "application/json",
		dataFilter : null,
		dataType : "json",
		enable : true,
		otherParam : {"depth":2,"residentialQuarter":$("#residentialQuarter").data("residentialQuarter")},
		type : "get",
		url : urlRootContext()+"/get_apartment_list"
	},*/
	callback : {
		onClick : onClick,
		onCheck : onCheck
	}
};

function onClick(e, treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("positionTree");
	zTree.checkNode(treeNode, !treeNode.checked, null, true);
	return false;
}

function onCheck(e, treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("positionTree");
	var nodes = zTree.getCheckedNodes(true);
	var v = "";
	var id = "";
	/*for (var i = 0, l = nodes.length; i < l; i++) {
		v += nodes[i].name + ",";
	}
	if (v.length > 0)
		v = v.substring(0, v.length - 1);*/
	if(!$.isEmptyObject(nodes[0])){
		for(var i = 0, l = dataList.length; i < l; i++){
			if(dataList[i].id == nodes[0].pid){
				id = nodes[0].id;
				v = dataList[i].name +"-"+ nodes[0].name;
				break;
			}
		}
	}
	var positionObj = $("#installedPosition");
	positionObj.attr("value", v);
	$("#installedPosition").data("installedPosition",id);
//	console.info($("#installedPosition").data("installedPosition"));
}

function showMenu() {
	if($("#residentialQuarter").val() == '')
		swal("请先选中对应的小区！", "", "warning");
	//获取节点数据
	$.ajax({
        type:"GET",
        url:urlRootContext()+"/get_apartment_list",
        data:"depth=2&residentialQuarter="+$("#residentialQuarter").data("residentialQuarter"),
        dataType:"json",
        async:false,
        success: function(response){
            if(response.success) {
            	dataList = response.data;
            	var length = dataList.length;
            	for(var i=0;i<length;i++){
        			if(dataList[i].level == 1){
        				dataList[i].open = true;
        				dataList[i].nocheck = true;
        			}
        		}
            	dataList[length] = {"id":0,"pid":"","name":$("#residentialQuarter").val(),"open":true,"nocheck":true};
            	/*console.info(JSON.stringify(dataList));*/
            	$.fn.zTree.init($("#positionTree"), setting, dataList);
			}else{
				 swal(response.message);
			}
	},
	error: function(e){
		 swal("获取节点数据失败！", "", "error");
        }
    });
	
	var positionObj = $("#installedPosition");
	var positionOffset = $("#installedPosition").offset();
	$("#menuContent").css({
		left : positionOffset.left + "px",
		top : positionOffset.top + positionObj.outerHeight() + "px"
	}).slideDown("fast");

	$("body").bind("mousedown", onBodyDown);
}
function hideMenu() {
	$("#menuContent").fadeOut("fast");
	$("body").unbind("mousedown", onBodyDown);
}
function onBodyDown(event) {
	if (!(event.target.id == "menuBtn" || event.target.id == "installedPosition"
			|| event.target.id == "menuContent" || $(event.target).parents(
			"#menuContent").length > 0)) {
		hideMenu();
	}
}
/** ztree end*/