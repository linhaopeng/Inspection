/**
 * created by chenxj
 */

var companyId;
var type;

/*table data start*/
var PAGESIZE = 8;
var currentPage = 1;
var totalPage = 0;
var numberOfPages = 5;
var accountIdModify;
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
				var reqData= {"companyName":$("#companyNameValue").val(),"ownedArea":$("#ownedAreaValue").val(),
						"companyAddress":$("#companyAddressValue").val()}; //取内容
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
	 var url = urlRootContext()+"/get_engineering_units"; //请求的网址
     var reqParams = {'reqData':reqData, 'pageNumber':pageNumber,'pageSize':pageSize};//请求数据
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
						         $("#tableBody").append('<tr id="'+ this.id +'">'+
						            		'<td ><div class="checkbox i-checks checkSingle"><label><input type="checkbox" value="'+ this.id +'" name="companyInfos"> <i></i></label></div></td>'+
						            		'<td >' + this.companyNum + '</td>'+
						            		'<td >' + this.companyName + '</td>'+
						            		'<td >' + this.legalPerson + '</td>'+
						            		'<td >' + this.ownedArea + '</td>'+
						            		'<td >' + this.contactPerson + '</td>'+
						            		'<td >' + this.contact + '</td>'+
						            		'<td >' + this.address + '</td>'+
						            		'<td ><button type="button" class="btn btn-primary btn-outline btn-xs editCompany">编辑</button>'+
											'</td></tr>');
						         $("#"+this.id).data("company",this);
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
	
	buildTable("",1,PAGESIZE);//默认空白查全部
	
    //创建结算规则
    $("#queryCompany").bind("click",function(){
    	var reqData= {"companyName":$("#companyNameValue").val(),"ownedArea":$("#ownedAreaValue").val(),
				"companyAddress":$("#companyAddressValue").val()}; //取内容
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
	$("#engineeringTable .checkAll").on("ifChecked",function(event){
		var len = $("#engineeringTable #tableBody").find("input[type=checkbox]").length;
		var i = $("#engineeringTable #tableBody").find("input[type=checkbox]:checked").length;
		if(i != len){
			$("#engineeringTable #tableBody").find("input[type=checkbox]").iCheck("check");
		}
	});
	
	//反选
	$("#engineeringTable .checkAll").on("ifUnchecked",function(event){
		var len = $("#engineeringTable #tableBody").find("input[type=checkbox]").length;
		var i = $("#engineeringTable #tableBody").find("input[type=checkbox]:checked").length;
		if(i == len){
			$("#engineeringTable #tableBody").find("input[type=checkbox]").iCheck("uncheck");
		}
	});
	
	//单选
	$("#engineeringTable .checkSingle input").on('ifChecked', function(event) {
		if(true == $(this).is(':checked')){
			selectedArr.push($(this).val());//将所有选中的值添加进数组
			var len = $("#engineeringTable #tableBody").find("input[type=checkbox]").length;
			var i = $("#engineeringTable #tableBody").find("input[type=checkbox]:checked").length;
			if(len == i){
				$("#engineeringTable .checkAll").iCheck("check");
			}
		}
	});
	
	$("#engineeringTable .checkSingle input").on('ifUnchecked', function(event) {
		if(false == $(this).is(':checked')){
			selectedArr.splice($.inArray($(this).val(),selectedArr),1);//将所有选中的值从数组中删除
			var i = $("#engineeringTable #tableBody").find("input[type=checkbox]:checked").length;
			var len = $("#engineeringTable #tableBody").find("input[type=checkbox]").length;
			if(i != len){
				$("#engineeringTable .checkAll").iCheck("uncheck");
			}
		}
	});

	//编辑单位信息
	$("#tableBody td .editCompany").click(function(event){
		type = 2;//修改
		companyId = $(this).parent().parent().attr("id");
		var companyInfo = $("#"+companyId).data("company");
		$("#companyEditModal .modal-title").html("编辑工程单位");
		$("#companyEditModal #companyNum").val(companyInfo.companyNum);
		$("#companyEditModal #companyName").val(companyInfo.companyName);
		$("#companyEditModal #legalPerson").val(companyInfo.legalPerson);
		$("#companyEditModal #ownedArea").val(companyInfo.ownedArea);
		$("#companyEditModal #contactPerson").val(companyInfo.contactPerson);
		$("#companyEditModal #contact").val(companyInfo.contact);
		$("#companyEditModal #fax").val(companyInfo.fax);
		$("#companyEditModal #address").val(companyInfo.address);
		$("#companyEditModal #website").val(companyInfo.website);
		$("#companyEditModal #description").val(companyInfo.description);
		$("#companyEditModal").modal("show");
	});
	
}

//新增单位
$("#addCompany").click(function(){
	type = 1;//新增
	$("#companyEditModal #companyName").val("");
	$("#companyEditModal #legalPerson").val("");
	$("#companyEditModal #ownedArea").val("");
	$("#companyEditModal #contactPerson").val("");
	$("#companyEditModal #contact").val("");
	$("#companyEditModal #fax").val("");
	$("#companyEditModal #address").val("");
	$("#companyEditModal #website").val("");
	$("#companyEditModal #description").val("");
	//生成企业编号
	$.ajax({
	        type:"GET",
	        url:urlRootContext()+"/get_company_num",
	        traditional:true,
	        data:"",
	        dataType:"json",
	        success: function(response){
	            if(response.success) {
	            	$("#companyEditModal #companyNum").val(response.data);
			}else{
				 alert(response.message);
			}
		},
		error: function(e){
			 swal("生成企业编号失败！", "", "error");
	        }
	    });
	$("#companyEditModal").modal("show");
});

//删除单位
$("#deleteCompany").click(function(){
	if(selectedArr.length != 0){
		swal({
			title : "确定删除选中项?",
			text : "你将删除选中的工程单位!",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#DD6B55",
			confirmButtonText : "是的，删除",
			cancelButtonText: "取消",
			closeOnConfirm : false
		}, function() {
			$.ajax({
     	        type:"POST",
     	        url:urlRootContext()+"/delete_company_info",
     	        traditional:true,
     	        data:{"selectedArr":selectedArr},
     	        async:false,
     	        dataType:"json",
     	        success: function(response){
     	            if(response.success) {
     	            	swal("已删除!", "你已删除选中的工程单位！", "success");
     	            	var reqData= {"companyName":$("#companyNameValue").val(),"ownedArea":$("#ownedAreaValue").val(),
     							"companyAddress":$("#companyAddressValue").val()}; //取内容
     	            	buildTable(JSON.stringify(reqData),(currentPage == totalPage && currentPage != 1)? currentPage-1:currentPage,PAGESIZE);//默认每页最多6条
     	            	currentPage = currentPage - 1 ;
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
setDefaultValidator(companyFormValidator);

function companyFormValidator(){
	var e = "<i class='fa fa-times-circle'></i> ";
	$("#companyForm").validate({
		rules : {
			companyName : {
				required : !0,
				minlength : 1,
				maxlength : 20
			},
			legalPerson : {
				required : !0,
				minlength : 1,
				maxlength : 20
			},
			contactPerson : {
				required : !0,
				minlength : 1,
				maxlength : 20,
			},
			ownedArea : {
				required : !0
			},
			contact : {
				 isPhone : !0
			},
			fax : {
				isPhone : !0
			}
		},
		messages : {
			companyName : {
				required : e + "请输入用户名！",
				minlength : e + "单位名称必须1个字符以上！",
				maxlength : e + "单位名称名必须20个字符以下！"
			},
			legalPerson : {
				required : e + "请输入法人代表！",
				minlength : e + "法人代表必须6个字符以上！",
				maxlength : e + "法人代表必须20个字符以下！"
			},
			contactPerson : {
				required : e + "请输入确认联系人！",
				minlength : e + "联系人必须6个字符以上！",
				maxlength : e + "联系人必须20个字符以下！",
			},
			ownedArea : {
				required : e + "请选择对应的行政区域！"
			},
			contact : {
				isPhone : e + "请输入有效的联系电话！"
			},
			fax : {
				isPhone : e + "请输入有效的传真！"
			}
		},
		submitHandler: function (form){
			saveCompanytInfo(form);
        }  
	});
}

var saveCompanytInfo = function(form){
	console.log("submit!");
    $.ajax({
		type:"post",
		url:urlRootContext()+"/save_company_info?type="+type+"&companyId="+companyId+"&companyType=2",
		traditional:true,
	    data:$(form).serialize(),
		dataType:"json",
		success:function(data){
			if(data.success){
				swal({
					title : data.message,
					type : "success",
					confirmButtonColor : "#AEDEF4",
					confirmButtonText : "确定",
					closeOnConfirm : true
				}, function() {
					if(type == 1){
						buildTable("",1,PAGESIZE);//默认空白查全部
					}else if(type == 2){
						var reqData= {"companyName":$("#companyNameValue").val(),"ownedArea":$("#ownedAreaValue").val(),
								"companyAddress":$("#companyAddressValue").val()}; //取内容
     	            	buildTable(JSON.stringify(reqData),currentPage,PAGESIZE);//默认每页最多6条
					}
					$("#companyEditModal").modal("hide");
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