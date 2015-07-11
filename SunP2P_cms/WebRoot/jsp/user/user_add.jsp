<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>添加用户</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="${ctx}/style/main-css/global.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/style/validate.css" type="text/css"/>
<script type="text/javascript" src="${ctx}/javascript/jquery/jquery-1.11.0.min.js"></script>
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
	<!--显示表单内容-->
	<form action="userAction_addUser" method="post" id="userAdd" >
		<ul class="pop-list">
			<li>
				<label><span style="color: red"> *</span>用户ID：</label> 
				<input class="tool-text" type="text" name="user_id" id="user_id" />
			</li>
			<li>
				<label><span style="color: red"> *</span>用户名称：</label> 
				<input class="required tool-text" type="text" name="user_name" id="user_name" />
			</li>
			<li>
				<label><span style="color: red"> *</span>用户类型：</label> 
				<select class="required tool-select" name="user_type">
					<option value="">==请选择用户状态==</option>
					<option value="0">普通用户</option>
					<option value="1">授权用户</option>
					<option value="2">清算用户</option>
				</select>			
			</li>
			<li>
				<label><span style="color: red"> *</span>用户状态：</label> 
				<select class="required tool-select" name="user_state">
					<option value="">==请选择用户状态==</option>
					<option value="0">初始化用户</option>
					<option value="1">正常用户</option>
					<option value="2">在线用户</option>
					<option value="3">锁定用户</option>
				</select>
			</li>
			<li>
				<label><span style="color: red"> *</span>所属机构：</label> 
				<select class="required tool-select" name="department_id" id="department_id">
					<option value="">==请选择机构==</option>
					<c:forEach items="${departmentTree}" var="rst">
						<option value="${rst.department_id}">${rst.department_name}</option>
					</c:forEach>
				</select>			
			</li>
			<li>
				<label>说  明：</label>&nbsp;&nbsp;&nbsp;
				<input class="tool-text" type="text" name="user_desc" id="user_desc" />			
			</li>
		</ul>
		<div class="tool-buttons">
			<input class="tool-btn" type="submit" value="提  交" />&nbsp;
			<input class="tool-btn" type="reset" value="重  置" />&nbsp;
			<input class="tool-btn" type="button" value="返 回" id="closeLayer" />
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
    $("#userAdd").validate({
        onfocusout: function(element) {
            $(element).valid();
        },
       rules: {
            user_id: {
                required: true,
                rangelength: [6,10]
            },
            user_name: {
            	required: true,
            	maxlength: 15
            },
            user_desc: {
            	maxlength: 50
            }
        } 
    });
});
</script>
</body>
</html>


