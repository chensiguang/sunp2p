<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>添加</title>
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
<script type="text/javascript">
function checkflag() {
	var delayflag = document.getElementById("delay_flag").value;
	if(delayflag == 1) {
		$("#delay_time").val("请输入具体的延时秒数").css("color","gray");
		$("#delay_time").focus(function(){$(this).val("");$("#delay_time").css("color","black")});
	}else if(delayflag == 2) {
		$("#delay_time").val("请输入具体的启动时间，格式为hhmmss");
		$("#delay_time").css("color","gray");
		$("#delay_time").focus(function(){$(this).val("");$("#delay_time").css("color","black")})
	}else {
		$("#delay_time").val("");
	}
}
</script>
</head>
<body>
<div class="window-pop">
	<!--显示表单内容-->
	<form action="batchOrderAction_addBatchOrder" method="post" id="batchOrderAdd" >
	<ul class="pop-list">
		<li>
			<label><span style="color: red">* </span>清算交易码：</label> 
			<input class="tool-text" type="text" name="task_code" id="task_code" />			
		</li>
		<li>
			<label><span style="color: red">* </span>清算组别：</label> 
			<input class="tool-text" type="text" name="batch_group" id="batch_group" />
		</li>
		<li>
			<label>清算名称：</label> 
			<input class="tool-text" type="text" name="task_name" id="task_name" />		
		</li>
		<li>
			<label>父清算交易码：</label> 
			<input class="tool-text" type="text" name="parent_task_code" id="parent_task_code" />		
		</li>
		<li>
			<label>延时处理标志：</label> 
			<select class="tool-select" name="delay_flag" id="delay_flag" onchange="checkflag()" >
				<option value="">==请选择延时处理标志==</option>
				<c:forEach items="${K_DELAYFLAG}" var="rst">
					<option value="${rst.val}">${rst.prompt}</option>
				</c:forEach>
			</select>	
		</li>
		<li>
			<label>延时时间：</label> 
			<input class="tool-text" type="text" name="delay_time" id="delay_time" />
		</li>
		<li>
			<label>是否允许重做：</label> 
			<select class="tool-select" name="redo_flag" id="redo_flag" >
				<option value="">==请选择是否允许重做==</option>
				<c:forEach items="${K_ISSUE}" var="rst">
					<option value="${rst.val}">${rst.prompt}</option>
				</c:forEach>
			</select>	
		</li>
	</ul>
	<div class="tool-buttons">
		<input class="tool-btn" type="submit" value="提  交" >&nbsp;
		<input class="tool-btn" type="Reset" value="重  置" />&nbsp;
		<input class="tool-btn" type="button" value="返  回"  id="closeLayer" />
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
	$("#batchOrderAdd").validate({
		onfocusout: function(element) { 
			$(element).valid(); 
		},
		rules: {
			task_code: {required: true,	maxlength: 10},
			task_name: {required: true,	maxlength: 15},
			batch_group: {required: true, maxlength: 1},
			parent_task_code: {required: true, maxlength: 10},
			redo_flag: {required: true,	maxlength: 1},
			delay_flag: {required: true},
			delay_time: {digits: true, rangelength: [0, 6]}
		}
	});
});
</script>
</body>
</html>


