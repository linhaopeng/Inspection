<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>项目管理系统客户端安装</title>

<style type="text/css">

body {
	margin: 0px;
}
.container{
	background-color:#fff;
	margin:0px auto;
}  

.header{
	height:85px;
	background-image:url(img/header.png);
	background-repeat: repeat-x;
	font-size:44px;
	color:#FFF;
	padding:20px 0 0 30px;
}
	
.middle{
	height:663px;	
	width:1024px;	
	}


.left{
	float:left;
	height:683px;	
	width:490px;	
	}
	
.content{
	margin:70px 0 50px 50px;
	}
	
h1{
   color:#d4993b;
   font-size:32px;
  }
   
li{
	list-style: none;
	padding-right:30px;
 }
   
.nosignList ul{
	list-style: none;
	margin:0px;
	padding:0px;	  
	}
.nosignList li{
	font-size:19px;
	line-height:36px;
	list-style: none;
	background:url(img/dot.png) no-repeat 0px 16px;
	padding-left:20px;
	}
	
a.button{
	margin:25px 0 0 30px;
	text-align:center;
	height:60px;
	width:240px;
	font-size:20px;
	color:#FFF;
	line-height:60px;
	display: block;
	background-image:url(img/button.png);
	background-repeat:no-repeat;
	text-decoration:none;
	}
a.button:active{
	background-image:url(img/button_active.png);
	background-repeat:no-repeat;
	}
	
.right{
	float:right;
	height:550px;	
	width:534px;
	margin-top:50px;
	}
.ios{background:url(img/icon01.png) no-repeat center right;}
.android{background:url(img/icon02.png) no-repeat center right;}	
</style>
<script src="<%=basePath %>/js/jquery-1.12.4.js"></script>
<script src="<%=basePath %>/js/plugins/jquery-qrcode-master/jquery.qrcode.min.js"></script>
</head>

<body>
<div class="container">

    <div class="header">广州市番禺现代产业基地项目管理系统客户端安装</div>

    <div class="middle" >  
    
        <div class="content">
        <h1>广州市番禺现代产业基地项目管理系统</h1>
              <ul class="nosignList">                
               <li>创新为本，追求先进 </li> 
               <li>一端接入，无限协同</li> 
               <li>精致流畅，舒适简易</li> 
             </ul>
        </div>
   
		 <div style="padding-left:100px">
			 <h2>
				<a href="PM.apk">项目管理系统-安卓版</a>
			 </h2>
			 <h2>
			 	<div id="code"></div> 
			 </h2>
			 <!-- <h2>
				<a href="itms-services://?action=download-manifest&url=https://downloadpkg.apicloud.com:443/zip/b0/2d/b02d93202a9f60f8834cc0348e0c68b9.plist">项目管理系统-IOS版</a>
			 </h2> -->
			 <h2>
				<a title="iPhone"
						href="itms-services://?action=download-manifest&url=https://odso7k3lz.qnssl.com/PMSystem.plist">
						项目管理系统-IOS版</a>
			 </h2>
			 <h2>
			 	<div id="code2"></div> 
			 </h2>
		 </div>
         <br/>
         </br>
        </div>
        
      </div>


<script type="">
$("#code").qrcode({ 
    render: "table", //table方式 
    width: 200, //宽度 
    height:200, //高度 
    text: "http://120.76.224.215/PM/PM.apk" //任意内容 
}); 

</script>

</body>

</html>