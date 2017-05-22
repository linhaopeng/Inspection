/**
 * created by chenxj
 */

var type = 2;

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
				var reqData= {}; //取内容
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
	 var url = urlRootContext()+"/get_access_list"; //请求的网址
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
						            		'<td >' + (this.deviceName == undefined || this.deviceName == 'undefined'? '--':this.deviceName) + '</td>'+
						            		'<td >' + this.description + '</td>'+
						            		'<td >' + this.installedCompanyName + '</td>'+
						            		'<td >' + (this.deviceStatus == 0? "离线":"在线") + '</td>'+
						            		'<td ><button type="button" class="btn btn-primary btn-outline btn-xs modifyAccessInfo">编辑</button>'+
											'</td><td ><button type="button" class="btn btn-primary btn-outline btn-xs findAccessAuth">查看授权</button>'+
											'</td></tr>');
						            $("#"+this.deviceId).data("accessInfo",this);
						     	 });  
						     
							     $(".i-checks").iCheck({
										checkboxClass : "icheckbox_square-green",
									});
						     	//重载事件
						     	reloadEvent();
						    } else {             	            	
						     	$("#tableBody").append('<tr><th colspan ="9"><center>查询无数据</center></th></tr>');
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
	
	var reqData= {"rqId":$.cookie("currentRQ")}; //取内容
	currentPage = 1;
	buildTable(JSON.stringify(reqData),currentPage,PAGESIZE);
	
    //创建结算规则
    $("#queryButton").bind("click",function(){
    	var reqData= {"rqId":$.cookie("currentRQ")}; //取内容
    	currentPage = 1;
    	buildTable(JSON.stringify(reqData),currentPage,PAGESIZE);//默认每页最多6条
    });
});

/**table data end*/

var selectedArr=new Array();
var doorNameArr=new Array();

//重载事件
function reloadEvent(){
	$(".i-checks").iCheck({
		checkboxClass : "icheckbox_square-green",
		radioClass : "iradio_square-green"
	});
	//全选、反选
	$(".checkAll").on("ifClicked",function(event){
		var len = $("#tableBody").find("input[type=checkbox]").length;
		var i = $("#tableBody").find("input[type=checkbox]:checked").length;
		if(i == len){
			$("#tableBody").find("input[type=checkbox]").iCheck("uncheck");
		}else{
			$("#tableBody").find("input[type=checkbox]").iCheck("check");
		}
	});
	
	//单选
	$(".checkSingle input").on('ifChecked', function(event) {
		if(true == $(this).is(':checked')){
			selectedArr.push($(this).val());//将所有选中的值添加进数组
			doorNameArr.push($("#"+$(this).val()+" td:nth-child(4)").html());//将所有选中的值添加进数组
			var len = $("#tableBody").find("input[type=checkbox]").length;
			var i = $("#tableBody").find("input[type=checkbox]:checked").length;
			if(len == i){
				$(".checkAll").iCheck("check");
			}
		}
	});
	
	$(".checkSingle input").on('ifUnchecked', function(event) {
		if(false == $(this).is(':checked')){
			selectedArr.splice($.inArray($(this).val(),selectedArr),1);//将所有选中的值从数组中删除
			doorNameArr.splice($.inArray($("#"+$(this).val()+" td:nth-child(4)").html(),doorNameArr),1);//将所有选中的值从数组中删除
			var i = $("#tableBody").find("input[type=checkbox]:checked").length;
			var len = $("#tableBody").find("input[type=checkbox]").length;
			if(i != len){
				$(".checkAll").iCheck("uncheck");
			}
		}
	});
	
	//修改门禁规则
	$("#tableBody td .modifyAccessInfo").click(function(event){
		var deviceId = $(this).parent().parent().attr("id");
//		window.location.href= urlRootContext()+"/edit_access_info.do?deviceId="+deviceId;
		var accessInfo = $("#"+deviceId).data("accessInfo");
		$("#deviceId").val(accessInfo.deviceId);
		$("#deviceName").val(accessInfo.deviceName);
		$("#installedPosition").val(accessInfo.description);
		$("#isBuzzing").val(accessInfo.isBuzzing);
		$("#lockActionTime").val(accessInfo.lockActionTime);
		$("#openTimeout").val(accessInfo.openTimeout);
		$("#pressInterval").val(accessInfo.pressInterval);
		$("#pressNumber").val(accessInfo.pressNumber);
		$("#cardReader").val(accessInfo.cardReader);
		$("#pilotLight").val(accessInfo.pilotLight);
		$("#readInterval").val(accessInfo.cardReadInterval);
		$("#installedPosition").data("installedPosition",accessInfo.apartmentId);//赋值
		$("#accessInfoEditModal").modal("show");
	});
	
	//查看门禁授权
	$("#tableBody td .findAccessAuth").click(function(event){
		var deviceId = $(this).parent().parent().attr("id");
		window.location.href= urlRootContext()+"/to_access_auth_management?deviceId="+deviceId;
	});
}

/**
 * 表单验证 保存门口机信息
 */
setDefaultValidator(accessInfoFormValidator);

function accessInfoFormValidator(){
	var e = "<i class='fa fa-times-circle'></i> ";
	$("#accessInfoForm").validate({
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
			installedPosition : {
				required : !0
			},
			lockActionTime : {
				required : !0
			},
			openTimeout : {
				required : !0
			},
			pressInterval : {
				required : !0
			},
			pressNumber : {
				required : !0
			},
			readInterval : {
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
			installedPosition : {
				required : e + "请选择安装位置！"
			},
			lockActionTime : {
				required : e + "请输入开锁动作时间！"
			},
			openTimeout : {
				required : e + "请输入门开超时报警时间！"
			},
			pressInterval : {
				required : e + "请输入连续按房号键启动预警的时间间隔！"
			},
			pressNumber : {
				required : e + "请输入连续按房号键启动预警的按键次数！"
			},
			readInterval : {
				required : e + "请输入读卡间隔！"
			}
		},
		submitHandler: function (form){
			saveAccessInfo(form);
        }  
	});
}

var saveAccessInfo = function(form){
	console.log("submit!");
    $.ajax({
		type:"post",
		url:urlRootContext()+"/save_access_info?type="+type+"&installedPosition="+$("#installedPosition").data("installedPosition"),
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
						var reqData= {"rqId":$.cookie("currentRQ")}; //取内容
     	            	buildTable(JSON.stringify(reqData),currentPage,PAGESIZE);//默认每页最多6条
					}
					$("#accessInfoEditModal").modal("hide");
				});
			}else{
				swal(data.message);
			}
		},
		error:function (XMLHttpRequest, textStatus, errorThrown) {
			// 通常 textStatus 和 errorThrown 之中
			// 只有一个会包含信息
			this; // 调用本次AJAX请求时传递的options参数
			console.error(XMLHttpRequest+"\n"+textStatus+"\n"+errorThrown);
		}
	});
}


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
	//获取节点数据
	$.ajax({
        type:"GET",
        url:urlRootContext()+"/get_apartment_list",
        data:"depth=2&residentialQuarter="+$.cookie("currentRQ"),
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
            	dataList[length] = {"id":0,"pid":"","name":$.cookie("currentRQName"),"open":true,"nocheck":true};
            	/*console.info(JSON.stringify(dataList));*/
            	$.fn.zTree.init($("#positionTree"), setting, dataList);
			}else{
				 swal(response.message);
			}
	},
	error: function(e){
		 swal("获取取节点数据失败！", "", "error");
        }
    });
	
	var positionObj = $("#installedPosition").position();
	var positionOffset = $("#installedPosition").offset();
	$("#menuContent").css({
		left : positionOffset.left + "px",
		top : (positionObj.top + 34) + "px"
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