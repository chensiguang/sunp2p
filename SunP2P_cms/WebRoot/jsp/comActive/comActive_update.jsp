<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ include file="/jsp/public/taglibs.jsp"%>
<html>
<head>
<title>修改</title>
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
	<!--显示表单内容-->
	<form action="comActiveAction_updateComActive" method="post" id="comAction" >
	<ul class="pop-list">
		<li>
			<label>活动交易代码：</label> 
			<input class="tool-text" type="text" readonly="readonly" value="${comActive.trans_id}" name="trans_id" id="trans_id" />			
		</li>
		<li>
			<label>赠送积分起始金额：</label> 
			<input class="tool-text" type="text" readonly="readonly" value="${comActive.start_amt}" name="start_amt" id="start_amt" />		
		</li>
		<li>
			<label>积分赠送方式：</label> 
			<input class="tool-text" type="text" readonly="readonly" value="${comActive.score_way}" name="score_way" id="score_way" />		
		</li>
		<li>
			<label><span style="color: red">* </span>活动交易名称：</label>
			<input class="tool-text" type="text" value="${comActive.trans_name}" name="trans_name" id="trans_name" />
		</li>
		<li>
			<label>金额与积分比例：</label> 
			<input class="required tool-text" type="text" value="${comActive.score_percent}" name="score_percent" id="score_percent" />		
		</li>
		<li>
			<label>是否启用：</label> 
			<select class="tool-select" name="enable_flag" id="enable_flag" >
				<option value="">==请选择是否启用==</option>
				<c:forEach items="${K_ISSUE}" var="rst">
					<option value="${rst.val}" <c:if test="${rst.val eq comActive.enable_flag}">selected</c:if> >${rst.prompt}</option>
				</c:forEach>
			</select>	
		</li>
		<li>
			<label>最高赠送积分：</label> 
			<input class="required tool-text" type="text" value="${comActive.max_score}" name="max_score" id="max_score" />
		</li>
		<li>
			<label>赠送积分：</label> 
			<input class="required tool-text" type="text" value="${comActive.score}" name="score" id="score" />		
		</li>
		<li>
			<label>赠送抵用券金额：</label> 
			<input class="tool-text" type="text" value="${comActive.voucher_amt}" name="voucher_amt" id="voucher_amt" />		
		</li>
		<li>
			<label>赠送红包：</label> 
			<input class="required tool-text" type="text" value="${comActive.amt}" name="amt" id="amt" />		
		</li>
		<li>
			<label>备注：</label> 
			<input class="tool-text" type="text" value="${comActive.remark}" name="remark" id="remark" />		
		</li>
	</ul>
	<div class="tool-buttons">
		<input class="tool-btn" type="submit" value="提  交" >&nbsp;
		<input class="tool-btn" type="Reset" value="重  置" />&nbsp;
		<input class="tool-btn" type="button" value="返  回" id="closeLayer" />
	</div>
	</form>
</div>
<script>
$(document).ready(function() {
	var index = parent.layer.getFrameIndex(window.name);
	$("#closeLayer").click(function(){
		parent.layer.close(index);
	});

	$("#comAction").validate({
		onfocusout: function(element) { 
			$(element).valid(); 
		},
		rules: {
			trans_name: {
				required: true,
				maxlength: 20
			}
		}
	});
});
</script>
</body>
</html>


