/**
 * created by chenxj
 */

var type;
var projectId;

/*table data start*/
var PAGESIZE = 8;
var currentPage = 1;
var totalPage = 0;
var numberOfPages = 5;
var projectIdModify;
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
				var reqData={"typeId":$("#p_typeId option:selected").val(),"name":$("#projectName").val(),"no":$("#projectNo").val()}; //取内容
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
}

/*function showMenu() {
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
            	dataList[length] = {"id":0,"pid":"","name":$.cookie("currentRQName"),"open":true,"nocheck":true};
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
}*/
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
	
	 var url = urlRootContext()+"/get_project_info"; //请求的网址
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
						    		 option = option + '<option value="'+this.projectId+'">'+this.rqName+'</option>';
						    	 });
						    	 
						    	 var str='<tr id="'+ this.projectId +'">'+
						    	 /*'<td ><div class="checkbox i-checks checkSingle"><label><input type="checkbox" value="'+ this.projectId +'" name="accountInfo"> <i></i></label></div></td>'+*/
						    	 '<td style="width: 100px;">' +'<img alt="" src="'+urlRootContext()+getProject_info_state(this.state)+'"></td>'+
						    	
						    	 '<td style="width: 400px;">' +'<a class="J_menuItem" href="'+urlRootContext()+'/project_info?projectId='+this.projectId+'" data-index="7">'+this.name+'</a>'  + '</td>'+
						    	 '<td style="width: 100px;">' + this.no + '</td>'+
						    	 '<td style="width: 200px;">' + this.typeId + '</td>'+
						    	 '<td style="width: 100px;">' + getProject_info_priority(this.priority) + '</td>';
						    	 
						    	 str+='<td style="width: 200px;">' + trim_date(this.planBeginDate);
						    	 str+='&nbsp&nbsp/&nbsp&nbsp'+ trim_date(this.planEndDate) + '</td>'+
						    	 '<td style="width: 200px;">' + getProgress_bar(Math.floor(this.progress)) +'</td>'+
//						    	 '<td><button type="button" class="btn btn-primary btn-outline btn-xs modify">修改</button></td>'+
						    	 '</tr>';
						         $("#tableBody").append(str);
						         $("#"+this.projectId).data("userDatas",this);
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

	//修改项目信息
	$("#tableBody td .modify").click(function(event){
		projectId = $(this).parent().parent().attr("id");
		var userDatas = $("#"+projectId).data("userDatas");
		
		type = 2;//修改
		//$("#accountEditModal #name").attr("readonly",true);
		$("#accountEditModal .modal-title").html("修改项目信息");
		$("#accountEditModal #name").val(userDatas.name);
		$("#accountEditModal #no").val(userDatas.no);
		
		 var se=document.getElementById("typeId");
		 var os=se.getElementsByTagName("option");
		 for(var i=0;i<os.length;i++){
			 if(os[i].innerHTML=userDatas.typeId){
			 os[i].selected=true;
			 break;
			 }
		 }
		 
		
		$("#accountEditModal #state").val(userDatas.state);
		$("#accountEditModal #priority").val(userDatas.priority);
		$("#accountEditModal #progress").val(userDatas.progress);
		$("#accountEditModal #site").val(userDatas.site);
		$("#accountEditModal #respDept").val(userDatas.respDept);
		$("#accountEditModal #ownerDept").val(userDatas.ownerDept);
		$("#accountEditModal #deputyDept").val(userDatas.deputyDept);
		$("#accountEditModal #builderDept").val(userDatas.builderDept);
		$("#accountEditModal #supDept").val(userDatas.supDept);
		$("#accountEditModal #designDept").val(userDatas.designDept);
		$("#accountEditModal #investor").val(userDatas.investor);
		$("#accountEditModal #gross").val(userDatas.gross);
		$("#accountEditModal #assets").val(userDatas.assets);
		$("#accountEditModal #address").val(userDatas.address);
		$("#accountEditModal #floorArea").val(userDatas.floorArea);
		$("#accountEditModal #coveredArea").val(userDatas.coveredArea);
		$("#accountEditModal #planArea").val(userDatas.planArea);
		$("#accountEditModal #capacity").val(userDatas.capacity);
		$("#accountEditModal #productType").val(userDatas.productType);
		$("#accountEditModal #annualProductValue").val(userDatas.annualProductValue);
		$("#accountEditModal #annualProductAmounr").val(userDatas.annualProductAmounr);
		$("#accountEditModal #annualSaleValue").val(userDatas.annualSaleValue);
		$("#accountEditModal #annualSaleAmount").val(userDatas.annualSaleAmount);
		$("#accountEditModal #annualRevenue").val(userDatas.annualRevenue);
		$("#accountEditModal #employees").val(userDatas.employees);
		$("#accountEditModal #acreProductValue").val(userDatas.acreProductValue);
		$("#accountEditModal #acreRevenue").val(userDatas.acreRevenue);
		$("#accountEditModal #acreAssets").val(userDatas.acreAssets);
		$("#accountEditModal #acreGross").val(userDatas.acreGross);
		$("#accountEditModal #electricity").val(userDatas.electricity);
		$("#accountEditModal #water").val(userDatas.water);
		$("#accountEditModal #note").val(userDatas.note);
		$("#accountEditModal #intro").val(userDatas.intro);
		
		$("#accountEditModal #beginDate").val(get_date(userDatas.planBeginDate));
		$("#accountEditModal #endDate").val(get_date(userDatas.planEndDate));
		$("#accountEditModal #s_beginDate").val(get_date(userDatas.actualBeginDate));
		$("#accountEditModal #s_endDate").val(get_date(userDatas.actualEndDate));
		
		
		
		
		
		/*$("#accountEditModal #password").parent().css("display","none");
		$("#accountEditModal #confirmPassword").parent().css("display","none");*/
		$("#accountEditModal").modal("show");
	});
	
	//重置密码
	/*$('#validationModal').on('show.bs.modal', function () {
	});*/
	$("#tableBody td .repassword").click(function(event){
		projectIdModify = $(this).parent().parent().attr("id");
		setDefaultValidator(passwordValidator);
		var userDatas = $("#"+projectIdModify).data("userDatas");
		$("#modifyUsername").val(userDatas.username);
		$("#modifyPasswordModal").modal("show");
	});
}

//新增项目信息
$("#addAccount").click(function(){
	type = 1;//新增
	//$("#accountEditModal #name").attr("readonly",false);
	$("#accountEditModal .modal-title").html("新增项目信息");
	
	$('#accountForm')[0].reset();
	
	$("#accountEditModal").modal("show");

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
			text : "你将删除选中的项目信息!",
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
     	            	swal("已删除!", "你已删除选中的项目信息！", "success");
     	            	var reqData= {"typeId":$("#p_typeId option:selected").val(),"name":$("#projectName").val(),"no":$("#projectNo").val()}; //取内容
     	            	//buildTable(JSON.stringify(reqData),(currentPage == totalPage && currentPage != 1)? currentPage-1:currentPage,PAGESIZE);//默认每页最多6条
     	            	//当选择删除的行等于总行，当前页-1
				     	currentPage=(selectedArr.length==($("#tableBody tr ").size()))?currentPage-1:currentPage;
     	            	buildTable(JSON.stringify(reqData),currentPage,PAGESIZE);
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
			
			typeId : {
				isChoose : !0,
				
			},
			name : {
				required : !0,
				maxlength : 60
			},
			no : {
				required : !0,
				maxlength : 10
			},
			
			state : {
				isChoose : !0,
			},
			priority : {
				isChoose : !0,
			},
			
		},
		messages : {
			/*username : {
				required : e + "请输入用户名！",
				minlength : e + "用户名必须1个字符以上！",
				maxlength : e + "用户名必须20个字符以下！"
			},*/
			
			typeId : {
				isChoose : e + "请选择项目类型！",
				
			},
			name : {
				required : e + "请输入项目名称！",
				maxlength : e + "项目名称必须60个字符以下！"
			},
			no : {
				required : e + "请输入项目编号！",
				maxlength : e + "项目名称必须10个字符以下！"
			},
			
			
			state : {
				isChoose : e + "请选择项目状态！",
			},
			priority : {
				isChoose : e + "请选择优先级！",
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

    $.ajax({
		type:"post",
		url:urlRootContext()+"/save_project_info",
		traditional:true,
	    data:
	    	$.param({
	    		'type':type,"id":projectId,"p_beginDate":$("#beginDate").val(), 
				"p_endDate":$("#endDate").val(), "ps_beginDate":$("#s_beginDate").val(), 
				"ps_endDate":$("#s_endDate").val()
	    		}) + '&' + $('#accountForm').serialize()
	    	,
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
					
					$("#accountEditModal").modal("hide");
				});
			}else{
				swal(data.message);
			}
		},
		error:function (XMLHttpRequest, textStatus, errorThrown) {
			swal("失败")
		}
	});
}


//添加单位  
$("#accountEditModal  .a_unit").live('click',function(){
	//获取项目单位列表
//	$("#accountEditModal").modal("hide");
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
//	$("#accountEditModal").modal("show");
	$('#accountEditModal').css({'overflow-y':'scroll'});
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




    
    
    

