/**
 * created by chenxj
 */

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
			var reqData= {"isRead":$("#isRead").val(),"handleType":$("#handleType").val(),
					"content":$("#fbContent").val(),"startTime":$("#start").val(),
					"endTime":$("#end").val()}; //取内容
			currentPage = newPage;
			buildTable(JSON.stringify(reqData),newPage,PAGESIZE);//默认每页最多6条
		},  
		onPageClicked: function (e, originalEvent, type, page) {  
		}      
} 	

//生成表格
function buildTable(reqData,pageNumber,pageSize) {
	 var url = urlRootContext()+"/get_requirements"; //请求的网址
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
    							 '<td >' + this.content + '</td>'+
    							 '<td >' + this.userName + '</td>'+
    							 '<td >' + this.createdTime + '</td>'+
    							 '<td >' + (this.isRead == 0? "未读":"已读") + '</td>'+
    							 '<td >' + (this.handleType == 0? "废弃":this.handleType == 1? "采纳":this.handleType == 2?"奖励":"--") + '</td>'+
    							 '<td ><button type="button" class="btn btn-primary btn-outline btn-xs readFeedbacks">查阅</button>'+
    					 '</td></tr>');
    				 });  
    				 
    				 //查阅反馈详情
    				 $("#tableBody td .readFeedbacks").click(function(event){
    					 var feedbackId = $(this).parent().parent().attr("id");
    					 window.location.href= urlRootContext()+"/get_requirement_detail?feedbackId="+feedbackId;
    				 });
    			 } else {             	            	
    				 $("#tableBody").append('<tr><th colspan ="8"><center>查询无数据</center></th></tr>');
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

//渲染完就执行
$(function() {
	
	buildTable("",1,PAGESIZE);//默认空白查全部
	
    //查询按钮
    $("#queryButton").bind("click",function(){
    	var reqData= {"isRead":$("#isRead").val(),"handleType":$("#handleType").val(),
    			"content":$("#fbContent").val(),"startTime":$("#start").val(),
    			"endTime":$("#end").val()}; //取内容
    	currentPage = 1;
    	buildTable(JSON.stringify(reqData),currentPage,PAGESIZE);//默认每页最多6条
    });
});

