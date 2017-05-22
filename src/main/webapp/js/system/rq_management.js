/**
 * created by chenxj
 */
var type;
var rqId;
var companyId = $("#companyId").val();

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
				var reqData= {"companyId":companyId,
						"rqAddress":$("#rqAddressValue").val(),"rqName":$("#rqNameValue").val()}; //取内容
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
     	            	 totalPage = response.data.pages;
     	            	 options.totalPages=(totalPage==0?1:totalPage);
     	    			 options.currentPage=pageNumber;
						 $('#bottomTab').bootstrapPaginator(options); //重新设置总页面数目
						 var dataList = response.data.dataList;
						 $("#tableBody").empty();//清空表格内容
						 if (dataList.length > 0 ) {
						     $(dataList).each(function(){//重新生成
						          $("#tableBody").append('<tr id="'+ this.id +'">'+
						            		'<td ><div class="checkbox i-checks checkSingle"><label><input type="checkbox" value="'+ this.id +'" name="residentialQuarters"> <i></i></label></div></td>'+
						            		'<td >' + this.rqName + '</td>'+
						            		'<td >' + this.companyName + '</td>'+
						            		'<td >' + this.contact + '</td>'+
						            		'<td >' + this.ownedArea + '</td>'+
						            		'<td >' + this.rqAddress + '</td>'+
						            		'<td ><button type="button" class="btn btn-primary btn-outline btn-xs editResidentialQuarter">编辑</button>'+
											'</td></tr>');
						            $("#" + this.id).data("residentialQuarter",this);//绑定数据
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
	$("#ownedArea").click(function (e) {
		SelCity(this,e);
	});
	
	var reqData= {"companyId":companyId,
			"rqAddress":$("#rqAddressValue").val(),"rqName":$("#rqNameValue").val()}; //取内容
	buildTable(JSON.stringify(reqData),1,PAGESIZE);//默认空白查全部
	
    //创建结算规则
    $("#queryButton").bind("click",function(){
    	var reqData= {"companyId":companyId,
				"rqAddress":$("#rqAddressValue").val(),"rqName":$("#rqNameValue").val()}; //取内容
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
	$("#residentialQuarterTable .checkAll").on("ifClicked",function(event){
		var len = $("#residentialQuarterTable #tableBody").find("input[type=checkbox]").length;
		var i = $("#residentialQuarterTable #tableBody").find("input[type=checkbox]:checked").length;
		if(i == len){
			$("#residentialQuarterTable #tableBody").find("input[type=checkbox]").iCheck("uncheck");
		}else{
			$("#residentialQuarterTable #tableBody").find("input[type=checkbox]").iCheck("check");
		}
	});
	
	//单选
	$("#residentialQuarterTable .checkSingle input").on('ifChecked', function(event) {
		if(true == $(this).is(':checked')){
			selectedArr.push($(this).val());//将所有选中的值添加进数组
			var len = $("#residentialQuarterTable #tableBody").find("input[type=checkbox]").length;
			var i = $("#residentialQuarterTable #tableBody").find("input[type=checkbox]:checked").length;
			if(len == i){
				$("#residentialQuarterTable .checkAll").iCheck("check");
			}
		}
	});
	
	$("#residentialQuarterTable .checkSingle input").on('ifUnchecked', function(event) {
		if(false == $(this).is(':checked')){
			selectedArr.splice($.inArray($(this).val(),selectedArr),1);//将所有选中的值从数组中删除
			var i = $("#residentialQuarterTable #tableBody").find("input[type=checkbox]:checked").length;
			var len = $("#residentialQuarterTable #tableBody").find("input[type=checkbox]").length;
			if(i != len){
				$("#residentialQuarterTable .checkAll").iCheck("uncheck");
			}
		}
	});
	
	//编辑小区
	$("#residentialQuarterTable #tableBody td .editResidentialQuarter").click(function(event){
		type = 2;//修改
		rqId = $(this).parent().parent().attr("id");
		var rqInfo = $("#"+rqId).data("residentialQuarter");
		$("#residentialQuarterForm .modal-title").html("编辑小区信息");
		$("#residentialQuarterEditModal #rqName").val(rqInfo.rqName);
		$("#residentialQuarterEditModal #contact").val(rqInfo.contact);
		$("#residentialQuarterEditModal #ownedArea").val(rqInfo.ownedArea);
		$("#residentialQuarterEditModal #rqAddress").val(rqInfo.rqAddress);
		$("#residentialQuarterEditModal #rqDescription").val(rqInfo.rqDescription);
		$("#residentialQuarterEditModal").modal("show");
	});
}

//新增小区
$("#addResidentialQuarter").click(function(){
	type = 1;//新增
	$("#residentialQuarterForm .modal-title").html("新增小区");
	$("#residentialQuarterEditModal #rqName").val("");
	$("#residentialQuarterEditModal #contact").val("");
	$("#residentialQuarterEditModal #ownedArea").val("");
	$("#residentialQuarterEditModal #rqAddress").val("");
	$("#residentialQuarterEditModal #rqDescription").val("");
	$("#residentialQuarterEditModal").modal("show");
});

//删除小区
$("#deleteResidentialQuarter").click(function(){
	if(selectedArr.length != 0){
		swal({
			title : "确定删除选中项?",
			text : "你将删除选中的小区!",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#DD6B55",
			confirmButtonText : "是的，删除",
			cancelButtonText: "取消",
			closeOnConfirm : false
		}, function() {
			$.ajax({
     	        type:"POST",
     	        url:urlRootContext()+"/delete_residential_quarter",
     	        traditional:true,
     	        data:{"selectedArr":selectedArr},
     	        async:false,
     	        dataType:"json",
     	        success: function(response){
     	            if(response.success) {
     	            	swal("已删除!", "你已删除选中的小区！", "success");
     	            	var reqData= {"companyId":companyId,
    							"rqAddress":$("#rqAddressValue").val(),"rqName":$("#rqNameValue").val()}; //取内容
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

/*
 * 表单验证
 */
setDefaultValidator(residentialQuarterFormValidator);

function residentialQuarterFormValidator(){
	var e = "<i class='fa fa-times-circle'></i> ";
	$("#residentialQuarterForm").validate({
		rules : {
			rqName : {
				required : !0,
				minlength : 1,
				maxlength : 20
			},
			companyName : {
				required : !0,
				minlength : 1,
				maxlength : 20
			},
			ownedArea : {
				required : !0
			},
			contact : {
				 isPhone : !0
			},
			rqAddress : {
				required : !0,
				minlength : 1,
				maxlength : 50
			}
		},
		messages : {
			rqName : {
				required : e + "请输入小区名称！",
				minlength : e + "小区名称必须1个字符以上！",
				maxlength : e + "小区名称名必须20个字符以下！"
			},
			companyName : {
				required : e + "请输入用户名！",
				minlength : e + "单位名称必须1个字符以上！",
				maxlength : e + "单位名称名必须20个字符以下！"
			},
			ownedArea : {
				required : e + "请选择对应的行政区域！"
			},
			contact : {
				isPhone : e + "请输入有效的联系电话！"
			},
			rqAddress : {
				required : e + "请输入小区地址！",
				minlength : e + "小区地址必须1个字符以上！",
				maxlength : e + "小区地址名必须20个字符以下！"
			}
		},
		submitHandler: function (form){
			saveRqInfo(form);
        }  
	});
}

var saveRqInfo = function(form){
	console.log("submit!");
    $.ajax({
		type:"post",
		url:urlRootContext()+"/save_residential_quarter_info?type="+type+"&rqId="+rqId+"&companyId="+companyId,
		traditional:true,
	    data:$(form).serialize(),
		dataType:"json",
		success:function(data){
			if(data.success){
				//改变当前小区选择框的值
				var rqList;
				var dataList = data.data.managedRQs;
				$(dataList).each(function(){
					rqList += '<option value="'+this.id+'">'+this.rqName+'</option>';
				});
				$(window.parent.document.body).find("#currentRQ").html(rqList)
				$(window.parent.document.body).find("#currentRQ").val(rqId);
				swal({
					title : data.message,
					type : "success",
					confirmButtonColor : "#AEDEF4",
					confirmButtonText : "确定",
					closeOnConfirm : true
				}, function() {
					var reqData= {"companyId":companyId,
							"rqAddress":$("#rqAddressValue").val(),"rqName":$("#rqNameValue").val()}; //取内容
					if(type == 1){
						currentPage = 1;
					}
					buildTable(JSON.stringify(reqData),currentPage,PAGESIZE);//默认每页最多6条
					$("#residentialQuarterEditModal").modal("hide");
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

