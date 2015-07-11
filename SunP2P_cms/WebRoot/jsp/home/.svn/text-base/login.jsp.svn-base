<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>login</title>
<link rel="stylesheet" type="text/css" href="${ctx}/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/themes/metro/easyui.css" />
<link rel="stylesheet" href="${ctx}/style/main-css/global.css" type="text/css" />
<script src="${ctx}/javascript/jquery/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/javascript/jquery/jquery.easyui.min.js"></script>
</head>

<body class="over-hid">
	<div id="loginBg" class="login-bg"><img class="login-bg-img" src="${ctx}/images/login-bg.jpg" /></div>
	<form id="homeLogin" action="homeAction_login" method="post">
		<div class="login-main">
			<div class="login-content">
				<div class="login-face"><img src="${ctx}/images/user-face.png" /></div>
				<h2 class="login-title"><img src="${ctx}/images/login-title.png" /></h2>
				<div class="user-login-info">
					<div class="user-name">
						<label for="username">账　号：</label> 
						<input type="text" name="user_name" id="username" class="user-name-input" />
					</div>
					<div class="user-pwd">
						<label for="userpwd">密　码：</label> 
						<input type="password" name="user_pwd" id="userpwd" class="user-pwd-input" />
					</div>
				</div>
				<span style="color:red;">${error}</span>
				<div class="user-login-button">
					<input type="submit" class="user-login" value="登　录" />
				</div>
			</div>
		</div>
	</form>
<script>
	/* bgResize();
	function bgResize(){
		$(window).resize(function(){
			var loginBgWidth = $(window).width();
			if($(window).width()<1043){
				$("#loginBg").css({"left":"50%","margin-left":"-"+loginBgWidth/2+"px","width":loginBgWidth});
			}else{
				$("#loginBg").css({"left":"0","margin-left":"0","width":loginBgWidth});
			}
		});
	}
	 */
	// 在被嵌套时就刷新上级窗口
	if(window.parent != window){
		window.parent.location.reload(true);
	}
</script>
</body>
</html>
