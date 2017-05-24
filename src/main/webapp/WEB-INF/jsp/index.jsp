<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="include_tags.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>Inspection - Home</title>

    <meta name="description" content="Inspection - Home">

    <!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="favicon.ico">
    <link href="${ctx  }/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="${ctx  }/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="${ctx  }/css/animate.min.css" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="${ctx  }/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="${ctx  }/css/style.min.css?v=4.0.0" rel="stylesheet">
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse" >
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                        <div id="img_show" style="width: 68px;height: 68px">
                        	<c:if test="${not empty user.headImg }">
                        		<img alt="image"  src="${ctx  }${user.headImg }" class="img-responsive img-circle" alt="Cinque Terre" style="width:68px;height:68px"/>
                        	</c:if>
                        	<c:if test="${empty user.headImg }">
                        		<img alt="image"  src="${ctx  }/img/head_img/default_img.jpg" class="img-responsive img-circle" alt="Cinque Terre" />
                        	</c:if>
                        </div>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                                <span class="block m-t-xs"><strong class="font-bold">${user.username}</strong></span>
                                <span class="text-muted text-xs block">${role.roleName}<b class="caret"></b></span>
                                </span>
                            </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                <li><a  href="#" id="show_a">修改头像</a>
                                </li>
                                <li><a class="J_menuItem" href="personalData">个人资料</a>
                                </li>
                                <li class="divider"></li>
                                <!-- <li>
                                	<a href="http://downloadpkg.apicloud.com/app/download?path=http://7xwky1.com1.z0.glb.clouddn.com/f149e598fe5de909cdc8a488b314b90b_d">App下载</a>
                                </li> -->
                                <li><a href="logout.do">安全退出</a>
                                </li>
                            </ul>
                        </div>
                        <div class="logo-element">LOGO
                        </div>
                    </li>
                    
                    
                     <form action="" enctype="multipart/form-data">
                     	<input type="file" name="head_img" id="head_img" style="display: none;" accept="image/*" >
                     </form>
                   <%--  <li>
                        <a class="J_menuItem" href="empty_page.do">
                            <i class="fa fa-home"></i>
                            <span class="nav-label">主页</span>
                        </a>
                        <c:if test="${role.roleId == 1 || role.roleId == 2 }">
                        	<a class="J_menuItem" href="${ctx  }/company_management.do">
	                            <i class="fa fa-home"></i>
	                            <span class="nav-label">主页</span>
	                        </a>
                        </c:if>
                        <c:if test="${role.roleId == 3 || role.roleId == 4 }">
                        	<a class="J_menuItem" href="${ctx  }/company_info.do">
	                            <i class="fa fa-home"></i>
	                            <span class="nav-label">主页</span>
	                        </a>
                        </c:if>
                        <c:if test="${role.roleId == 5 || role.roleId == 6 }">
                        	<a class="J_menuItem" href="${ctx  }/management_units_info.do">
	                            <i class="fa fa-home"></i>
	                            <span class="nav-label">主页</span>
	                        </a>
                        </c:if>
                        <c:if test="${role.roleId == 7 || role.roleId == 8 }">
                        	<a class="J_menuItem" href="${ctx  }/device_management.do">
	                            <i class="fa fa-home"></i>
	                            <span class="nav-label">主页</span>
	                        </a>
                        </c:if>
                    </li> --%>
<!-- start menu -->
                    <c:forEach var="menu" items="${menus }" varStatus="s">
                    	<%-- <c:if test="${empty menu.children }">
	                    	<li>
	                    		<a class="J_menuItem" href="${ctx  }/${menu.id.link}">
		                        	<i class="fa fa-desktop"></i> 
		                        	<span class="nav-label">${menu.id.permissionName}</span>
		                        </a>
		                    </li>
                    	</c:if> --%>
						<c:if test="${not empty menu.children }">
							<li>
		                        <a href="#">
		                        	<i class="fa fa-columns"></i> 
		                        	<span class="nav-label">${menu.id.permissionName} </span>
		                        	<span class="fa arrow"></span>
		                        </a>
		                        <ul class="nav nav-second-level">
		                        	<c:forEach var="sencondMenu" items="${menu.children }" varStatus="s" >
			                            <li>
			                            	<a class="J_menuItem"  href="${ctx  }/${sencondMenu.id.link}">${sencondMenu.id.permissionName}</a>
			                            </li>
		                        	</c:forEach>
		                        </ul>
		                    </li>
						</c:if>
					</c:forEach>
<!-- end menu -->
                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                   <%--  <div class="navbar-header">
                    	<a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
                    	<div class="minimalize-styl-2 form-inline col-sm-6" style="padding: 0px;">
	                    	<div class="form-group">
	 		                	<label for="currentRQ">当前小区：</label>
			                    <select class="form-control" name="currentRQ" id="currentRQ">
			                    	<c:forEach items="${managedRQs }" var="managedRQ" varStatus="s">
		                                 <option value="${managedRQ.id }">${managedRQ.rqName }</option>
			                    	</c:forEach>
	                             </select>
			                </div>
                    	</div>
                    </div> --%>
                    <ul class="nav navbar-top-links navbar-right">
                        <!-- <li class="dropdown hidden-xs">
                            <a class="right-sidebar-toggle" aria-expanded="false">
                                <i class="fa fa-tasks"></i> 主题
                            </a>
                        </li> -->
                    </ul>
                </nav>
            </div>
            <div class="row content-tabs">
                <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                        <!-- <a href="javascript:;" class="active J_menuTab" data-id="empty_page.do">项目信息</a> -->
                        <a href="javascript:;" class="active J_menuTab" data-id="empty_page.do">Home</a>
                        <%-- <c:if test="${role.roleId == 1 || role.roleId == 2 }">
	                        <a href="javascript:;" class="active J_menuTab" data-id="${ctx  }/company_management.do">首页</a>
                        </c:if>
                        <c:if test="${role.roleId == 3 || role.roleId == 4 }">
	                        <a href="javascript:;" class="active J_menuTab" data-id="${ctx  }/company_info.do">首页</a>
                        </c:if>
                        <c:if test="${role.roleId == 5 || role.roleId == 6 }">
	                        <a href="javascript:;" class="active J_menuTab" data-id="${ctx  }/management_units_info.do">首页</a>
                        </c:if>
                        <c:if test="${role.roleId == 7 || role.roleId == 8 }">
	                        <a href="javascript:;" class="active J_menuTab" data-id="${ctx  }/device_management.do">首页</a>
                        </c:if> --%>
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
                </button>
                <!-- <div class="btn-group roll-nav roll-right">
                    <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>

                    </button>
                    <ul role="menu" class="dropdown-menu dropdown-menu-right">
                        <li class="J_tabShowActive"><a>定位当前选项卡</a>
                        </li>
                        <li class="divider"></li>
                        <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                        </li>
                        <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                        </li>
                    </ul>
                </div> -->
                <a href="logout.do" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i>Logout</a>
            </div>
            <div class="row J_mainContent" id="content-main">
            
                <%-- <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${ctx }/project_info_management" frameborder="0" data-id="empty_page.do" seamless></iframe> --%>
				<iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="empty_page.do?v=4.0" frameborder="0" data-id="empty_page.do" seamless></iframe>		
						<%-- <c:if test="${role.roleId == 1 || role.roleId == 2 }">
	                 		<iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${ctx  }/company_management.do?v=4.0" frameborder="0" data-id="${ctx  }/company_management.do" seamless></iframe>
                        </c:if>
                        <c:if test="${role.roleId == 3 || role.roleId == 4 }">
                        	<iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${ctx  }/company_info.do?v=4.0" frameborder="0" data-id="${ctx  }/company_info.do" seamless></iframe>
                        </c:if>
                        <c:if test="${role.roleId == 5 || role.roleId == 6 }">
                        	<iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${ctx  }/management_units_info.do?v=4.0" frameborder="0" data-id="${ctx  }/management_units_info.do" seamless></iframe>
                        </c:if>
                        <c:if test="${role.roleId == 7 || role.roleId == 8 }">
                        	<iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${ctx  }/device_management.do?v=4.0" frameborder="0" data-id="${ctx  }/device_management.do" seamless></iframe>
                        </c:if> --%>
            </div>
        </div>
        <!--右侧部分结束-->
    </div>
    <%-- <script src="${ctx  }/js/jquery.min.js?v=2.1.4"></script> --%>
    <script src="${ctx  }/js/jquery-1.12.4.js"></script>
    <script src="${ctx  }/js/jquery-migrate-1.1.0.min.js"></script>
    <script src="${ctx  }/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="${ctx  }/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${ctx  }/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="${ctx  }/js/plugins/layer/layer.min.js"></script>
    <script type="text/javascript" src="${ctx  }/js/contabs.min.js"></script>
    <script src="${ctx  }/js/plugins/pace/pace.min.js"></script>
    <%-- <script src="${ctx  }/js/plugins/sweetalert/sweetalert.min.js"></script> --%>
    <script src="${ctx  }/js/jquery.cookie.js"></script>
    <script src="${ctx  }/js/system/base.js"></script>
    <script src="${ctx  }/js/ajaxfileupload.js"></script>
    <script src="${ctx  }/js/system/index.js"></script>
    <script src="${ctx  }/js/hplus.min.js?v=4.0.0"></script>
    <script type="text/javascript">
    	$(function(){
    		var obj = $(".nav-second-level").find("a[data-index='1']");
    		obj.click(); 
    	});
    </script>
</body>

</html>