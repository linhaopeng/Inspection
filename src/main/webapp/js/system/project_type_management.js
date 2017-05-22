/**
 * created by chenxj
 */

var companyId = $("#companyId").val();
var companyType = $("#companyType").val();
var type;
var typeId;

/*table data start*/
var PAGESIZE = 8;
var currentPage = 1;
var totalPage = 0;
var numberOfPages = 5;
var typeIdModify;
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
				var reqData= {"userName":$("#userName").val(),"companyName":$("#companyName").val()}; //取内容
				currentPage = newPage;
		    	buildTable(JSON.stringify(reqData),newPage,PAGESIZE);//默认每页最多6条
		    	$('.checkAll').iCheck('uncheck');//取消全选
		    	selectedArr.splice(0,selectedArr.length);//清空数组
		    	reloadEvent();
			},  
		    onPageClicked: function (e, originalEvent, type, page) {  
		    	
		    }  
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
	
	callback : {
		onClick : onClick,
		onCheck : onCheck
	}
};

function onClick(e, treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("departmentTree");
	zTree.checkNode(treeNode, !treeNode.checked, null, true);
	return false;
}

function onCheck(e, treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("departmentTree");
	var nodes = zTree.getCheckedNodes(true);
	console.info(zTree);
	var v = "";
	var id = "";
	if(!$.isEmptyObject(nodes[0])){
		id = nodes[0].id;
		v = nodes[0].name;
		var pid = nodes[0].pid;
		for(var i = 0, l = dataList.length; i < l; i++){
			if(dataList[i].id == pid){
				v = dataList[i].name +"-"+ v;
				pid = dataList[i].pid;
				i = -1;
				if(pid == 0)
					break;
			}
		}
	}
	
	buildTable('','1','8',id);
	var positionObj = $("#department");
	positionObj.attr("value", v);
	$("#department").data("department",id);
//	console.info($("#apartUnitHouse").data("apartUnitHouse"));
}

function showMenu() {
	//获取节点数据
	$.ajax({
        type:"GET",
        url:urlRootContext()+"/get_department_list",
        data:"",
        dataType:"json",
        async:false,
        success: function(response){
            if(response.success) {
            	dataList = response.data;
            	var length = dataList.length;
            	for(var i=0;i<length;i++){
        			if(dataList[i].levels == 1){
        				dataList[i].open = true;
        			}
        		}
            	/*dataList[length] = {"id":0,"pid":"","name":$.cookie("currentRQName"),"open":true,"nocheck":true};*/
            	console.info(JSON.stringify(dataList));
            	$.fn.zTree.init($("#departmentTree"), setting, dataList);
			}else{
				 swal(response.message);
			}
	},
	error: function(e){
		 swal("获取节点数据失败！", "", "error");
        }
    });
	
	var positionObj = $("#apartUnitHouse");
	var positionOffset = $("#apartUnitHouse").offset();
	$("#menuContent").css({
		left : positionObj.outerWidth() + "px",
		top :  positionObj.outerHeight() + "px"
	}).slideDown("fast");

	$("body").bind("mousedown", onBodyDown);
}
function hideMenu() {
	$("#menuContent").fadeOut("fast");
	$("body").unbind("mousedown", onBodyDown);
}
function onBodyDown(event) {
	if (!(event.target.id == "menuBtn" || event.target.id == "apartUnitHouse"
			|| event.target.id == "menuContent" || $(event.target).parents(
			"#menuContent").length > 0)) {
		hideMenu();
	}
}
/** ztree end*/


//生成表格
function buildTable(reqData,pageNumber,pageSize,id) {
	
	 var url = urlRootContext()+"/get_project_type"; //请求的网址
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
     	            	options.totalPages=(totalPage==0?1:totalPage);
     	    			options.currentPage=pageNumber;
						 $('#bottomTab').bootstrapPaginator(options); //重新设置总页面数目
						 var dataList = response.data.dataList;
						 $("#tableBody").empty();//清空表格内容
						 if (dataList.length > 0 ) {
						     $(dataList).each(function(){//重新生成
						    	 var option = "";
						    	 $(this.residentialQuarters).each(function(){
						    		 option = option + '<option value="'+this.typeId+'">'+this.rqName+'</option>';
						    	 });
						    	 
						         $("#tableBody").append('<tr id="'+ this.typeId +'">'+
						            		'<td ><div class="checkbox i-checks checkSingle"><label><input type="checkbox" value="'+ this.typeId +'" name="accountInfo"> <i></i></label></div></td>'+
						            		'<td >' + this.code + '</td>'+
						            		'<td style="width: 400px;">' + this.name + '</td>'+
						            		'<td style="width: 400px;">' + this.description + '</td>'+
						            		
											'<td style="width: 200px;"><button type="button" class="btn btn-primary btn-outline btn-xs modify">修改</button>'+
											'</td></tr>');
						         $("#"+this.typeId).data("userDatas",this);
						     	 });  
						     	$(".i-checks").iCheck({
									checkboxClass : "icheckbox_square-green",
								});
						     	//重载事件
						     	reloadEvent();
						    } else {             	            	
						     	$("#tableBody").append('<tr><th colspan ="7"><center>查询无数据</center></th></tr>');
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

//渲染完就执行
$(function() {
	
	buildTable("",1,PAGESIZE);//默认空白查全部
	
    //创建结算规则
    $("#queryButton").bind("click",function(){
    	var reqData= {"userName":$("#userName").val(),"companyName":$("#companyName").val()}; //取内容
    	buildTable(JSON.stringify(reqData),1,PAGESIZE);//默认每页最多6条
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
	
	//全选
	$("#accountInfos .checkAll").on("ifChecked",function(event){
		var len = $("#accountInfos #tableBody").find("input[type=checkbox]").length;
		var i = $("#accountInfos #tableBody").find("input[type=checkbox]:checked").length;
		if(i != len){
			$("#accountInfos #tableBody").find("input[type=checkbox]").iCheck("check");
		}
	});
	
	//反选
	$("#accountInfos .checkAll").on("ifUnchecked",function(event){
		var len = $("#accountInfos #tableBody").find("input[type=checkbox]").length;
		var i = $("#accountInfos #tableBody").find("input[type=checkbox]:checked").length;
		if(i == len){
			$("#accountInfos #tableBody").find("input[type=checkbox]").iCheck("uncheck");
		}
	});
	
	//单选
	$("#accountInfos .checkSingle input").on('ifChecked', function(event) {
		if(true == $(this).is(':checked')){
			selectedArr.push($(this).val());//将所有选中的值添加进数组
			var len = $("#accountInfos #tableBody").find("input[type=checkbox]").length;
			var i = $("#accountInfos #tableBody").find("input[type=checkbox]:checked").length;
			if(len == i){
				$("#accountInfos .checkAll").iCheck("check");
			}
		}
	});
	
	$("#accountInfos .checkSingle input").on('ifUnchecked', function(event) {
		if(false == $(this).is(':checked')){
			selectedArr.splice($.inArray($(this).val(),selectedArr),1);//将所有选中的值从数组中删除
			var i = $("#accountInfos #tableBody").find("input[type=checkbox]:checked").length;
			var len = $("#accountInfos #tableBody").find("input[type=checkbox]").length;
			if(i != len){
				$("#accountInfos .checkAll").iCheck("uncheck");
			}
		}
	});

	//修改项目类型信息
	$("#tableBody td .modify").click(function(event){
		typeId = $(this).parent().parent().attr("id");
		var userDatas = $("#"+typeId).data("userDatas");
		
		type = 2;//修改
		$("#accountEditModal #name").attr("readonly",true);
		$("#accountEditModal .modal-title").html("修改项目类型");
		$("#accountEditModal #name").val(userDatas.name);
		$("#accountEditModal #code").val(userDatas.code);
		$("#accountEditModal #description").val(userDatas.description);
		$("#accountEditModal #parentTypeId").val(userDatas.parentTypeId);
		$("#accountEditModal #listNo").val(userDatas.listNo);
		$("#accountEditModal #creator").val(userDatas.creator);
		
		/*$("#accountEditModal #password").parent().css("display","none");
		$("#accountEditModal #confirmPassword").parent().css("display","none");*/
		$("#accountEditModal").modal("show");
	});
	
	//重置密码
	/*$('#validationModal').on('show.bs.modal', function () {
	});*/
	$("#tableBody td .repassword").click(function(event){
		typeIdModify = $(this).parent().parent().attr("id");
		setDefaultValidator(passwordValidator);
		var userDatas = $("#"+typeIdModify).data("userDatas");
		$("#modifyUsername").val(userDatas.username);
		$("#modifyPasswordModal").modal("show");
	});
}

//新增项目类型
$("#addAccount").click(function(){
	type = 1;//新增
	$("#accountEditModal #name").attr("readonly",false);
	$("#accountEditModal .modal-title").html("新增项目类型");
	/*$("#accountEditModal #password").parent().css("display","block");
	$("#accountEditModal #confirmPassword").parent().css("display","block");
	$("#accountEditModal #username").val("");
	$("#accountEditModal #password").val("");
	$("#accountEditModal #confirmPassword").val("");
	$("#accountEditModal #managedRq").empty();
	$("#accountEditModal #remark").val("");
	*/
	$("#accountEditModal").modal("show");
	$('#accountForm')[0].reset();

});

function displayCustomList(){
	if($("#company option:selected").attr("class") == "companyType_3"){
		$("#accountEditModal .custom-list").css("display","block");
		rqArr.splice(0,rqArr.length);//清空数组
		rqMap={rq:[]};//清空对象
		$("#accountEditModal #managedRq").empty();//清空列表
	}else{
		$("#accountEditModal .custom-list").css("display","none");
	}
}

//删除
$("#deleteAccount").click(function(){
	if(selectedArr.length != 0){
		swal({
			title : "确定删除选中项?",
			text : "你将删除选中的项目类型!",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#DD6B55",
			confirmButtonText : "是的，删除",
			cancelButtonText: "取消",
			closeOnConfirm : false
		}, function() {
			$.ajax({
     	        type:"POST",
     	        url:urlRootContext()+"/delete_project_type/",
     	        traditional:true,
     	        data:{"selectedArr":selectedArr},
     	        async:false,
     	        dataType:"json",
     	        success: function(response){
     	            if(response.success) {
     	            	swal("已删除!", "你已删除选中的项目类型！", "success");
     	            	var reqData= {"userName":$("#userName").val(),"companyName":$("#companyName").val()}; //取内容
     	            	//buildTable(JSON.stringify(reqData),(currentPage == totalPage && currentPage != 1)? currentPage-1:currentPage,PAGESIZE);//默认每页最多6条
     	            	//当选择删除的行等于总行，当前页-1
				     	currentPage=(selectedArr.length==($("#tableBody tr ").size()))?currentPage-1:currentPage;
				     	if(currentPage<1){
				     		currentPage=1;
				     	}
     	            	buildTable("",currentPage,PAGESIZE);
     	            	$('.checkAll').iCheck('uncheck');//取消全选
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

//获取角色列表
function getRoleList(){
	$.ajax({
	        type:"GET",
	        url:urlRootContext()+"get_role_list",
	        data:"",
	        dataType:"json",
	        async:false,
	        success: function(response){
	            if(response.success) {
	            	var dataList = response.data;
					 $("#roles").empty();//清空表格内容
					 if (dataList.length > 0 ) {
					     $(dataList).each(function(){//重新生成
					         $("#roles").append('<option value="'+this.role_id+'" class="roleKey'+this.role_key+'" >'+this.role_name+'</option>');
					     	 });  
					    }
			}else{
				swal(response.message);
			}
		},
		error: function(e){
			 swal("获取角色列表失败！", "", "error");
	        }
	    });
}



/**管理小区模态框start */
/*table data start*/
var PAGESIZE1 = 1;
var currentPage1 = 1;
var totalPage1 = 0;
var numberOfPages1 = 5;
var rqArr=new Array();
var rqTempArr=new Array();
var rqMap={rq:[]};
var rqTempMap={rq:[]};
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
							        			'<div class="checkbox i-checks checkSingle" >'+
							        				'<label><input type="checkbox" value="'+this.id+'" name="residentialQuarters"> <i></i></label>'+
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
	
	$('#rqTable .checkAll').iCheck('uncheck');//取消全选
	$("input[name='residentialQuarters']:checkbox").each(function(){
		if($.inArray($(this).val(),rqTempArr) != -1){
			$(this).iCheck("check");//将所有选中的值添加进数组
		}
	});
	var len = $("#rqTable #tableBody").find("input[type=checkbox]").length;
	var i = $("#rqTable #tableBody").find("input[type=checkbox]:checked").length;
	if(len != 0 && i != 0 && len == i){
		$("#rqTable .checkAll").iCheck("check");
	}
	
	//全选
	$("#rqTable .checkAll").on("ifChecked",function(event){
		var len = $("#rqTable #tableBody").find("input[type=checkbox]").length;
		var i = $("#rqTable #tableBody").find("input[type=checkbox]:checked").length;
		if(i != len){
			$("#rqTable #tableBody").find("input[type=checkbox]").iCheck("check");
		}
	});
	//反选
	$("#rqTable .checkAll").on("ifUnchecked",function(event){
		var len = $("#rqTable #tableBody").find("input[type=checkbox]").length;
		var i = $("#rqTable #tableBody").find("input[type=checkbox]:checked").length;
		if(i == len){
			$("#rqTable #tableBody").find("input[type=checkbox]").iCheck("uncheck");
		}
	});
	
	//单选
	$("#rqTable .checkSingle input").on('ifChecked', function(event) {
		if(true == $(this).is(':checked')){
			rqTempArr.push($(this).val());//将所有选中的值添加进数组
			rqTempMap.rq.push({'id':$(this).val(),"name":$("#residentialQuarterModal #"+$(this).val()+" td:nth-child(2)").html()});
			var len = $("#rqTable #tableBody").find("input[type=checkbox]").length;
			var i = $("#rqTable #tableBody").find("input[type=checkbox]:checked").length;
			if(len == i){
				$("#rqTable .checkAll").iCheck("check");
			}
		}
	});
	
	$("#rqTable .checkSingle input").on('ifUnchecked', function(event) {
		if(false == $(this).is(':checked')){
			rqTempArr.splice($.inArray($(this).val(),rqTempArr),1);//将所有选中的值从数组中删除
			deleteObjData(rqTempMap.rq,$(this).val());
			var i = $("#rqTable #tableBody").find("input[type=checkbox]:checked").length;
			var len = $("#rqTable #tableBody").find("input[type=checkbox]").length;
			if(i != len){
				$("#rqTable .checkAll").iCheck("uncheck");
			}
		}
	});
	
}

/*
 * 模态框事件
 */
$('#residentialQuarterModal').on('show.bs.modal', function () {
	$("#rqName").val("");
	$("#rqAddress").val("")
	var reqData= {"companyId":companyId}; //取内容
	currentPage1 = 1;
	buildRQTable(JSON.stringify(reqData),currentPage1,PAGESIZE1);//默认每页最多6条
	
	rqTempArr = $.map(rqArr, function(n){//将数组放进一个临时数组
		  return n;
	});
	
	rqTempMap = $.extend(true,{},rqMap);
});
$('#residentialQuarterModal').on('hide.bs.modal', function () {
	$('#accountEditModal').css("overflow","scroll");
});

$("#queryRQ").click(function(){
	var reqData= {"companyId":companyId,"rqName":$("#rqName").val(),"rqAddress":$("#rqAddress").val()}; //取内容
	currentPage1 = 1;
	buildRQTable(JSON.stringify(reqData),currentPage1,PAGESIZE1);//默认每页最多6条
});

function managedRqLi(id,value,name){
	var li = '<li>'+
		'<div><span>'+name+'<span><span class="pull-right" id="'+id+'" name="'+value+'"><i class="fa fa-close fa-lg"></i></span></div>'+
		'</li>';
	return li;
}

$("#confirmRQ").click(function(){
	rqArr = $.map(rqTempArr , function(n){//将临时数组赋给新数组
		  return n;
	});
	console.log("confirmRQ"+rqArr);//TODO
	
	rqMap = $.extend(true,{},rqTempMap);//复制对象
	console.log(JSON.stringify(rqMap));
	
	$('#residentialQuarterModal').modal('hide');
	$("#managedRq").empty();//清空列表
	var li="";
	for(var i=0;i<rqArr.length;i++){
		var rq_id = rqArr[i];
		li=li+managedRqLi("managedRq"+rq_id,rq_id,getObjData(rqMap.rq,rq_id));
	}
	$("#managedRq").html(li);
	//对应li的删除事件
	$("#managedRq .pull-right").click(function(){
		var rq_id = $(this).attr("name");
		$(this).parent().parent().parent().parent().remove();
		rqArr.splice($.inArray(rq_id,rqArr),1);//将所有选中的值从数组中删除
		deleteObjData(rqMap.rq,rq_id);//将所有选中的值从map数组中删除
	});
});

/**管理小区模态框 end*/

/*
 * 表单验证
 */
setDefaultValidator(accountFormValidator);

function accountFormValidator(){
	var e = "<i class='fa fa-times-circle'></i> ";
	$("#accountForm").validate({
		rules : {
			/*username : {
				required : !0,
				minlength : 1,
				maxlength : 20
			},*/
			
			code : {
				required : !0,
				maxlength : 3
			},
			name : {
				required : !0,
			},
			
			
		},
		messages : {
			
			
			code : {
				required : e + "请输入类型编码！",
				maxlength : e + "类型编码必须3个字符以下！"
			},
			name : {
				required : e + "请输入类型名称！",
			},
			
		},
		submitHandler: function (form){
			saveAccountInfo(form);
        }  
	});
}

/**
 * 保存
 */
var saveAccountInfo = function(form){
	console.log("submit!");
	var obj = document.getElementsByTagName("input");
    for(var i=0; i<obj.length; i ++){
        if(obj[i].checked){
            sex=obj[i].value;
        }
    }
    $.ajax({
		type:"post",
		url:urlRootContext()+"/save_project_type",
		traditional:true,
	    data:{"type":type,"id":typeId,"name":$("#name").val(),"code":$("#code").val(),
	    	"parentTypeId":$("#parentTypeId").val(),"description":$("#description").val(),"listNo":$("#listNo").val(),"creator":$("#creator").val()},
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
					buildTable("",currentPage,PAGESIZE);//默认空白查全部
					/*if(type == 1){
						buildTable("",1,PAGESIZE);//默认空白查全部
					}else if(type == 2){
						var reqData= {"username":$("#username").val(),"sex":sex}; //取内容
     	            	buildTable(JSON.stringify(reqData),currentPage,PAGESIZE);//默认每页最多6条
					}*/
					$("#accountEditModal").modal("hide");
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

//修改密码
function passwordValidator(){
	var e = "<i class='fa fa-times-circle'></i> ";
	$("#passwordForm").validate({
		rules : {
			loginPassword : {
				required : !0,
				minlength : 6,
				maxlength : 20
			},
			newPassword : {
				required : !0,
				minlength : 6,
				maxlength : 20
			},
			confirmNewPassword : {
				required : !0,
				minlength : 6,
				maxlength : 20,
				equalTo : "#newPassword"
			}
		},
		messages : {
			loginPassword : {
				required : e + "请输入密码！",
				minlength : e + "密码必须6个字符以上！",
				maxlength : e + "密码必须20个字符以下！"
			},
			newPassword : {
				required : e + "请输入密码！",
				minlength : e + "密码必须6个字符以上！",
				maxlength : e + "密码必须20个字符以下！"
			},
			confirmNewPassword : {
				required : e + "请输入确认密码！",
				minlength : e + "密码必须6个字符以上！",
				maxlength : e + "密码必须20个字符以下！",
				equalTo : e + "两次输入的密码不一致"
			}
		},
		submitHandler: function (form){
			savePassword(form);
        }  
	});
}

var savePassword = function(form){
	console.log("submit!");
    $.ajax({
		type:"post",
		url:urlRootContext()+"/modify_password?typeId="+typeIdModify,
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
					$("#modifyPasswordModal").modal("hide");
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
