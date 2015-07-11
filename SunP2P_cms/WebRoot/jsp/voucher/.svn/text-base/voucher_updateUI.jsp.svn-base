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
<script type="text/javascript" src="${ctx}/javascript/My97DatePicker/WdatePicker.js"></script>
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
	<form action="voucherAction_update" method="post" id="voucherUpdate" >
		<ul class="pop-list">
				<li><label><span style="color: red"> *</span>抵用券编号：</label> 
				<input class="required tool-text" type="text" name="voucher_no" id="voucher_no"readonly="readonly" value="${voucher.voucher_no}" />
				</li>
				<li><label><span style="color: red"> *</span>金额：</label>
				 <input class="required tool-text" type="text" name="voucher_amt" id="voucher_amt" value="${voucher.voucher_amt }"/>
				</li>
				<li><label><span style="color: red"> *</span>所属账户：</label>
				<input class="required tool-text" type="text" name="eacc_no" id="eacc_no" value="${voucher.eacc_no}"/>
				</li>
				<li><label><span style="color: red"> *</span>有效起始日期：</label>
				<input class="required tool-text" type="text" name="begin_date" id="begin_date" value="${voucher.begin_date }"onfocus="WdatePicker()" />
				</li>
				<li><label><span style="color: red"> *</span>有效截止日期：</label>
				<input class="required tool-text" type="text" name="end_date" id="end_date" value="${voucher.end_date }" onfocus="WdatePicker()"/>
				</li>
				<li><label>抵用券类型：</label>
				   <select name="voucher_type" class="tool-select" id="voucher_type">
				   <c:forEach items="${K_VOUCHERTYPE}" var="rst">
					<option value="${rst.val}" <c:if test="${rst.val eq voucher.voucher_type}">selected</c:if> >${rst.prompt}</option>
				</c:forEach>
			      </select>
				</li>
				<li><label>抵用券状态：</label>
				   <select name="status" class="tool-select" id="status">
				   <c:forEach items="${K_VOUCHERSTATUS}" var="rst">
					<option value="${rst.val}" <c:if test="${rst.val eq voucher.status}">selected</c:if> >${rst.prompt}</option>
				   </c:forEach>
			</select>
				</li>
				 <li><label>备注：</label><input class="tool-text" type="text"
					name="description" id="description"  value="${voucher.description }"/>
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
		rules : {
					voucher_no : {
						required : true,
						maxlength : 32
					},
					voucher_amt : {
						required : true,
					},
					eacc_no : {
						required : true,
						
					},	
					begin_date : {
						required : true,
					},	
					end_date : {
						required : true,
					},	
					description : {
						maxlength : 30
					}
					
				}
			});
});
</script>
</body>
</html>

