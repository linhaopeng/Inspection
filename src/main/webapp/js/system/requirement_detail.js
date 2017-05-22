/**
 * created by chenxj
 */

var handleType = $("#handleType").val();

$(function(){
	handleFancybox();
	$("#radio"+handleType).iCheck("check"); 
	
	$('.radio input').on('ifChecked', function(event) { //ifCreated 事件应该在插件初始化之前绑定 
		if(true == $(this).is(':checked')){
			handleType = $(this).val();
		}
	});
});

$("#cancel").click(function(){
	window.location.href=urlRootContext()+"/requirement_management";
});

$("#save").click(function(){
	window.location.href=urlRootContext()+"/save_requirement?feedbackId="+$("#feedbackId").val()
	+"&handleType="+handleType+"&replyContent="+$("#replyContent").val()+"&score="+fbScore;
});

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