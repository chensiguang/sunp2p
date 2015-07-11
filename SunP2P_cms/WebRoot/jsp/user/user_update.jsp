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
	<form action="userAction_updateUser" method="post" id="userUpdate" >
		<ul class="pop-list">
			<li>
				<label><span style="color: red">* </span>用户ID：</label> 
				<input class="required tool-text" type="text" readonly="readonly" value="${user.user_id}" name="user_id" id="user_id" />			
			</li>
			<li>
				<label><span style="color: red">* </span>用户名称：</label> 
				<input class="required tool-text" type="text" value="${user.user_name}" name="user_name" id="user_name" />			
			</li>
			<li>
				<label><span style="color: red">* </span>用户类型：</label> 
				<select  class="required tool-select" name="user_type">
					<option value="">==请选择用户类型==</option>
					<c:forEach items="${K_USERTYPE}" var="rst" >
						<option value="${rst.val}" <c:if test="${rst.val eq user.user_type}">selected</c:if> >${rst.prompt}</option>
					</c:forEach>
				</select>
			</li>
			<li>
				<label><span style="color: red">* </span>用户状态：</label> 
				<select  class="required tool-select" name="user_state">
					<option value="">==请选择用户状态==</option>
					<c:forEach items="${K_USERSTATE}" var="rst">
						<option value="${rst.val}" <c:if test="${rst.val eq user.user_state}">selected</c:if> >${rst.prompt}</option>
					</c:forEach>
				</select>			
			</li>
			<li>
				<label><span style="color: red">* </span>所属机构：</label> 
				<select  class="required tool-select" name="department_id" id="department_id">
					<option value="">==请选择机构==</option>
					<c:forEach items="${departmentTree}" var="rst">
						<option value="${rst.department_id}" <c:if test="${rst.department_id eq user.department_id}">selected</c:if> >${rst.department_name}</option>
					</c:forEach>
				</select>			
			</li>
			<li>
				<label>说  明：</label> 
				<input class="tool-text" type="text" value="${user.user_desc}" name="user_desc" id="user_desc" />			
			</li>
		</ul>
		<div class="tool-buttons">
			<input class="tool-btn" type="submit" value="提  交" >&nbsp;
			<input class="tool-btn" type="Reset" value="重  置" />&nbsp;
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
    $("#userUpdate").validate({
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
