<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>添加角色</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${ctx}/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/themes/icon.css" />
<link rel="stylesheet" href="${ctx}/style/main-css/global.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/style/validate.css" type="text/css"/>
<script src="${ctx}/javascript/jquery/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/javascript/jquery/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/javascript/jquery/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/javascript/layer/layer.min.js"></script>
<script type="text/javascript" src="${ctx}/javascript/My97DatePicker/WdatePicker.js"></script>
<style>
span.error {
	top:5px;
	right:68px;
	line-height:25px;
}
</style>
</head>
<body>
<div >
	<!--显示表单内容-->
	<form action="financeAction_approve" method="post" id="financeApprove" >
	<ul  class="main-actions clearfix" >
		<li>
			<label>融资编号：</label>
			<input class="tool-text" type="text" name="financ_id" id="financ_id" value="${finance.financ_id}" readonly="readonly"/>			
		</li>
		<li>
			<label>电子账户：</label>
			<input class="tool-text" type="text" name="use_date" id="use_date" value="${finance.eacc_no}" readonly="readonly"/>
		</li>
		<li>
			<label>客户名称：</label>
			<input class="tool-text" type="text" name="name" id="name" value="${finance.name}" readonly="readonly"/>
		</li>
		<li>
			<label>申请日期：</label>
			<input class="tool-text" type="text" name="reg_date" id="reg_date" value="${finance.reg_date}" readonly="readonly"/>			
		</li>
		<li>
			<label>融资金额：</label>
			<input class="tool-text" type="text" name="financ_amt" id="financ_amt" value="${finance.financ_amt}" readonly="readonly"/>			
		</li>
		<li>
			<label>客户经理：</label>
			<input class="tool-text" type="text" name="manage" id="manage" value="${finance.manage}" readonly="readonly"/>			
		</li>
	</ul>

	</form>
    <form action="financeAction_approve" id="approveform" method="post">
	<ul id="mainAction" class="main-actions clearfix">
	
		<li style="height: 100px">
			<label><span style="color: red">* </span>通过理由：</label>
			<textarea rows="5" cols="80" name="remark" id="remark"></textarea>
			<input type="hidden" id="status" name="status"/>
			<input type="hidden" id="financ_id" name="financ_id" value="${finance.financ_id}"/>
		</li>
	</ul>
	<div class="tool-buttons">
		<input class="tool-btn" type="button" value="审核通过" onclick="financeAction_approve(1)"/>
	</div>
	</form>
</div>
<script>
$(document).ready(function() {
	
	});
	function financeAction_approve(val) {
			var text = $("#remark").val();
			if(text == ""|| text== null){
				alert("请输入通过理由");
			}else if(text.length>50){
				alert("通过理由字数不得大于50，请重新输入");
			}else{
			var app = document.getElementById("status");
			app.value = val;
			document.forms[1].submit();
			}
		}
</script>
</body>
</html>


