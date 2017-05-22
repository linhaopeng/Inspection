/**
 * created by chenxj
 */
var deviceId=$("#deviceId").val();
var companyId = $("#companyId").val();
var type = $("#type").val();
var authType;

if($("#authDiv .radio input[name='authType']").is(':checked')){
	authType = $("#authDiv .radio input[name='authType']").val();
}
$('#authDiv .radio input').on('ifChecked', function(event) { //ifCreated 事件应该在插件初始化之前绑定 
	$("#authDiv1").css("display",$("#authDiv1").css("display") == "block"? "none":"block");
	$("#authDiv2").css("display",$("#authDiv2").css("display") == "block"? "none":"block");
	if($("#authDiv .radio input[name='authType']").is(':checked')){
		authType = $(this).val();
	}
});

/*开门类型选择-start*/
var openMethodArr = new Array();
$('#openMethod .checkbox input').on('ifChecked', function(event) { //ifCreated 事件应该在插件初始化之前绑定 
	if($.inArray($(this).val(),openMethodArr) == -1)
		openMethodArr.push($(this).val());
});
$('#openMethod .checkbox input').on('ifUnchecked', function(event) { //ifCreated 事件应该在插件初始化之前绑定 
	openMethodArr.splice($.inArray($(this).val(),openMethodArr),1);//将所有选中的值从数组中删除
});
/*开门类型选择-end*/

function authDivLi(id,value,name){
	var li = '<li>'+
		'<div><span>'+name+'<span><span class="pull-right" id="'+id+'" name="'+value+'"><i class="fa fa-close fa-lg"></i></span></div>'+
		'</li>';
	return li;
}

/*删除map数据*/
function getObjData(obj,id) {
    for (var i = 0; i < obj.length; i++) {
        var cur_obj = obj[i];
        if (cur_obj.id == id) {
        	return cur_obj.name;
        }
    }
}

/*删除map数据*/
function deleteObjData(obj,id) {
    for (var i = 0; i < obj.length; i++) {
        var cur_obj = obj[i];
        if (cur_obj.id == id) {
        	obj.splice(i, 1);
        }
    }
}

/**公司组织模态框start */
/*table data start*/
var PAGESIZE1 = 1;
var currentPage1 = 1;
var totalPage1 = 0;
var numberOfPages1 = 5;
var orgArr=new Array();
var orgTempArr=new Array();
var orgMap={org:[]};
var orgTempMap={org:[]};
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
		    	buildCompanyOrgTable(JSON.stringify(reqData),newPage,PAGESIZE1);//默认每页最多6条
			},  
		    onPageClicked: function (e, originalEvent, type, page) {  
		    	
		    }  
		} 	

//生成表格
function buildCompanyOrgTable(reqData,pageNumber,pageSize) {
	 var url = urlRootContext()+"/get_company_org.do"; //请求的网址
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
						 $('#companyOrgTable #bottomTab').bootstrapPaginator(options1); //重新设置总页面数目
						 var dataList = response.data.dataList;
						 $("#companyOrgTable #tableBody").empty();//清空表格内容
						 if(pageNumber == 1){
					            $("#companyOrgTable #tableBody").append('<tr id="0">'+
					            		'<td>'+
						        			'<div class="checkbox i-checks checkSingle" >'+
						        				'<label><input type="checkbox" value="0" name="companyOrgs"> <i></i></label>'+
						        			'</div>'+
						        		'</td>'+
						        		'<td>全公司</td>'+
						        	'</tr>');
						 }
						 if (dataList.length > 0 ) {
						     $(dataList).each(function(){//重新生成
						            $("#companyOrgTable #tableBody").append('<tr id="'+this.id+'">'+
						            		'<td>'+
							        			'<div class="checkbox i-checks checkSingle" >'+
							        				'<label><input type="checkbox" value="'+this.id+'" name="companyOrgs"> <i></i></label>'+
							        			'</div>'+
							        		'</td>'+
							        		'<td>'+this.deptName+'</td>'+
							        	'</tr>');
						     	 });  
						     
						     	//重载事件
						     	reloadEvent1();
						    } else {             	            	
						     	$("#companyOrgTable #tableBody").append('<tr><th colspan ="2"><center>查询无数据</center></th></tr>');
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
	$("#companyOrgTable .i-checks").iCheck({
		checkboxClass : "icheckbox_square-green",
		radioClass : "iradio_square-green"
	});
	
	$('#companyOrgTable .checkAll').iCheck('uncheck');//取消全选
	$("input[name='companyOrgs']:checkbox").each(function(){
		if($.inArray($(this).val(),orgArr) != -1){
			$(this).iCheck("check");//将所有选中的值添加进数组
		}
	});
	var len = $("#companyOrgTable #tableBody").find("input[type=checkbox]").length;
	var i = $("#companyOrgTable #tableBody").find("input[type=checkbox]:checked").length;
	if(len != 0 && i != 0 && len == i){
		$("#companyOrgTable .checkAll").iCheck("check");
	}
	
	//全选
	$("#companyOrgTable .checkAll").on("ifChecked",function(event){
		var len = $("#companyOrgTable #tableBody").find("input[type=checkbox]").length;
		var i = $("#companyOrgTable #tableBody").find("input[type=checkbox]:checked").length;
		if(i != len){
			$("#companyOrgTable #tableBody").find("input[type=checkbox]").iCheck("check");
		}
	});
	//反选
	$("#companyOrgTable .checkAll").on("ifUnchecked",function(event){
		var len = $("#companyOrgTable #tableBody").find("input[type=checkbox]").length;
		var i = $("#companyOrgTable #tableBody").find("input[type=checkbox]:checked").length;
		if(i == len){
			$("#companyOrgTable #tableBody").find("input[type=checkbox]").iCheck("uncheck");
		}
	});
	
	//单选
	$("#companyOrgTable .checkSingle input").on('ifChecked', function(event) {
		if(true == $(this).is(':checked')){
			orgTempArr.push($(this).val());//将所有选中的值添加进数组
			orgTempMap.org.push({'id':$(this).val(),"name":$("#companyOrgModal #"+$(this).val()+" td:nth-child(2)").html()});
			var len = $("#companyOrgTable #tableBody").find("input[type=checkbox]").length;
			var i = $("#companyOrgTable #tableBody").find("input[type=checkbox]:checked").length;
			if(len == i){
				$("#companyOrgTable .checkAll").iCheck("check");
			}
		}
	});
	
	$("#companyOrgTable .checkSingle input").on('ifUnchecked', function(event) {
		if(false == $(this).is(':checked')){
			orgTempArr.splice($.inArray($(this).val(),orgTempArr),1);//将所有选中的值从数组中删除
			deleteObjData(orgTempMap.org,$(this).val());
			var i = $("#companyOrgTable #tableBody").find("input[type=checkbox]:checked").length;
			var len = $("#companyOrgTable #tableBody").find("input[type=checkbox]").length;
			if(i != len){
				$("#companyOrgTable .checkAll").iCheck("uncheck");
			}
		}
	});
	
}

/*
 * 模态框事件
 */
$('#companyOrgModal').on('show.bs.modal', function () {
	var reqData= {"companyId":companyId}; //取内容
	currentPage1 = 1;
	buildCompanyOrgTable(JSON.stringify(reqData),currentPage1,PAGESIZE1);//默认每页最多6条
	
	orgTempArr = $.map(orgArr, function(n){//将数组放进一个临时数组
		  return n;
	});
	
	orgTempMap = $.extend(true,{},orgMap);
});

$("#selectedCompanyOrg").click(function(){
	orgArr = $.map(orgTempArr , function(n){//将临时数组赋给新数组
		  return n;
	});
	console.log("selectedCompanyOrg"+orgArr);//TODO
	
	orgMap = $.extend(true,{},orgTempMap);//复制对象
	console.log(JSON.stringify(orgMap));
	
	$('#companyOrgModal').modal('hide');
	$("#authDiv1 ul").empty();//清空列表
	var li="";
	for(var i=0;i<orgArr.length;i++){
		var org_id = orgArr[i];
		li=li+authDivLi("authDiv1_"+org_id,org_id,getObjData(orgMap.org,org_id));
	}
	$("#authDiv1 ul").html((li == ""?"<li></li>":li));
	//对应li的删除事件
	$("#authDiv1 li .pull-right").click(function(){
		var org_id = $(this).attr("name");
		$(this).parent().parent().parent().parent().remove();
		orgArr.splice($.inArray(org_id,orgArr),1);//将所有选中的值从数组中删除
		deleteObjData(orgMap.org,org_id);//将所有选中的值从map数组中删除
	});
});

/**公司组织模态框 end*/


/**用户模态框start */
var PAGESIZE2 = 2;
var currentPage2 = 1;
var totalPage2 = 0;
var numberOfPages2 = 5;
var userArr=new Array();
var userTempArr=new Array();
var userMap={user:[]};
var userTempMap={user:[]};
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
				var reqData= {"companyId":companyId,"employeeName":$("#employeeName").val(),"phone":$("#phone").val(),"deptId":$("#department").val()}; //取内容
		    	currentPage2 = newPage;
		    	buildEmployeeTable(JSON.stringify(reqData),newPage,PAGESIZE2);//默认每页最多6条
			},  
		    onPageClicked: function (e, originalEvent, type, page) {  
		    	
		    }  
		} 	

//生成表格
function buildEmployeeTable(reqData,pageNumber,pageSize) {
	 var url = urlRootContext()+"/get_company_employees.do"; //请求的网址
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
						 $('#employeeModal #bottomTab').bootstrapPaginator(options2); //重新设置总页面数目
						 var dataList = response.data.dataList;
						 $("#employeeModal #tableBody").empty();//清空表格内容
						 if (dataList.length > 0 ) {
						     $(dataList).each(function(){//重新生成
						            $("#employeeModal #tableBody").append('<tr id="'+this.employeeId+'">'+
						            		'<td>'+
							        			'<div class="checkbox i-checks checkSingle" >'+
							        				'<label><input type="checkbox" value="'+this.employeeId+'" name="employees"> <i></i></label>'+
							        			'</div>'+
							        		'</td>'+
							        		'<td>'+(this.employeeNum == undefined || this.employeeNum == 'undefined'? "--":this.employeeNum)+'</td>'+
							        		'<td>'+(this.employeeName == undefined || this.employeeName == 'undefined'? "--":this.employeeName)+'</td>'+
							        		'<td>'+this.phone+'</td>'+
							        		'<td>'+(this.deptName == undefined || this.deptName == 'undefined'? "--":this.deptName)+'</td>'+
						        	'</tr>');
						     	 });  
						     	//重载事件
						     	reloadEvent2();
						    } else {             	            	
						     	$("#employeeModal #tableBody").append('<tr><th colspan ="5"><center>查询无数据</center></th></tr>');
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
	$("#employeeModal .i-checks").iCheck({
		checkboxClass : "icheckbox_square-green",
		radioClass : "iradio_square-green"
	});
	
	$("#employeeModal .checkAll").iCheck("uncheck");//取消全选
	
	$("input[name='employees']:checkbox").each(function(){
		if($.inArray($(this).val(),userArr) != -1){
			$(this).iCheck("check");//将所有选中的值添加进数组
		}
	});
	var len = $("#employeeModal #tableBody").find("input[type=checkbox]").length;
	var i = $("#employeeModal #tableBody").find("input[type=checkbox]:checked").length;
	if(len != 0 && i != 0 && len == i){
		$("#employeeModal .checkAll").iCheck("check");
	}
	
	//全选
	$("#employeeModal .checkAll").on("ifChecked",function(event){
		var len = $("#employeeModal #tableBody").find("input[type=checkbox]").length;
		var i = $("#employeeModal #tableBody").find("input[type=checkbox]:checked").length;
		if(i != len){
			$("#employeeModal #tableBody").find("input[type=checkbox]").iCheck("check");
		}
	});
	//反选
	$("#employeeModal .checkAll").on("ifUnchecked",function(event){
		var len = $("#employeeModal #tableBody").find("input[type=checkbox]").length;
		var i = $("#employeeModal #tableBody").find("input[type=checkbox]:checked").length;
		if(i == len){
			$("#employeeModal #tableBody").find("input[type=checkbox]").iCheck("uncheck");
		}
	});
	
	//单选-正
	$("#employeeModal .checkSingle input").on('ifChecked', function(event) {
		if(true == $(this).is(':checked')){
			userTempArr.push($(this).val());//将所有选中的值添加进数组
			userTempMap.user.push({'id':$(this).val(),"name":$("#employeeModal #"+$(this).val()+" td:nth-child(3)").html()});
			var len = $("#employeeModal #tableBody").find("input[type=checkbox]").length;
			var i = $("#employeeModal #tableBody").find("input[type=checkbox]:checked").length;
			if(len == i){
				$("#employeeModal .checkAll").iCheck("check");
			}
		}
	});
	//单选-反
	$("#employeeModal .checkSingle input").on('ifUnchecked', function(event) {
		if(false == $(this).is(':checked')){
			userTempArr.splice($.inArray($(this).val(),userTempArr),1);//将所有选中的值从数组中删除
			deleteObjData(userTempMap.user,$(this).val());
			var i = $("#employeeModal #tableBody").find("input[type=checkbox]:checked").length;
			var len = $("#employeeModal #tableBody").find("input[type=checkbox]").length;
			if(i != len){
				$("#employeeModal .checkAll").iCheck("uncheck");
			}
		}
	});
	
}

/*
 * 模态框事件
 */
$('#employeeModal').on('show.bs.modal', function () {
	var reqData= {"companyId":companyId,"employeeName":$("#employeeName").val(),"phone":$("#phone").val(),"deptId":$("#department").val()}; //取内容
	currentPage2 = 1;
	buildEmployeeTable(JSON.stringify(reqData),currentPage2,PAGESIZE2);//默认每页最多6条
	
	userTempArr = $.map(userArr , function(n){//将数组放进一个临时数组
		  return n;
	});
	
	userTempMap = $.extend(true,{},userMap);
});

/*确定选择用户对象*/
$("#selectedEmployee").click(function(){
	userArr = $.map(userTempArr , function(n){
		  return n;
	});
	console.log("selectedEmployee"+userArr);
	
	userMap = $.extend(true,{},userTempMap);
	console.log(JSON.stringify(userMap));
	
	$('#employeeModal').modal('hide');
	$("#authDiv2 ul").empty();//清空列表
	var li="";
	for(var i=0;i<userArr.length;i++){
		var user_id = userArr[i];
		li=li+authDivLi("authDiv2_"+user_id,user_id,getObjData(userMap.user,user_id));
	}
	$("#authDiv2 ul").html((li == ""?"<li></li>":li));
	
	//对应li的删除事件
	$("#authDiv2 li .pull-right").click(function(){
		var user_id = $(this).attr("name");
		$(this).parent().parent().parent().parent().remove();
		userArr.splice($.inArray(user_id,userArr),1);//将所有选中的值从数组中删除
		deleteObjData(userMap.user,user_id);//将所有选中的值从map数组中删除
	});
});

/*按条件查询用户*/
$("#selectEmployee").click(function(){
	var reqData= {"companyId":companyId,"employeeName":$("#employeeName").val(),"phone":$("#phone").val(),"deptId":$("#department").val()}; //取内容
	currentPage2 = 1;
	buildEmployeeTable(JSON.stringify(reqData),currentPage2,PAGESIZE2);//默认每页最多6条
});
/**用户模态框end */

/**保存授权信息start*/

var saveAccessAuthInfo = function(){
	console.info($("#startDate").val()+"::"+$("#endDate").val()+"::"+authType+"::"+openMethodArr.length+"::"+orgArr.length+"::"+userArr.length);
	if($("#startDate").val()!="" && $("#endDate").val()!="" && openMethodArr.length != 0){
		var authDataArr=new Array();
		if(authType == 1 && orgArr.length != 0){
			authDataArr = orgArr;
		}else if(authType == 2 && userArr.length != 0){
			authDataArr = userArr;
		}else{
			swal("请选择好对应的授权信息!");
			return;
		}
		
		$.ajax({
			type:"post",
			url:urlRootContext()+"/access_auth_save.do",
			traditional:true,
 	        data:{"type":type,"deviceId":deviceId,"authType":authType,"openMethodArr":openMethodArr,
 	        	"authDataArr":authDataArr,"startDate":$("#startDate").val(),"endDate":$("#endDate").val(),"authId":$("#authId").val()},
			dataType:"json",
			success:function(data){
				if(data.success){
					swal({
						title : data.message,
						type : "warning",
						showCancelButton : true,
						confirmButtonColor : "#DD6B55",
						confirmButtonText : "确定",
						cancelButtonText : "取消",
						closeOnConfirm : false
					}, function() {
						if($("#authNum").val() == 1){
							window.location.href = urlRootContext()+"/access_auth_find.do?deviceId="+deviceId;
						}else{
							window.location.href = urlRootContext()+"/access_management.do";
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
				console.error(XMLHttpRequest+"\n"+textStatus+"\n"+errorThrown);
			}
		});
	}else{
		swal("请选择好对应的授权信息!");
	}
}

/**保存授权信息end*/


$(function(){
	
	//修改授权初始化
	if(type == 2){
		openMethodArr = $("#openMethodValue").val().split(",");
		for(var i=0;i<openMethodArr.length ;i++){
			$("#openMethod .checkbox input[value='"+openMethodArr[i]+"']").iCheck("check");//授权的开门方式
		}
		
		authType = $("#authTypeValue").val();
		$("#authDiv .radio input[value='"+authType+"']").iCheck("check");//授权类型
		
		switch (authType) {
		case "1":
			$("#authDiv1 li .pull-right").each(function(){
				var org_id = $(this).attr("name");
				orgArr.push(org_id);
				orgMap.org.push({'id':org_id,"name":$(this).prev().html()});
			});
			break;
		case "2":
			$("#authDiv2 li .pull-right").each(function(){
				var user_id = $(this).attr("name");
				userArr.push(user_id);
				userMap.user.push({'id':user_id,"name":$(this).prev().html()});
			});
			break;
		}
		
		//对应li的删除事件
		$("#authDiv1 li .pull-right").click(function(){
			var org_id = $(this).attr("name");
			$(this).parent().parent().remove();
			orgArr.splice($.inArray(org_id,orgArr),1);//将所有选中的值从数组中删除
			deleteObjData(orgMap.org,org_id);//将所有选中的值从map数组中删除
		});
		//对应li的删除事件
		$("#authDiv2 li .pull-right").click(function(){
			var user_id = $(this).attr("name");
			$(this).parent().parent().remove();
			userArr.splice($.inArray(user_id,userArr),1);//将所有选中的值从数组中删除
			deleteObjData(userMap.user,user_id);//将所有选中的值从map数组中删除
		});
	}
});