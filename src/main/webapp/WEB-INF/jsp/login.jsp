<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="include_tags.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--[if lt IE 8]>
	    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <![endif]-->

    <title>Inspection - Login</title>
    <meta name="keywords" content="sign in,门禁,安防">
    <meta name="description" content="Inspection- Login">

    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="${ctx  }/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="${ctx  }/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="${ctx  }/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

    <link href="${ctx  }/css/animate.min.css" rel="stylesheet">
    <link href="${ctx  }/css/style.min.css?v=4.0.0" rel="stylesheet">
    <link href="${ctx  }/css/system/login.css" rel="stylesheet">
    <base target="_blank">
    <!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <style type="text/css">
    	
    </style>
    <script>if(window.top !== window.self){ window.top.location = window.location;}</script>
</head>

<body class="gray-bg">

    <div class="middle-box text-center loginscreen  animated fadeInDown">
        <div style="width: 320px;">
				<div>

                	<h1 class="logo-name">GO</h1>
                	<!-- <img src="img/logo_bold_yellow.png" alt="" class="logo"/> -->

            	</div>
            <h3 style="color: #fff;">Inspection - Login </h3>
            <form class="m-t" role="form" id="loginForm" method="post" target="_self">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Username" title="Username" name="username" id="username"  minlength="2" maxlength="20" required="required" aria-required="true">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="Password" title="Password" name="password" id="password"  minlength="6" maxlength="20" required="required" aria-required="true">
                </div>
                <div class="form-group">
                    <input type="text" class="form-code" placeholder="Identifying code" title="Identifying code"  name="code" id="code" maxlength="4" required="required" aria-required="true">
                    <img alt="点击刷新" title="点击刷新" src="${ctx  }/pcrimg" class="form-code-img" onclick="this.src='${ctx  }/pcrimg?d='+Math.random();">
                    <div class="clear"></div> 
                </div>
                <button type="submit" class="btn btn-primary block full-width m-b" id="login">Login</button>


                <!-- <p class="text-muted text-center"> 
                	<a href="#"><small>忘记密码了？</small></a>
                </p> -->

            </form>
        </div>
    </div>
    <!-- <script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script> -->
    <script src="${ctx  }/js/jquery-1.12.4.js"></script>
    <script src="${ctx  }/js/jquery-migrate-1.1.0.min.js"></script>
    <script src="${ctx  }/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="${ctx  }/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="${ctx  }/js/plugins/validate/messages_zh.min.js"></script>
    <script src="${ctx  }/js/plugins/sweetalert/sweetalert.min.js"></script>
    <script type="text/javascript" src="${ctx  }/js/system/base.js"></script>
    <script type="text/javascript" src="${ctx  }/js/system/login.js"></script>
</body>

</html>