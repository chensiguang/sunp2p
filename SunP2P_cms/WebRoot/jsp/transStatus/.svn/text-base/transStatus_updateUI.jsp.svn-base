<?xml version="1.0" encoding="utf-8" ?>
<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>修改产品交易状态</title>
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
	<form action="transStatusAction_update" method="post" id="transStatusUpdate" >
	<ul class="pop-list">
		<li>
			<label><span style="color: red"> *</span>产品类型：</label> 
				<select name="prod_type" class="tool-select" id="prod_type" 
						onchange="if(this.options[selectedIndex].className!='readonly') this.selectedIndex=-1">
					<option value="">===请选择产品类型===</option>
					<c:forEach items="${K_PRODTYPE}" var="rstt">
						<option value="${rstt.val}" <c:if test="${rstt.val eq transStatus.prod_type}" >
								class="readonly" selected</c:if> >${rstt.prompt}</option>
					</c:forEach>
				</select>
		</li>
		<li>
			<label><span style="color: red"> *</span>产品代码：</label>
			<input class="tool-text" type="text" readonly="readonly" value="${transStatus.prod_id}" name="prod_id" id="prod_id" />		
		</li>
		<li>
			<label><span style="color: red"> *</span>交易代码：</label>
			<input class="tool-text" type="text" readonly="readonly" value="${transStatus.trans_code }" name="trans_code" id="trans_code" />		
		</li>
		<li>
			<label>交易允许：</label>
			<select name="enable_flag" class="tool-select" id="enable_flag">
			<c:forEach items="${K_ENABLEFLAG}" var="rst">
				<option value="${rst.val}" <c:if test="${rst.val eq transStatus.enable_flag}">selected</c:if> >${rst.prompt}</option>
			</c:forEach>
			</select>
		</li>
		<li>
			<label>当前状态：</label>
			<select name="status" class="tool-select" id="status">
			<c:forEach items="${K_ENABLEFLAG}" var="rst">
				<option value="${rst.val}" <c:if test="${rst.val eq transStatus.status}">selected</c:if> >${rst.prompt}</option>
			</c:forEach>
			</select>
		</li>
	</ul>
	<div class="tool-buttons">
		<input class="tool-btn" type="submit" value="提  交" />&nbsp;
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
	$("#transStatusUpdate").validate({
		onfocusout: function(element) { 
			$(element).valid(); 
		},
		rules: {
			prod_type: {
				required: true,
                maxlength: 10
			},
			prod_id: {
				required: true,
				maxlength: 20
			},
			trans_code: {
			    required: true,
                maxlength: 6
			}
		}
	});
});
</script>
</body>
</html>

