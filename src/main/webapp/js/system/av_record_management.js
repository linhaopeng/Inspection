/**
 * created by chenxj
 */

var rqId = $.cookie("currentRQ");
var audioSourceUrl;
var imageSourceUrl;

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
			var reqData= {"rqId":$.cookie("currentRQ"),"avType":$("#avType").val(),
					"fromDevice":$("#fromDevice").val(),"toDevice":$("#toDevice").val(),
					"startTime":$("#start").val(),"endTime":$("#end").val()}; //取内容
			currentPage = newPage;
			buildTable(JSON.stringify(reqData),newPage,PAGESIZE);//默认每页最多6条
		},  
		onPageClicked: function (e, originalEvent, type, page) {  
		}      
} 	

//生成表格
function buildTable(reqData,pageNumber,pageSize) {
	 var url = urlRootContext()+"/get_audio_visual_records"; //请求的网址
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
    			 console.info(response.data);
    			 audioSourceUrl = response.data.audioSourceUrl;
    			 imageSourceUrl = response.data.imageSourceUrl;
    			 $("#tableBody").empty();//清空表格内容
    			 if (dataList.length > 0 ) {
    				 $(dataList).each(function(i){//重新生成
    					 $("#tableBody").append('<tr id="'+ this.id +'">'+
    							 '<td >'+ ((currentPage-1)*PAGESIZE+(i+1)) +'</td>'+
    							 '<td >' + ($.isNumeric(this.fromName)?this.fromName:(this.fromName+"门口机")) + '</td>'+
    							 '<td >' + ($.isNumeric(this.toName)?this.toName:(this.toName+"门口机")) + '</td>'+
    							 '<td >' + (new Date(this.callBeginTime)).pattern("yyyy-MM-dd hh:mm:ss") + '</td>'+
    							 '<td >' + (new Date(this.callEndTime)).pattern("yyyy-MM-dd hh:mm:ss") + '</td>'+
    							 '<td >' + $("#avType [value='"+this.avType+"']").html() + '</td>'+
    							 '<td >' + (this.callEndTime == null || this.callEndTime == '' ?"--":(this.callEndTime-this.callBeginTime)/1000) + '</td>'+
    							 '<td ><button type="button" class="btn btn-primary btn-outline btn-xs lookResource">查看</button>'+
    					 '</td></tr>');
    					 $("#"+this.id).data("audioVisualRecord",this);
    					 
    				 });  
    				 //重载事件
    				 lookResource();
    				 
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

function lookResource(){
	//查看视听资源
	$("#avRecords #tableBody td .lookResource").click(function(event){
		console.warn("lookResource....");
		var audioVisualId = $(this).parent().parent().attr("id");
		var audioVisualRecord = $("#"+audioVisualId).data("audioVisualRecord");
		console.info(audioVisualRecord.avSource);
		$(".player #noAudio").remove();
		if(audioVisualRecord.avSource != 'undefined' && audioVisualRecord.avSource != undefined){
			var audioSourceSrc = audioSourceUrl+audioVisualRecord.avSource;
			var audioSource = '<source src="'+audioSourceSrc+'" type="audio/mp3">'
			+'您的浏览器不支持在线播放，请<a href="'+audioSourceSrc+'">下载</a>';
			$(".player audio").html(audioSource);
		}else{
			$(".player").prepend('<div id="noAudio" style="text-align: center;"><strong>暂无音频资源</strong><div>');
			console.info(player);
			player.restart();
		}
		$("#resourceModal").modal("show");
	});
}

function getData(){
	var reqData= {"rqId":$.cookie("currentRQ"),"avType":$("#avType").val(),
			"fromDevice":$("#fromDevice").val(),"toDevice":$("#toDevice").val(),
			"startTime":$("#start").val(),"endTime":$("#end").val()}; //取内容
	currentPage = 1;
	buildTable(JSON.stringify(reqData),currentPage,PAGESIZE);
}

//渲染完就执行
$(function() {
	handleFancybox();
	getData();//默认空白查全部
	
    //查询按钮
    $("#queryButton").bind("click",function(){
		getData();
    });
    
});

//fancybox 
var handleFancybox = function () {
    if (!$.fancybox) {
        return;
    }

    if ($(".fancybox-button").size() > 0) {            
        $(".fancybox-button").fancybox({
            groupAttr: 'data-rel',
            prevEffect: 'none',
            nextEffect: 'none',
            closeBtn: true,
            helpers: {
                title: {
                    type: 'inside'
                }
            }
        });

        $('.fancybox-video').fancybox({
            type: 'iframe'
        });
    }
}