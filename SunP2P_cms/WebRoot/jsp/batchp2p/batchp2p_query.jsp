<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>P2p网络贷款产品还款管理</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="cache-control" content="no-cache" />
	<link rel="stylesheet" type="text/css" href="${ctx}/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/themes/icon.css" />
	<link rel="stylesheet" href="${ctx}/style/tools.css" type="text/css"/>
	<link rel="stylesheet" href="${ctx}/style/main-css/global.css" type="text/css" />
	<script src="${ctx}/javascript/jquery/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="${ctx}/javascript/jquery/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${ctx}/javascript/My97DatePicker/WdatePicker.js"></script>
	<style>
	
	</style>
</head>
<body>
	<div class="main-title" id="Title"><!--页面标题-->
       	P2p网络贷款产品还款管理	
    </div>
	
	<div class="toolBar">
		<span class="toolbar-icon"></span>
			P2p网络贷款产品还款管理
		<div class="privileges" id="myPrivileges">
		</div>
	</div>
	<div id="scrollDiv" style="width: 100%; overflow-y: auto; height: 100%;">
		<table class="data-content" width="100%" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<th>产品代码</th>
				<th>还款期数</th>
				<th>应还款日期</th>
				<th>应还款总额</th>
				<th>实还款日期</th>
				<th>实还款总额</th>
				<th>还款状态</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${rstlist}" var="rst">
			<tr>
				<td>${rst.prod_id}</td>
				<td>${rst.repay_num}</td>
				<td>${rst.repay_date}</td>
				<td>${rst.repay_amt}<input id="repay_amt-${rst.prod_id}&${rst.repay_num}" type="hidden" value="${rst.repay_amt}"/></td>
				<td align="center"><input style="width:80%" id="real_repay_date-${rst.prod_id}&${rst.repay_num}" type="text" onfocus="WdatePicker()" value="${rst.real_repay_date}"/></td>
				<td align="center"><input style="width:80%" id="real_repay_amt-${rst.prod_id}&${rst.repay_num}" type="text" value="${rst.real_repay_amt}"/></td>
				<td>${rst.status}</td>
				<td align="center"><button class="tool-btn" onclick="doSubmit('${rst.prod_id}&${rst.repay_num}')">保 存</button></td>
			</tr> 
			</c:forEach>
			<c:if test="${empty rstlist}">
				<tr>
					<td height="25" colspan="8" align="center">无相关信息</td>
				</tr>
			</c:if>
		</table>
	</div>
	<form method="post" name="detailForm">
		<input type="hidden" name="prodRepayInfo.real_repay_date" id="real_repay_date"/>
		<input type="hidden" name="prodRepayInfo.real_repay_amt" id="real_repay_amt"/>
		<input type="hidden" name="prodRepayInfo.repay_amt" id="repay_amt"/>
		<input type="hidden" name="prodRepayInfo.prod_id" id="prod_id"/>
		<input type="hidden" name="prodRepayInfo.repay_num" id="repay_num"/>
		<input type="hidden" name="_backUrl" value="batchP2pAction_entryRepaymentInfo"/>
	</form>	
	<script type="text/javascript">
		function doSubmit(pkstr){
			document.getElementById("real_repay_date").value = document.getElementById("real_repay_date-" + pkstr).value;
			document.getElementById("real_repay_amt").value = document.getElementById("real_repay_amt-" + pkstr).value;
			document.getElementById("repay_amt").value = document.getElementById("repay_amt-" + pkstr).value;
			document.getElementById("prod_id").value = pkstr.slice(0,pkstr.indexOf("&"));
			document.getElementById("repay_num").value = pkstr.slice(pkstr.indexOf("&")+1);
			detailForm.action = "batchP2pAction_entryRepaymentSave"
			detailForm.submit()
		}
		
	</script>
</body>
</html>
