/**
 * created by chenxj
 */

var type=1;//1-新增，2-修改
var holidayId;

/**初始化企业节假日*/
$("#initHoliday").click(function(){
	swal({
		title : "您是否确定初始化今年节假日\n初始化后原来的数据将被清除掉！",
		type : "warning",
		showCancelButton : true,
		confirmButtonColor : "#DD6B55",
		confirmButtonText : "确定",
		cancelButtonText : "取消",
		closeOnConfirm : false
	}, function() {
		$.ajax({
			type:"post",
			url:urlRootContext()+"/init_company_holidays.do",
			data:{"year":$("#year").val()},
			dataType:"json",
			success:function(data){
				if(data.success){
					swal({
						title : data.message,
						type: "success",
						confirmButtonText : "确定",
						closeOnConfirm : true
					}, function() {
						//重新刷新显示数据
						buildTable('{"year":'+$("#year").val()+'}',1,PAGESIZE);//默认查全部
						$('.checkAll').iCheck('uncheck');
     	            	selectedArr.splice(0,selectedArr.length);//清空数组
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
	});
});

/**查询企业节假日*/
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
				var reqData= {"year":$("#year").val()}; //取内容
		    	currentPage = newPage;
		    	buildTable(JSON.stringify(reqData),newPage,PAGESIZE);//默认每页最多6条
		    	$('.checkAll').iCheck('uncheck');
	            selectedArr.splice(0,selectedArr.length);//清空数组
			},  
		    onPageClicked: function (e, originalEvent, type, page) {  
		    	
		    }  
		} 	

//生成表格
function buildTable(reqData,pageNumber,pageSize) {
	 var url = urlRootContext()+"/get_company_holidays.do"; //请求的网址
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
						            		'<td ><div class="checkbox i-checks checkSingle"><label><input type="checkbox" value="'+ this.id +'" name="holidays"> <i></i></label></div></td>'+
						            		'<td '+(this.holidayType == 1?'class="text-success"':'')+'>' + this.holidayName + '</td>'+
						            		'<td >' + new Date(this.startTime).pattern("yyyy-MM-dd") + '</td>'+
						            		'<td >' + new Date(this.endTime).pattern("yyyy-MM-dd") + '</td>'+
						            		'<td >' + (this.holidayType == 1?"法定节假日":"休息日") + '</td>'+
						            		'<td >' + (this.executeObject == 1?"所有员工":"指定员工") + '</td>'+
						            		'<td ><button type="button" class="btn btn-primary btn-outline btn-xs editHoliday" '+(new Date(this.startTime) < new Date(new Date().pattern("yyyy-MM-dd")+" 00:00:00")?'disabled="disabled"':'')+'>编辑</button>'+//TODO 到时具体到时间时得改动
											'</td></tr>');
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
	
	buildTable('{"year":'+$("#year").val()+'}',1,PAGESIZE);//默认查全部
	
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
	$(".checkAll").on("ifChecked",function(event){
		var len = $("#tableBody").find("input[type=checkbox]").length;
		var i = $("#tableBody").find("input[type=checkbox]:checked").length;
		if(i != len){
			$("#tableBody").find("input[type=checkbox]").iCheck("check");
		}
	});
	//反选
	$(".checkAll").on("ifUnchecked",function(event){
		var len = $("#tableBody").find("input[type=checkbox]").length;
		var i = $("#tableBody").find("input[type=checkbox]:checked").length;
		if(i == len){
			$("#tableBody").find("input[type=checkbox]").iCheck("uncheck");
		}
	});
	
	//单选
	$(".checkSingle input").on('ifChecked', function(event) {
		if(true == $(this).is(':checked')){
			selectedArr.push($(this).val());//将所有选中的值添加进数组
			var len = $("#tableBody").find("input[type=checkbox]").length;
			var i = $("#tableBody").find("input[type=checkbox]:checked").length;
			if(len == i){
				$(".checkAll").iCheck("check");
			}
		}
		console.info("checkSingle-Y:"+selectedArr);
	});
	
	$(".checkSingle input").on('ifUnchecked', function(event) {
		if(false == $(this).is(':checked')){
			selectedArr.splice($.inArray($(this).val(),selectedArr),1);//将所有选中的值从数组中删除
			var i = $("#tableBody").find("input[type=checkbox]:checked").length;
			var len = $("#tableBody").find("input[type=checkbox]").length;
			if(i != len){
				$(".checkAll").iCheck("uncheck");
			}
		}
		console.info("checkSingle-N:"+selectedArr);
	});
	
	//修改节假日信息
	$("#tableBody td .editHoliday").click(function(event){
		type = 2;//修改
		holidayId = $(this).parent().parent().attr("id");
		$('#holidayModal').modal('show');
		$("#holidayName").val($("#"+holidayId+" td:nth-child(2)").html());
		$("#startTime").datepicker("setDate",$("#"+holidayId+" td:nth-child(3)").html());
		$("#endTime").datepicker("setDate",$("#"+holidayId+" td:nth-child(4)").html());
	});
}

//删除节假日
$("#deleteHoliday").click(function(){
	if(selectedArr.length != 0){
		swal({
			title : "确定删除选中节假日?",
			text : "删除选中的节假日后将会影响改天的考勤!",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#DD6B55",
			confirmButtonText : "是的，删除",
			cancelButtonText: "取消",
			closeOnConfirm : false
		}, function() {
			$.ajax({
     	        type:"POST",
     	        url:urlRootContext()+"/company_holidays_delete.do",
     	        traditional:true,
     	        data:{"selectedArr":selectedArr},
     	        async:false,
     	        dataType:"json",
     	        success: function(response){
     	            if(response.success) {
     	            	swal("已删除!", "你已删除选中的节假日！", "success");
     	            	var reqData= {"year":$("#year").val()}; //取内容
     	            	buildTable(JSON.stringify(reqData),(currentPage == totalPage && currentPage != 1)? currentPage-1:currentPage,PAGESIZE);//默认每页最多6条
     	            	currentPage = currentPage - 1 ;
     	            	$('.checkAll').iCheck('uncheck');
     	            	selectedArr.splice(0,selectedArr.length);//清空数组
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
		swal("请选择要删除的节假日!");
	}
});

//年份改变显示对应的数据
$("#year").change(function(){
	buildTable('{"year":'+$("#year").val()+'}',1,PAGESIZE);//默认查全部
	$('.checkAll').iCheck('uncheck');
	selectedArr.splice(0,selectedArr.length);//清空数组
	
	
	var len = $("#tableBody").find("input[type=checkbox]").length;
	var i = $("#tableBody").find("input[type=checkbox]:checked").length;
	console.warn("len:"+len+",i:"+i);
});


//保存节假日
$("#saveHoliday").click(function(){
	if($("#holidayName").val() == ''){
		swal("请输入相应的节假日名称！");
	}else if($("#startTime").val() == '' ||  $("#endTime").val() == ''){
		swal("请选择相应的开始时间和结束时间！");
	}else{
		$.ajax({
			type:"post",
			url:urlRootContext()+"/holiday_info_save.do?type="+type+"&holidayId="+holidayId,
			data:$("#holidayModal form").serialize(),
			dataType:"json",
			success:function(data){
				if(data.success){
					if(type == 2){
						$("#"+holidayId+" td:nth-child(2)").html($("#holidayName").val());
						$("#"+holidayId+" td:nth-child(3)").html($("#startTime").val());
						$("#"+holidayId+" td:nth-child(4)").html($("#endTime").val());
					}
					swal({
						title : data.message,
						type : "success",
						confirmButtonText : "确定",
						closeOnConfirm : true
					}, function() {
						$("#holidayModal").modal("hide");
						if(type == 1){
							buildTable('{"year":'+$("#year").val()+'}',1,PAGESIZE);
	     	            	$('.checkAll').iCheck('uncheck');
	     	            	selectedArr.splice(0,selectedArr.length);//清空数组
						}
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
});

//新增节假日
$("#addHoliday").click(function(){
	type = 1;//修改
	$('#holidayModal').modal('show');
	$("#holidayName").val("");
	$("#startTime").val("");
	$("#endTime").val("");
});