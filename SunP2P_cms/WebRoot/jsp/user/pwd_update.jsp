<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>修改用户</title>
<link rel="stylesheet" href="${ctx}/style/main-css/global.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/style/validate.css" type="text/css"/>
<script src="${ctx}/javascript/jquery/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/javascript/jquery/jquery.validate.js"></script>
<script type="text/javascript" src="${ctx}/javascript/jquery/jquery.metadata.js"></script>
<script type="text/javascript" src="${ctx}/javascript/jquery/messages_cn.js"></script>
<style>
span.error {
	top:5px;
	right:68px;
	line-height:25px;
}
</style>
</head>

<body style="text-align:center;">
<div class="window-pop">
	<form action="userAction_updatePwd" method="post" name="updatePWD" onsubmit="return formCheck()" id="pwdUpdate" >
		<input type="hidden" value="${userupdate.user_id}" name="user_id" id="user_id" >
		<input type="hidden" value="${userupdate.user_name}" name="user_name" id="user_name" >
		<input type="hidden" value="${userupdate.user_pwd}" name="user_password" id="user_password" >
		<span style="color:red">${fieldErrors.usernewpwd[0]}</span>
		<ul class="pop-list">
			<li>
				<label><span style="color: red"> *</span>当前密码：</label> 
				<input class="tool-text" type="text" name="user_pwd" id="user_pwd" /><br />
			</li>
			<li style="height:18px;line-height:18px; text-align:center;">
				<span style="color:red"><span class="incorrect"></span></span>
			</li>
			<li>
				<label><span style="color: red"> *</span>新密码：</label> 
				<input class="tool-text" type="text" name="user_new_pwd" id="user_new_pwd" />			
			</li>
			<li>
				<label><span style="color: red"> *</span>确认密码：</label> 
				<input class="tool-text" type="text" name="user_confirm_pwd" id="user_confirm_pwd" /><br />
			</li>
			<li style="height:18px;line-height:18px; text-align:center;">
				<span style="color:red"><span class="difference"></span></span>
			</li>
		</ul>
		<div class="tool-buttons">
			<input class="tool-btn" type="submit" value="提  交" >&nbsp;
			<input class="tool-btn" type="Reset" value="重  置" />&nbsp;
			<input class="tool-btn" type="button" value="返 回" id="closeLayer" />
		</div>
	</form>
</div>
<script type="text/javascript">
	function formCheck(){
		if(updatePWD.user_password.value != updatePWD.user_pwd.value) {
			
	    	$(".incorrect").html("<span> 当前密码不正确，请重新输入~ </span>");
		return false;
		}
		
	    if(updatePWD.user_new_pwd.value != updatePWD.user_confirm_pwd.value) {
	    	
	    	$(".difference").html("<span> 两次输入的密码不一致，请重新输入~ </span>");
		return false;
	    }
	}
	
	// 非空验证
	$(document).ready(function() {
		//获取当前窗口索引
		var index = parent.layer.getFrameIndex(window.name);
		$("#closeLayer").click(function(){
			parent.layer.close(index);
		});
		$("#pwdUpdate").validate({
			onfocusout: function(element) {
				$(element).valid();
			},
			rules: {
				user_pwd: {
					required: true,
					maxlength: 25,
					minlength: 6
				},
				user_new_pwd: {
					required: true,
					maxlength: 25,
					minlength: 6
				},
				user_confirm_pwd: {
					required: true,
					maxlength: 25,
					minlength: 6
				}
			}
		});
	});
</script>
</body>
</html>
