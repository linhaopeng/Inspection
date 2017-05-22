/**
 * created by chenxj
 */

var rqId = $.cookie("currentRQ");

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
			var reqData= {"rqId":$.cookie("currentRQ"),"openMethod":$("#openMethod").val(),"apartmentUnit":$("#apartmentUnit").data("apartmentUnit"),
					"deviceId":$("#deviceId").val(),"userName":$("#userName").val(),"startTime":$("#start").val(),
					"endTime":$("#end").val()}; //取内容
			currentPage = newPage;
			buildTable(JSON.stringify(reqData),newPage,PAGESIZE);//默认每页最多6条
		},  
		onPageClicked: function (e, originalEvent, type, page) {  
		}      
} 	

//生成表格
function buildTable(reqData,pageNumber,pageSize) {
	 var url = urlRootContext()+"/get_open_records"; //请求的网址
     var reqParams = {'reqData':reqData, 'pageNumber':pageNumber,'pageSize':pageSize};//请求数据
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
    				 $(dataList).each(function(i){//重新生成
    					 $("#tableBody").append('<tr id="'+ this.id +'">'+
    							 '<td >'+ ((currentPage-1)*PAGESIZE+(i+1)) +'</td>'+
    							 '<td >' + this.deviceId + '</td>'+
    							 '<td >' + this.deviceName + '</td>'+
    							 '<td >' + this.apartName + '</td>'+
    							 '<td >' + this.unitName + '</td>'+
    							 '<td >' + (new Date(this.openTime)).pattern("yyyy-MM-dd hh:mm:ss") + '</td>'+
    							 '<td >' + this.openMethodName + '</td>'+
    							 '<td >' + this.rfidCard + '</td>'+
    							 '<td >' + this.userName + '</td>'+
    							 '<td >' + this.userPhone + '</td>'+
    					 '</td></tr>');
    				 });  
    				 
    			 } else {             	            	
    				 $("#tableBody").append('<tr><th colspan ="10"><center>查询无数据</center></th></tr>');
    			 }
    		 }else{
    			 swal(response.message);
    		 }
    	 },
    	 error: function(e){
    		 console.error("查询失败:" + e);
    	 }
     });
     
  
}

function getData(){
	var reqData= {"rqId":$.cookie("currentRQ"),"openMethod":$("#openMethod").val(),"apartmentUnit":$("#apartmentUnit").data("apartmentUnit"),
			"deviceId":$("#deviceId").val(),"userName":$("#userName").val(),"startTime":$("#start").val(),
			"endTime":$("#end").val()}; //取内容
	currentPage = 1;
	buildTable(JSON.stringify(reqData),currentPage,PAGESIZE);
}

//渲染完就执行
$(function() {
	getData();//默认空白查全部
	
    //查询按钮
    $("#queryButton").bind("click",function(){
		getData();
    });
    
    $("#clearApartmentUnit").click(function(){
    	$("#apartmentUnit").val("");
    	$("#apartmentUnit").data("apartmentUnit","");
    });
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
				v = (nodes[0].pid != 0?(dataList[i].name +"-"):"")+ nodes[0].name;
				break;
			}
		}
	}
	var apartmentUnitObj = $("#apartmentUnit");
	apartmentUnitObj.attr("value", v);
	$("#apartmentUnit").data("apartmentUnit",id);
//	console.info($("#apartmentUnit").data("apartmentUnit"));
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
            	/*for(var i=0;i<length;i++){
        			if(dataList[i].level == 1){
        				dataList[i].open = true;
        				dataList[i].nocheck = true;
        			}
        		}*/
            	dataList[length] = {"id":0,"pid":"","name":$.cookie("currentRQName"),"open":true,"nocheck":true};
            	/*console.info(JSON.stringify(dataList));*/
            	$.fn.zTree.init($("#positionTree"), setting, dataList);
			}else{
				 swal(response.message);
			}
	},
	error: function(e){
		 swal("获取获取节点数据失败！", "", "error");
        }
    });
	
	var apartmentUnitObj = $("#apartmentUnit");
	var apartmentUnitOffset = $("#apartmentUnit").offset();
	$("#menuContent").css({
		left : "75px",
		/*left : apartmentUnitOffset.left + "px",
		top : apartmentUnitOffset.top + apartmentUnitObj.outerHeight() + "px"*/
	}).slideDown("fast");

	$("body").bind("mousedown", onBodyDown);
}
function hideMenu() {
	$("#menuContent").fadeOut("fast");
	$("body").unbind("mousedown", onBodyDown);
}
function onBodyDown(event) {
	if (!(event.target.id == "menuBtn" || event.target.id == "apartmentUnit"
			|| event.target.id == "menuContent" || $(event.target).parents(
			"#menuContent").length > 0)) {
		hideMenu();
	}
}
/** ztree end*/