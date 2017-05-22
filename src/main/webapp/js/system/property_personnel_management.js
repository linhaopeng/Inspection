/**
 * created by chenxj
 */

var deviceId;
var type;
var residentialQuarterId;
var personnelId;
var companyId = $("#companyId").val();
var rqRfidArr = new Array();
var sex;
var personnelStatus;

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
				var reqData= {"personnelName":$("#personnelNameValue").val(),
						"personnelPhone":$("#personnelPhoneValue").val(),"personnelType":$("#personnelTypeValue").val()}; //取内容
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
	 var url = urlRootContext()+"/get_property_personnels"; //请求的网址
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
						    	 var option = "";
						    	 $(this.rfidCards).each(function(){
						    		 option = option + '<option value="'+this.id+'">'+this.cardId+'</option>';
						    	 });
						    	 
						    	 var personnelType;//1-物业经理，2-物业管理员，3-物业操作员，4-小区管理员，5-小区操作员，6-保洁人员
						    	  switch (this.personnelType) {
									case 1:
										personnelType = "物业经理";
										break;
									case 2:
										personnelType = "物业管理员";
										break;
									case 3:
										personnelType = "物业操作员";
										break;
									case 4:
										personnelType = "小区管理员";
										break;
									case 5:
										personnelType = "小区操作员";
										break;
									case 6:
										personnelType = "保洁人员";
										break;
									default:
										personnelType = "--";
										break;
									}
						    	 	
						          $("#tableBody").append('<tr id="'+ this.personnelId +'">'+
						            		'<td ><div class="checkbox i-checks checkSingle"><label><input type="checkbox" value="'+ this.personnelId +'" name="personnels"> <i></i></label></div></td>'+
						            		'<td >' + this.personnelName + '</td>'+
						            		'<td >' + this.personnelPhone + '</td>'+
						            		'<td >' + this.personnelIdentityNum + '</td>'+
						            		'<td >' + personnelType + '</td>'+
						            		'<td ><select id="rfid_"'+this.personnelId+' >'+
						            			option
					                         + '</select></td>'+
						            		'<td ><button type="button" class="btn btn-primary btn-outline btn-xs editPersonnel">编辑</button>'+
											'</td></tr>');
						            $("#" + this.personnelId).data("personnel",this);//绑定数据
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
	
	buildTable("",1,PAGESIZE);//默认空白查全部
	
    //创建结算规则
    $("#queryButton").bind("click",function(){
    	var reqData= {"personnelName":$("#personnelNameValue").val(),
				"personnelPhone":$("#personnelPhoneValue").val(),"personnelType":$("#personnelTypeValue").val()}; //取内容
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
	$("#propertyPersonnelTable .checkAll").on("ifClicked",function(event){
		var len = $("#propertyPersonnelTable #tableBody").find("input[type=checkbox]").length;
		var i = $("#propertyPersonnelTable #tableBody").find("input[type=checkbox]:checked").length;
		if(i == len){
			$("#propertyPersonnelTable #tableBody").find("input[type=checkbox]").iCheck("uncheck");
		}else{
			$("#propertyPersonnelTable #tableBody").find("input[type=checkbox]").iCheck("check");
		}
	});
	
	//单选
	$("#propertyPersonnelTable .checkSingle input").on('ifChecked', function(event) {
		if(true == $(this).is(':checked')){
			selectedArr.push($(this).val());//将所有选中的值添加进数组
			var len = $("#propertyPersonnelTable #tableBody").find("input[type=checkbox]").length;
			var i = $("#propertyPersonnelTable #tableBody").find("input[type=checkbox]:checked").length;
			if(len == i){
				$("#propertyPersonnelTable .checkAll").iCheck("check");
			}
		}
	});
	
	$("#propertyPersonnelTable .checkSingle input").on('ifUnchecked', function(event) {
		if(false == $(this).is(':checked')){
			selectedArr.splice($.inArray($(this).val(),selectedArr),1);//将所有选中的值从数组中删除
			var i = $("#propertyPersonnelTable #tableBody").find("input[type=checkbox]:checked").length;
			var len = $("#propertyPersonnelTable #tableBody").find("input[type=checkbox]").length;
			if(i != len){
				$("#propertyPersonnelTable .checkAll").iCheck("uncheck");
			}
		}
	});
	
	//编辑人员
	$("#propertyPersonnelTable #tableBody td .editPersonnel").click(function(event){
		type = 2;//修改
		personnelId = $(this).parent().parent().attr("id");
		var personnelInfo = $("#"+personnelId).data("personnel");
		residentialQuarterId = "";
		rfidCardId = "";
		rqRfidArr.length = 0;//清空数组 
		$("#propertyPersonnelForm .modal-title").html("编辑物业人员");
		$("#propertyPersonnelEditModal #personnelName").val(personnelInfo.personnelName);
		$("#propertyPersonnelEditModal #personnelPhone").val(personnelInfo.personnelPhone);
		$("#propertyPersonnelEditModal #personnelIdentityNum").val(personnelInfo.personnelIdentityNum);
		$("#propertyPersonnelEditModal #personnelType").val(personnelInfo.personnelType);
		$("#propertyPersonnelEditModal #rfidCard").val("");
		$("#propertyPersonnelEditModal #birthday").val(personnelInfo.personnelBirthday);
		$("#propertyPersonnelEditModal #address").val(personnelInfo.personnelAddress);
		var li = "";
		$(personnelInfo.residentialQuarters).each(function(){
			li=li+managedRqLi("managedRq"+this.id,this.id,this.rqName);	
			rqTempArr.push(this.id);//将所有选中的值添加进数组
			rqTempMap.rq.push({'id':this.id,"name":this.rqName});
			rqArr = $.map(rqTempArr , function(n){//将临时数组赋给新数组
				  return n;
			});
			rqMap = $.extend(true,{},rqTempMap);//复制对象
		});
		$(personnelInfo.rfidCards).each(function(){
			var rqRfidMap = {};
			rqRfidMap["residentialQuarterId"] = this.residentialQuarters;
			rqRfidMap["rfidCardId"] = this.cardId == null?"":this.cardId;
			rqRfidArr.push(rqRfidMap);
		});
		$("#propertyPersonnelEditModal #managedRq").html(li);//TODO 
		managedRqReload();//TODO 
		$("input[name='sex']").iCheck("check");
		$("input[name='personnelStatus']").iCheck("check");
		sex = personnelInfo.personnelSex;
		personnelStatus = personnelInfo.personnelStatus;
		$("input[name='sex']").each(function(){
			if($(this).val() == sex){
				$(this).iCheck("check");//选中的值
			}
		});
		$("input[name='personnelStatus']").each(function(){
			if($(this).val() == personnelStatus){
				$(this).iCheck("check");//选中的值
			}
		});
		$("#propertyPersonnelEditModal").modal("show");
	});
}

$("#propertyPersonnelEditModal").on('shown.bs.modal', function () {
	$("input[name='sex']").on('ifChecked', function(event){ //ifCreated 事件应该在插件初始化之前绑定 
		sex = $(this).val();
	}); 
	$("input[name='personnelStatus']").on('ifChecked', function(event){ //ifCreated 事件应该在插件初始化之前绑定 
		personnelStatus = $(this).val();
	}); 
})

//新增人员
$("#addPropertyPersonnel").click(function(){
	type = 1;//新增
	$("#propertyPersonnelForm .modal-title").html("新增物业人员");
	$("#propertyPersonnelEditModal #personnelName").val("");
	$("#propertyPersonnelEditModal #personnelPhone").val("");
	$("#propertyPersonnelEditModal #personnelIdentityNum").val("");
	$("#propertyPersonnelEditModal #personnelType").val(1);
	$("#propertyPersonnelEditModal #managedRq").html("");//TODO 
	$("#propertyPersonnelEditModal #rfidCard").val("");
	$("#propertyPersonnelEditModal #birthday").val("");
	$("#propertyPersonnelEditModal #address").val("");
	$("#propertyPersonnelEditModal #sex").val(0);
	$("#propertyPersonnelEditModal #personnelStatus").val(1);
	sex = 0;
	personnelStatus = 1;
	residentialQuarterId = "";
	rfidCardId = "";
	rqRfidArr.length = 0;//清空数组 
	rqArr.length = 0;//清空数组 
	rqMap={rq:[]};
	$("#propertyPersonnelEditModal").modal("show");
});

//删除人员
$("#deletePropertyPersonnel").click(function(){
	if(selectedArr.length != 0){
		swal({
			title : "确定删除选中项?",
			text : "你将删除选中的人员!",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#DD6B55",
			confirmButtonText : "是的，删除",
			cancelButtonText: "取消",
			closeOnConfirm : false
		}, function() {
			$.ajax({
     	        type:"POST",
     	        url:urlRootContext()+"/delete_property_personnel",
     	        traditional:true,
     	        data:{"selectedArr":selectedArr},
     	        async:false,
     	        dataType:"json",
     	        success: function(response){
     	            if(response.success) {
     	            	swal("已删除!", "你已删除选中的人员！", "success");
     	            	var reqData= {"personnelName":$("#personnelNameValue").val(),
     	       				"personnelPhone":$("#personnelPhoneValue").val(),"personnelType":$("#personnelTypeValue").val()}; //取内容
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
		if($.inArray($(this).val(),rqArr) != -1){
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
	$('#propertyPersonnelEditModal').css("overflow","scroll");
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
	//console.log("confirmRQ"+rqArr);//TODO
	
	rqMap = $.extend(true,{},rqTempMap);//复制对象
	//console.log(JSON.stringify(rqMap));
	
	$('#residentialQuarterModal').modal('hide');
	$("#managedRq").empty();//清空列表
	var li="";
	for(var i=0;i<rqArr.length;i++){
		var rq_id = rqArr[i];
		li=li+managedRqLi("managedRq"+rq_id,rq_id,getObjData(rqMap.rq,rq_id));
		var rqRfidMap = {};
		rqRfidMap["residentialQuarterId"] = rq_id;
		rqRfidMap["rfidCardId"] = "";
		rqRfidArr.push(rqRfidMap);//将选中de值加进rqRfidArr数组eg:{"123121654656789":""}
	}
	$("#managedRq").html(li);
	managedRqReload();
});

//重载事件
function managedRqReload(){
	//对应li的删除事件
	$("#managedRq .pull-right").click(function(){
		var rq_id = $(this).attr("name");
		$(this).parent().parent().parent().parent().remove();
		rqArr.splice($.inArray(rq_id,rqArr),1);//将所有选中的值从数组中删除
		deleteObjData(rqMap.rq,rq_id);//将所有选中的值从map数组中删除
		//从rqRfidArr数组中删除对应的元素
		for (var i = 0,l = rqRfidArr.length; i < l; i++) {
			if(rqRfidArr[i]["residentialQuarterId"] == rq_id){
				rqRfidArr.splice(i,1);
			}
		}
		if(residentialQuarterId != "" && rq_id == residentialQuarterId){
			$("#clearRfidCard").trigger("click");
		}
	});
	$("#managedRq li").click(function(){
		$(this).addClass("bg-li");
		$(this).siblings().removeClass("bg-li");
		residentialQuarterId = $(this).find(".pull-right").attr("name");//为residentialQuarterId赋值
		for (var i = 0,l = rqRfidArr.length; i < l; i++) {
			if(rqRfidArr[i]["residentialQuarterId"] == residentialQuarterId){
				$("#rfidCard").data("rfidCardId",rqRfidArr[i]["rfidCardId"]);
				$("#rfidCard").val(rqRfidArr[i]["rfidCardId"]);
				break;
			}
			$("#rfidCard").data("rfidCardId","");
			$("#rfidCard").val("");
		}
		
		console.info(rqRfidArr);
	});
}

/**管理小区模态框 end*/

/**RFID卡模态框 start */
/*table data start*/
var rfidCardId;
var PAGESIZE2 = 5;
var currentPage2 = 1;
var totalPage2 = 0;
var numberOfPages2 = 5;
var options2 = {  
			containerClass:"pagination",
		    currentPage: currentPage2,  //当前页数
		    totalPages: totalPage2,  //总页数
		    size:"normal",  
		    alignment:"center",  
		    numberOfPages: numberOfPages2,
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
				var reqData= {"rfidCardId":$("#rfidCardId").val(),"residentialQuarter":residentialQuarterId,"personnelId":personnelId}; //取内容
		    	currentPage2 = newPage;
		    	buildRQTable2(JSON.stringify(reqData),newPage,PAGESIZE2);//默认每页最多6条
			},  
		    onPageClicked: function (e, originalEvent, type, page) {  
		    	
		    }  
		} 	

//生成表格
function buildRQTable2(reqData,pageNumber,pageSize) {
	 var url = urlRootContext()+"/get_rfid_card_list"; //请求的网址
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
     	            	 totalPage2 = response.data.pages;
     	            	 options2.totalPages=(totalPage2==0?1:totalPage2);
     	    			 options2.currentPage=pageNumber;
						 $('#rfidCardTable #bottomTab').bootstrapPaginator(options2); //重新设置总页面数目
						 var dataList = response.data.dataList;
						 $("#rfidCardTable #tableBody").empty();//清空表格内容
						 if (dataList.length > 0 ) {
						     $(dataList).each(function(){//重新生成
						            $("#rfidCardTable #tableBody").append('<tr id="'+this.cardId+'">'+
						            		'<td>'+
							        			'<div class="radio i-checks checkSingle" >'+
							        				'<label><input type="radio" value="'+this.cardId+'" name="rfidCards"> <i></i></label>'+
							        			'</div>'+
							        		'</td>'+
							        		'<td>'+this.cardId+'</td>'+
							        	'</tr>');
						     	 });  
						     
						     	//重载事件
						     	reloadEvent2();
						    } else {             	            	
						     	$("#rfidCardTable #tableBody").append('<tr><th colspan ="2"><center>查询无数据</center></th></tr>');
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
function reloadEvent2(){
	$("#rfidCardTable .i-checks").iCheck({
		checkboxClass : "icheckbox_square-green",
		radioClass : "iradio_square-green"
	});
	
	$('#'+rfidCardId).iCheck('check');//选
	
	$('#rfidCardTable .checkSingle input').on('ifChecked', function(event){ //ifCreated 事件应该在插件初始化之前绑定 
		rfidCardId = $(this).val();
	}); 
}

/*
 * 模态框事件
 */
$('#rfidCardModal').on('shown.bs.modal', function () {
	if(residentialQuarterId == ""){
		$('#rfidCardModal').modal("hide");
		swal("请先单击选择对应的小区");
	}
});
$('#rfidCardModal').on('show.bs.modal', function () {
	if(residentialQuarterId != ""){
		rfidCardId = $("#rfidCard").data("rfidCardId");
		$('#'+rfidCardId).iCheck('check');//选
		$("#rfidCardId").val("");
		var reqData= {"rfidCardId":$("#rfidCardId").val(),"residentialQuarter":residentialQuarterId,"personnelId":personnelId}; //取内容
		currentPage2 = 1;
		buildRQTable2(JSON.stringify(reqData),currentPage2,PAGESIZE2);//默认每页最多6条
	}
	
});
$('#rfidCardModal').on('hide.bs.modal', function () {
	$('#propertyPersonnelEditModal').css("overflow","scroll");
});

$("#queryRfidCard").click(function(){
	var reqData= {"rfidCardId":$("#rfidCardId").val(),"residentialQuarter":residentialQuarterId,"personnelId":personnelId}; //取内容
	currentPage2 = 1;
	buildRQTable2(JSON.stringify(reqData),currentPage2,PAGESIZE2);//默认每页最多6条
});

$("#confirmRfidCard").click(function(){
	$("#rfidCard").data("rfidCardId",rfidCardId);
	$("#rfidCard").val(rfidCardId);
	$('#rfidCardModal').modal("hide");
	
	//查找rqRfidArr是否有对应的key
	var flag = false;
	for (var i = 0,l = rqRfidArr.length; i < l; i++) {
		if(rqRfidArr[i]["residentialQuarterId"] == residentialQuarterId){
			rqRfidArr[i]["rfidCardId"] = rfidCardId;
			flag = true;
			break;
		}
	}
	if(!flag){
		var rqRfidMap ={};
		rqRfidMap["residentialQuarterId"] = residentialQuarterId;
		rqRfidMap["rfidCardId"] = rfidCardId;
		rqRfidArr.push(rqRfidMap);
	}
	console.info(rqRfidArr);
});

/**RFID卡模态框 end*/

//清除对应的rfid卡号
$("#clearRfidCard").click(function(){
	for (var i = 0,l = rqRfidArr.length; i < l; i++) {
		if(rqRfidArr[i]["residentialQuarterId"] == residentialQuarterId){
			rqRfidArr[i]["rfidCardId"] = "";
//			rqRfidArr.splice(i, 1);
//			break;
		}
	}
	$("#rfidCard").val("");
	residentialQuarterId = "";
});

/**
 * 表单验证 保存物业人员信息
 */
setDefaultValidator(personnelFormValidator);

function personnelFormValidator(){
	var e = "<i class='fa fa-times-circle'></i> ";
	$("#propertyPersonnelForm").validate({
		rules : {
			personnelName : {
				required : !0,
				minlength : 1,
				maxlength : 20
			},
			personnelPhone : {
				required : !0,
				isMobile : true
			},
			personnelIdentityNum : {
				required : !0,
				isIdCardNo : true
			}
		},
		messages : {
			personnelName : {
				required : e + "请输入人员姓名！",
				minlength : e + "人员姓名必须1个字符以上！",
				maxlength : e + "人员姓名必须20个字符以下！"
			},
			personnelPhone : {
				required : e + "请输入手机号！",
				isMobile : e + "请输入有效的手机号！"
			},
			personnelIdentityNum : {
				required : e + "请输入身份证号码！",
				isIdCardNo : e + "请输入有效的身份证号码！"
			}
		},
		submitHandler: function (form){
			savePersonnelInfo(form);
        }  
	});
}

var savePersonnelInfo = function(form){
	console.log("submit!");
	console.info(arrayToJson(rqRfidArr));
    $.ajax({
		type:"post",
		url:urlRootContext()+"/save_property_personnel_info",
		traditional:true,
	    data:{"type":type,"rqRfidArr":arrayToJson(rqRfidArr),"personnelId":personnelId,"personnelName":$("#personnelName").val(),
	    	"personnelPhone":$("#personnelPhone").val(),"personnelIdentityNum":$("#personnelIdentityNum").val(),"personnelType":$("#personnelType").val(),
	    	"sex":sex,"birthday":$("#birthday").val(),"address":$("#address").val(),"personnelStatus":personnelStatus},
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
						var reqData= {"personnelName":$("#personnelNameValue").val(),
								"personnelPhone":$("#personnelPhoneValue").val(),"personnelType":$("#personnelTypeValue").val()}; //取内容
     	            	buildTable(JSON.stringify(reqData),currentPage,PAGESIZE);//默认每页最多6条
					}
					$("#propertyPersonnelEditModal").modal("hide");
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

