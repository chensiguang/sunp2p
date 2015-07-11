<?xml version="1.0" encoding="utf-8" ?>
<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>修改机构</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	<form action="privilegeAction_updatePrivilege" method="post" id="privilegeUpdate" >
	<ul class="pop-list">
		<li>
			<label><span style="color: red">* </span>权限代码：</label> 
			<input class="tool-text" type="text" readonly="readonly" value="${privilege.privilege_id}" name="privilege_id" id="privilege_id" />
		</li>
		<li>
			<label><span style="color: red">* </span>权限名称：</label> 
			<input class="tool-text" type="text" value="${privilege.privilege_name}" name="privilege_name" id="privilege_name" />		
		</li>
		<li>
			<label>父ID：</label> 
			<input class="tool-text" type="text" value="${privilege.parent_id}" name="parent_id" id="parent_id" />		
		</li>
		<li>
			<label>URL：</label> 
			<input class="tool-text" type="text" value="${privilege.url}" name="url" id="url" />		
		</li>
	</ul>
	<div class="tool-buttons">
		<input class="tool-btn" type="submit" value="提  交" />&nbsp;
		<input class="tool-btn" type="reset" value="重  置"/>&nbsp;
		<input class="tool-btn" type="button" value="返  回" id="closeLayer" />
	</div>
	</form>
</div>
<script>
$(document).ready(function() {
	//获取当前窗口索引
	var index = parent.layer.getFrameIndex(window.name);
	$("#closeLayer").click(function(){
		parent.layer.close(index);
	});
	$("#privilegeUpdate").validate({
		onfocusout: function(element) { 
			$(element).valid(); 
		},
		rules: {
			privilege_id: {
				required: true,
                rangelength: [5,10]
			},
			privilege_name: {
				required: true,
				maxlength: 15
			},
			parent_id: {
                rangelength: [5,10]
			},
			url: {
				maxlength: 100
			}
		}
	});
});
</script>
</body>
</html>

