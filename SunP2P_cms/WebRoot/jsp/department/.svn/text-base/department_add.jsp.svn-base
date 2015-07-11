<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>添加机构</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="${ctx}/style/main-css/global.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="${ctx}/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/themes/icon.css" />
<link rel="stylesheet" href="${ctx}/style/validate.css" type="text/css"/>
<script type="text/javascript" src="${ctx}/javascript/jquery/jquery.easyui.min.js"></script>
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
	<!--显示表单内容-->
	<form id="addDepartment" action="departmentAction_addDepartment" method="post" >
		<ul class="pop-list">
			<li>
				<label>上级机构：</label>
				<select class="tool-select" name="parent_id">
					<option value="">==请选择机构==</option>
					<c:forEach items="${departmentTree}" var="rst">
					<option value="${rst.department_id}">${rst.department_name}</option>
					</c:forEach>
				</select>
			</li>
			<li>
				<label><span style="color: red">* </span>机构名称：</label> 
				<input class="tool-text" type="text" name="department_name" id="department_name" />
			</li>
			<li>
				<label><span style="color: red">* </span>机构级别：</label> 
				<input class="tool-text" type="text" name="department_level" id="department_level" />				
			</li>
			<li>
				<label>说  明：</label> 
				<input class="tool-text" type="text" name="department_desc" id="department_desc" />				
			</li>
		</ul>
		<div class="tool-buttons">
			<input class="tool-btn" type="submit" value="提  交"></input>&nbsp;
			<input class="tool-btn" type="reset" value="重  置"></input>&nbsp;
			<input class="tool-btn" id="closeLayer" type="button" value="返  回"></input>
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
	$("#addDepartment").validate({
		onfocusout: function(element) { 
			$(element).valid(); 
		},
		rules: {
			department_name: {
				required: true,
				maxlength: 15
			},
			department_level: {
				required: true,
			},
			department_desc: {
				maxlength: 50
			}
		}
	});
});
</script>
</body>
</html>
