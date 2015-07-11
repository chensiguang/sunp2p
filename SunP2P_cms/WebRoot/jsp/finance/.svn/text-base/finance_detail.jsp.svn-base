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
		
	<div class="main-title" id="Title">
       	 融资信息	
    </div>
	<ul id="mainAction" class="main-actions clearfix" >
		<li>
			<label>融资编号：</label>
			<input class="tool-text" type="text" name="financ_id" id="financ_id" value="${details.financ_id}" readonly="readonly"/>			
		</li>
		<li>
			<label>申请日期：</label>
			<input class="tool-text" type="text" name="reg_date" id="reg_date" value="${details.reg_date}" readonly="readonly"/>			
		</li>
		<li>
			<label>融资金额</label>
			<input class="tool-text" type="text" name="financ_amt" id="financ_amt" value="${details.financ_amt}" readonly="readonly"/>			
		</li>
		<li>
			<label>融资期限：</label>
			<input class="tool-text" type="text" name="financ_cycle" id="financ_cycle" value="${details.financ_cycle}" readonly="readonly"/>
		</li>
		<li>
			<label>融资利息：</label>
			<input class="tool-text" type="text" name="financ_int" id="financ_int" value="${details.financ_int}" readonly="readonly"/>			
		</li>
		<li>
			<label>还款方式：</label>
			<input class="tool-text" type="text" name="repay_type" id="repay_type" value="${details.repay_type}" readonly="readonly"/>
		</li>
		<li>
			<label>担保方式</label>
			<input class="tool-text" type="text" name="guarantee_way" id="guarantee_way" value="${details.guarantee_way}" readonly="readonly"/>			
		</li>
		<li>
			<label>用款日期：</label>
			<input class="tool-text" type="text" name="use_date" id="use_date" value="${details.use_date}" readonly="readonly"/>
		</li>
		<li>
			<label>客户经理</label>
			<input class="tool-text" type="text" name="manage" id="manage" value="${details.manage}" readonly="readonly"/>			
		</li>
		<li>
			<label>当前状态：</label>
			<input class="tool-text" type="text" name="status" id="status1" value="${details.status}" readonly="readonly"/>
		</li>
	</ul>
	<div class="main-title" id="Title">
       	 融资人信息	
    </div>
	<ul id="mainAction" class="main-actions clearfix">
		<li>
			<label>电子账号：</label>
			<input class="tool-text" type="text" name="eacc_no" id="eacc_no" value="${details.eacc_no}" readonly="readonly"/>
		</li>
		<li>
			<label>客户名称：</label>
			<input class="tool-text" type="text" name="name" id="name" value="${details.name}" readonly="readonly"/>
		</li>
		<li>
			<label>客户类型：</label>
			<input class="tool-text" type="text" name="cus_type" id="cus_type" value="${details.cus_type}" readonly="readonly"/>
		</li>
		<li>
			<label>信用等级：</label>
			<input class="tool-text" type="text" name="trust_lvl" id="trust_lvl" value="${details.trust_lvl}" readonly="readonly"/>
		</li>
		<li>
			<label>成功次数：</label>
			<input class="tool-text" type="text" name="successtimes" id="successtimes" value="${details.successtimes}" readonly="readonly"/>
		</li>
		<li>
			<label>成功金额：</label>
			<input class="tool-text" type="text" name="sumamt" id="sumamt" value="${details.sumamt}" readonly="readonly"/>
		</li>
		<li>
			<label>联系方式：</label>
			<input class="tool-text" type="text" name="mobile" id="mobile" value="${details.mobile}" readonly="readonly"/>
		</li>
		<li>
			<label>邮箱：</label>
			<input class="tool-text" type="text" name="email" id="email" value="${details.email}" readonly="readonly"/>
		</li>
		<li>
			<label>风险等级：</label>
			<input class="tool-text" type="text" name="risk_lvl" id="risk_lvl" value="${details.risk_lvl}" readonly="readonly"/>
		</li>
		<li>
			<label>注册时间：</label>
			<input class="tool-text" type="text" name="reg_time" id="reg_time" value="${details.reg_time }" readonly="readonly"/>
		</li>
		
	</ul>
	</form>
	<div class="main-title" id="Title">
      	 审核
    </div>
    <form action="financeAction_approve" id="approveform" method="post">
    	<c:if test="${empty param._backUrl}">
			<input type="hidden" name="_backUrl" value="financeAction_selectAllFinances"/>
		</c:if>
		${paramCover.unCoveredInputs}
	<ul id="mainAction" class="main-actions clearfix">
	
		<li style="height: 100px">
			<label><span style="color: red">* </span>审核备注：</label><br />
			<textarea cols="140" rows="5" name="remark" id="remark"></textarea>
			<input type="hidden" id="from" name="from" value="detail"/>
			<input type="hidden" id="status2" name="status"/>
			<input type="hidden" id="financ_id" name="financ_id" value="${details.financ_id}"/>
		</li>
	</ul>
	<div class="tool-buttons" id="myPrivileges">
		<input class="tool-btn" type="button" value="返  回" onclick="javascript:history.back()" />
	</div>
	</form>
</div>
<script>
$(document).ready(function() {
		var status = $("#status1").val();
		//获取权限
		$.ajax({
			type : "post",
			url : "financeAction_getButton",
			dataType : "text",
			timeout: 6000,
			cache : false,
			error : function(msg) {
				alert('获取权限失败！');
			},
			success : function(result) {
				var tmpPrivilege = eval("("+result+")");
				var privilegeHtml=$("#myPrivileges").html();
				var searchHtml=$("#mainAction").html();
				$.each(tmpPrivilege, function(i, list) {
					if(list.privilege_name.indexOf("查询") > -1 || list.privilege_name.indexOf("明细") > -1){
						searchHtml += "<input type='hidden' id='from' name='from' />";
					}else if(status == '待审核'){
						privilegeHtml += "<a class='tool-btn' onclick='"+list.url+"()"+"'>"+list.privilege_name+"</a>"+"&nbsp;";
					}
				})
				$("#myPrivileges").html(privilegeHtml);
				$("#mainAction").html(searchHtml);
			}
		});
	});
	
	function financeAction_approve(val) {
			var text = $("#remark").val();
			if(text == ""|| text== null){
				alert("请输入审核备注");
			}else if(text.length>50){
				alert("审核备注字数不得大于50，请重新输入");
			}else{
			var app = document.getElementById("status2");
			app.value = val;
			document.forms[1].submit();
			}
		}
	
	function finance_toPass() {
		financeAction_approve(1);
	}
	
	function finance_toRefuce() {
		financeAction_approve(2);
	}
</script>
</body>
</html>


