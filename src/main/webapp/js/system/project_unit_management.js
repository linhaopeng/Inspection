/**
 * created by chenxj
 */

var type;
var commonDeptId;

/*table data start*/
var PAGESIZE = 8;
var currentPage = 1;
var totalPage = 0;
var numberOfPages = 5;
var commonDeptIdModify;
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
				var reqData= {"commName":$("#commName").val()}; //取内容
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



//生成表格
function buildTable(reqData,pageNumber,pageSize,id) {
	
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
     	            	options.totalPages=(totalPage==0?1:totalPage);
     	    			options.currentPage=pageNumber;
						 $('#bottomTab').bootstrapPaginator(options); //重新设置总页面数目
						 var dataList = response.data.dataList;
						 $("#tableBody").empty();//清空表格内容
						 if (dataList.length > 0 ) {
						     $(dataList).each(function(){//重新生成
						    	 var option = "";
						    	 $(this.residentialQuarters).each(function(){
						    		 option = option + '<option value="'+this.commonDeptId+'">'+this.rqName+'</option>';
						    	 });
						    	 
						         $("#tableBody").append('<tr id="'+ this.commonDeptId +'">'+
						            		'<td ><div class="checkbox i-checks checkSingle"><label><input type="checkbox" value="'+ this.commonDeptId +'" name="accountInfo"> <i></i></label></div></td>'+
						            		'<td style="width: 450px;">' + this.name + '</td>'+
						            		'<td style="width: 200px;">' + this.principal + '</td>'+
						            		'<td style="width: 200px;">' + this.phone + '</td>'+
						            		'<td style="width: 500px;">' + this.address + '</td>'+
											'<td style="width: 200px;"><button type="button" class="btn btn-primary btn-outline btn-xs modify">修改</button>'+
											'</td></tr>');
						         $("#"+this.commonDeptId).data("userDatas",this);
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
    	var reqData= {"commName":$("#commName").val()}; //取内容
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

	//修改项目单位信息
	$("#tableBody td .modify").click(function(event){
		commonDeptId = $(this).parent().parent().attr("id");
		var userDatas = $("#"+commonDeptId).data("userDatas");
		
		type = 2;//修改
		$("#accountEditModal #name").attr("readonly",true);
		$("#accountEditModal .modal-title").html("修改项目单位");
		$("#accountEditModal #name").val(userDatas.name);
		$("#accountEditModal #principal").val(userDatas.principal);
		$("#accountEditModal #phone").val(userDatas.phone);
		$("#accountEditModal #address").val(userDatas.address);
		/*$("#accountEditModal #password").parent().css("display","none");
		$("#accountEditModal #confirmPassword").parent().css("display","none");*/
		$("#accountEditModal").modal("show");
	});
	

}

//新增项目单位
$("#addAccount").click(function(){
	type = 1;//新增
	$("#accountEditModal #name").attr("readonly",false);
	$("#accountEditModal .modal-title").html("新增项目单位");
	
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
			text : "你将删除选中的项目单位!",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#DD6B55",
			confirmButtonText : "是的，删除",
			cancelButtonText: "取消",
			closeOnConfirm : false
		}, function() {
			$.ajax({
     	        type:"POST",
     	        url:urlRootContext()+"/delete_project_unit/",
     	        traditional:true,
     	        data:{"selectedArr":selectedArr},
     	        async:false,
     	        dataType:"json",
     	        success: function(response){
     	            if(response.success) {
     	            	swal("已删除!", "你已删除选中的项目单位！", "success");
     	            	var reqData= {"commName":$("#commName").val()}; //取内容
     	            	//buildTable(JSON.stringify(reqData),(currentPage == totalPage && currentPage != 1)? currentPage-1:currentPage,PAGESIZE);//默认每页最多6条
     	            	//当选择删除的行等于总行，当前页-1
				     	currentPage=(selectedArr.length==($("#tableBody tr ").size()))?currentPage-1:currentPage;
				     	if(currentPage<1){
				     		currentPage=1;
				     	}
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




/**
 * 保存
 */
var saveAccountInfo = function(form){
	
	var obj = document.getElementsByTagName("input");
    for(var i=0; i<obj.length; i ++){
        if(obj[i].checked){
            sex=obj[i].value;
        }
    }
    $.ajax({
		type:"post",
		url:urlRootContext()+"/save_project_unit",
		traditional:true,
	    data:{"type":type,"commonDeptId":commonDeptId,"name":$("#name").val(),"principal":$("#principal").val(),
	    	"phone":$("#phone").val(),"address":$("#address").val()},
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
						var reqData= {"commName":$("#commName").val()}; //取内容
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
/*
 * 表单验证
 */
setDefaultValidator(accountFormValidator);

function accountFormValidator(){
	var e = "<i class='fa fa-times-circle'></i> ";
	$("#accountForm").validate({
		rules : {
			name : {
				required : !0,
			},
			
		},
		messages : {
			name : {
				required : e + "请输入单位名称！",
			},
			
		},
		submitHandler: function (form){
			saveAccountInfo(form);
        }  
	});
}
