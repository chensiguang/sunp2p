<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理系统</title>
<link rel="stylesheet" type="text/css" href="${ctx}/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/themes/icon.css" />
<link rel="stylesheet" href="${ctx}/style/main-css/dtree.css" />
<link rel="stylesheet" href="${ctx}/style/main-css/global.css" type="text/css" />
<script type="text/javascript" src="${ctx}/javascript/dtree/dtree.js"></script>
<script src="${ctx}/javascript/jquery/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/javascript/jquery/jquery.easyui.min.js"></script>
</head>

<body class="easyui-layout content" data-options="fit:true">
<div data-options="region:'north'" style="border:0; overflow:visible;">
	<div class="header">
		<div class="top-content clearfix">
	    	<span class="logo"></span>
	        <ul class="nav">
	        	<c:forEach items="${topPrivileges}" var="rst">
		        	<li>
		        		<span class="nav-icon nav-${rst.privilege_id}"></span><a href="homeAction_showChildren?privilege_id=${rst.privilege_id}">${rst.privilege_name}</a>
		        	</li>
				</c:forEach>
	        </ul>
	        <div class="user-action">
	        	<div id="loginStatus" class="login-status">
	        		<div id="loginOut" class="login-out">
	        			<a href="homeAction_logout">退出系统</a>
	        		</div>
	        		<span id="loginArrow" class="login-arrow-down"></span>
	        	</div>
	        </div>
	    </div>
	</div>
</div>
<div data-options="region:'west',split:true,iconCls:'icon-base'" title="${title}" style="width:200px;background:#f7f9f9;">
	<div class="dtree">
		<!-- <p><a href="javascript: d.openAll();">展开 ∨</a> | <a href="javascript: d.closeAll();">收起 ∧</a></p> -->
		<script type="text/javascript" charset="utf-8">
		d = new dTree("d");
		<% String strTree = (String)request.getSession().getAttribute("childrenList");out.println(strTree); %>
		document.write(d);
		</script>
	</div>
</div>
<div data-options="region:'center'"><iframe id="frame" name="${frame}" marginwidth="0" marginheight="0" frameborder="0" style="width:100%;height:100%; display:block;"></iframe>
</div>
	<script>
	$(function(){
			$(".node").click(function(){
				if($(this).parent(".dTreeNode").next(".clip").is(":visible")){
					$(this).parent(".dTreeNode").removeClass("dTreeNodeOn");
				}else{
					$(this).parent(".dTreeNode").addClass("dTreeNodeOn");
				}
			});
		$("#loginStatus").click(function(){
			if($("#loginOut").is(":hidden")){
				$("#loginOut").show();
				$("#loginArrow").removeClass("login-arrow-down").addClass("login-arrow-up");
			}else{
				$("#loginOut").hide();
				$("#loginArrow").removeClass("login-arrow-up").addClass("login-arrow-down");
			}
		});
		
		var winHref = window.location.href;
		if(winHref.indexOf("20000")>-1){
			$(".nav li").each(function(index){
				var className = $(this).find("span").attr("class");
				if(className.indexOf("20000")>-1){
					$(this).find("span").addClass(className+"-on");
				}
			});
		}else if(winHref.indexOf("30000")>-1){
			$(".nav li").each(function(index){
				var className = $(this).find("span").attr("class");
				if(className.indexOf("30000")>-1){
					$(this).find("span").addClass(className+"-on");
				}
			});
		}else if(winHref.indexOf("40000")>-1){
			$(".nav li").each(function(index){
				var className = $(this).find("span").attr("class");
				if(className.indexOf("40000")>-1){
					$(this).find("span").addClass(className+"-on");
				}
			});
		}else if(winHref.indexOf("50000")>-1){
			$(".nav li").each(function(index){
				var className = $(this).find("span").attr("class");
				if(className.indexOf("50000")>-1){
					$(this).find("span").addClass(className+"-on");
				}
			});
		}else {
			$(".nav li").each(function(index){
				var className = $(this).find("span").attr("class");
				if(className.indexOf("10000")>-1){
					$(this).find("span").addClass(className+"-on");
				}
		});
	}
	});
	</script>
</body>
</html>
