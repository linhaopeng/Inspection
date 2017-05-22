
//进度条    
function getProgress_bar(s) {
	var t = /^\d{1,3}$/;
	if (t.test(s)) {
		return '<div class="progressbar_3"><div class="text">' + s
				+ '%</div><div class="bar" style="width: ' + s
				+ '%;"></div></div>';

	}
	return '<div class="progressbar_3"><div class="text">0%</div><div class="bar" style="width: 0%;"></div></div>';
}

// 项目信息优先级
function getProject_info_priority(s) {
	var t = /^\d{1}$/;
	if (t.test(s)) {
		return s == 1 ? '极高' : s == 2 ? '高' : s == 3 ? '中' : s == 4 ? '低'
				: '';
	}
	return '优先级';
}

// 项目信息状态
function getProject_info_state(s) {
	var t = /^\d{1}$/;
	if (t.test(s)) {
		return s == 1 ? '/img/d1.jpg' : s == 2 ? '/img/d2.jpg'
				: s == 3 ? '/img/d3.jpg' : '';
	}
	return '/img/d1.jpg';
}

function get_date(s) {
	if (s == null || s == 'undefined' || s == 'undefined') {
		return '';
	}
	var newDate = new Date();
	newDate.setTime(s);
	var d = newDate.toLocaleDateString();
	s = d.replace('\/', '-');
	return s.replace('\/', '-');

}
//日期去空
function trim_date(s){
	return s==null?'':s;
}
//数值去空并取整
function trim_num(s){
	//return s==null?'':Math.floor(s);
	return s==null?'':s;
}
// 项目进度状态
function getProgress_state(s) {
	var t = /^\d{1}$/;
	if (t.test(s)) {
		return s == 1 ? '严重问题' : s == 2 ? '已滞后' : s == 3 ? '正常':'';
	}
	return '';
}
//计划状态
function getTask_state(s) {
	return s == 1 ? '项目未开始' : s == 2 ? '项目进行中' : s == 3 ? '已滞后':s==4?'严重问题':s==5?'已取消':'已完成';
}
// 几天前
(function(factory) {
	if (typeof define === 'function' && define.amd) {
		// AMD. Register as an anonymous module.
		define([ 'jquery' ], factory);
	} else {
		// Browser globals
		factory(jQuery);
	}
}(function($) {
	$.timeago = function(timestamp) {
		if (timestamp instanceof Date) {
			return inWords(timestamp);
		} else if (typeof timestamp === "string") {
			return inWords($.timeago.parse(timestamp));
		} else if (typeof timestamp === "number") {
			return inWords(new Date(timestamp));
		} else {
			return inWords($.timeago.datetime(timestamp));
		}
	};
	var $t = $.timeago;

	$.extend($.timeago, {
		settings : {
			refreshMillis : 60000,
			allowFuture : false,
			localeTitle : false,
			cutoff : 0,
			strings : {
				prefixAgo : null,
				prefixFromNow : null,
				suffixAgo : "前",
				suffixFromNow : "from now",
				seconds : "1分钟",
				minute : "1分钟",
				minutes : "%d分钟",
				hour : "1小时",
				hours : "%d小时",
				day : "1天",
				days : "%d天",
				month : "1月",
				months : "%d月",
				year : "1年",
				years : "%d年",
				wordSeparator : "",
				numbers : []
			}
		},
		inWords : function(distanceMillis) {
			var $l = this.settings.strings;
			var prefix = $l.prefixAgo;
			var suffix = $l.suffixAgo;
			if (this.settings.allowFuture) {
				if (distanceMillis < 0) {
					prefix = $l.prefixFromNow;
					suffix = $l.suffixFromNow;
				}
			}

			var seconds = Math.abs(distanceMillis) / 1000;
			var minutes = seconds / 60;
			var hours = minutes / 60;
			var days = hours / 24;
			var years = days / 365;

			function substitute(stringOrFunction, number) {
				var string = $.isFunction(stringOrFunction) ? stringOrFunction(
						number, distanceMillis) : stringOrFunction;
				var value = ($l.numbers && $l.numbers[number]) || number;
				return string.replace(/%d/i, value);
			}

			var words = seconds < 45
					&& substitute($l.seconds, Math.round(seconds))
					|| seconds < 90 && substitute($l.minute, 1) || minutes < 45
					&& substitute($l.minutes, Math.round(minutes))
					|| minutes < 90 && substitute($l.hour, 1) || hours < 24
					&& substitute($l.hours, Math.round(hours)) || hours < 42
					&& substitute($l.day, 1) || days < 30
					&& substitute($l.days, Math.round(days)) || days < 45
					&& substitute($l.month, 1) || days < 365
					&& substitute($l.months, Math.round(days / 30))
					|| years < 1.5 && substitute($l.year, 1)
					|| substitute($l.years, Math.round(years));

			var separator = $l.wordSeparator || "";
			if ($l.wordSeparator === undefined) {
				separator = " ";
			}
			return $.trim([ prefix, words, suffix ].join(separator));
		},
		parse : function(iso8601) {
			var s = $.trim(iso8601);
			s = s.replace(/\.\d+/, ""); // remove milliseconds
			s = s.replace(/-/, "/").replace(/-/, "/");
			s = s.replace(/T/, " ").replace(/Z/, " UTC");
			s = s.replace(/([\+\-]\d\d)\:?(\d\d)/, " $1$2"); // -04:00 ->
																// -0400
			return new Date(s);
		},
		datetime : function(elem) {
			var iso8601 = $t.isTime(elem) ? $(elem).attr("datetime") : $(elem)
					.attr("title");
			return $t.parse(iso8601);
		},
		isTime : function(elem) {
			// jQuery's `is()` doesn't play well with HTML5 in IE
			return $(elem).get(0).tagName.toLowerCase() === "time"; // $(elem).is("time");
		}
	});

	// functions that can be called via $(el).timeago('action')
	// init is default when no action is given
	// functions are called with context of a single element
	var functions = {
		init : function() {
			var refresh_el = $.proxy(refresh, this);
			refresh_el();
			var $s = $t.settings;
			if ($s.refreshMillis > 0) {
				setInterval(refresh_el, $s.refreshMillis);
			}
		},
		update : function(time) {
			$(this).data('timeago', {
				datetime : $t.parse(time)
			});
			refresh.apply(this);
		},
		updateFromDOM : function() {
			$(this).data(
					'timeago',
					{
						datetime : $t.parse($t.isTime(this) ? $(this).attr(
								"datetime") : $(this).attr("title"))
					});
			refresh.apply(this);
		}
	};

	$.fn.timeago = function(action, options) {
		var fn = action ? functions[action] : functions.init;
		if (!fn) {
			throw new Error("Unknown function name '" + action
					+ "' for timeago");
		}
		// each over objects here and call the requested function
		this.each(function() {
			fn.call(this, options);
		});
		return this;
	};

	function refresh() {
		var data = prepareData(this);
		var $s = $t.settings;

		if (!isNaN(data.datetime)) {
			if ($s.cutoff == 0 || distance(data.datetime) < $s.cutoff) {
				$(this).text(inWords(data.datetime));
			}
		}
		return this;
	}

	function prepareData(element) {
		element = $(element);
		if (!element.data("timeago")) {
			element.data("timeago", {
				datetime : $t.datetime(element)
			});
			var text = $.trim(element.text());
			if ($t.settings.localeTitle) {
				element.attr("title", element.data('timeago').datetime
						.toLocaleString());
			} else if (text.length > 0
					&& !($t.isTime(element) && element.attr("title"))) {
				element.attr("title", text);
			}
		}
		return element.data("timeago");
	}

	function inWords(date) {
		return $t.inWords(distance(date));
	}

	function distance(date) {
		return (new Date().getTime() - date.getTime());
	}

	// fix for IE6 suckage
	document.createElement("abbr");
	document.createElement("time");
}));

// 
function getImg(){
	var $imgCrop = $("#imgCrop");
	var $img = $imgCrop.find("img");
	var img = $img[0];
	var width = parseInt($imgCrop.css("width"));
	var height = parseInt($imgCrop.css("height"));
	var startX,startY,scale = 1;
	var x = 0,y = 0;
	$("input").on("change",function(){
	    var fr = new FileReader();
	    var file = this.files[0]
	    //console.log(file);
	    if(!/image\/\w+/.test(file.type)){
	        alert(file.name + "不是图片文件！");
	        return;
	    }
	    console.log(file);
	    $img.removeAttr("height width");
	    fr.readAsDataURL(file);

	    fr.onload = function(){
	        img.src = fr.result;
	        var widthInit = img.width;
	        if(img.width>img.height){
	            img.height = height;
	            x = (width - img.width)/2;
	            y = 0;
	        }else{
	            img.width = width;
	            x = 0;
	            y = (height - img.height)/2;
	        }
	        scale = widthInit/img.width;
	        move($img, x, y);
	        
	    };
	    
	});

	img.addEventListener("touchstart",function(e){  
	    startX = e.targetTouches[0].pageX;
	    startY = e.targetTouches[0].pageY;
	 
	    return;  

	}); 
	img.addEventListener("touchmove",function(e){  
	    e.preventDefault();  
	    e.stopPropagation();  

	    var changeX = e.changedTouches[0].pageX - startX + x;
	    var changeY = e.changedTouches[0].pageY - startY + y;

	    move($(this), changeX, changeY);
	    return;  
	  
	}); 
	img.addEventListener("touchend",function(e){   
	   var changeX = e.changedTouches[0].pageX - startX + x;
	    var changeY = e.changedTouches[0].pageY - startY + y;

	    x = x + e.changedTouches[0].pageX - startX;
	    y = y + e.changedTouches[0].pageY - startY;

	    move($(this), changeX, changeY);
	    return;  
	  
	});  
	//确定目标图片的样式
	function move(ele, x, y){
	    ele.css({
	        '-webkit-transform' : 'translate3d(' + x + 'px, ' + y + 'px, 0)',
	        'transform' : 'translate3d(' + x + 'px, ' + y + 'px, 0)'
	    });
	}

	$("#save").on("click",function(){
	    var url = imageData($img);
	    console.log(url);

	    $("#imgShow").html("<img src="+url+" />");;
	});
	//裁剪图片
	function imageData($img) {
	        var canvas = document.createElement('canvas');
	        var ctx = canvas.getContext('2d');
	        canvas.width = width ;
	        canvas.height = height;
	        ctx.drawImage(img, -x*scale, -y*scale, width*scale, height*scale, 0, 0, width, height);
	        return canvas.toDataURL();
	    }
}