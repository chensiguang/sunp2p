<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>修改角色</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
	<form action="roleAction_updateRole" method="post" id="roleUpdate" >
		<ul class="pop-list">
			<li>
				<label><span style="color: red"> *</span>角色ID：</label> 
				<input class="tool-text" type="text" readonly="readonly" value="${role.role_id}" name="role_id" id="role_id" />				
			</li>
			<li>
				<label><span style="color: red"> *</span>角色名称：</label> 
				<input class="tool-text" type="text" value="${role.role_name}" name="role_name" id="role_name" />			
			</li>
			<li>
				<label>说  明：</label> 
				<input class="tool-text" type="text" value="${role.role_desc}" name="role_desc" id="role_desc" />				
			</li>
		</ul>
		<div class="tool-buttons">
			<input class="tool-btn" type="submit" value="提  交" >&nbsp;
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
	$("#roleUpdate").validate({
		onfocusout: function(element) { 
			$(element).valid(); 
		},
		rules: {
			role_id: {
				required: true,
                rangelength: [6,10]
			},
			role_name: {
				required: true,
				maxlength: 15
			},
			role_desc: {
				maxlength: 50
			}
		}
	});
});
</script>
</body>
</html>
