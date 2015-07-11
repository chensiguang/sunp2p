<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>添加抵用券</title>
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
	top: 5px;
	right: 68px;
	line-height: 25px;
}
</style>
</head>
<body style="text-align:center;">
	<div class="window-pop">
		<!--显示表单内容-->
		<form action="voucherAction_add" method="post" id="vouchenrAdd">
			<ul class="pop-list">
				<li><label><span style="color: red"> *</span>金额：</label>
				 <input class="required tool-text" type="text" name="voucher_amt" id="voucher_amt" />
				</li>
				<li><label><span style="color: red"> *</span>所属账户：</label>
				<input class="required tool-text" type="text" name="eacc_no" id="eacc_no" />
				</li>
				<li><label><span style="color: red"> *</span>有效起始日期：</label>
				<input class="required tool-text" type="text" name="begin_date" id="begin_date"onfocus="WdatePicker()" />
				</li>
				<li><label><span style="color: red"> *</span>有效截止日期：</label>
				<input class="required tool-text" type="text" name="end_date" id="end_date" onfocus="WdatePicker()"/>
				</li>
				<li><label>抵用券类型：</label><select name="voucher_type" class="tool-select"
				id="voucher_type">
					<option value="">===请选择抵用券类型===</option>
					<c:forEach items="${K_VOUCHERTYPE}" var="rstt">
						<option value="${rstt.val}">${rstt.prompt}</option>
					</c:forEach>
			      </select>
				</li>
				<li><label>抵用券状态：</label><select name="status" class="tool-select"
				id="status">
					<option value="">===请选择抵用卷状态===</option>
					<c:forEach items="${K_VOUCHERSTATUS}" var="rstt">
						<option value="${rstt.val}">${rstt.prompt}</option>
					</c:forEach>
			</select>
				</li>
				 <li><label>备注：</label><input class="tool-text" type="text"
					name="description" id="description" />
				</li> 
			</ul>
			<div class="tool-buttons">
				<input class="tool-btn" type="submit" value="提  交">&nbsp;
                <input class="tool-btn" type="Reset" value="重  置" />&nbsp; 
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
			$("#transStatusAdd").validate({
				onfocusout : function(element) {
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