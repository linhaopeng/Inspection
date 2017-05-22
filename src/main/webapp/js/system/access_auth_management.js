/**
 * created by chenxj
 */

var type;

/*table data start*/
var PAGESIZE = 8;
var currentPage = 1;
var totalPage = 0;
var numberOfPages = 5;
var deviceId;
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
				var reqData= {"deviceId":deviceId}; //取内容
		    	currentPage = newPage;
		    	buildTable(JSON.stringify(reqData),newPage,PAGESIZE);//默认每页最多6条
	 		   	$('.checkAll').iCheck('uncheck');//取消全选
	 		   	selectedArr.splice(0,selectedArr.length);//清空数组
	 		   	accessIdArr.splice(0,accessIdArr.length);//清空数组
	 		   	reloadEvent();
			},  
		    onPageClicked: function (e, originalEvent, type, page) {  
		    	
		    }  
		} 	

//生成表格
function buildTable(reqData,pageNumber,pageSize) {
	 var url = urlRootContext()+"/get_access_auths"; //请求的网址
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
						            $("#tableBody").append('<tr id="'+ this.authUserId +'">'+
						            		'<td ><div class="checkbox i-checks checkSingle"><label><input type="checkbox" value="'+ this.authUserId +'" name="accessAuthIds"> <i></i></label></div></td>'+
						            		'<td >' + (new Date(this.authStartDate)).pattern("yyyy-MM-dd hh:mm:ss") +'</td>'+
						            		'<td >' + (new Date(this.authEndDate)).pattern("yyyy-MM-dd hh:mm:ss") + '</td>'+
						            		'<td >' + this.openMethod + '</td>'+
						            		'<td >' + this.openCount + '</td>'+
						            		'<td >' + this.authorizeeName + '</td>'+
						            		'<td >' + (new Date(this.createdTime)).pattern("yyyy-MM-dd hh:mm:ss") + '</td>'+
						            		'<td >' + this.authorizerName + '</td>'+
						            		'<td ><button type="button" class="btn btn-primary btn-outline btn-xs modifyAccessAuth">修改</button>'+
											'</td></tr>');
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
	deviceId=$("#deviceId").val();
	
	var reqData= {"deviceId":deviceId}; //取内容
	buildTable(JSON.stringify(reqData),1,PAGESIZE);//默认空白查全部
	
    //创建结算规则
    $("#queryButton").bind("click",function(){
    	var reqData= {"deviceId":deviceId}; //取内容
    	currentPage = 1;
    	buildTable(JSON.stringify(reqData),currentPage,PAGESIZE);//默认每页最多6条
    });
});

/**table data end*/

var selectedArr=new Array();
var accessIdArr=new Array();

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
			accessIdArr.push($(this).parent().parent().parent().parent().parent().attr("id"));//将所有选中的值添加进数组
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
			accessIdArr.splice($.inArray($(this).val(),accessIdArr),1);//将所有选中的值从数组中删除
			var i = $("#tableBody").find("input[type=checkbox]:checked").length;
			var len = $("#tableBody").find("input[type=checkbox]").length;
			if(i != len){
				$(".checkAll").iCheck("uncheck");
			}
		}
	});
	
	//修改门禁授权信息
	$("#tableBody td .modifyAccessAuth").click(function(event){
		var accessId = $(this).parent().parent().attr("id");
		window.location.href= urlRootContext()+"/access_auth_modify.do?authNum=1&deviceId="+$("#deviceId").val()+"&doorName="+$("#doorName").val()+"&accessId="+accessId;
	});
}

//滚动条控制
$("#residentialQuarterUserModal").on('show.bs.modal', function (event) {
	event.stopPropagation();//防止事件冒泡
});

$("#residentialQuarterUserModal").on('hide.bs.modal', function (event) {
	event.stopPropagation();//防止事件冒泡
	/*$("#accessAuthEditModal").css("overflow","scroll");
	$(window.frameElement).contents().find("body").css("overflow","hidden");*/
});

$("#accessAuthEditModal").on('show.bs.modal', function (event) {
	event.stopPropagation();//防止事件冒泡
});

$("#accessAuthEditModal").on('hide.bs.modal', function (event) {
	event.stopPropagation();//防止事件冒泡
});

//新增门禁授权信息(单门授权)
$("#addAccessAuth").click(function(event){
	type = 1;//新增
	rqUserArr.length = 0;//如果是新增，清空数组
	$("#managedRqUser").empty();
	rqUserTempMap={rqUser:[]};//清空map
	rqUserMap={rqUser:[]};//清空map
	$("#accessAuthEditModal").modal("show");
});

//删除门禁授权
$("#deleteAccessAuth").click(function(){
	if(selectedArr.length != 0 && accessIdArr.length != 0){
		swal({
			title : "确定删除选中项?",
			text : "你将删除选中的授权项!",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#DD6B55",
			confirmButtonText : "是的，删除",
			cancelButtonText: "取消",
			closeOnConfirm : false
		}, function() {
			$.ajax({
     	        type:"POST",
     	        url:urlRootContext()+"/account_auth_delete.do",
     	        traditional:true,
     	        data:{"selectedArr":selectedArr,"accessIdArr":accessIdArr},
     	        async:false,
     	        dataType:"json",
     	        success: function(response){
     	            if(response.success) {
     	            	swal("已删除!", "你已删除选中的授权项！", "success");
     	            	var reqData= {"deviceId":deviceId}; //取内容
     	            	buildTable(JSON.stringify(reqData),(currentPage == totalPage && currentPage != 1)? currentPage-1:currentPage,PAGESIZE);//默认每页最多6条
     	            	currentPage = currentPage - 1 ;
     	            	$('.checkAll').iCheck('uncheck');//取消全选
     			    	selectedArr.splice(0,selectedArr.length);//清空数组
     			    	accessIdArr.splice(0,accessIdArr.length);//清空数组
     			    	reloadEvent();//重载事件
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

/**管理小区用户模态框start */
/*table data start*/
var PAGESIZE1 = 6;
var currentPage1 = 1;
var totalPage1 = 0;
var numberOfPages1 = 5;
var rqUserArr=new Array();
var rqUserTempArr=new Array();
var rqUserMap={rqUser:[]};
var rqUserTempMap={rqUser:[]};
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
				var reqData= {"rqId":$.cookie("currentRQ"),"phone":$("#phone").val(),"userType":$("#userType").val(),
						"apartUnitHouse":$("#apartUnitHouse").data("apartUnitHouse")}; //取内容
		    	currentPage1 = newPage;
		    	buildRQTable(JSON.stringify(reqData),newPage,PAGESIZE1);//默认每页最多6条
			},  
		    onPageClicked: function (e, originalEvent, type, page) {  
		    	
		    }  
		} 	

//生成表格
function buildRQTable(reqData,pageNumber,pageSize) {
	 var url = urlRootContext()+"/get_residential_quarter_user_list"; //请求的网址
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
						 $('#rqUserTable #bottomTab').bootstrapPaginator(options1); //重新设置总页面数目
						 var dataList = response.data.dataList;
						 $("#rqUserTable #tableBody").empty();//清空表格内容
						 if (dataList.length > 0 ) {
						     $(dataList).each(function(){//重新生成
						            $("#rqUserTable #tableBody").append('<tr id="'+this.id+'">'+
						            		'<td>'+
							        			'<div class="checkbox i-checks checkSingleUser" >'+
							        				'<label><input type="checkbox" value="'+this.id+'" name="residentialQuarterUsers"> <i></i></label>'+
							        			'</div>'+
							        		'</td>'+
							        		'<td>'+this.userName+'</td>'+
							        		'<td>'+(this.userPhone == undefined || this.userPhone == 'undefined'?"--":this.userPhone)+'</td>'+
							        		'<td>'+($("#userType [value='"+(this.userHouseName == undefined || this.userHouseName == 'undefined'?"pp"+this.userType:"rf"+this.userType)+"']").html())+'</td>'+
							        		'<td>'+(this.userHouseName == undefined || this.userHouseName == 'undefined'?"--":this.userHouseName)+'</td>'+
							        	'</tr>');
						            $("#"+this.id).data("residentialQuarterUser",this);
						     	 });  
						     
						     	//重载事件
						     	reloadEvent1();
						    } else {             	            	
						     	$("#rqUserTable #tableBody").append('<tr><th colspan ="5"><center>查询无数据</center></th></tr>');
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
	$("#rqUserTable .i-checks").iCheck({
		checkboxClass : "icheckbox_square-green",
		radioClass : "iradio_square-green"
	});
	
	$('#rqUserTable .checkAllUser').iCheck('uncheck');//取消全选
	$("input[name='residentialQuarterUsers']:checkbox").each(function(){
		if($.inArray($(this).val(),rqUserArr) != -1){
			$(this).iCheck("check");//将所有选中的值添加进数组
		}
	});
	var len = $("#rqUserTable #tableBody").find("input[type=checkbox]").length;
	var i = $("#rqUserTable #tableBody").find("input[type=checkbox]:checked").length;
	if(len != 0 && i != 0 && len == i){
		$("#rqUserTable .checkAllUser").iCheck("check");
	}
	
	//全选
	$("#rqUserTable .checkAllUser").on("ifChecked",function(event){
		event.stopPropagation();//防止事件冒泡
		var len = $("#rqUserTable #tableBody").find("input[type=checkbox]").length;
		var i = $("#rqUserTable #tableBody").find("input[type=checkbox]:checked").length;
		if(i != len){
			$("#rqUserTable #tableBody").find("input[type=checkbox]").iCheck("check");
		}
	});
	//反选
	$("#rqUserTable .checkAllUser").on("ifUnchecked",function(event){
		event.stopPropagation();//防止事件冒泡
		var len = $("#rqUserTable #tableBody").find("input[type=checkbox]").length;
		var i = $("#rqUserTable #tableBody").find("input[type=checkbox]:checked").length;
		if(i == len){
			$("#rqUserTable #tableBody").find("input[type=checkbox]").iCheck("uncheck");
		}
	});
	
	//单选
	$("#rqUserTable .checkSingleUser input").on('ifChecked', function(event) {
		event.stopPropagation();//防止事件冒泡
		if(true == $(this).is(':checked')){
			rqUserTempArr.push($(this).val());//将所有选中的值添加进数组
			rqUserTempMap.rqUser.push({'id':$(this).val(),
				"name":$("#residentialQuarterUserModal #"+$(this).val()+" td:nth-child(2)").html()+"("
				+($("#residentialQuarterUserModal #"+$(this).val()+" td:nth-child(5)").html() == '--'?
						"":$("#residentialQuarterUserModal #"+$(this).val()+" td:nth-child(5)").html()+"-")
				+($("#residentialQuarterUserModal #"+$(this).val()+" td:nth-child(4)").html())+")"});
			rqUserMap.rqUser.push($("#"+$(this).val()).data("residentialQuarterUser"));
			var len = $("#rqUserTable #tableBody").find("input[type=checkbox]").length;
			var i = $("#rqUserTable #tableBody").find("input[type=checkbox]:checked").length;
			if(len == i){
				$("#rqUserTable .checkAllUser").iCheck("check");
			}
		}
	});
	
	$("#rqUserTable .checkSingleUser input").on('ifUnchecked', function(event) {
		event.stopPropagation();//防止事件冒泡
		if(false == $(this).is(':checked')){
			rqUserTempArr.splice($.inArray($(this).val(),rqUserTempArr),1);//将所有选中的值从数组中删除
			deleteObjData(rqUserTempMap.rqUser,$(this).val());
			var i = $("#rqUserTable #tableBody").find("input[type=checkbox]:checked").length;
			var len = $("#rqUserTable #tableBody").find("input[type=checkbox]").length;
			if(i != len){
				$("#rqUserTable .checkAllUser").iCheck("uncheck");
			}
		}
	});
	
}

/*
 * 模态框事件
 */
$('#residentialQuarterUserModal').on('show.bs.modal', function () {
	$("#userType").val("");
	$("#phone").val("");
	$("#apartUnitHouse").val("");
	$("#apartUnitHouse").data("apartUnitHouse","");
	var reqData= {"rqId":$.cookie("currentRQ"),"phone":$("#phone").val(),"userType":$("#userType").val(),
			"apartUnitHouse":$("#apartUnitHouse").data("apartUnitHouse")}; //取内容
	currentPage1 = 1;
	buildRQTable(JSON.stringify(reqData),currentPage1,PAGESIZE1);//默认每页最多6条
	
	rqUserTempArr = $.map(rqUserArr, function(n){//将数组放进一个临时数组
		  return n;
	});
	
	/*rqUserTempMap = $.extend(true,{},rqUserMap);*/
});

$("#queryRQUser").click(function(){
	var reqData= {"rqId":$.cookie("currentRQ"),"phone":$("#phone").val(),"userType":$("#userType").val(),
			"apartUnitHouse":$("#apartUnitHouse").data("apartUnitHouse")}; //取内容
	currentPage1 = 1;
	buildRQTable(JSON.stringify(reqData),currentPage1,PAGESIZE1);//默认每页最多6条
});

function managedRqUserLi(id,value,name){
	var li = '<li>'+
		'<div><span>'+name+'<span><span class="pull-right" id="'+id+'" name="'+value+'"><i class="fa fa-close fa-lg"></i></span></div>'+
		'</li>';
	return li;
}

$("#confirmRQUser").click(function(){
	rqUserArr = $.map(rqUserTempArr , function(n){//将临时数组赋给新数组
		  return n;
	});
	console.log("rqUserArr="+rqUserArr);//TODO
	
//	rqUserMap={rqUser:[]};//清空map
//	rqUserMap = $.extend(true,{},rqUserTempMap);//复制对象
	console.log("rqUserTempMap="+JSON.stringify(rqUserTempMap));
	console.log("rqUserMap="+JSON.stringify(rqUserMap));
	
	$('#residentialQuarterUserModal').modal('hide');
	$("#managedRqUser").empty();//清空列表
	var li="";
	for(var i=0;i<rqUserArr.length;i++){
		var rqUserId = rqUserArr[i];
		li=li+managedRqUserLi("managedRqUser"+rqUserId,rqUserId,getObjData(rqUserTempMap.rqUser,rqUserId));
	}
	$("#managedRqUser").html(li);
	//对应li的删除事件
	$("#managedRqUser .pull-right").click(function(){
		var rqUserId = $(this).attr("name");
		$(this).parent().parent().parent().parent().remove();
		rqUserArr.splice($.inArray(rqUserId,rqUserArr),1);//将所有选中的值从数组中删除
		deleteObjData(rqUserTempMap.rqUser,rqUserId);//将所有选中的值从map数组中删除
		deleteObjData(rqUserMap.rqUser,rqUserId);//将所有选中的值从map数组中删除
	});
});

/**管理小区用户模态框 end*/

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
	var positionObj = $("#apartUnitHouse");
	positionObj.attr("value", v);
	$("#apartUnitHouse").data("apartUnitHouse",id);
//	console.info($("#apartUnitHouse").data("apartUnitHouse"));
}

function showMenu() {
	//获取节点数据
	$.ajax({
        type:"GET",
        url:urlRootContext()+"/get_apartment_list",
        data:"depth=3&residentialQuarter="+$.cookie("currentRQ"),
        dataType:"json",
        async:false,
        success: function(response){
            if(response.success) {
            	dataList = response.data;
            	var length = dataList.length;
            	for(var i=0;i<length;i++){
        			if(dataList[i].level == 1){
        				dataList[i].open = true;
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
